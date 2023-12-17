/*
-- =========================================================================== A
-- Insertion des données valides pour l'enregistrement des professionnels
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--
-- Insérer des enregistrements de professionnels
call creer_enregistrement_professionnel(42, 1, 'Chercheur en astrophysique', 'Université de Sherbrooke', 3, null, true); -- compte, evenement, occupation, organisation, commentaire, politique_check
call inserer_pref_alimentaire(42, 4);

call creer_enregistrement_professionnel(43, 1, 'Diplomate', 'Gouvernement de la Roumanie', 2, null, true);
call inserer_pref_alimentaire(43, 2);

call creer_enregistrement_professionnel(44, 1, 'Testeur de jeux vidéos', 'Ubisoft', 1, null, true);
call inserer_pref_alimentaire(44, 3);

call creer_enregistrement_professionnel(45, 1, 'Agent de la police montée', 'Gouvernement du Canada', 1, null, true);
call inserer_pref_alimentaire(45, 1);

call creer_enregistrement_professionnel(46, 1, 'Programmeur front-end', 'GRIIS', 2, null, true);
call inserer_pref_alimentaire(46, 3);

call creer_enregistrement_professionnel(47, 1, 'Neurochirurgien', 'CHUS', 3, null, true);
call inserer_pref_alimentaire(47, 2);

call creer_enregistrement_professionnel(48, 1, 'Chef scientifique de l''Insititut Quantique', 'Université de Sherbrooke', 3, null, true);
call inserer_pref_alimentaire(48, 1);

call creer_enregistrement_professionnel(49, 1, 'Professeur de marketing', 'Université de Toronto', 3, 'RIEN', true);
call inserer_pref_alimentaire(49, 4);

call creer_enregistrement_professionnel(50, 1, 'Cuisinier', 'Club de Golf de Sherbrooke', 1, 'J''HAIS LES OEUFS !!!!!', true);
call inserer_pref_alimentaire(50, 5);
call inserer_intol_alimentaire(50, 1);

call creer_enregistrement_professionnel(51, 1, 'Mécanicien', 'Garage Mario Moreau', 1, 'Je sais réparer une voiture', true);
call inserer_pref_alimentaire(51, 5);
call inserer_intol_alimentaire(51, 1);

call creer_enregistrement_professionnel(52, 1, 'Physicien', 'Université du Delaware', 1, null, true);
call inserer_pref_alimentaire(52, 5);
call inserer_intol_alimentaire(52, 13);


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
  2023-12-07 (FNT), (GD), (CB), (HMSD) : Création

-- -----------------------------------------------------------------------------
-- Fin de professionnel_test-val_ins.sql
-- =========================================================================== Z
*/