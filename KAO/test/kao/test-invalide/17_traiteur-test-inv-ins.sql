/*
-- =========================================================================== A
-- Insertion des données invalides pour tester la table traiteur et la procedure inserer_traiteur
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/
--
set schema 'kaotest';
--  insertions invalides avec la procédure inserer_traiteur
-- vérifie si la date de livraison correspond pas à la période de l'événement.
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');

CALL inserer_traiteur('Traiteur XYZ',1 , '2023-06-05');

-- Date de Livraison Après la Fin de l'Événement :
CALL inserer_traiteur('Traiteur XYZ', 1, '2023-06-09');


-- Événement Inexistant
CALL inserer_traiteur('Traiteur XYZ', 2, '2023-06-09');

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