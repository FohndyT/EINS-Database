
/*
-- =========================================================================== A
 -- tester des insertions invalides pour la table public en utilisant les procedures
creer_enregistrement_professionnel et creer_enregistrement_etudiant
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kao';
-- tester des insertions invalides pour la table public en utilisant les procédures creer_enregistrement par categorie
-- l'invocation de la table public pour insertion est  aussi verifiée a partir de ces procedure


ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;


--==========================================================================>Étudiant

set schema 'kao';
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');
insert into type_role(idrole, nom)
values (1, 'Étudiant');
insert into type_diplome(iddip,nom)
    values (1, 'Baccalauréat');
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

-- essais d'insertion dans la table public apres l'insertion par
-- la procedure creer_enregistrement_etuiant
insert into public(enregistrement,occupation,organisation)
    values (1,'Étudiant en microbiologie','Université de Sherbrooke');

--==========================================================================>Professionnel
call creer_compte('allo@gmail.com', 'Goodbye', 'Allo', '3773ygf');
insert into type_role(idrole, nom)
values (2, 'Professionnel');
insert into type_diplome(iddip,nom)
    values (2, 'Doctorat');
-- Test avec un d'insertion invalide dans la table public
-- pour un professionnel en utilisant la procedurec creer_enregistrement_professionnel
-- l'invocation de la table public pour insertion est  aussi verifiée

call creer_enregistrement_professionnel(
        2,
        1,
        'Diplomate',
        'Gouvernement de la Roumanie',
        2,
        'Ceci est un commentaire valide pour professionnel',
        true
);
-- essais d'insertion dans la table public apres l'insertion par
-- la procedure creer_enregistrement_professionnel
insert into public(enregistrement,occupation,organisation)
    values (1,'Diplomate','Gouvernement de la Roumanie');


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
