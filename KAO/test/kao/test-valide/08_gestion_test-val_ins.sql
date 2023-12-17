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

-- Assigner la gestion d'un événement à un responsable
call inserer_gestion(1, 1);
call inserer_gestion(2, 2);
call inserer_gestion(3, 3);

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
-- Fin de gestion_test-val_ins.sql
-- =========================================================================== Z
*/