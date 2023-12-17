/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table theme et la procédure insert_theme.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kaotest';
-- teste d'insertion d'invalidité dans la table theme
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
call pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
-- 1) tester un theme avec des dates en dehors de l'intervalle de l'événement correspondant (evenement 1 : '2023-06-06', '2023-06-09')
call insert_theme(1, 'Le comportement de la lumière', 'On parle de la nature et du fonctionnement de la lumière', '2023-06-06 07:00:00', '2023-06-09 18:00:00');
-- 2) Tester l'existence de l'événement pour le theme correspondant
call insert_theme(6, 'Les réactions explosives', 'Nous explorerons les réactions chimiques entrainant des réactions explosives', '2023-11-06 08:00:00', '2023-11-06 20:00:00');

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