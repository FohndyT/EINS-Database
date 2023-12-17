/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table compte et la procédure creer_compte.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
set schema 'kaotest';

-- Mot de passe trop court (si la longueur minimale est, disons, 6 caractères)
CALL creer_compte('nouveau@domaine.com', 'Jean', 'Dupont', '123');

-- Nom vide
CALL creer_compte('nouveau@domaine.com', '', 'Dupont', 'MotDePasse123');

-- Prénom vide et courriel dupliquer
CALL creer_compte('nouveau@domaine.com', 'Jean', '', 'MotDePasse123');

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
-- Fin de compte_test-val_ins.sql
-- =========================================================================== Z
*/