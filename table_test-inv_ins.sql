/*
-- =========================================================================== A
-- Insertion des données invalides pour tester les tables.
-- -----------------------------------------------------------------------------
Produit  : Saphir
Version  : 0.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kao62';
--
-- ======= Tester la table evenement
-- Tester une fin invalide
insert into kao62.evenement(edition, debut, fin)
values ('2023-1', '2023-06-01', '2023-05-07');

-- ======= Tester la table enregistrement
-- Tester un courriel invalide
insert into kao62.enregistrement(ide, evenement, courriel, nom, prenom, categorie, pref_alim, intol_alim, commentaire, politique_check)
values (1, '2023-1', 'Maxmoringmail.com', 'Morin', 'Max', 'professionnel', 'V_AP', 'Lactose', null, 'true');
-- Tester une catégorie invalide
insert into kao62.enregistrement(ide, evenement, courriel, nom, prenom, categorie, pref_alim, intol_alim, commentaire, politique_check)
values (1, '2023-1', 'Maxmoringmail.com', 'Morin', 'Max', 'CEO', 'V_AP', 'Lactose', null, 'true');

-- ======= Tester la table inscription
-- Tester un frais invalide
insert into kao62.inscription(personne, frais, dernier_diplome, occupation, organisation)
values (2, 'responsable', 'baccalaureat', 'etudiant en informatique de gestion', 'UdeS');
-- Tester une personne invalide
insert into kao62.inscription(personne, frais, dernier_diplome, occupation, organisation)
values (574667544, 'etudiant', 'baccalaureat', 'etudiant en informatique de gestion', 'UdeS');

-- ======= Tester la table chambre
-- Tester une fin invalide
insert into kao62.chambre(personne, evenement, adresse, emplacement, debut, fin)
values (3, '2024-1', '123', 'Hotel Times', '2023-01-01', '2022-02-14');
-- Tester une personne invalide
insert into kao62.chambre(personne, evenement, adresse, emplacement, debut, fin)
values (4, '2024-1', '123', 'Hotel Times', '2023-01-01', '2023-02-14');

-- ======= Tester la table absence
-- Tester une fin invalide
insert into kao62.absence(personne, debut, fin)
values (3, '2023-01-02', '2022-01-03');
-- Tester une personne invalide
insert into kao62.absence(personne, debut, fin)
values (9378643916, '2022-01-02', '2022-01-03');

-- ======= Tester la table telephone
-- Tester un numero invalide
insert into kao62.telephone(personne, numero, primaire)
values ('3', '819-345-6345-9291', false);
-- Tester un numero invalide
insert into kao62.telephone(personne, numero, primaire)
values ('3', 'abc-345-6kk5', false);
-- Tester une personne invalide
insert into kao62.telephone(personne, numero, primaire)
values (78384, '819-355-4532', false);

-- ======= Tester la table theme
-- Tester un evenement invalide
insert into kao62.theme(sujet, evenement, responsable, description, categorie, debut, fin)
values ('Biologie', '2030-1', 6, 'Étude des êtres et de la matière vivante', 'responsable', '2023-01-01', '2023-07-30');
-- Tester une fin invalide
insert into kao62.theme(sujet, evenement, responsable, description, categorie, debut, fin)
values ('Gaming', '2023-1', 6, 'Univers des jeux vidéos', 'responsable', '2023-05-01', '2022-06-15');

-- ======= Tester la table lieu
-- Tester un nb_places invalide
insert into kao62.lieu(adresse, emplacement, nb_places, description)
values ('321 1ere avenue Val-des-Sources', 'Salle a manger', -2, 'Restaurant familial');

-- ======= Tester la table activite
-- Tester un theme invalide
insert into kao62.activite(titre, theme, evenement, description, type, debut, fin, adresse, emplacement)
values ('Comment faire une poutine', 'slkdjgklsdhgls', '2023-1', 'Très important dans le domaine de la biologie', 'atelier', '2023-01-01', '2023-01-03', '321 1ere avenue Val-des-Sources', 'Salle a manger');
-- Tester un type invalide
insert into kao62.activite(titre, theme, evenement, description, type, debut, fin, adresse, emplacement)
values ('Comment faire une poutine', 'Biologie', '2023-1', 'Très important dans le domaine de la biologie', 'Google', '2023-01-01', '2023-01-03', '321 1ere avenue Val-des-Sources', 'Salle a manger');

-- ======= Tester la table animation
-- Tester un theme invalide
insert into kao62.animation(personne, categorie, evenement, theme, activite, type)
values (4, 'conferencier', '2023-1', 'Aloa', 'La combustion', 'atelier');
-- Tester une personne invalide
insert into kao62.animation(personne, categorie, evenement, theme, activite, type)
values (999, 'conferencier', '2023-1', 'Chimie', 'La combustion', 'atelier');
-- Tester une type invalide
insert into kao62.animation(personne, categorie, evenement, theme, activite, type)
values (4, 'conferencier', '2023-1', 'Chimie', 'La combustion', 'travail_equipe');

-- ======= Tester la table equipe
-- Tester un type invalide
insert into kao62.equipe(personne, categorie, evenement, theme, activite, type, numero)
values ('2', 'etudiant', '2023-1', 'Gaming', 'Super Smash Bros', 'presentation', '14');
-- Tester une catégorie invalide
insert into kao62.equipe(personne, categorie, evenement, theme, activite, type, numero)
values ('7', 'responsable', '2023-1', 'Gaming', 'Super Smash Bros', 'travail_equipe', '14');

-- ======= Tester la table evaluation
-- Tester une catégorie invalide
insert into kao62.evaluation(personne, categorie, evenement, theme, activite, type, matricule, cip, resultat)
values ('2', 'conferencier', '2023-1', 'BD', 'Evaluation sur Merise', 'evaluation', '42424242', 'DROG3503', 'echec');
-- Tester un type invalide
insert into kao62.evaluation(personne, categorie, evenement, theme, activite, type, matricule, cip, resultat)
values ('2', 'etudiant', '2023-1', 'BD', 'Evaluation sur Merise', 'presentation', '42424242', 'DROG3503', 'echec');
-- Tester un matricule invalide
insert into kao62.evaluation(personne, categorie, evenement, theme, activite, type, matricule, cip, resultat)
values ('2', 'etudiant', '2023-1', 'BD', 'Evaluation sur Merise', 'evaluation', 'qbv387vh433487', 'DROG3503', 'echec');
-- Tester un cip invalide
insert into kao62.evaluation(personne, categorie, evenement, theme, activite, type, matricule, cip, resultat)
values ('2', 'etudiant', '2023-1', 'BD', 'Evaluation sur Merise', 'evaluation', '42424242', 'D5423503', 'echec');
-- Tester un resultat invalide
insert into kao62.evaluation(personne, categorie, evenement, theme, activite, type, matricule, cip, resultat)
values ('2', 'etudiant', '2023-1', 'BD', 'Evaluation sur Merise', 'evaluation', '42424242', 'DROG3503', 'bravo');
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
  2023-09-17 (FNT), (GD), (CB), (HMSD) : Création

-- -----------------------------------------------------------------------------
-- Fin de table_test-inv_ins.sql.sql
-- =========================================================================== Z
*/