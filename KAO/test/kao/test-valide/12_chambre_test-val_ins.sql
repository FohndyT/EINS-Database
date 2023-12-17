/*
-- =========================================================================== A
-- Insertion des données valides pour associer une chambre à un conférencier
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
--

-- Assigner une chambre à un conférencier
call inserer_chambre(4, 'Times Sherbrooke', '1 Rue Belvédère S, Sherbrooke, QC J1H 0G8', '2023-06-05', '2023-06-07'); -- enregistrement, hotel, adresse, debut, fin
call inserer_chambre(8, 'Delta Sherbrooke', '2685 Rue King Ouest, Sherbrooke, QC J1L 1C1', '2023-06-05', '2023-06-08');
call inserer_chambre(12, 'Le président', '3535 Rue King Ouest, Sherbrooke, QC J1L 1P8', '2023-06-06', '2023-06-08');

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
-- Fin de chambre_test-val_ins.sql
-- =========================================================================== Z
*/