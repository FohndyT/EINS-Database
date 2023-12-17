/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table activite et la procédure pro_ins_act.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--
-- teste d'insertion d'invalidité dans la table activité

-- theme de l'activiter qu'on veut tester
ALTER SEQUENCE theme_idt_seq RESTART WITH 1;
call insert_theme(1, 'Le comportement de la lumière', 'On parle de la nature et du fonctionnement de la lumière', '2023-06-06 07:00:00', '2023-06-07 18:00:00');
-- Insérez une activité dont la durée ne respecte pas les limites min et max du type d'activité spécifié.
-- 'Présentation' doit etre min >= 15min et max <= 1h
call pro_ins_act(1, 'Planter des fleurs', 'On plante le plus de fleurs possibles', '2023-06-06 15:00:00', '2023-06-06 15:14:00',1);
-- -- 'Atelier' doit etre min >= 1h30min et max <= 3h10min
call pro_ins_act(1, 'Examen sur plantes', 'Examen sur plantes', '2023-06-06 15:00:00', '2023-06-06 19:00:00',2);
-- -- 'Évaluation' doit etre min >= 2h et max <= 2h
call pro_ins_act(1, 'Examen sur plantes', 'Examen sur plantes', '2023-06-06 15:00:00', '2023-06-06 17:30:00',3);
-- -- 'Travail d'équipe' doit etre min >= 1h et max <= 1h30
call pro_ins_act(1, 'Examen sur plantes', 'Examen sur plantes', '2023-06-06 15:00:00', '2023-06-06 15:30:00',4);
-- -- 'Pause café' doit etre min >= 30min et max <= 30min
call pro_ins_act(1, 'Examen sur plantes', 'Examen sur plantes', '2023-06-06 15:00:00', '2023-06-06 15:29:00',5);
-- -- 'Pause dîner' doit etre min >= 1h30min et max <=1h30min
call pro_ins_act(1, 'Examen sur plantes', 'Examen sur plantes', '2023-06-06 15:00:00', '2023-06-06 16:31:00',6);


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
  2023-12-06 (FNT), (GD), (CB), (HMSD) : Création

-- -----------------------------------------------------------------------------
-- Fin de activite_test-val_ins.sql
-- =========================================================================== Z
*/