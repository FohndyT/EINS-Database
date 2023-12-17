/*
-- =========================================================================== A
 -- tester des insertions invalides pour la table association_role en utilisant les procédures creer_enregistrement_responsable
-- creer_enregistrement_conferencier, creer_enregistrement_benevole, creer_enregistrement_etudiant, creer_enregistrement_professionnel,

-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kaotest';

-- si le commentaire n'est pas null
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');
call creer_compte('allo@gmail.com', 'Goodbye', 'Allo', '3773ygf');

insert into type_diplome(iddip, nom)
values (1, 'Baccalauréat');
--==================================================>Étudiant

-- tester des insertions invalides pour la table association_role en utilisant les procédures
-- creer_enregistrement_responsable creer_enregistrement_conferencier, creer_enregistrement_benevole,
-- creer_enregistrement_etudiant, creer_enregistrement_professionnel,
-- l'invocation de la table association_role pour insertion est  aussi verifiée a partir de ces procedure

 --NOTE:
-- les procédures elles-même s'assurent que enregistrement_personne est valide avant d'essayer
-- d'insérer dans association_role

ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');
call creer_compte('allo@gmail.com', 'Goodbye', 'Allo', '3773ygf');
call creer_compte('nana@gmail.com', 'Lavoie', 'Nana', 'vhfjehdnhneay3');
call creer_compte('Eatyou@yahoo.fr', 'Gibier', 'Hunter', 'dhdjrhiui3wyri');
call creer_compte('FerencierKond@yahoo.fr', 'Férencier', 'Kond', '¨¨Fw378f');
insert into type_diplome(iddip, nom)
values (1, 'Baccalauréat');
--==========================================================================>Étudiant

set schema 'kao';
insert into type_role(idrole, nom)
values (1, 'Étudiant');
-- Test avec un d'insertion invalide dans la table association_role pour un
-- etudiant en utilisant la procedurec reer_enregistrement_etudiant
-- l'invocation de la table association_role pour insertion est  aussi verifiée
call creer_enregistrement_etudiant(1,
                                   1,
                                   'Étudiant en microbiologie',
                                   'Université de Sherbrooke',
                                   1,
                                   'Ceci est un commentaire valide pour etudiant',
                                   true,
                                   '74849311',
                                   'DKFL9581'
);

-- essais d'insertion dans la table association_role apres l'insertion par
-- la procedure creer_enregistrement_etudiant
insert into association_role(type,enregistrement)
    values (1,1);

--==========================================================================>Professionnel
insert into type_role(idrole, nom)
values (2, 'Professionnel');
-- Test avec un d'insertion invalide dans la table association_role
-- pour un professionnel en utilisant la procedurec creer_enregistrement_professionnel
-- l'invocation de la table association_role pour insertion est  aussi verifiée

call creer_enregistrement_professionnel(
        2,
        1,
        'Diplomate',
        'Gouvernement de la Roumanie',
        1,
        'Ceci est un commentaire valide pour professionnel',
        true
);
-- essais d'insertion dans la table association_role apres l'insertion par
-- la procedure creer_enregistrement_professionnel
insert into association_role(type,enregistrement)
    values (2,2);

--==================================================================================================>Responsable
-- Test avec un d'insertion invalide dans la table association_role pour un responsable
-- en utilisant la procedurec creer_enregistrement_responsable
-- l'invocation de la table association_role pour insertion est  aussi verifiée
insert into type_role(idrole, nom)
values (3, 'Responsable');
CALL creer_enregistrement_responsable(
    3,
    1,
    '123-456-7890',
     'Ceci est un commentaire valide pour responsable',
     true
);
-- essais d'insertion dans la table association_role apres l'insertion par
-- la procedure creer_enregistrement_responsable
insert into association_role(type,enregistrement)
    values (3,3);
--==========================================================================>conférencière
-- Test avec un d'insertion invalide dans la table
-- association_role pour un bénévole
-- en utilisant la procedurec creer_enregistrement_conferencier
-- l'invocation de la table association_role pour insertion est  aussi verifiée
insert into type_role(idrole, nom)
    values(4, 'conferenciere');
call creer_enregistrement_conferencier(4,
                                   1,
                                   '514-555-6677',
                                   'Ceci est un commentaire valide pour conferencière',
                                   true
);
-- essais d'insertion dans la table association_role apres l'insertion
-- par la procedure creer_enregistrement_conferencier
insert into association_role(type,enregistrement)
    values (4,4);
--==========================================================================>bénévole
-- Test avec un d'insertion invalide dans la table association_role pour un bénévole en utilisant la procedurec creer_enregistrement_benevole
-- l'invocation de la table association_role pour insertion est  aussi verifiée
insert into type_role(idrole, nom)
    values(5, 'Bénévole');
call creer_enregistrement_benevole(5,
                                   1,
                                   '514-555-6677',
                                   'Ceci est un commentaire valide pour benevole',
                                   true
);
-- essais d'insertion dans la table association_role apres l'insertion 
-- par la procedure creer_enregistrement_conferencier
insert into association_role(type,enregistrement)
    values (5,5);

--===============================================================================================================>


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