/*
-- =========================================================================== A
-- Insertion des données dictionnaires pour les tables 'type' du schéma kao.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';

-- Insérer les types de rôles
insert into type_role(idrole, nom)
values (1, 'Étudiant'),
       (2, 'Professionnel'),
       (3, 'Conférencier(ière)'),
       (4, 'Responsable'),
       (5, 'Bénévole');

-- Insérer les types de préférences alimentaires
insert into type_pref(idpref, nom)
values (1, 'Viande incluant poisson'),
       (2, 'Viande sans poisson'),
       (3, 'Végétarien'),
       (4, 'Végan'),
       (5, 'Aucune préférence');

-- Insérer les types d'intolérances alimentaires
insert into type_intol(idintol, nom)
values (1, 'Oeuf'),
       (2, 'Lait'),
       (3, 'Moutarde'),
       (4, 'Arachide'),
       (5, 'Mollusques et crustacés'),
       (6, 'Poissons'),
       (7, 'Graines de sésame'),
       (8, 'Soja'),
       (9, 'Sulfites'),
       (10, 'Noix'),
       (11, 'Blé et triticale'),
       (12, 'Céleri'),
       (13, 'Lupin');

-- Insérer les types de diplômes
insert into type_diplome(iddip, nom)
values (1, 'Baccalauréat'),
       (2, 'Maitrise'),
       (3, 'Doctorat');

-- Insérer les types d'activités
insert into type_activite(idtypact, nom, min, max)
values (1, 'Présentation', '15 minutes', '60 minutes'),
       (2, 'Atelier', '90 minutes', '190 minutes'),
       (3, 'Évaluation', '120 minutes', '120 minutes'),
       (4, 'Travail d''équipe', '60 minutes', '90 minutes'),
       (5, 'Pause café', '30 minutes', '30 minutes'),
       (6, 'Pause dîner', '90 minutes', '90 minutes'),
       (7, 'Activités sociales', '0 minutes', '360 minutes');

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

Sources :
https://www.canada.ca/fr/sante-canada/services/aliments-nutrition/salubrite-aliments/allergies-alimentaires-intolerances-alimentaires/allergies-alimentaires.html
-- -----------------------------------------------------------------------------
-- Fin de table_ins.sql
-- =========================================================================== Z
*/