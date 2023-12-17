/*
-- =========================================================================== A
-- Insertion des données invalides pour tester les tables evaluation en utilisant la procedure inserer_resultat
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
-- programmation d'une activité de type evaluation
call pro_ins_act(1, 'Les calcules bayésien', 'Présentation sur les nouvelles méthodes découvertes en 2023', '2023-06-06 08:00:00', '2023-06-06 10:00:00', 3);



insert into type_role(idrole, nom)
values (1, 'Étudiant'),
       (4, 'Responsable');
-- enregistrement non etudiante
call creer_enregistrement_responsable(1,
                                      1,
                                      '819-555-4629',
                                      null,
                                      true
     );




-- evaluation d'un enregistrement non etudiante et insertion de resultat
CALL inserer_resultat(1, 4, 'reussi');



insert into type_diplome(iddip, nom)
values (1, 'Baccalauréat');
-- pour le categorie d'enregistrement professionnel rejetter l'enregistrement lorsque le paramètre _politique_check est à false
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



-- attribution d'un resultat a une activité autre qu'une evaluation

CALL inserer_resultat(2, 4, 'reussi');


--
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