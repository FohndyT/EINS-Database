/*
-- =========================================================================== A
-- Insertion des données valides pour tester la table evenement et la procédure pro_ins_even.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--
-- Insérer des événements
call pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
call pro_ins_even('OpenAI DevDay', '2024', '2024-11-06', '2024-11-06');
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
-- Fin de evenement_test-val_ins.sql
-- =========================================================================== Z
*/