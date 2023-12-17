/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table enregistrement

-- et la procédure creer_enregistrement_responsable creer_enregistrement_responsable
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kaotest';
-- tester des insertions invalides pour la table enregistrement en utilisant la procédure creer_enregistrement_responsable
-- pour le categorie d'enregistrement responsable rejetter l'enregistrement lorsque le paramètre _politique_check est à false
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');


--==================================================>Responsable
insert into type_role(idrole, nom)
values (4, 'Responsable');
CALL creer_enregistrement_responsable(
    1,
    1,
    '123-456-7890',
     null,
     false
);

-- Test avec un ID de Compte Invalide
CALL creer_enregistrement_responsable(
    2,
    1,
    '123-456-7890',
     null,
     true
);
-- Test avec un ID de evenement Invalide
CALL creer_enregistrement_responsable(
    1,
    2,
    '123-456-7890',
     null,
     true
);







-
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