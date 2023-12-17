
/*
-- =========================================================================== A
-- Insertion des données valides pour tester les tables equipe en utilisant la procedure 
-- inserer_dans_equipe
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 4.0.0
Statut   : en développement
-- =========================================================================== A
*/

-- tester des insertions invalides pour la table enregistrement en utilisant la procédure creer_enregistrement_responsable
-- pour le categorie d'enregistrement responsable rejetter l'enregistrement lorsque le paramètre _politique_check est à false
ALTER SEQUENCE evenement_idevn_seq RESTART WITH 1;
CALL pro_ins_even('EINS', '2023', '2023-06-06', '2023-06-08');
ALTER SEQUENCE kao.compte_idc_seq RESTART WITH 1;
CALL creer_compte('Maxmorin@gmail.com', 'Morin', 'Max', 'kghsfvjkdkh');

ALTER SEQUENCE kao.theme_idt_seq RESTART WITH 1;
call insert_theme(1, 'La végétation', 'Les plantes seront le centre de nos activités', '2023-06-06', '2023-06-06');


insert into type_role(idrole, nom)
values (1, 'Étudiant');
-- pour le categorie d'enregistrement Conferencière rejetter l'enregistrement lorsque le paramètre _politique_check est à false

-- Insérer les types de rôles
insert into type_role(idrole, nom)
values  (3, 'Conférencier(ière)');
call creer_enregistrement_conferencier(1,
                                       1,
                                       '514-382-8008',
                                       null,
                                       true
     );

-- une activite de 1h
insert into type_activite(idtypact, nom, min, max)
values (1, 'Présentation', '15 minutes', '60 minutes');
call pro_ins_act(1, 'Les arbres', 'Présentation sur les arbres', '2023-06-06 08:00:00', '2023-06-06 09:00:00', 1);

-- Tenter d'insérer une personne dans une équipe alors que son rôle n'est
-- ni celui d'un étudiant (type_role = 1) ni celui d'un professionnel (type_role = 2).
CALL inserer_dans_equipe(1, 456, 'Équipe A');  -- 456 est l'ID de l'activité

-- L'activité 1 n'est pas un « Travail d'équipe »
CALL inserer_dans_equipe(1, 1, 'Équipe B');


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