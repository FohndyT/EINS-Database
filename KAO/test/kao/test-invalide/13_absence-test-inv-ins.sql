

/*
-- =========================================================================== A
-- Insertion des données invalides pour tester les tables absence en utilisant la procedure pro_ins_absence
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
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
values  (4, 'Responsable');
-- enregistrement non etudiante
ALTER SEQUENCE kao.enregistrement_idenr_seq RESTART WITH 1;
call creer_enregistrement_responsable(1,
                                      1,
                                      '819-555-4629',
                                      null,
                                      true
     );
-- test d'insertion pour une Période d'Absence Incohérente
 -- Fin avant le début
CALL pro_ins_absence(1, '2023-01-02 09:00:00', '2023-01-01 17:00:00');


insert into type_role(idrole, nom)
values (3, 'Conférencier(ière)');
call creer_enregistrement_conferencier(2, 1, '514-382-8008', null, true);
call inserer_animateur(2, 1); -- enregistrement, activite

-- Période d'Absence Chevauchant une Activité Animée
-- une conferenciére veux d'absencter durant une periode pour la quelle elle annime une activité
CALL pro_ins_absence(1, '2023-01-02 09:00:00', '2023-01-01 17:00:00');



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