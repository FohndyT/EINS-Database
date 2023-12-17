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

-- Assigner l'animation d'une activité à un responsable et/ou un conférencier
call inserer_animateur(4, 1); -- enregistrement, activite
call inserer_animateur(5, 2);
call inserer_animateur(6, 4);
call inserer_animateur(4, 6);
call inserer_animateur(1, 6);
call inserer_animateur(8, 9);
call inserer_animateur(9, 11);
call inserer_animateur(10, 12);
call inserer_animateur(7, 12);
call inserer_animateur(12, 15);
call inserer_animateur(2, 15);
call inserer_animateur(13, 17);
call inserer_animateur(14, 18);
call inserer_animateur(11, 22);
call inserer_animateur(3, 22);
call inserer_animateur(12, 23);
call inserer_animateur(9, 25);
call inserer_animateur(10, 27);
call inserer_animateur(5, 28);

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
-- Fin de animation_test-val_ins.sql
-- =========================================================================== Z
*/