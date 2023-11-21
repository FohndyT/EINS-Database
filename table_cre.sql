/*
-- =========================================================================== A
-- Création des tables et des domaines du schéma kao62.
-- -----------------------------------------------------------------------------
Produit  : Saphir
Version  : 0.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kao62';
--
create domain edition as varchar(60);
comment on domain edition is
$$ L'identifiant unique d'un événement $$;

CREATE TABLE evenement
(
    edition edition NOT NULL,
    debut   date    NOT NULL,
    fin     date    NOT NULL,
    constraint evenement_cc00 primary key (edition),
    constraint evenement_date check (evenement.debut < fin)
);
comment on table evenement is
$$  Un événement identifié par "édition" est décrit par sa date de début "debut"
    et sa date de fin "fin"
$$;
comment on column evenement.edition is $$ L'identifiant unique d'un événement $$;
comment on column evenement.debut is $$ La date de début de l'événement $$;
comment on column evenement.fin is $$ La date de fin de l'événement $$;

create domain idE as varchar(60);
comment on domain idE is
    $$
       Le domaine pour une clé artificielle aléatoire pour une personne
    $$;

create domain courriel as text
    check ( value similar to '[a-zA-Z0-9_+&-]+([\.][a-zA-Z0-9_+&-]+)*[@]([a-zA-Z0-9-]+[\.])+[a-zA-Z]{2,7}');
comment on domain courriel is $$ Le domaine pour un courriel $$;

create domain nom as varchar(60);
comment on domain nom is $$ Le domaine pour le nom, prénom $$;

create type type_inscription as enum ('etudiant', 'professionnel', 'conferencier', 'responsable', 'benevole');
comment on type type_inscription is
    $$ Le type du statut de la personne au sein de l'évènement $$;

create type type_repas as enum ('V_AP', 'V_SP', 'VG', 'VGN', 'NA');
comment on type type_inscription is
    $$ Les types de préférences alimentaire. \n
     V_AP veut dire viande avec poisson \n
     V_SP veut dire viande sans poisson \n
     VG   veut dire veut dire végétarien \n
     VGN  veut dire végane \n
     NA   veut dire aucune préférence \n
  $$;

CREATE TABLE enregistrement
(
    ide             idE              NOT NULL,
    evenement       edition          NOT NULL,
    courriel        courriel         NOT NULL,
    nom             nom              NOT NULL,
    prenom          nom              NOT NULL,
    categorie       type_inscription NOT NULL,
    pref_alim       type_repas       NOT NULL,
    intol_alim      text,
    commentaire     text,
    politique_check boolean          NOT NULL,
    constraint enregistrement_cc00 primary key (ide),
    constraint enregistrement_cc01 unique (ide, evenement), /*contrainte nécessaire pour la clé référentielle de la table theme*/
    constraint enregistrement_cc02 unique (ide, evenement, categorie), /*contrainte nécessaire pour la clé référentielle de la table theme*/
    constraint enregistrement_cc03 unique (evenement, courriel),
    constraint enregistrement_cr04 foreign key (evenement) references evenement (edition)
);
comment on table enregistrement is
$$  Un enregistrement est identifié par "ide" et est décrit par l'événement
    auquel il est impliqué "evenement", le courriel de la personne "courriel",
    son nom "nom" et prénom "prenom", son statut dans l'évenement "categorie",
    ses préférences et intolérance alimentaires "pref_alim" et "into_alim",
    un commentaire "commentaire" et la vérification politiqe "politique_check" $$;
comment on column enregistrement.ide is $$ L'identifiant unique d'une personne $$;
comment on column enregistrement.evenement is $$ L'édition de l'évenement $$;
comment on column enregistrement.courriel is $$ Le courriel de la personne enregistrée $$;
comment on column enregistrement.nom is $$ Le nom de la personne enregistrée $$;
comment on column enregistrement.prenom is $$ Le prénom de la personne enregistrée $$;
comment on column enregistrement.categorie is $$ Le statut de la personne enregistrée dans l'événement $$;
comment on column enregistrement.pref_alim is $$ Les préférences alimentaires de la personne enregistrée $$;
comment on column enregistrement.intol_alim is $$ Les intolérances alimentaire de la personne enregistrée $$;
comment on column enregistrement.commentaire is $$ Les détails supplémentaires sur la personne enregistrée $$;
comment on column enregistrement.politique_check is $$ Si la vérification politique de la personne enregistrée a été faite $$;

create type diplome as enum ('baccalaureat', 'maitrise', 'doctorat');
comment on type diplome is
$$ Le type de diplôme $$;

CREATE TABLE inscription
(
    personne        idE              NOT NULL,
    frais           type_inscription NOT NULL,
    dernier_diplome diplome          NOT NULL,
    occupation      text             NOT NULL,
    organisation    text             NOT NULL,
    constraint inscription_cc00 primary key (personne),
    constraint inscription_cr01 foreign key (personne) references enregistrement (ide),
    constraint frais_inscription check (frais IN ('etudiant', 'professionnel'))
);
comment on table inscription is
$$  Une inscription est identifié par la personne "ide" et est de type "frais".
    Son dernier diplome est "dernier_diplome et la personne est un "occupation"
    à "organisation" $$;
comment on column inscription.personne is $$ L'identifiant unique d'une personne $$;

CREATE TABLE chambre
(
    personne    idE     NOT NULL,
    evenement   edition NOT NULL,
    adresse     text    NOT NULL,
    emplacement text    NOT NULL,
    debut       date    NOT NULL,
    fin         date    NOT NULL,
    constraint chambre_cc00 primary key (personne),
    constraint chambre_cc01 unique (evenement, adresse, emplacement),
    constraint chambre_cr02 foreign key (personne, evenement) references enregistrement (ide, evenement),
    constraint chambre_date check (debut < fin)
);
comment on table chambre is
$$  La chambre attribuée à la personne 'personne' pour l'événement 'evenement',
    située à l'adresse 'adresse' avec un emplacement de d'etablissement 'emplacement',
    est réservée du 'debut' au 'fin'. $$;
comment on column chambre.personne is $$ L'identifiant unique d'une personne $$;

CREATE TABLE absence
(
    personne idE  NOT NULL,
    debut    date NOT NULL,
    fin      date NOT NULL,
    constraint absence_cc00 primary key (personne, debut, fin),
    constraint absence_cc01 unique (personne, debut),
    constraint absence_cc02 unique (personne, fin),
    constraint absence_cr03 foreign key (personne) references enregistrement (ide),
    constraint absence_date check (debut < fin)
);
comment on table absence is
$$ L'absence de la personne 'personne' durant l'événement 'evenement'
   est enregistrée avec un début 'debut' et une fin 'fin'. $$;
comment on column absence.personne is $$ L'identifiant unique d'une personne $$;

/* constraint check a ajouter: seulement une valeur primaire true par enregistrement */
create domain numero_telephone as varchar(12)
    check (value similar to '\d{10}|\d{3}-\d{3}-\d{4}');
comment on domain numero_telephone is
$$ Le numéro de téléphone d'une personne $$;

CREATE TABLE telephone
(
    personne idE              NOT NULL,
    numero   numero_telephone NOT NULL,
    primaire boolean          NOT NULL,
    constraint telephone_cc00 primary key (personne, numero),
    constraint telephone_cr01 foreign key (personne) references enregistrement (ide)
);
comment on table telephone is
$$ Le téléphone de la personne 'personne' est
   enregistré avec le numéro 'numero' et un indicateur 'primaire' pour
   déterminer s'il s'agit du numéro principal. $$;
comment on column telephone.personne is $$ L'identifiant unique d'une personne $$;

create domain sujet_theme as varchar(60);
comment on domain sujet_theme is
    $$
        Le sujet principal d'un thème
    $$;

CREATE TABLE theme
(
    sujet       sujet_theme      NOT NULL,
    evenement   edition          NOT NULL,
    description text             NOT NULL,
    responsable idE              NOT NULL,
    categorie   type_inscription NOT NULL,
    debut       date             NOT NULL,
    fin         date             NOT NULL,
    constraint theme_cc00 primary key (sujet, evenement),
    constraint theme_cr03 foreign key (responsable, categorie, evenement) references enregistrement (ide, categorie, evenement),
    constraint theme_categorie_responsable check (categorie = 'responsable'),
    constraint theme_date check (debut < fin)
);
comment on table inscription is
$$ Le thème 'sujet' pour l'événement 'evenement' inclut une description 'description',
   est géré par le responsable 'responsable', appartient à la catégorie 'categorie',
   et se déroule du 'debut' au 'fin'. $$;

CREATE TABLE lieu
(
    adresse     text    NOT NULL,
    emplacement text    NOT NULL,
    nb_places   integer NOT NULL,
    description text    NOT NULL,
    constraint lieu_cc00 primary key (adresse, emplacement),
    constraint lieu_nbPlaces check (nb_places > -1)
);
comment on table inscription is
$$ Le lieu situé à 'adresse' avec un emplacement 'emplacement' a une capacité
   de 'nb_places' et est décrit par 'description'. $$;

create domain titre_activite as varchar(60);
comment on domain titre_activite is
    $$
        Le titre d'une activité
    $$;

create type type_activite as enum ('presentation', 'atelier', 'evaluation', 'travail_equipe', 'pause_cafe', 'pause_diner', 'sociale');
comment on type type_activite is
    $$
        La nature de l'activité. Une activité peut être une présentation d’une courte durée (de 15 à 60 minutes)
        un atelier de longue durée (de 90 à 190 minutes), une évaluation de 120 minutes,
        un travail d’équipe de durée variable (de 60 à 90 minutes),
        une pause-café de 30 minutes, une pause diner de 90 minutes et des activités sociales
    $$;

CREATE TABLE activite
(
    titre       titre_activite NOT NULL,
    theme       sujet_theme    NOT NULL,
    evenement   edition        NOT NULL,
    description text           NOT NULL,
    type        type_activite  NOT NULL,
    debut       date           NOT NULL,
    fin         date           NOT NULL,
    adresse     text           NOT NULL,
    emplacement text           NOT NULL,
    constraint activite_cc00 primary key (titre, theme, evenement),
    constraint activite_cc01 unique (titre, theme, evenement, type), /* pour les clés référentielles de animation, equipe et evaluation */
    constraint activite_cr02 foreign key (evenement, theme) references theme (evenement, sujet),
    constraint activite_cr03 foreign key (adresse, emplacement) references lieu (adresse, emplacement),
    constraint activite_date check (debut < fin)
);
comment on table activite is
$$ L'activité 'titre' dans le cadre du thème 'theme' de l'événement 'evenement'
   est décrite par 'description', appartient au type 'type', et se déroule du
   'debut' au 'fin' à l'adresse 'adresse' et emplacement 'emplacement'. $$;

CREATE TABLE animation
(
    personne  idE              NOT NULL,
    categorie type_inscription NOT NULL,
    evenement edition          NOT NULL,
    theme     sujet_theme      NOT NULL,
    activite  titre_activite   NOT NULL,
    type      type_activite    NOT NULL,
    constraint animation_cc00 primary key (personne, evenement, theme, activite),
    constraint animation_cr01 foreign key (personne, evenement, categorie) references enregistrement (ide, evenement, categorie),
    constraint animation_cr02 foreign key (evenement, theme, activite, type) references activite (evenement, theme, titre, type),
    constraint animation_categorie_personne check (categorie = 'conferencier' or categorie = 'responsable'),
    constraint animation_type_activite check (type = 'presentation' or type = 'atelier' or type = 'sociale')
);
comment on table animation is
$$ L'animation de l'activité 'activite' pour le thème 'theme' et l'événement
   'evenement' est réalisée par la personne 'personne' de la catégorie 'categorie'
   et du type 'type'. $$;

CREATE TABLE equipe
(
    personne  idE              NOT NULL,
    categorie type_inscription NOT NULL,
    evenement edition          NOT NULL,
    theme     sujet_theme      NOT NULL,
    activite  titre_activite   NOT NULL,
    type      type_activite    NOT NULL,
    numero    varchar(10)      NOT NULL,
    constraint equipe_cc00 primary key (personne, evenement, theme, activite),
    constraint equipe_cr01 foreign key (personne, evenement, categorie) references enregistrement (ide, evenement, categorie),
    constraint equipe_cr02 foreign key (evenement, theme, activite, type) references activite (evenement, theme, titre, type),
    constraint equipe_categorie_personne check (categorie = 'etudiant' or categorie = 'professionnel'),
    constraint equipe_type_activite check (type = 'travail_equipe')
);
comment on table equipe is
$$ L'équipe, comprenant la personne 'personne' de la catégorie 'categorie',
   participe à l'activité 'activite' du thème 'theme' et de l'événement 'evenement',
   de type 'type', avec le numéro d'équipe 'numero'. $$;

create domain matricule as varchar(8)
    check (value similar to '[0-9]{6,8}');
comment on domain matricule is
    $$ Un matricule est formé de 8 chiffres $$;

create domain cip as char(8)
    check (value similar to '[a-zA-Z]{4}[0-9]{4}');
comment on domain cip is
    $$ Le code d'identification personnel est formé des deux premières lettres du nom
  suivi de deux premières lettres du prénom et 4 chiffres aléatoires $$;

create type resultat as enum ('reussi', 'echec');
comment on type resultat is
$$ La réussite ou l'échec d'une évaluation $$;

CREATE TABLE evaluation
(
    personne  idE              NOT NULL,
    categorie type_inscription NOT NULL,
    evenement edition          NOT NULL,
    theme     sujet_theme      NOT NULL,
    activite  titre_activite   NOT NULL,
    type      type_activite    NOT NULL,
    matricule matricule        NOT NULL,
    cip       cip              NOT NULL,
    resultat  resultat         NOT NULL,
    constraint evaluation_cc00 primary key (personne, evenement, theme, activite),
    constraint evaluation_cr01 foreign key (personne, evenement, categorie) references enregistrement (ide, evenement, categorie),
    constraint evaluation_cr02 foreign key (evenement, theme, activite, type) references activite (evenement, theme, titre, type),
    constraint evaluation_categorie_personne check (categorie = 'etudiant'),
    constraint evaluation_type_activite check (type = 'evaluation')
);
comment on table evaluation is
$$ L'évaluation de la personne 'personne' dans la catégorie 'categorie'
   pour l'activité 'activite' du thème 'theme' et de l'événement 'evenement'
   de type 'type' inclut le matricule 'matricule', le cip 'cip' et le résultat 'resultat'.$$;
--
/*
-- =========================================================================== Z
Contributeurs :
  (FNT)  Nomerth.Fohndy.Tah@USherbrooke.ca
  (GD)   Gabriel.Drouin2@usherbrooke.ca
  (CB)   Constant.Bastonnais@usherbrooke.ca
  (HMSD) Haran.Mourno.Suliman.Dogoy@usherbrooke.ca

Tâches projetées :

Tâches réalisées :
  2023-07-23 (FNT), (GD), (CB), (HMSD) : Création
-- -----------------------------------------------------------------------------
-- Fin de table_cre.sql
-- =========================================================================== Z
*/