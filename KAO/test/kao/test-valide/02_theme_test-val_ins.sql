/*
-- =========================================================================== A
-- Insertion des données valides pour tester la table theme et la procédure insert_theme.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--
-- Insérer des thèmes
call insert_theme(1, 'La végétation', 'Les plantes seront le centre de nos activités', '2023-06-06', '2023-06-06');
call insert_theme(1, 'Les réactions explosives', 'Nous explorerons les réactions chimiques entrainant des réactions explosives', '2023-06-07', '2023-06-07');
call insert_theme(1, 'Les calculs', 'On fait des calculs mathématiques à longueur de journées', '2023-06-08', '2023-06-08');

call insert_theme(2, 'L''intelligence artificielle générale', 'Une avancée technologique qui sera atteinte soit dans quelques années, soit dans 30 minutes', '2024-11-06', '2024-11-06');
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
