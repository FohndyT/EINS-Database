/*
-- =========================================================================== A
-- Insertion des données valides pour l'enregistrement des étudiants
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';

-- Insérer des enregistrements de conférenciers
call creer_enregistrement_etudiant(21, 1, 'Étudiant en microbiologie', 'Université de Sherbrooke', 2, null, true, '74849311', 'DKFL9581'); -- compte, evenement, occupation, organisation, commentaire, politique_check, matricule, cip
call inserer_pref_alimentaire(21, 5);

call creer_enregistrement_etudiant(22, 1, 'Étudiant en médecine', 'Université de Sherbrooke', 1, 'Mettre le céleri à part pour mon lapin domestique', true, '99367382', 'PPDM2993');
call inserer_pref_alimentaire(22, 1);
call inserer_intol_alimentaire(22, 1);
call inserer_intol_alimentaire(22, 3);
call inserer_intol_alimentaire(22, 12);

call creer_enregistrement_etudiant(23, 1, 'Étudiant en sciences du multimédia et du jeu vidéo', 'Université de Sherbrooke', 3, null, true, '98076447', 'DRFE1116');
call inserer_pref_alimentaire(23, 4);

call creer_enregistrement_etudiant(24, 1, 'Étudiant en médecine', 'Université d''Ottawa', 2, null, true, null, null);
call inserer_pref_alimentaire(24, 2);
call inserer_intol_alimentaire(24, 2);

call creer_enregistrement_etudiant(25, 1, 'Étudiant en sciences du multimédia et du jeu vidéo', 'Université de Sherbrooke', 1, 'Ok Google comment me rendre à EINS 2023', true, '92847611', 'ZXRT7892');
call inserer_pref_alimentaire(25, 5);

call creer_enregistrement_etudiant(26, 1, 'Étudiant en microbiologie', 'Université de Sherbrooke', 2, null, true, '61539482', 'QWER1287');
call inserer_pref_alimentaire(26, 3);

call creer_enregistrement_etudiant(27, 1, 'Étudiant en mathématique', 'Université de Sherbrooke', 1, null, true, '75423016', 'LKJH9347');
call inserer_pref_alimentaire(27, 1);

call creer_enregistrement_etudiant(28, 1, 'Étudiant en médecine', 'Université de Sherbrooke', 3, null, true, '49012736', 'POIU5729');
call inserer_pref_alimentaire(28, 4);

call creer_enregistrement_etudiant(29, 1, 'Étudiant en communication', 'UQAM', 1, 'S''assurer que tous les lieux sont adaptés pour les fauteuils roulants svp', true, null, null);
call inserer_pref_alimentaire(29, 5);

call creer_enregistrement_etudiant(30, 1, 'Étudiant en philosophie', 'Université de Sherbrooke', 3, null, true, '26758049', 'CVBN6823');
call inserer_pref_alimentaire(30, 2);

call creer_enregistrement_etudiant(31, 1, 'Étudiant en médecine', 'Université de Sherbrooke', 2, null, true, '19382750', 'ASDF2398');
call inserer_pref_alimentaire(31, 3);

call creer_enregistrement_etudiant(32, 1, 'Étudiant en génie logiciel', 'Polytechnique de Montréal', 1, null, true, null, null);
call inserer_pref_alimentaire(32, 1);

call creer_enregistrement_etudiant(33, 1, 'Étudiant en mathématique', 'Université de Sherbrooke', 2, null, true, '74610582', 'UYTR4751');
call inserer_pref_alimentaire(33, 2);
call inserer_intol_alimentaire(33, 6);

call creer_enregistrement_etudiant(34, 1, 'Étudiant en microbiologie', 'Université de Sherbrooke', 3, null, true, '39847162', 'POIU2975');
call inserer_pref_alimentaire(34, 3);

call creer_enregistrement_etudiant(35, 1, 'Étudiant en chimie', 'Université de Sherbrooke', 1, null, true, '56203814', 'LKJH7392');
call inserer_pref_alimentaire(35, 4);

call creer_enregistrement_etudiant(36, 1, 'Étudiant en sciences du multimédia et du jeu vidéo', 'Université de Sherbrooke', 2, null, true, '94278513', 'ASDF6824');
call inserer_pref_alimentaire(36, 5);

call creer_enregistrement_etudiant(37, 1, 'Étudiant en médecine', 'UQAC', 1, 'm''envoyer la liste des conferenciers a mon adresse postale 321 1ere avenue val des sources svp merci jen ai de besoin vrm important svp svp merci bcp !', true, null, null);
call inserer_pref_alimentaire(37, 1);

call creer_enregistrement_etudiant(38, 1, 'Étudiant en sciences du multimédia et du jeu vidéo', 'Université de Sherbrooke', 3, null, true, '84751620', 'ZXCV2094');
call inserer_pref_alimentaire(38, 2);
call inserer_intol_alimentaire(38, 6);
call inserer_intol_alimentaire(38, 7);

call creer_enregistrement_etudiant(39, 1, 'Étudiant en mathématique', 'Université Bishop', 2, null, true, null, null);
call inserer_pref_alimentaire(39, 3);

call creer_enregistrement_etudiant(40, 1, 'Étudiant en microbiologie', 'Université de Sherbrooke', 1, null, true, '92867415', 'UIOP3749');
call inserer_pref_alimentaire(40, 4);

call creer_enregistrement_etudiant(41, 1, 'Étudiant en droit', 'Université McGill', 3, null, true, null, null);
call inserer_pref_alimentaire(41, 5);

--
/*
-- =========================================================================== Z
Contributeurs :
  (FNT)  Nomerth.Fohndy.Tah@USherbrooke.ca
  (GD)   Gabriel.Drouin2@usherbrooke.ca
  (CB)   Constant.Bastonnais@usherbrooke.ca
  (HMSD) Haran.Mourno.Suliman.Dogoy@usherbrooke.ca

Tâches réalisées :
  2023-12-07 (FNT), (GD), (CB), (HMSD) : Création

-- -----------------------------------------------------------------------------
-- Fin de etudiant_test-val_ins.sql
-- =========================================================================== Z
*/