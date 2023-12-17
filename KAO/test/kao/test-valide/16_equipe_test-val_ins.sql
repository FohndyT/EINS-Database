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

-- Assigner un enregistrement à une équipe lors d'un travail d'équipe
call inserer_dans_equipe(21, 7, 'Équipe 1');
call inserer_dans_equipe(22, 7, 'Équipe 1');
call inserer_dans_equipe(23, 7, 'Équipe 1');
call inserer_dans_equipe(24, 7, 'Équipe 1');
call inserer_dans_equipe(25, 7, 'Équipe 1');
call inserer_dans_equipe(26, 7, 'Équipe 2');
call inserer_dans_equipe(27, 7, 'Équipe 2');
call inserer_dans_equipe(28, 7, 'Équipe 2');
call inserer_dans_equipe(29, 7, 'Équipe 2');
call inserer_dans_equipe(30, 7, 'Équipe 3');
call inserer_dans_equipe(31, 7, 'Équipe 3');
call inserer_dans_equipe(32, 7, 'Équipe 3');
call inserer_dans_equipe(33, 7, 'Équipe 3');
call inserer_dans_equipe(34, 7, 'Équipe 4');
call inserer_dans_equipe(35, 7, 'Équipe 4');
call inserer_dans_equipe(36, 7, 'Équipe 4');
call inserer_dans_equipe(37, 7, 'Équipe 4');
call inserer_dans_equipe(38, 7, 'Équipe 5');
call inserer_dans_equipe(39, 7, 'Équipe 5');
call inserer_dans_equipe(40, 7, 'Équipe 5');
call inserer_dans_equipe(41, 7, 'Équipe 5');
call inserer_dans_equipe(42, 7, 'Équipe 1');
call inserer_dans_equipe(43, 7, 'Équipe 1');
call inserer_dans_equipe(44, 7, 'Équipe 2');
call inserer_dans_equipe(45, 7, 'Équipe 2');
call inserer_dans_equipe(46, 7, 'Équipe 3');
call inserer_dans_equipe(47, 7, 'Équipe 3');
call inserer_dans_equipe(48, 7, 'Équipe 4');
call inserer_dans_equipe(49, 7, 'Équipe 4');
call inserer_dans_equipe(50, 7, 'Équipe 5');
call inserer_dans_equipe(51, 7, 'Équipe 5');
call inserer_dans_equipe(52, 7, 'Équipe 5');

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
-- Fin de equipe_test-val_ins.sql
-- =========================================================================== Z
*/