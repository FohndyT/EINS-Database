
/*
-- =========================================================================== A
-- Insertion des données invalides pour associer une chambre à un conférencier
-- en utilisant la procefure inserer_chambre
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
set schema 'kaotest';
--
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');


--==================================================>Étudiant
insert into type_role(idrole, nom)
values (1, 'Étudiant');
-- Insérer les types de diplômes
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
-- assignation d'une chambre a un enregistrement non conferencière
CALL inserer_chambre(1, 'Hôtel Exemple', '123 Rue Exemple', '2023-06-07', '2023-06-08');

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
