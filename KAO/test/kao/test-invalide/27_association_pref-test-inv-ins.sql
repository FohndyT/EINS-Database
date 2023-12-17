/*
-- =========================================================================== A
 -- tester des insertions invalides pour la table association_pref en utilisant inserer_pref_alimentaire
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
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

-- tester des insertions invalides pour la table association_role en utilisant inserer_pref_alimentaire
-- l'invocation de la table association_role pour insertion est  aussi verifiée a partir de ces procedure


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


-- tester des insertions invalides pour la table association_pref en utilisant les procédures
-- inserer_pref_alimentaire
-- l'invocation de la table association_pref pour insertion est  aussi verifiée a partir de ces procedure


ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
insert into type_diplome(iddip, nom)
values (1, 'Baccalauréat');

--==========================================================================>Étudiant

set schema 'kao';
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');
insert into type_role(idrole, nom)
values (1, 'Étudiant');
insert into type_pref(idpref, nom)
values (1, 'Viande incluant poisson');
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

-- insertion valide dans la table association_pref
insert into association_pref(type,enregistrement)
    values (1,1);
-- essais de faire une attribution de preference a un enregistrement qui a deja été faite
insert into association_pref(type,enregistrement)
    values (1,1);
--==========================================================================>Professionnel
call creer_compte('allo@gmail.com', 'Goodbye', 'Allo', '3773ygf');
insert into type_role(idrole, nom)
values (2, 'Professionnel');
insert into type_pref(idpref, nom)
values (2, 'Viande sans poisson');

-- Test avec un d'insertion invalide dans la table association_pref
-- pour un professionnel en utilisant la procedurec creer_enregistrement_professionnel
-- l'invocation de la table association_pref pour insertion est  aussi verifiée

call creer_enregistrement_professionnel(
        2,
        1,
        'Diplomate',
        'Gouvernement de la Roumanie',
        1,
        'Ceci est un commentaire valide pour professionnel',
        true
);
-- insertion valide dans la table association_pref
insert into association_pref(type,enregistrement)
    values (2,2);
-- essais de faire une attribution de preference a un enregistrement qui a deja été faite
insert into association_pref(type,enregistrement)
    values (2,2);

--==================================================================================================>Responsable
-- Test avec un d'insertion invalide dans la table association_pref pour un responsable
-- en utilisant la procedurec creer_enregistrement_responsable
-- l'invocation de la table association_pref pour insertion est  aussi verifiée

call creer_compte('nana@gmail.com', 'Lavoie', 'Nana', 'vhfjehdnhneay3');
insert into type_role(idrole, nom)
values (3, 'Conférencier(ière)');
insert into type_pref(idpref, nom)
values (3, 'Végétarien');

CALL creer_enregistrement_conferencier(
    3,
    1,
    '123-456-7890',
     'Ceci est un commentaire valide pour responsable',
     true
);
-- insertion valide dans la table association_pref
insert into association_pref(type,enregistrement)
    values (3,3);
-- essais de faire une attribution de preference a un enregistrement qui a deja été faite
insert into association_pref(type,enregistrement)
    values (3,3);
--==========================================================================>conférencière
-- Test avec un d'insertion invalide dans la table
-- association_pref pour un bénévole
-- en utilisant la procedurec creer_enregistrement_conferencier
-- l'invocation de la table association_pref pour insertion est  aussi verifiée

call creer_compte('Eatyou@yahoo.fr', 'Gibier', 'Hunter', 'dhdjrhiui3wyri');
insert into type_role(idrole, nom)
values (4, 'Responsable');
insert into type_pref(idpref, nom)
    values (4, 'Végan');

call creer_enregistrement_responsable(4,
                                   1,
                                   '514-555-6677',
                                   'Ceci est un commentaire valide pour conferencière',
                                   true
);
-- insertion valide dans la table association_pref
insert into association_pref(type,enregistrement)
    values (4,4);
-- essais de faire une attribution de preference a un enregistrement qui a deja été faite
insert into association_pref(type,enregistrement)
    values (4,4);
--==========================================================================>bénévole
-- Test avec un d'insertion invalide dans la table association_pref pour un bénévole en utilisant la procedurec creer_enregistrement_benevole
-- l'invocation de la table association_pref pour insertion est  aussi verifiée

call creer_compte('FerencierKond@yahoo.fr', 'Férencier', 'Kond', '¨¨Fw378f');
insert into type_role(idrole, nom)
values (5, 'Bénévole');
insert into type_pref(idpref, nom)
    values (5, 'Aucune préférence');
call creer_enregistrement_benevole(5,
                                   1,
                                   '514-555-6677',
                                   'Ceci est un commentaire valide pour benevole',
                                   true
);
-- insertion valide dans la table association_pref
insert into association_pref(type,enregistrement)
    values (5,5);
-- essais de faire une attribution de preference a un enregistrement qui a deja été faite
insert into association_pref(type,enregistrement)
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