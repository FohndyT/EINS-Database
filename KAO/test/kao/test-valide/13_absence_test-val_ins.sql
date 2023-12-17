/*
-- =========================================================================== A
-- Insertion des données valides pour tester les absences
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--

-- Assigner une absence à un enregistrement
call pro_ins_abs(4, '2023-06-08', '2023-06-09'); -- enregistrement, debut, fin
call pro_ins_abs(6, '2023-06-07', '2023-06-08');
call pro_ins_abs(7, '2023-06-06', '2023-06-07');
call pro_ins_abs(7, '2023-06-08', '2023-06-09');
call pro_ins_abs(12, '2023-06-06', '2023-06-07');

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
-- Fin de absence_test-val_ins.sql
-- =========================================================================== Z
*/