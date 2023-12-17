/*
-- =========================================================================== A
-- Création des tables et des domaines du schéma kao.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';

-- region Création des tables evenement, theme, activite, lieu et leurs associations

--
-- Création de la table evenement et ses domaines
--

create domain titre_evenement as varchar(60);
comment on domain titre_evenement is
$$ Le titre d'un evenement $$;

create domain edition as varchar(60);
comment on domain edition is
$$ L'edition d'un événement $$;

create table evenement
(
    idEvn   serial          not null,
    titre   titre_evenement not null,
    edition edition         not null,
    debut   date       not null,
    fin     date       not null,
    constraint evenement_cc00 primary key (idEvn),
    constraint evenement_date check (evenement.debut <= fin)
);
comment on table evenement is
$$ L’événement identifié par l’identifiant « idEvn » est reconnu par son titre « titre », en est à son édition
    « edition », débute à la date et heure « debut » et se termine à la date et heure « fin » $$;
comment on column evenement.idEvn is $$ L’identifiant unique d'un événement $$;
comment on column evenement.edition is $$ L’édition de l’événement $$;
comment on column evenement.debut is $$ Le début, en date et heure, d’un événement $$;
comment on column evenement.fin is $$ La fin, en date et heure, d’un événement $$;

--
-- Création de la table traiteur
--

create table traiteur
(
    nom       varchar(255) not null,
    evenement integer      not null,
    date      date         not null,
    constraint traiteur_cc00 primary key (evenement, date),
    constraint traiteur_cr01 foreign key (evenement) references evenement (idEvn)
);
comment on table traiteur is
$$ Le traiteur identifié par le nom « nom » doit servir l’événement « evenement » lors de la date « date » $$;
comment on column traiteur.nom is $$ Le nom d'un traiteur $$;
comment on column traiteur.evenement is $$ L’identifiant unique d'un événement $$;
comment on column traiteur.date is $$ La date de livraison des repas d’un traiteur $$;

--
-- Creation de la table theme et ses domaines
--

create domain sujet_theme as varchar(60);
comment on domain sujet_theme is
$$ Le sujet d'un thème $$;

create table theme
(
    idT         serial        not null,
    evenement   integer       not null,
    sujet       sujet_theme   not null,
    description varchar(5000) not null,
    debut       date     not null,
    fin         date     not null,
    constraint theme_cc00 primary key (idT),
    constraint theme_cr01 foreign key (evenement) references evenement (idEvn),
    constraint theme_date check (debut <= fin)
);
comment on table theme is
$$ Le thème identifié par l’identifiant « idT », se déroulant lors de l'événement « evenement», est reconnu par son
sujet « sujet », est décrit par sa description « description », débute à la date et heure « debut » et se termine à
la date et heure « fin » $$;
comment on column theme.idT is $$ L’identifiant unique d'un thème $$;
comment on column theme.evenement is $$ L’identifiant unique d'un événement $$;
comment on column theme.sujet is $$ Le sujet attribué à un thème $$;
comment on column theme.description is $$ La description d'un thème $$;
comment on column theme.debut is $$ Le début, en date et heure, d’un thème $$;
comment on column theme.fin is $$ La fin, en date et heure, d’un thème $$;

--
-- Creation de la table activite et ses domaines
--

create domain titre_activite as varchar(60);
comment on domain titre_activite is
    $$ Le titre d'une activité $$;

create table activite
(
    idA         serial         not null,
    theme       integer        not null,
    titre       titre_activite not null,
    description varchar(5000)  not null,
    debut       timestamp      not null,
    fin         timestamp      not null,
    constraint activite_cc00 primary key (idA),
    constraint activite_cr01 foreign key (theme) references theme (idT),
    constraint activite_date check (debut < fin)
);
comment on table activite is
$$ L’activité identifiée par l’identifiant « idA », faisant partie du thème « theme », est reconnue par son titre
« titre », est décrite par sa description « description », est de type « type », débute à la date et heure « debut » et
se termine à la date et heure « fin » $$;
comment on column activite.idA is $$ L’identifiant unique d'une activité $$;
comment on column activite.theme is $$ L’identifiant unique d'un thème $$;
comment on column activite.titre is $$ Le titre attribué à une activité $$;
comment on column activite.description is $$ La description d'une activité $$;
comment on column activite.debut is $$ Le début, en date et heure, d’une activité $$;
comment on column activite.fin is $$ La fin, en date et heure, d’une activité $$;

--
-- Creation de la table type_activite et ses domaines
--

create domain nom_activite as varchar(60);
comment on domain nom_activite is
    $$ Le nom d'une activité $$;

create domain min as interval;
comment on domain nom_activite is
    $$ Le temps minimal d'une activité $$;

create domain max as interval;
comment on domain nom_activite is
    $$ Le temps maximal d'une activité $$;

create table type_activite
(
    idTypAct serial       not null,
    nom      nom_activite not null,
    min      min          not null,
    max      max          not null,
    constraint type_activite_cc00 primary key (idtypact),
    constraint type_activite_cc01 unique (nom),
    constraint type_activite_duree check (min <= max)
);
comment on table type_activite is
$$ Le type d'activité identifié par l'identifiant « idTypAct » est reconnu par son nom « nom », a une durée minimale
de « min » et une durée maximale de « max » $$;
comment on column type_activite.idTypAct is $$ L’identifiant unique d'un type d'activité $$;
comment on column type_activite.nom is $$ Le nom d'un type d'activité $$;
comment on column type_activite.min is $$ Le temps minimal d'une activité $$;
comment on column type_activite.max is $$ Le temps maximal d'une activité $$;

--
-- Creation de la table association_type_activite et ses domaines
--

create table association_type_activite
(
    activite integer not null,
    type     integer not null,
    constraint association_type_activite_cc00 primary key (activite),
    constraint association_type_activite_cr01 foreign key (activite) references activite (idA),
    constraint association_type_activite_cr02 foreign key (type) references type_activite (idtypact)
);
comment on table association_type_activite is
$$ L'activité identifiée par l'identifiant « activite » est associée au type d'activité « type » $$;
comment on column association_type_activite.activite is $$ L’identifiant unique d'une activité $$;
comment on column association_type_activite.type is $$ L’identifiant unique d'un type d'activité $$;

--
-- Creation de la table local et ses domaines
--

create domain nom_lieu as varchar(60);
comment on domain nom_lieu is
    $$ Le nom du lieu contenant le local $$;

create domain adresse_lieu as varchar(60);
comment on domain adresse_lieu is
    $$ L'adresse du lieu content le local $$;

create domain emplacement_local as varchar(60);
comment on domain emplacement_local is
    $$ L'emplacement du local à l'intérieur du lieu $$;

create table local
(
    idL         serial            not null,
    lieu        nom_lieu          not null,
    adresse     adresse_lieu      not null,
    emplacement emplacement_local not null,
    nb_places   integer           not null,
    constraint local_cc00 primary key (idL),
    constraint local_nb_places check (nb_places >= 0)
);
comment on table local is
$$ Le local identifié par l’identifiant « idL » qui se situe au lieu « lieu », à l’adresse « adresse », dans
l’emplacement « emplacement » compte le nombre de places « nb_places » $$;
comment on column local.idL is $$ L’identifiant unique d'un local $$;
comment on column local.lieu is $$ Le nom d'un lieu contenant le local d'une activité $$;
comment on column local.adresse is $$ L’adresse du lieu contenant le local d'une activité $$;
comment on column local.emplacement is $$ L’emplacement d’un local d’une activité $$;
comment on column local.nb_places is $$ Le nombre de places d’un local $$;

--
-- Creation de la table deroulement et ses domaines
--

create table deroulement
(
    activite integer not null,
    local    integer not null,
    constraint deroulement_cc00 primary key (activite),
    constraint deroulement_cr01 foreign key (activite) references activite (idA),
    constraint deroulement_cr02 foreign key (local) references local (idL)
);
comment on table deroulement is
$$ L'activité identifiée par l'identifiant « activite » se déroule dans le local « local » $$;
comment on column deroulement.activite is $$ L’identifiant unique d'une activité $$;
comment on column deroulement.local is $$ L’identifiant unique d'un local $$;

-- endregion Création des tables evenement, theme, activite, lieu et leurs associations

-- region Création de la table compte + la table enregistrement et ses tables de renseignements supplémentaires
--        selon le rôle attribué à l'enregistrement

-- region Tables compte et enregistrement

--
-- Creation de la table compte et ses domaines
--

create domain courriel as text
    check (value similar to '[a-zA-Z0-9_+&-]+([\.][a-zA-Z0-9_+&-]+)*[@]([a-zA-Z0-9-]+[\.])+[a-zA-Z]{2,7}');
comment on domain courriel is $$ Le domaine pour un courriel $$;

create domain nom as varchar(60);
comment on domain nom is $$ Le domaine pour le nom, prénom $$;

create table compte
(
    idC          serial       not null,
    courriel     courriel     not null,
    nom          nom          not null,
    prenom       nom          not null,
    mot_de_passe varchar(255) not null,
    constraint compte_cc00 primary key (idC),
    constraint compte_cc01 unique (courriel)
);
comment on table compte is
$$ Le compte identifié par l’identifiant « idc » qui est associé au courriel unique « courriel », appartient à la
personne de nom « nom », de prénom « prenom » et est protégé par le mot de passe « mot_de_passe» $$;
comment on column compte.idC is $$ L’identifiant unique d’un compte de l’application de gestion d’événements
scientifiques $$;
comment on column compte.courriel is $$ Le courriel d’une personne ayant un compte $$;
comment on column compte.nom is $$ Le nom d’une personne ayant un compte $$;
comment on column compte.prenom is $$ Le prénom d’une personne ayant un compte $$;
comment on column compte.mot_de_passe is $$ Le mot de passe utilisé lors de la connexion à la plateforme $$;

--
-- Creation de la table enregistrement et ses domaines
--

create table enregistrement
(
    idEnr           serial  not null,
    compte          integer not null,
    evenement       integer not null,
    politique_check boolean not null,
    check_in        boolean not null,
    constraint enregistrement_cc00 primary key (idEnr),
    constraint enregistrement_cr01 foreign key (compte) references compte (idC),
    constraint enregistrement_cr02 foreign key (evenement) references evenement (idEvn)
);
comment on table enregistrement is
$$ L’enregistrement identifié par l’identifiant « idenr » lors de l’événement « idevn » en tant que « idrole »,
qui s’est enregistré à partir de son compte « idc », a accordé le consentement « politique_check » à la politique de
confidentialité et a eu une présence « check_in » à l’événement $$;
comment on column enregistrement.idEnr is $$ L’identifiant unique d’un enregistrement $$;
comment on column enregistrement.compte is $$ L’identifiant unique d’un compte de l’application de gestion d’événements
scientifiques $$;
comment on column enregistrement.evenement is $$ L’identifiant unique associé à un événement $$;
comment on column enregistrement.politique_check is $$ La validation de la politique de confidentialité pour un
enregistrement $$;
comment on column enregistrement.check_in is $$ La validation de la présence à un événement $$;

-- endregion Tables compte et enregistrement

-- region Tables des renseignements supplémentaires pour l'enregistrement selon le rôle

-- region Renseignements applicables à tous les rôles

--
-- Creation de la table commentaire et ses domaines
--

create table commentaire
(
    enregistrement integer       not null,
    commentaire    varchar(5000) not null,
    constraint commentaire_cc00 primary key (enregistrement),
    constraint commentaire_cr01 foreign key (enregistrement) references enregistrement (idEnr)
);
comment on table commentaire is
$$ La personne associée à l'enregistrement « enregistrement » a laissé un commentaire « commentaire » sur son
enregistrement $$;
comment on column commentaire.enregistrement is $$ L’identifiant unique d’un enregistrement $$;
comment on column commentaire.commentaire is $$ Le commentaire associé à un enregistrement $$;

--
-- Creation de la table type_role et ses domaines
--
create domain nom_role as varchar(60);
comment on domain nom_role is
    $$ Le nom du rôle d'une personne à un événement selon son enregistrement $$;

create table type_role
(
    idRole serial   not null,
    nom    nom_role not null,
    constraint type_role_cc00 primary key (idRole),
    constraint type_role_cc02 unique (nom)
);
comment on table type_role is
$$ Le type de rôle identifié par l'identifiant « idRole » est reconnu par son nom « nom » $$;
comment on column type_role.idRole is $$ L’identifiant unique d’un type de role $$;
comment on column type_role.nom is $$ Le nom d'un type de rôle $$;

--
-- Creation de la table role_enr et ses domaines
--

create table association_role
(
    enregistrement integer not null,
    type           integer not null,
    constraint association_role_cc00 primary key (enregistrement),
    constraint association_role_cr01 foreign key (enregistrement) references enregistrement (idEnr),
    constraint association_role_cr02 foreign key (type) references type_role (idRole)
);
comment on table association_role is
$$ La personne identifiée par son enregistrement « enregistrement » est associé au type de rôle « type » $$;
comment on column association_role.enregistrement is $$ L’identifiant unique d’un enregistrement $$;
comment on column association_role.type is $$ L’identifiant unique d’un role $$;

--
-- Creation de la table type_pref et ses domaines
--

create domain nom_pref as varchar(60);
comment on domain nom_pref is
    $$ Le nom d'une préférence alimentaire, soit un type de repas $$;

create table type_pref
(
    idPref serial   not null,
    nom    nom_pref not null,
    constraint type_pref_cc00 primary key (idPref),
    constraint type_pref_cc02 unique (nom)
);
comment on table type_pref is
$$ Le type de préférence alimentaire identifié par l'identifiant « idPref » est reconnu par son nom « nom » $$;
comment on column type_pref.idPref is $$ L’identifiant unique d’un type de préférence alimentaire $$;
comment on column type_pref.nom is $$ Le nom d'un type de préférence alimentaire $$;

--
-- Creation de la table association_pref et ses domaines
--

create table association_pref
(
    enregistrement integer not null,
    type           integer not null,
    constraint association_pref_cc00 primary key (enregistrement),
    constraint association_pref_cr01 foreign key (enregistrement) references enregistrement (idEnr),
    constraint association_pref_cr02 foreign key (type) references type_pref (idPref)
);
comment on table association_pref is
$$ La personne identifié par son enregistrement « enregistrement » est associé au type de préférence alimentaire
« type » $$;
comment on column association_pref.enregistrement is $$ L’identifiant unique d’un enregistrement $$;
comment on column association_pref.type is $$ L’identifiant unique d’un type de préférence alimentaire $$;

--
-- Creation de la table type_intol et ses domaines
--

create domain nom_intol as varchar(60);
comment on domain nom_intol is
    $$ Le nom d'une intolérance alimentaire, soit un aliment ou un groupe d'aliments alergènes $$;

create table type_intol
(
    idIntol serial    not null,
    nom     nom_intol not null,
    constraint type_intol_cc00 primary key (idIntol),
    constraint type_intol_cc01 unique (nom)
);
comment on table type_intol is
$$ Le type d'intolérance alimentaire identifié par l'identifiant « idIntol » est reconnu par son nom « nom » $$;
comment on column type_intol.idIntol is $$ L’identifiant unique d’un type d'intolérance alimentaire $$;
comment on column type_intol.nom is $$ Le nom d'un type d'intolérance alimentaire $$;

--
-- Creation de la table association_intol et ses domaines
--

create table association_intol
(
    enregistrement integer not null,
    type           integer not null,
    constraint association_intol_cc00 primary key (enregistrement, type),
    constraint association_intol_cr01 foreign key (enregistrement) references enregistrement (idEnr),
    constraint association_intol_cr02 foreign key (type) references type_intol (idIntol)
);
comment on table association_intol is
$$ La personne identifiée par son enregistrement « enregistrement » est associée au type d'intolérance alimentaire
« type » $$;
comment on column association_intol.enregistrement is $$ L’identifiant unique d’une intolérance alimentaire $$;
comment on column association_intol.type is $$ L’identifiant unique d’une intolérance alimentaire $$;

-- endregion Renseignements applications à tous les rôles

-- region Renseignements propres aux rôles public

--
-- Creation de la table public et ses domaines
--

create table public
(
    enregistrement integer      not null,
    occupation     varchar(255) not null,
    organisation   varchar(255) not null,
    constraint public_cc00 primary key (enregistrement),
    constraint public_cr01 foreign key (enregistrement) references enregistrement (idEnr)
);
comment on table public is
$$ Le membre du public identifié par son enregistrement « enregistrement » occupe l’occupation « occupation » à
l’organisation « organisation  » $$;
comment on column public.enregistrement is $$ L’identifiant unique d’un enregistrement $$;
comment on column public.occupation is $$ L’occupation d’un membre du public $$;
comment on column public.organisation is $$ L’organisation d’un membre du public $$;

--
-- Creation de la table type_diplome et ses domaines
--

create domain nom_diplome as varchar(60);
comment on domain nom_diplome is
    $$ Le nom d'un diplôme $$;

create table type_diplome
(
    idDip  serial      not null,
    nom    nom_diplome not null,
    constraint type_diplome_cc00 primary key (idDip),
    constraint type_diplome_cc01 unique (nom)
);
comment on table type_diplome is
$$ Le type de diplôme identifié par l'identifiant « idDip » est reconnu par son nom « nom » $$;
comment on column type_diplome.idDip is $$ L’identifiant unique d’un type de diplôme $$;
comment on column type_diplome.nom is $$ Le nom d'un type de diplôme $$;

--
-- Creation de la table association_diplome et ses domaines
--

create table association_diplome
(
    enregistrement integer not null,
    type           integer not null,
    constraint association_diplome_cc00 primary key (enregistrement),
    constraint association_diplome_cr01 foreign key (enregistrement) references public (enregistrement),
    constraint association_diplome_cr02 foreign key (type) references type_diplome (idDip)
);
comment on table association_diplome is
$$ Le membre du public identifié par son enregistrement « enregistrement » a reçu comme dernier diplôme le type de
diplôme « type » $$;
comment on column association_intol.enregistrement is $$ L’identifiant unique d’un enregistrement $$;
comment on column association_intol.type is $$ L’identifiant unique d'un type de diplôme $$;

--
-- Creation de la table etudiant_UdeS et ses domaines
--
create domain matricule as varchar(8)
    check (value similar to '[0-9]{6,8}');
comment on domain matricule is
    $$ Le matricle d'un étudiant de l'UdeS, formé de 6 à 8 chiffres $$;

create domain cip as char(8)
    check (value similar to '[a-zA-Z]{4}[0-9]{4}');
comment on domain cip is
    $$ Le code d'identification personnel d'un étudiant de l'UdeS, formé
    des deux premières lettres du nom suivi de deux premières lettres du
    prénom et 4 chiffres aléatoires $$;

create table etudiant_udes
(
    enregistrement integer   not null,
    matricule      matricule not null,
    cip            cip       not null,
    constraint etudiant_udes_cc00 primary key (enregistrement),
    constraint etudiant_udes_cr01 foreign key (enregistrement) references public (enregistrement)
);
comment on table etudiant_udes is
$$ L'étudiant de l'UdeS identifié par son enregistrement « enregistrement » est associé au matricule « matricule » et
au cip « cip » $$;
comment on column etudiant_udes.enregistrement is $$ L’identifiant unique d'un enregistrement $$;
comment on column etudiant_udes.matricule is $$ Le matricule unique d' un étudiant $$;
comment on column etudiant_udes.cip is $$ Le cip unique d'un étudiant $$;

-- endregion Renseignements propres aux rôles public

-- region Renseignements propres aux rôles staff

--
-- Creation de la table staff et ses domaines
--

create domain numero_telephone as varchar(12)
    check (value similar to '\d{10}|\d{3}-\d{3}-\d{4}');
comment on domain numero_telephone is
$$ Le numéro de téléphone d'une personne $$;

create table staff
(
    enregistrement integer          not null,
    telephone      numero_telephone not null,
    constraint telephone_cc00 primary key (enregistrement),
    constraint telephone_cr01 foreign key (enregistrement) references enregistrement (idEnr)
);
comment on table staff is
$$ Le membre du staff identifié par son enregistrement « enregistrement » doit fournir son numéro de téléphone
« telephone » $$;
comment on column staff.enregistrement is $$ L’identifiant unique d’un enregistrement $$;
comment on column staff.telephone is $$ Le téléphone d'un membre du staff $$;

--
-- Creation de la table chambre et ses domaines
--

create domain nom_hotel as varchar(60);
comment on domain nom_hotel is
    $$ Le nom de l'hotel contenant la chambre $$;

create domain adresse_hotel as varchar(60);
comment on domain adresse_hotel is
    $$ L'adresse de l'hotel contenant la chambre $$;

create domain emplacement_chambre as varchar(60);
comment on domain emplacement_chambre is
    $$ L'emplacement de la chambre à l'intérieur de l'hotel $$;

create table chambre
(
    enregistrement integer        not null,
    hotel          nom_hotel      not null,
    adresse        adresse_hotel  not null,
    debut          date           not null,
    fin            date           not null,
    constraint chambre_cc00 primary key (enregistrement),
    constraint chambre_cr01 foreign key (enregistrement) references staff (enregistrement),
    constraint chambre_date check (debut <= fin)
);
comment on table chambre is
$$ Le conférencier identifié par son enregistrement « enregistrement » possède une chambre à l'hotel « hotel » qui se
situe à l'adresse « adresse » à partir de la date et heure « debut » jusqu'à la date et heure « fin » $$;
comment on column chambre.enregistrement is $$ L’identifiant unique d’un enregistrement $$;
comment on column chambre.hotel is $$ Le nom d'un hôtel $$;
comment on column chambre.adresse is $$ L’adresse d'un hôtel $$;
comment on column chambre.debut is $$ Le début, en date et heure, d'une réservation d'hôtel $$;
comment on column chambre.fin is $$ La fin, en date et heure, d'une réservation d'hôtel $$;

--
-- Creation de la table absence et ses domaines
--

create table absence
(
    enregistrement integer not null,
    debut          timestamp    not null,
    fin            timestamp    not null,
    constraint absence_cc00 primary key (enregistrement, debut, fin),
    constraint absence_cr03 foreign key (enregistrement) references staff (enregistrement),
    constraint absence_date check (debut <= fin)
);
comment on table absence is
$$ Le conférencier identifié par son enregistrement « enregistrement » est absent à partir de la date et heure
« debut » jusqu'à la date et heure « fin » $$;
comment on column absence.enregistrement is $$ L’identifiant unique d’un enregistrement $$;
comment on column absence.debut is $$ Le début, en date et heure, de l'absence d'un conférencier $$;
comment on column absence.fin is $$ La fin, en date et heure, de l'absence d'un conférencier $$;


-- endregion Renseignements propres aux rôles staff

-- endregion Tables des renseignements supplémentaires pour l'enregistrement selon le rôle

-- endregion Création de la table compte + la table enregistrement et ses tables de renseignements supplémentaires

-- region Création des tables faisant l'association des enregistrements avec les thèmes et les activités
--        selon le rôle d'un enregistrement et le type d'une activité

--
-- Creation de la table gestion et ses domaines
--

create table gestion
(
    enregistrement integer not null,
    theme          integer not null,
    constraint gestion_cc00 primary key (enregistrement, theme),
    constraint gestion_cr01 foreign key (enregistrement) references enregistrement (idEnr),
    constraint gestion_cr02 foreign key (theme) references theme (idT)
);
comment on table gestion is
$$ Le responsable identifié par son enregistrement « enregistrement » doit gérer le thème « theme » $$;
comment on column gestion.enregistrement is $$ L’identifiant unique d'un enregistrement $$;
comment on column gestion.theme is $$ L'identifiant unique d'un thème $$;

--
-- Creation de la table animation et ses domaines
--

create table animation
(
    enregistrement integer not null,
    activite       integer not null,
    constraint animation_cc00 primary key (enregistrement, activite),
    constraint animation_cr01 foreign key (enregistrement) references enregistrement (idEnr),
    constraint animation_cr02 foreign key (activite) references activite (idA)
);
comment on table animation is
$$ L'animateur identifié par son enregistrement « enregistrement » doit animer l'activité « activite » $$;
comment on column animation.enregistrement is $$ L’identifiant unique d'un enregistrement $$;
comment on column animation.activite is $$ L'identifiant unique d'une activité $$;

--
-- Creation de la table equipe et ses domaines
--

create domain num_equipe as varchar(255);
comment on domain num_equipe is
    $$ L'identifiant d'une équipe dans le cadre d'un travail d'équipe $$;

create table equipe
(
    enregistrement integer not null,
    activite       integer not null,
    equipe         num_equipe  not null,
    constraint equipe_cc00 primary key (enregistrement, activite),
    constraint equipe_cr01 foreign key (enregistrement) references enregistrement (idEnr),
    constraint equipe_cr02 foreign key (activite) references activite (idA)
);
comment on table equipe is
$$ Le membre du public identifié par son enregistrement « enregistrement » participe à l'activité « activite » en tant
que membre de l'équipe « equipe » $$;
comment on column equipe.enregistrement is $$ L’identifiant unique d'un enregistrement $$;
comment on column equipe.activite is $$ L'identifiant unique d'une activité $$;
comment on column equipe.equipe is $$ L'identifiant d'une équipe dans le cadre d'un travail d'équipe $$;

--
-- Creation de la table evaluation et ses domaines
--

create type resultat as enum('reussi', 'echec');
comment on type resultat is
    $$ Le résultat d'un examen $$;

create table evaluation
(
    enregistrement integer  not null,
    activite       integer  not null,
    resultat       resultat not null,
    constraint evaluation_cc00 primary key (enregistrement, activite),
    constraint evaluation_cr01 foreign key (enregistrement) references enregistrement (idEnr),
    constraint evaluation_cr02 foreign key (activite) references activite (idA)
);
comment on table evaluation is
$$ L'étudiant de l'UdeS identifié par son enregistrement « enregistrement » a été évalué à l'activité « activite » et
a reçu le le résultat « resultat » $$;
comment on column evaluation.enregistrement is $$ L’identifiant unique d'un enregistrement $$;
comment on column evaluation.activite is $$ L'identifiant unique d'une activité $$;
comment on column evaluation.resultat is $$ Le résultat unique d'un étudiant dans le cadre d'une évaluation $$;

-- endregion

--
/*
-- =========================================================================== Z
Contributeurs :
  (FNT)  Nomerth.Fohndy.Tah@USherbrooke.ca
  (GD)   Gabriel.Drouin2@usherbrooke.ca
  (CB)   Constant.Bastonnais@usherbrooke.ca
  (HMSD) Haran.Mourno.Suliman.Dogoy@usherbrooke.ca

Tâches réalisées :
  2023-12-07 (FNT), (GD), (CB), (HMSD) : Création
-- -----------------------------------------------------------------------------
-- Fin de table_cre.sql
-- =========================================================================== Z
*/