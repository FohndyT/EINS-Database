/*
-- =========================================================================== A
-- Insertion des données valides pour tester les tables.
-- -----------------------------------------------------------------------------
Produit  : Saphir
Version  : 0.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kao62';
--
-- Insérer des évènements
insert into kao62.evenement(edition, debut, fin)
values ('2023-1', '2023-01-01', '2023-05-07'),
       ('2023-2', '2023-01-08', '2023-12-12'),
       ('2024-1', '2024-01-01', '2024-06-29'),
       ('2028-3', '2028-05-01', '2028-06-12');

-- Insérer des enregistrements
insert into kao62.enregistrement(ide, evenement, courriel, nom, prenom, categorie, pref_alim, intol_alim, commentaire, politique_check)
values (1, '2023-1', 'Maxmorin@gmail.com', 'Morin', 'Max', 'professionnel', 'V_AP', 'Lactose', null, true),
       (2, '2023-1', 'xav@usherbrooke.ca', 'Lamarre', 'Xavier', 'etudiant', 'NA', 'Fruits de mer', null, true),
       (3, '2024-1', 'mat@yahoo.fr', 'Beauregard', 'Mathieu', 'conferencier', 'V_SP', null, 'Viens avec ses 2 enfants', true),
       (4, '2023-1', 'uppercut@gmail.com', 'Ali', 'Muhammad', 'conferencier', 'NA', null, null, true),
       (5, '2023-1', 'CambridgeAnalytica@gmail.com', 'Zuckerberg', 'Mark', 'benevole', 'NA', 'Gluten', 'Le Metavers est un succès', false),
       (6, '2023-1', '3000@gmail.com', 'Stark', 'Tony', 'responsable', 'V_SP', null, null, true),
       (7, '2028-3', 'cleave@yahoo.fr', 'Ryomen', 'Sukuna', 'responsable', 'NA', 'Légumes', null, false),
       (8, '2028-3', 'ThePresident@gmail.com', 'Obama', 'Barack', 'conferencier', 'V_AP', null, 'Est très occupé', true),
       (9, '2028-3', 'Ben10@usherbrooke.ca', 'Ten', 'Ben', 'etudiant', 'NA', null, 'A des problèmes d''attention', true);

-- Insérer des inscriptions
insert into kao62.inscription(personne, frais, dernier_diplome, occupation, organisation)
values (2, 'etudiant', 'baccalaureat', 'etudiant en informatique de gestion', 'UdeS'),
       (1, 'professionnel', 'maitrise', 'Gestionnaire de comptes', 'Industrie pharmaceutique'),
       (9, 'etudiant', 'baccalaureat', 'etudiant en biologie', 'UdeS');

-- Insérer des chambres
insert into kao62.chambre(personne, evenement, adresse, emplacement, debut, fin)
values (3, '2024-1', '123', 'Hotel Times', '2023-01-01', '2023-02-14'),
       (4, '2023-1', '1233', 'ABC Hotel', '2023-01-01', '2023-03-22'),
       (8, '2028-3', '865', 'Hotel Hotel', '2028-05-01', '2028-06-12');

-- Insérer des absences
insert into kao62.absence(personne, debut, fin)
values (3, '2023-01-02', '2023-01-03'),
       (4, '2023-01-05', '2023-02-05'),
       (7, '2028-05-01', '2028-06-12');

-- Insérer des téléphones
insert into kao62.telephone(personne, numero, primaire)
values (3, '819-345-6345', true),
       (1, '5194442222', false),
       (5, '514-946-4642', true),
       (7, '514-946-4642', true),
       (8, '4381019988', true);

-- Insérer des thèmes
insert into kao62.theme(sujet, evenement, responsable, description, categorie, debut, fin)
values ('Biologie', '2023-1', 6, 'Étude des êtres et de la matière vivante', 'responsable', '2023-01-01', '2023-07-30'),
       ('Gaming', '2023-1', 6, 'Univers des jeux vidéos', 'responsable', '2023-05-01', '2023-06-15'),
       ('BD', '2023-1', 6, 'Les bandes déssinées', 'responsable', '2023-04-01', '2023-08-11'),
       ('Chimie', '2023-1', 6, 'Laboratoires et expériences de chimie !', 'responsable', '2023-01-28', '2023-09-26'),
       ('Zoologie', '2028-3', 7, 'Les animaux', 'responsable', '2028-05-01', '2028-06-12');

-- Insérer des lieux
insert into kao62.lieu(adresse, emplacement, nb_places, description)
values ('321 1ere avenue Val-des-Sources', 'Salle a manger', 40, 'Restaurant familial'),
       ('chez nous', 'dans le salon', 4, 'decoration assez mediocre'),
       ('quelque part', 'assis sur une chaise', 20, 'magasin de chaise'),
       ('2500 boul de l''Universite', 'D4-2021', 30, 'Salle de classe'),
       ('1234 rue Rue', 'Somewhere over the rainbow', 50, 'En Hawaii');

-- Insérer des activités
insert into kao62.activite(titre, theme, evenement, description, type, debut, fin, adresse, emplacement)
values ('Comment faire une poutine', 'Biologie', '2023-1', 'Très important dans le domaine de la biologie', 'atelier', '2023-01-01', '2023-01-03', '321 1ere avenue Val-des-Sources', 'Salle a manger'),
       ('La combustion', 'Chimie', '2023-1', 'Exemple de combustion spontannée sur les participants', 'atelier', '2023-01-01', '2023-01-03', '321 1ere avenue Val-des-Sources', 'Salle a manger'),
       ('Super Smash Bros', 'Gaming', '2023-1', 'Tous ceux qui perdent on un échec', 'travail_equipe', '2023-01-01', '2023-01-03', 'chez nous', 'dans le salon'),
       ('Evaluation sur Merise', 'BD', '2023-1', 'Something something schéma', 'evaluation', '2023-01-01', '2023-01-03', 'quelque part', 'assis sur une chaise'),
       ('Présentation des serpents', 'Zoologie', '2028-3', 'ssssssssssss', 'presentation', '2028-05-01', '2028-05-02', '1234 rue Rue', 'Somewhere over the rainbow'),
       ('Chasser les ours bruns', 'Zoologie', '2028-3', 'Ce fait a mains nues', 'atelier', '2028-05-03', '2028-05-04', '1234 rue Rue', 'Somewhere over the rainbow'),
       ('Pause café', 'Zoologie', '2028-3', 'Une pause', 'pause_cafe', '2028-05-05', '2028-05-06', '1234 rue Rue', 'Somewhere over the rainbow'),
       ('Test sur les oiseaux', 'Zoologie', '2028-3', 'Name every existing birds', 'evaluation', '2028-05-07', '2028-05-08', '1234 rue Rue', 'Somewhere over the rainbow');

-- Insérer des animations
insert into kao62.animation(personne, categorie, evenement, theme, activite, type)
values (4, 'conferencier', '2023-1', 'Chimie', 'La combustion', 'atelier'),
       (4, 'conferencier', '2023-1', 'Biologie', 'Comment faire une poutine', 'atelier'),
       (8, 'conferencier', '2028-3', 'Zoologie', 'Présentation des serpents', 'presentation');

-- Insérer des équipes
insert into kao62.equipe(personne, categorie, evenement, theme, activite, type, numero)
values (2, 'etudiant', '2023-1', 'Gaming', 'Super Smash Bros', 'travail_equipe', 14),
       (1, 'professionnel', '2023-1', 'Gaming', 'Super Smash Bros', 'travail_equipe', 14);

-- Insérer des évaluations
insert into kao62.evaluation(personne, categorie, evenement, theme, activite, type, matricule, cip, resultat)
values (2, 'etudiant', '2023-1', 'BD', 'Evaluation sur Merise', 'evaluation', '42424242', 'DROG3503', 'echec'),
       (9, 'etudiant', '2028-3', 'Zoologie', 'Test sur les oiseaux', 'evaluation', '12345678', 'TEBE1234', 'reussi');
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
  2023-08-14 (FNT), (GD), (CB), (HMSD) : Création

-- -----------------------------------------------------------------------------
-- Fin de table_test-val_ins.sql
-- =========================================================================== Z
*/