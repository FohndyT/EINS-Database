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

-- Assigner un local à une activité
call assigner_local(1, 1); -- activite, local
call assigner_local(2, 1);
call assigner_local(3, 3);
call assigner_local(4, 1);
call assigner_local(5, 2);
call assigner_local(6, 1);
call assigner_local(7, 1);
call assigner_local(8, 3);
call assigner_local(9, 1);
call assigner_local(10, 5);

call assigner_local(11, 1);
call assigner_local(12, 1);
call assigner_local(13, 3);
call assigner_local(14, 1);
call assigner_local(15, 6);
call assigner_local(16, 2);
call assigner_local(17, 1);
call assigner_local(18, 1);
call assigner_local(19, 3);
call assigner_local(20, 1);
call assigner_local(21, 5);

call assigner_local(22, 1);
call assigner_local(23, 1);
call assigner_local(24, 3);
call assigner_local(25, 1);
call assigner_local(26, 2);
call assigner_local(27, 1);
call assigner_local(28, 1);
call assigner_local(29, 3);
call assigner_local(30, 4);
call assigner_local(31, 1);
call assigner_local(32, 5);

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