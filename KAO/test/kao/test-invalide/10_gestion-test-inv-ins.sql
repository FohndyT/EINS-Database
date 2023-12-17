
/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table gestion

-- et la procédure
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/
set schema 'kaotest';
-- tester des insertions invalides pour la table enregistrement en utilisant la procédure inserer_gestion
-- pour le categorie d'enregistrement etudiant rejetter l'enregistrement lorsque le paramètre _politique_check est à false
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');
call creer_compte('Eatyou@yahoo.fr', 'Gibier', 'Hunter', 'dhdjrhiui3wyri');
ALTER SEQUENCE kao.theme_idt_seq RESTART WITH 1;
call insert_theme(1, 'La végétation', 'Les plantes seront le centre de nos activités', '2023-06-06', '2023-06-06');

--==================================================>Étudiant
insert into type_role(idrole, nom)
values (1, 'Étudiant'),
       (4, 'Responsable');
insert into type_diplome(iddip, nom)
values (1, 'Baccalauréat');
-- pour le categorie d'enregistrement professionnel rejetter l'enregistrement lorsque le paramètre _politique_check est à false
call creer_enregistrement_etudiant(1,
                                   1,
                                   'Étudiant en microbiologie',
                                   'Université de Sherbrooke',
                                   1,
                                   null,
                                   true,
                                   '74849311',
                                   'DKFL9581'
);

--Insertion Invalide pour le Critère « Rôle Inapproprié pour l'enregistrement correspondant »
-- un etudiant ne peut pas etre un gestionnaire d'un theme
-- theme correct enregistrement incorrste
CALL inserer_gestion(1, 1);





call creer_enregistrement_responsable(2,
                                      1,
                                      '819-555-4629',
                                      null,
                                      true
     );

-- si le theme n'existe pas
-- theme incorrect enregistrement correct
CALL inserer_gestion(2, 999);

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