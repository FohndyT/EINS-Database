/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table type_role 
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kaotest';
-- Insertion d'un Nom de role en Double
INSERT INTO type_role (nom) VALUES ('Conférencier');
INSERT INTO type_role (nom) VALUES ('Conférencier'); 

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
-- Fin de evenement_test-val_ins.sql
-- =========================================================================== Z
*/