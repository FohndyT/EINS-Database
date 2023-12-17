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
call inserer_resultat(21, 30, 'reussi'); -- enregistrement, evaluation, resultat
call inserer_resultat(22, 30, 'reussi');
call inserer_resultat(23, 30, 'reussi');
call inserer_resultat(25, 30, 'echec');
call inserer_resultat(26, 30, 'reussi');
call inserer_resultat(27, 30, 'reussi');
call inserer_resultat(28, 30, 'reussi');
call inserer_resultat(30, 30, 'reussi');
call inserer_resultat(31, 30, 'reussi');
call inserer_resultat(33, 30, 'reussi');
call inserer_resultat(34, 30, 'reussi');
call inserer_resultat(35, 30, 'reussi');
call inserer_resultat(36, 30, 'reussi');
call inserer_resultat(38, 30, 'echec');
call inserer_resultat(40, 30, 'reussi');

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
-- Fin de staff_test-val_ins.sql
-- =========================================================================== Z
*/