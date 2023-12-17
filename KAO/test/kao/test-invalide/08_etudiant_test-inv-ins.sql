/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table enregistrement

-- et les procédures creer_enregistrement_etudiant,creer_enregistrement_etudiant
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kaotest';
-- tester des insertions invalides pour la table enregistrement en utilisant la procédure creer_enregistrement_etudiant
-- pour le categorie d'enregistrement etudiant rejetter l'enregistrement lorsque le paramètre _politique_check est à false
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');


--==================================================>Étudiant
insert into type_role(idrole, nom)
values (1, 'Étudiant');
-- pour le categorie d'enregistrement professionnel rejetter l'enregistrement lorsque le paramètre _politique_check est à false
call creer_enregistrement_etudiant(1,
                                   1,
                                   'Étudiant en microbiologie',
                                   'Université de Sherbrooke',
                                   1,
                                   null,
                                   false,
                                   '74849311',
                                   'DKFL9581'
);
-- Test avec un ID de Compte Invalide
call creer_enregistrement_etudiant(2,
                                   1,
                                   'Étudiant en microbiologie',
                                   'Université de Sherbrooke',
                                   1,
                                   null,
                                   true,
                                   '74849311',
                                   'DKFL9581'
);
-- Test avec un ID de evenement Invalide
call creer_enregistrement_etudiant(1,
                                   2,
                                   'Étudiant en microbiologie',
                                   'Université de Sherbrooke',
                                   1,
                                   null,
                                   true,
                                   '74849311',
                                   'DKFL9581'
);


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