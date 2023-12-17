/*
-- =========================================================================== A
-- Retrait des données des tables du schéma kao
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';

delete from kao.evaluation;

delete from kao.equipe;

delete from kao.animation;

delete from kao.gestion;

delete from kao.absence;

delete from kao.chambre;

delete from kao.staff;

delete from kao.etudiant_udes;

delete from kao.association_diplome;

delete from kao.type_diplome;
ALTER SEQUENCE type_diplome_iddip_seq RESTART WITH 1;

delete from kao.public;

delete from kao.association_intol;

delete from kao.association_pref;

delete from kao.type_pref;
ALTER SEQUENCE type_pref_idpref_seq RESTART WITH 1;

delete from kao.association_role;

delete from kao.type_role;
ALTER SEQUENCE type_role_idrole_seq RESTART WITH 1;

delete from kao.commentaire;

delete from kao.enregistrement;
ALTER SEQUENCE enregistrement_idenr_seq RESTART WITH 1;

delete from kao.compte;
ALTER SEQUENCE compte_idc_seq RESTART WITH 1;

delete from kao.deroulement;

delete from kao.local;
ALTER SEQUENCE local_idl_seq RESTART WITH 1;

delete from kao.association_type_activite;

delete from kao.type_activite;
ALTER SEQUENCE type_activite_idtypact_seq RESTART WITH 1;

delete from kao.activite;
ALTER SEQUENCE activite_ida_seq RESTART WITH 1;

delete from kao.theme;
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;

delete from kao.traiteur;

delete from kao.evenement;
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;

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
-- Fin de table_ret.sql
-- =========================================================================== Z
*/
