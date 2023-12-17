
/*
-- =========================================================================== A
-- Insertion des données valides pour tester les tables deroulement en
-- utilisant la procedure pro_ins_act
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/

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
call inserer_local('Université de Sherbrooke', '2500, boulevard de l''Université', 'D7-3021', 80); -- nom, adresse, emplacement, places
-- une activite de 1h
call pro_ins_act(1, 'Les arbres', 'Présentation sur les arbres', '2023-06-06 08:00:00', '2023-06-06 09:00:00', 1);
-- une activite de 2h
call pro_ins_act(1, 'Le plantage des fleurs', 'Présentation sur le plantage de fleurs', '2023-06-06 08:00:00', '2023-06-06 09:00:00', 1);
-- asignation du local 1 a l'activité 1
CALL assigner_local(1, 1);


-- Si un local est déjà occupé pendant une période donnée, essayer d''assigner une nouvelle activité
-- à ce même local pendant cette période devais provoquer une erreur.
-- Essayons d'assigner une nouvelle activité au même local pendant cette période
CALL assigner_local(2, 1);

-- Local 999 n'existe pas, ou activité 789 n'existe pas
CALL assigner_local(789, 999);


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