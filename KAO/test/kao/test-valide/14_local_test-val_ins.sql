/*
-- =========================================================================== A
-- Insertion des données valides pour tester les tables enregistrement, commentaire et staff
-- et les procédures creer_enregistrement_responsable, creer_enregistrement_benevole et creer_enregistrement_conferencier.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--

-- Insérer un local
call inserer_local('Université de Sherbrooke', '2500, boulevard de l''Université', 'D7-3021', 80); -- nom, adresse, emplacement, places
call inserer_local('Université de Sherbrooke', '2500, boulevard de l''Université', 'Cafétéria du D7', 150); -- pausediner
call inserer_local('Université de Sherbrooke', '2500, boulevard de l''Université', 'D7-2021', 35); -- pausecafe
call inserer_local('Université de Sherbrooke', '2500, boulevard de l''Université', 'D7-2023', 35); -- exam
call inserer_local('Refuge des brasseurs', '2155 Rue Galt O, Sherbrooke', 'Extérieur', 60); -- activites sociales
call inserer_local('Université de Sherbrooke', '2500, boulevard de l''Université', 'D4-1010', 30); -- locaux des profs



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
  2023-12-06 (FNT), (GD), (CB), (HMSD) : Création

-- -----------------------------------------------------------------------------
-- Fin de staff_test-val_ins.sql
-- =========================================================================== Z
*/