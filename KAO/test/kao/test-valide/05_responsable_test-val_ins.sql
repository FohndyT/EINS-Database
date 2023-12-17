/*
-- =========================================================================== A
-- Insertion des données valides pour l'enregistrement des responsables
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--
-- Insérer des enregistrements de responsables
call creer_enregistrement_responsable(1, 1, '819-555-4629', null, true); -- compte, evenement, telephone, commentaire, politique_check
call inserer_pref_alimentaire(1,5);
call inserer_intol_alimentaire(1, 2);

call creer_enregistrement_responsable(2, 1, '819-666-9283', null, true);
call inserer_pref_alimentaire(2, 5);

call creer_enregistrement_responsable(3, 1, '819-777-0123', null, true);
call inserer_pref_alimentaire(3, 1);

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
-- Fin de 05_responsable_test-val_ins.sql
-- =========================================================================== Z
*/