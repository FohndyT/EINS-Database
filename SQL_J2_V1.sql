/*drop schema kao28 cascade;*/
create schema kao62;
set schema 'kao62';

CREATE TABLE evenement (
  edition VARCHAR(42) NOT NULL,
  debut   VARCHAR(42) NOT NULL,
  fin     VARCHAR(42) NOT NULL,
  constraint evenement_cc00 primary key (edition)
);

insert into evenement(edition, debut, fin) VALUES
('2023-1', '2023-01-01', '2023-30-07'),
('2023-2', '2023-01-08', '2023-31-12'),
('2024-1', '2023-01-01', '2023-30-07')

CREATE TABLE enregistrement (
  ide             VARCHAR(42) NOT NULL,
  evenement       VARCHAR(42) NOT NULL,
  courriel        VARCHAR(42) NOT NULL,
  nom             VARCHAR(42) NOT NULL,
  prenom          VARCHAR(42) NOT NULL,
  categorie       VARCHAR(42) NOT NULL,
  pref_alim       VARCHAR(42) NOT NULL,
  intol_alim      VARCHAR(42) NOT NULL,
  commentaire     VARCHAR(42) NOT NULL,
  politique_check VARCHAR(42) NOT NULL,
  constraint enregistrement_cc00 primary key (ide),
  constraint enregistrement_cc01 unique (ide, evenement), /*contrainte nécessaire pour la clé référentielle de la table theme*/
  constraint enregistrement_cc02 unique (ide, evenement, categorie), /*contrainte nécessaire pour la clé référentielle de la table theme*/
  constraint enregistrement_cc03 unique (evenement, courriel),
  constraint enregistrement_cr04 foreign key (evenement) references evenement (edition)
);

insert into enregistrement(ide, evenement, courriel, nom, prenom, categorie, pref_alim, intol_alim, commentaire, politique_check)
values ('1', '2023-1', 'gab@com', 'drouin', 'gabriel', 'etudiant', 'vegan', 'aucun', 'aucun', 'true'),
       ('2', '2023-1', 'xav@com', 'drouin', 'xavier', 'etudiant', 'na', 'aucun', 'aucun', 'true'),
       ('3', '2024-1', 'mat@com', 'drouin', 'mathieu', 'conferencier', 'na', 'aucun', 'aucun', 'true'),
       ('4', '2023-1', 'foo@com', 'drouin', 'foo', 'conferencier', 'na', 'aucun', 'aucun', 'true'),
       ('5', '2023-1', 'bar@com', 'drouin', 'bar', 'benevole', 'na', 'aucun', 'aucun', 'true'),
       ('6', '2023-1', 'abc@com', 'drouin', 'abc', 'responsable', 'na', 'aucun', 'aucun', 'true');


CREATE TABLE inscription (
  personne           VARCHAR(42) NOT NULL,
  frais           VARCHAR(42) NOT NULL,
  dernier_diplome VARCHAR(42) NOT NULL,
  occupation      VARCHAR(42) NOT NULL,
  organisation    VARCHAR(42) NOT NULL,
  constraint inscription_cc00 primary key (personne),
  constraint inscription_cr01 foreign key (personne) references enregistrement (ide)
);

insert into inscription(personne, frais, dernier_diplome, occupation, organisation) values
    ('1', 'etudiant', 'baccalaureat', 'etudiant en informatique de gestion', 'udes'),
    ('2', 'etudiant', 'maitrise', 'etudiant en informatique', 'udes');

CREATE TABLE chambre (
  personne    VARCHAR(42) NOT NULL,
  evenement   VARCHAR(42) NOT NULL,
  adresse     VARCHAR(42) NOT NULL,
  emplacement VARCHAR(42) NOT NULL,
  debut       VARCHAR(42) NOT NULL,
  fin         VARCHAR(42) NOT NULL,
  constraint chambre_cc00 primary key (personne),
  constraint chambre_cc01 unique (evenement, adresse, emplacement),
  constraint chambre_cr02 foreign key (personne, evenement) references enregistrement (ide, evenement)
);

insert into chambre(personne, evenement, adresse, emplacement, debut, fin) values
    ('1', '2023-1', '123', 'abc', 'foo', 'bar'),
    ('2', '2023-1', '1233', 'abc', 'xyz', 'zyx');

/* constraint absence a corriger, fin doit pas etre avant debut pour une meme enregistrement */
CREATE TABLE absence (
  personne VARCHAR(42) NOT NULL,
  debut VARCHAR(42) NOT NULL,
  fin   VARCHAR(42) NOT NULL,
  constraint absence_cc00 primary key (personne, debut, fin),
  constraint absence_cc01 unique (personne, debut),
  constraint absence_cc02 unique (personne, fin),
  constraint absence_cr03 foreign key (personne) references enregistrement (ide)
);

insert into absence (personne, debut, fin) values
    ('1', '12h', '20h'),
    ('1', '13h', '21h');

/* constraint check a ajouter: seulement une valeur primaire true par enregistrement */
CREATE TABLE telephone (
  personne   VARCHAR(42) NOT NULL,
  numero     VARCHAR(42) NOT NULL,
  primaire   bool        NOT NULL,
  constraint telephone_cc00 primary key (personne, numero),
  constraint telephone_cr01 foreign key (personne) references enregistrement (ide)
);

insert into telephone(personne, numero, primaire) VALUES
('1', '819', true),
('1', '514', true),
('2', '514', true);

CREATE TABLE theme (
  sujet       VARCHAR(42) NOT NULL,
  evenement   VARCHAR(42) NOT NULL,
  description text        NOT NULL,
  responsable VARCHAR(42) NOT NULL,
  categorie   VARCHAR(42) NOT NULL,
  debut       VARCHAR(42) NOT NULL,
  fin         VARCHAR(42) NOT NULL,
  constraint theme_cc00 primary key (sujet, evenement),
  constraint theme_cr03 foreign key (responsable, categorie, evenement) references enregistrement (ide, categorie, evenement),
  constraint theme_categorie_responsable check (categorie = 'responsable')
);

insert into theme(sujet, evenement, responsable, description, categorie, debut, fin) VALUES
    ('Biologie', '2023-1', '6', 'blahblah', 'responsable', '2023-01-01', '2023-07-30'),
    ('Gaming', '2023-1', '6', 'blahblah', 'responsable', '2023-01-01', '2023-07-30'),
    ('BD', '2023-1', '6', 'blahblah', 'responsable', '2023-01-01', '2023-07-30'),
    ('Chimie', '2023-1', '6', 'blahblah', 'responsable', '2023-01-01', '2023-07-30');

CREATE TABLE lieu (
  adresse     text NOT NULL,
  emplacement VARCHAR(42) NOT NULL,
  nb_places   VARCHAR(42) NOT NULL,
  description VARCHAR(42) NOT NULL,
  constraint lieu_cc00 primary key (adresse, emplacement)
);

insert into lieu(adresse, emplacement, nb_places, description) VALUES
('321 1ere avenue Val-des-Sources', 'Salle a manger', '40', 'Restaurant familial'),
('chez nous', 'dans le salon', '4', 'decoration assez mediocre'),
('quelque part', 'assis sur une chaise', '20', 'magasin de chaise'),
('2500 boul de l''Universite', 'D4-2021', '30', 'Salle de classe');

CREATE TABLE activite (
  titre       VARCHAR(42) NOT NULL,
  theme       VARCHAR(42) NOT NULL,
  evenement   VARCHAR(42) NOT NULL,
  description VARCHAR(42) NOT NULL,
  type        VARCHAR(42) NOT NULL,
  debut       VARCHAR(42) NOT NULL,
  fin         VARCHAR(42) NOT NULL,
  adresse     VARCHAR(42) NOT NULL,
  emplacement VARCHAR(42) NOT NULL,
  constraint activite_cc00 primary key (titre, theme, evenement),
  constraint activite_cc01 unique (titre, theme, evenement, type), /* pour les clés référentielles de animation, equipe et evaluation */
  constraint activite_cr02 foreign key (evenement, theme) references theme (evenement, sujet),
  constraint activite_cr03 foreign key (adresse, emplacement) references lieu (adresse, emplacement)
);

insert into activite(titre, theme, evenement, description, type, debut, fin, adresse, emplacement) VALUES
('Comment faire une poutine', 'Biologie', '2023-1', 'lorem', 'atelier', '12h', '13h', '321 1ere avenue Val-des-Sources', 'Salle a manger'),
('La combustion', 'Chimie', '2023-1', 'lorem', 'atelier', '12h', '13h', '321 1ere avenue Val-des-Sources', 'Salle a manger'),
('Super Smash Bros', 'Gaming', '2023-1', 'lorem', 'travail d''equipe', '12h', '13h', 'chez nous', 'dans le salon'),
('Evaluation sur Merise', 'BD', '2023-1', 'lorem', 'evaluation', '12h', '13h', 'quelque part', 'assis sur une chaise');

CREATE TABLE animation (
  personne  VARCHAR(42) NOT NULL,
  categorie VARCHAR(42) NOT NULL,
  evenement VARCHAR(42) NOT NULL,
  theme     VARCHAR(42) NOT NULL,
  activite  VARCHAR(42) NOT NULL,
  type      VARCHAR(42) NOT NULL,
  constraint animation_cc00 primary key (personne, evenement, theme, activite),
  constraint animation_cr01 foreign key (personne, evenement, categorie) references enregistrement (ide, evenement, categorie),
  constraint animation_cr02 foreign key (evenement, theme, activite, type) references activite (evenement, theme, titre, type),
  constraint animation_categorie_personne check (categorie = 'conferencier' or categorie = 'responsable'),
  constraint animation_type_activite check (type = 'presentation' or type = 'atelier' or type = 'social')
);

insert into animation(personne, categorie, evenement, theme, activite, type) VALUES
('4', 'conferencier', '2023-1', 'Biologie', 'Comment faire une poutine', 'atelier');

CREATE TABLE equipe (
  personne  VARCHAR(42) NOT NULL,
  categorie VARCHAR(42) NOT NULL,
  evenement VARCHAR(42) NOT NULL,
  theme     VARCHAR(42) NOT NULL,
  activite  VARCHAR(42) NOT NULL,
  type      VARCHAR(42) NOT NULL,
  numero    VARCHAR(42) NOT NULL,
  constraint equipe_cc00 primary key (personne, evenement, theme, activite),
  constraint equipe_cr01 foreign key (personne, evenement, categorie) references enregistrement (ide, evenement, categorie),
  constraint equipe_cr02 foreign key (evenement, theme, activite, type) references activite (evenement, theme, titre, type),
  constraint equipe_categorie_personne check (categorie = 'etudiant' or categorie = 'professionnel'),
  constraint equipe_type_activite check (type = 'travail d''equipe')
);
insert into equipe(personne, categorie, evenement, theme, activite, type, numero) VALUES
('1', 'etudiant', '2023-1', 'Gaming', 'Super Smash Bros', 'travail d''equipe', '14');

CREATE TABLE evaluation (
  personne  VARCHAR(42) NOT NULL,
  categorie VARCHAR(42) NOT NULL,
  evenement VARCHAR(42) NOT NULL,
  theme     VARCHAR(42) NOT NULL,
  activite  VARCHAR(42) NOT NULL,
  type      VARCHAR(42) NOT NULL,
  matricule VARCHAR(42) NOT NULL,
  cip       VARCHAR(42) NOT NULL,
  resultat  VARCHAR(42) NOT NULL,
  constraint evaluation_cc00 primary key (personne, evenement, theme, activite),
  constraint evaluation_cr01 foreign key (personne, evenement, categorie) references enregistrement (ide, evenement, categorie),
  constraint evaluation_cr02 foreign key (evenement, theme, activite, type) references activite (evenement, theme, titre, type),
  constraint evaluation_categorie_personne check (categorie = 'etudiant'),
  constraint evaluation_type_activite check (type = 'evaluation')
);
insert into evaluation(personne, categorie, evenement, theme, activite, type, matricule, cip, resultat) VALUES
('1', 'etudiant', '2023-1', 'BD', 'Evaluation sur Merise', 'evaluation', '42424242', 'DROG3503', 'echec');