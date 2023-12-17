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
-- Insérer des enregistrements de conférenciers
call creer_enregistrement_conferencier(4, 1, '514-382-8008', null, true); -- compte, evenement, telephone, commentaire, politique_check
call inserer_pref_alimentaire(4, 1);

call creer_enregistrement_conferencier(5, 1, '418-786-8008', null, true);
call inserer_pref_alimentaire(5, 1);

call creer_enregistrement_conferencier(6, 1, '438-555-9876', null, true);
call inserer_pref_alimentaire(6, 3);

call creer_enregistrement_conferencier(7, 1, '613-444-7654', null, true);
call inserer_pref_alimentaire(7, 2);

call creer_enregistrement_conferencier(8, 1, '450-777-1234', null, true);
call inserer_pref_alimentaire(8, 4);

call creer_enregistrement_conferencier(9, 1, '514-888-5678', null, true);
call inserer_pref_alimentaire(9, 5);

call creer_enregistrement_conferencier(10, 1, '418-999-4321', null, true);
call inserer_pref_alimentaire(10, 1);

call creer_enregistrement_conferencier(11, 1, '819-111-2233', null, true);
call inserer_pref_alimentaire(11, 3);

call creer_enregistrement_conferencier(12, 1, '514-222-3344', null, true);
call inserer_pref_alimentaire(12, 5);

call creer_enregistrement_conferencier(13, 1, '450-333-4455', 'Allergique aux arachides émondées seulement', true);
call inserer_pref_alimentaire(13, 2);
call inserer_intol_alimentaire(13, 4);
call inserer_intol_alimentaire(13, 5);

call creer_enregistrement_conferencier(14, 1, '613-444-5566', null, true);
call inserer_pref_alimentaire(14, 1);

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