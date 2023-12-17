/*
-- =========================================================================== A
-- Insertion des données valides pour tester la table activite et la procédure pro_ins_act.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--
-- Insérer des activités
call pro_ins_act(1, 'Les arbres', 'Présentation sur les arbres', '2023-06-06 08:00:00', '2023-06-06 09:00:00', 1);
call pro_ins_act(1, 'Le plantage des fleurs', 'Présentation sur le plantage de fleurs', '2023-06-06 09:00:00', '2023-06-06 10:00:00', 1);
call pro_ins_act(1, 'Pause café', 'Café régulier, décaféiné et collations offerts à toutes et à tous', '2023-06-06 10:00:00', '2023-06-06 10:30:00', 5);
call pro_ins_act(1, 'Plantage de fleurs', 'Activité super le fun : on se salit les mains, go!', '2023-06-06 10:30:00', '2023-06-06 12:30:00', 2);
call pro_ins_act(1, 'Pause dîner', 'Repas fournis à toutes et à tous', '2023-06-06 12:00:00', '2023-06-06 13:30:00', 6);
call pro_ins_act(1, 'La mitochondrie chez les pissenlits', 'Une revue de la matière du secondaire', '2023-06-06 13:30:00', '2023-06-06 14:00:00', 1);
call pro_ins_act(1, 'Jeu sur les cellules des connifères', 'Travail d''équipe super amusant sous forme de jeu', '2023-06-06 14:00:00', '2023-06-06 15:30:00', 4);
call pro_ins_act(1, 'Pause café', 'Café régulier, décaféiné et collations offerts à toutes et à tous', '2023-06-06 15:30:00', '2023-06-06 16:00:00', 5);
call pro_ins_act(1, 'L''ésotérisme scientifique, partie 1', 'Atelier de découverte sensorielle avec la nature', '2023-06-06 16:00:00', '2023-06-06 18:00:00', 2);
call pro_ins_act(1, 'Souper et activité', 'Au programme: Scrabble et paintball. Breuvages avec et sans alcool offerts', '2023-06-06 18:00:00', '2023-06-06 22:00:00',7);

call pro_ins_act(2, 'Les explosions', 'Présentation sur les explosions', '2023-06-07 08:00:00', '2023-06-07 09:00:00', 1);
call pro_ins_act(2, 'La dynamite', 'Présentation sur la dynamite', '2023-06-07 09:00:00', '2023-06-07 10:00:00', 1);
call pro_ins_act(2, 'Pause café', 'Café régulier, décaféiné et collations offerts à toutes et à tous', '2023-06-07 10:00:00', '2023-06-07 10:30:00', 5);
call pro_ins_act(2, 'Exploser des véhicules usagés', 'Activité super le fun : on explose des chars, go!', '2023-06-07 10:30:00', '2023-06-07 12:30:00', 2);
call pro_ins_act(2, 'Ménage des locaux des profs', 'Activité productive pour celles et ceux qui n''aiment pas les explosions', '2023-06-07 10:30:00', '2023-06-07 12:30:00', 2);
call pro_ins_act(2, 'Pause dîner', 'Repas fournis à toutes et à tous', '2023-06-07 12:00:00', '2023-06-07 13:30:00',6);
call pro_ins_act(2, 'La mitochondrie chez les automobiles électriques', 'Hen, ça n''existe pas??', '2023-06-07 13:30:00', '2023-06-07 14:00:00', 1);
call pro_ins_act(2, 'Reconstruire les véhicules qu''on a explosé ce matin', 'Une activité qui prône le développement durable...', '2023-06-07 14:00:00', '2023-06-07 15:30:00', 2);
call pro_ins_act(2, 'Pause café', 'Café régulier, décaféiné et collations offerts à toutes et à tous', '2023-06-07 15:30:00', '2023-06-07 16:00:00', 5);
call pro_ins_act(2, 'L''ésotérisme scientifique, partie 2', 'Atelier de découverte sensorielle avec les explosions', '2023-06-07 16:00:00', '2023-06-07 18:00:00', 2);
call pro_ins_act(2, 'Souper et activité', 'Au programme: Monopoly et motocrosse. Breuvages avec et sans alcool offerts', '2023-06-07 18:00:00', '2023-06-07 22:00:00',7);

call pro_ins_act(3, 'Les calcules bayésien', 'Présentation sur les nouvelles méthodes découvertes en 2023', '2023-06-08 08:00:00', '2023-06-08 09:00:00', 1);
call pro_ins_act(3, 'Les calculatrices scientifiques', 'Présentation sur la régression des calculatrices en 2023', '2023-06-08 09:00:00', '2023-06-08 10:00:00', 1);
call pro_ins_act(3, 'Pause café', 'Café régulier, décaféiné et collations offerts à toutes et à tous', '2023-06-08 10:00:00', '2023-06-08 10:30:00', 5);
call pro_ins_act(3, 'Exploser des calculatrices', 'Ben oui, encore des explosions, go!', '2023-06-08 10:30:00', '2023-06-08 12:30:00', 2);
call pro_ins_act(3, 'Pause dîner', 'Repas fournis à toutes et à tous', '2023-06-08 12:00:00', '2023-06-08 13:30:00',6);
call pro_ins_act(3, 'Les calculatrices dans les cours de base de données', 'Une heure et demi de présentation pour pas grand chose', '2023-06-08 13:30:00', '2023-06-08 14:00:00', 1);
call pro_ins_act(3, 'Acheter de nouvelles calculatrices', 'Une activité qui ne prône pas le développement durable...', '2023-06-08 14:00:00', '2023-06-08 15:30:00', 2);
call pro_ins_act(3, 'Pause café', 'Café régulier, décaféiné et collations offerts à toutes et à tous', '2023-06-08 15:30:00', '2023-06-08 16:00:00', 5);
call pro_ins_act(3, 'Examen du EINS 2023', 'Offert à tous les membres du public', '2023-06-08 16:00:00', '2023-06-08 18:00:00', 3);
call pro_ins_act(3, 'Échanges sur le EINS 2023', 'Activité pour tous les membres du public ne souhaitant pas faire d''examen', '2023-06-08 16:00:00', '2023-06-08 18:00:00', 2);
call pro_ins_act(3, 'Souper et activité', 'Au programme: sudoku et kung-fu. Breuvages avec et sans alcool offerts', '2023-06-08 18:00:00', '2023-06-08 22:00:00',7);

call pro_ins_act(4, 'Introduction à l''AIG', 'Présentation sur les nouvelles méthodes découvertes en 2024', '2024-11-06 08:00:00', '2024-11-06 09:00:00', 1);
call pro_ins_act(4, 'Les méthodes d''accumulation de données', 'Présentation sur les avancements en 2024', '2024-11-06 09:00:00', '2024-11-06 10:00:00', 1);
call pro_ins_act(4, 'Pause café', 'Café régulier, décaféiné et collations offerts à toutes et à tous', '2024-11-06 10:00:00', '2024-11-06 10:30:00', 5);
call pro_ins_act(4, 'Méthodes pour bonifier l''usage de l''IA', 'Atelier pour apprendre à améliorer ses requêtes', '2024-11-06 10:30:00', '2024-11-06 12:30:00', 2);
call pro_ins_act(4, 'Pause dîner', 'Repas fournis à toutes et à tous', '2024-11-06 12:00:00', '2024-11-06 13:30:00',6);
call pro_ins_act(4, 'Les calculatrices pour utiliser ChatGPT', 'Présentation d''une heure et demi de très grande pertinence', '2024-11-06 13:30:00', '2024-11-06 14:00:00', 1);
call pro_ins_act(4, 'Création de GPT', 'Une activité pour créer des nouveaux GPT sur le nouveau marketplace', '2024-11-06 14:00:00', '2024-11-06 15:30:00', 2);
call pro_ins_act(4, 'Pause café', 'Café régulier, décaféiné et collations offerts à toutes et à tous', '2024-11-06 15:30:00', '2024-11-06 16:00:00', 5);
call pro_ins_act(4, 'Les fabulations magistrales de la Silicon Valley', 'Atelier de découverte sensorielle avec les gurus technologiques', '2024-11-06 16:00:00', '2024-11-06 18:00:00', 3);
call pro_ins_act(4, 'Souper et activité', 'Au programme: sudoku et kung-fu. Breuvages avec et sans alcool offerts', '2024-11-06 18:00:00', '2024-11-06 22:00:00',7);




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