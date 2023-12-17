/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table association_type_activite et la procédure assigner_local
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kaotest';
-- tester des insertions invalides dans la table deroulement en utilisant la procédure assigner_local

-- assignation d'un local a une activiter inexistant dans la tabl eactivite
ALTER SEQUENCE local_idl_seq RESTART WITH 1;
CALL inserer_local('Centre de Conférence', '123 Rue de lExemple', 'Salle A', 100);
CALL assigner_local(9999, 1);

-- assignation d'un local inexistant a une activiter
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE theme_idt_seq RESTART WITH 1;
CALL insert_theme(1, 'Le comportement de la lumière', 'On parle de la nature et du fonctionnement de la lumière', '2023-06-06 07:00:00', '2023-06-07 18:00:00');
insert into type_activite(idtypact, nom, min, max) values(6, 'Pause dîner', '90 minutes', '90 minutes');
CALL pro_ins_act(1, 'Examen sur plantes', 'Examen sur plantes', '2023-06-06 15:00:00', '2023-06-06 16:30:00',6);
CALL assigner_local(1, 9999);

-- assignation d'un local inexistant à une activite deja existante dans la table deroulement
CALL assigner_local(1, 2);
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