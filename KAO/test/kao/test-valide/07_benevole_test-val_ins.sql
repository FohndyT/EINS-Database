/*
-- =========================================================================== A
-- Insertion des données valides pour l'enregistrement des bénévoles
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--
-- Insérer des enregistrements de bénévoles
call creer_enregistrement_benevole(15, 1, '514-555-6677', null, true); -- compte, evenement, telephone, commentaire, politique_check
call inserer_pref_alimentaire(15, 4);

call creer_enregistrement_benevole(16, 1, '418-666-7788', null, true);
call inserer_pref_alimentaire(16, 3);
call inserer_intol_alimentaire(16, 7);

call creer_enregistrement_benevole(17, 1, '819-777-8899', null, true);
call inserer_pref_alimentaire(17, 2);

call creer_enregistrement_benevole(18, 1, '438-888-9900', 'Température des pièces à plus de 27 degrées SVP, merci !!!', true);
call inserer_pref_alimentaire(18, 4);

call creer_enregistrement_benevole(19, 1, '514-999-0011', null, true);
call inserer_pref_alimentaire(19, 1);

call creer_enregistrement_benevole(20, 1, '450-111-2233', null, true);
call inserer_pref_alimentaire(20, 5);

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
-- Fin de 07_benevole_test-val_ins.sql
-- =========================================================================== Z
*/