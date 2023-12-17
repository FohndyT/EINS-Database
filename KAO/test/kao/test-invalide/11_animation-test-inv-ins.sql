
/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table animation
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kaotest';
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');
call creer_compte('Eatyou@yahoo.fr', 'Gibier', 'Hunter', 'dhdjrhiui3wyri');
ALTER SEQUENCE kao.theme_idt_seq RESTART WITH 1;
call insert_theme(1, 'La végétation', 'Les plantes seront le centre de nos activités', '2023-06-06', '2023-06-06');

-- Insérer les types d'activités
insert into type_activite(idtypact, nom, min, max)
values (1, 'Présentation', '15 minutes', '60 minutes'),
       (3, 'Évaluation', '120 minutes', '120 minutes');

-- programmation d'une activité de type presentation
call pro_ins_act(1, 'Les arbres', 'Présentation sur les arbres', '2023-06-06 08:00:00', '2023-06-06 09:00:00', 1);


insert into type_role(idrole, nom)
values  (1, 'Étudiant');
insert into type_diplome(iddip, nom)
values (1, 'Baccalauréat');
-- creation d'un enregistrement non etudiante
ALTER SEQUENCE kao.enregistrement_idenr_seq RESTART WITH 1;
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
-- test d'insertion dans animateur avec un role Inapproprié (etudiant)
-- Insérer un animateur qui n'est ni un conférencier (type_role = 3) ni un responsable (type_role = 4).
call inserer_animateur(1, 1); -- enregistrement, activite




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