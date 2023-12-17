/*
-- =========================================================================== A
-- Création des procédures du schéma kao.
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';

-- Procédure pour insérer un nouvel événement
create or replace procedure pro_ins_even(_titre titre_evenement, _edition edition, _debut date,
                                         _fin date /*, _v_overlap boolean DEFAULT false*/ )
    language plpgsql as
$$
begin
    /* if (_v_overlap) then
        if exists(
            select *
            from evenement as e
            where (cast(e.debut as timestamp)<=_debut and cast(e.fin as timestamp) >= _debut)
            or (cast(e.debut as timestamp)>=_debut and cast(e.debut as timestamp) <= _fin)
        )then
            raise exception 'L''insertion est Invalide.';
        end if;
    end if; */

    insert into evenement(titre, edition, debut, fin)
    values (_titre, _edition, _debut, _fin);
end;
$$;

-- Procédure pour mettre à jour un événement
create or replace procedure pro_upd_even(_id int, _titre titre_evenement, _edition edition, _debut timestamp,
                                         _fin timestamp/*, _v_overlap boolean DEFAULT false*/)
    language plpgsql as
$$
declare
    event evenement;
begin
    /*select * into event from evenement where idevn=_id;
    if (_v_overlap and (event.debut<>_debut or event.fin<>_fin)) then
        if exists(
            select *
            from evenement as e
            where idevn != event.idevn and ((cast(e.debut as timestamp)<=event.debut and cast(e.fin as timestamp) >= event.debut)
            or (cast(e.debut as timestamp)>=event.debut and cast(e.debut as timestamp) <= event.fin))
        )then
            raise exception 'La modification est Invalide.';
        end if;
    end if; */
    update evenement
    set titre=_titre,
        edition=_edition,
        debut=_debut,
        fin=_fin
    where idevn = _id;
end;
$$;

-- Procédure pour insérer un thème
CREATE OR REPLACE PROCEDURE insert_theme(
    _evenement INTEGER,
    _sujet sujet_theme,
    _description VARCHAR,
    _debut timestamp,
    _fin timestamp
)
    LANGUAGE plpgsql
AS
$$
DECLARE
    evenement_debut timestamp;
    evenement_fin   timestamp;
BEGIN
    -- Récupérer les dates de début et de fin de l'événement correspondant
    SELECT debut, fin
    INTO evenement_debut, evenement_fin
    FROM evenement
    WHERE idEvn = _evenement;
    -- Vérifier si les dates du thème sont dans l'intervalle de l'événement correspondant
    IF (_debut < evenement_debut OR _fin > evenement_fin) THEN
        RAISE EXCEPTION 'Les dates du thème doivent être dans l''intervalle de l''événement correspondant.';
    END IF;
    -- Insérer le nouveau thème
    INSERT INTO theme (evenement, sujet, description, debut, fin)
    VALUES (_evenement, _sujet, _description, _debut, _fin);
END;
$$;

-- Procédure pour insérer une activité
create or replace procedure pro_ins_act(_theme integer, _titre varchar(60), _description varchar(5000),
                                        _debut timestamp, _fin timestamp, _type integer/*, _v_overlap boolean DEFAULT false*/)
    language plpgsql as
$$
declare
    theme_act        theme;
    declare type_act type_activite;
    declare duree    interval;
begin
    --test overflow theme
    select *
    into theme_act
    from theme
    where idt = _theme;
    if cast((theme_act.debut) as timestamp) > _debut or cast((theme_act.fin + 1) as timestamp) < _fin then
        raise exception 'L''insertion est invalide car la durée de l''activité dépasse celle de son thème.';
    end if;

    --test min max type
    duree = _fin - _debut;
    select *
    into type_act
    from type_activite
    where idtypact = _type;
    if (type_act.min > duree or type_act.max < duree) then
        raise exception 'L''insertion est invalide car la durée de l''activité n''est pas conforme pour son type.';
    end if;

    --test overlap
    /*if (_v_overlap) then
        if exists(
            select *
            from activite as a
            where a.theme = _theme and ((cast(a.debut as timestamp)<=_debut and cast(a.fin as timestamp) >= _debut)
            or (cast(a.debut as timestamp)>=_debut and cast(a.debut as timestamp) <= _fin))
        )then
            raise exception 'L''insertion est Invalide.';
        end if;
    end if;*/

    --inserts
    with act_key as
             (
                 insert into activite (theme, titre, description, debut, fin)
                     values (_theme, _titre, _description, _debut, _fin)
                     returning ida)
    insert
    into association_type_activite(activite, type)
    select ida, _type
    from act_key;
end;
$$;

-- Procédure pour mettre à jour une activité
create or replace procedure pro_upd_act(_id int, _titre varchar(60), _description varchar(5000), _debut timestamp,
                                        _fin timestamp, _type integer/*, _v_overlap boolean DEFAULT false*/)
    language plpgsql as
$$
declare
    act               activite;
    declare theme_act theme;
    declare type_act1 type_activite;--celui ci pour tester si le type change
    declare type_act2 type_activite;--celui ci pour tester si le min max est valide
    declare duree     interval;
begin
    --get l'activité à modifier
    select *
    into act
    from activite
             join association_type_activite on ida = association_type_activite.activite
    where ida = _id;

    if (act is null) then
        raise exception 'Cette activité est introuvable';
    end if;

    select *
    into type_act1
    from association_type_activite
    where activite = act.ida;

    if not (type_act1.idtypact = _type) then
        --test min max type
        duree = _fin - _debut;
        select *
        into type_act2
        from type_activite
        where idtypact = _type;
        if (type_act2.min > duree or type_act2.max < duree) then
            raise exception 'La modification est invalide car la durée de l''activité n''est pas conforme pour ce type.';
        else
            update association_type_activite
            set type=_type
            where association_type_activite.activite = _id;
        end if;
    end if;

    if (act.debut <> _debut and act.fin <> _fin) then
        --test overflow theme
        select *
        into theme_act
        from theme
        where idt = act.theme;
        if cast(theme_act.debut as timestamp) > _debut or cast(theme_act.fin as timestamp) < _fin then
            raise exception 'La modification est invalide car la nouvelle durée de l''activité dépasse celle de son thème.';
        end if;
    end if;

    --test overlap
    /* if (_v_overlap) then
        if exists(
            select *
            from activite as a
            where a.theme = act.theme and a.ida != _id and ((cast(a.debut as timestamp)<=_debut and cast(a.fin as timestamp) >= _debut)
            or (cast(a.debut as timestamp)>=_debut and cast(a.debut as timestamp) <= _fin))
        )then
            raise exception 'La modification est invalide car une autre activité couvre déjà cet intervalle de temps.';
        end if;
    end if; */

    --update
    update activite
    set titre=_titre,
        description=_description,
        debut=_debut,
        fin=_fin
    where ida = _id;
end;
$$;

-- Procédure pour insérer un compte
create or replace procedure kao.creer_compte(_courriel kao.courriel, _nom kao.nom, _prenom kao.nom,
                                             _mot_de_passe varchar(255))
    language plpgsql
as
$$
begin
    insert into kao.compte(courriel, nom, prenom, mot_de_passe)
    values (_courriel, _nom, _prenom, _mot_de_passe);
end;
$$;

-- Procédure pour insérer l'enregistrement d'un responsable
create or replace procedure creer_enregistrement_responsable(_idc integer,
                                                             _evenement integer,
                                                             _telephone numero_telephone,
                                                             _commentaire varchar(5000),
                                                             _politique_check boolean)
    language plpgsql as
$$
DECLARE
    enregistrement_personne integer;
BEGIN
    if _politique_check = false then
        raise exception 'Enregistrement impossible si le paramètre _politique_check est de valeur false';
    end if;

    insert into kao.enregistrement(compte, evenement, politique_check, check_in)
    values (_idc, _evenement, _politique_check, false);

    select kao.enregistrement.idenr
    into enregistrement_personne
    from kao.enregistrement
    where kao.enregistrement.compte = _idc;

    if _commentaire is not null then
        insert into kao.commentaire(enregistrement, commentaire)
        values (enregistrement_personne, _commentaire);
    end if;

    insert into kao.association_role(enregistrement, type)
    values (enregistrement_personne, 4);

    insert into kao.staff(enregistrement, telephone)
    values (enregistrement_personne, _telephone);
end
$$;

-- Procédure pour insérer l'enregistrement d'un bénévole
create or replace procedure creer_enregistrement_benevole(_idc integer,
                                                          _evenement integer,
                                                          _telephone numero_telephone,
                                                          _commentaire varchar(5000),
                                                          _politique_check boolean)
    language plpgsql as
$$
DECLARE
    enregistrement_personne integer;
BEGIN
    if _politique_check = false then
        raise exception 'Enregistrement impossible si le paramètre _politique_check est de valeur false';
    end if;

    insert into kao.enregistrement(compte, evenement, politique_check, check_in)
    values (_idc, _evenement, _politique_check, false);

    select kao.enregistrement.idenr
    into enregistrement_personne
    from kao.enregistrement
    where kao.enregistrement.compte = _idc;

    if _commentaire is not null then
        insert into kao.commentaire(enregistrement, commentaire)
        values (enregistrement_personne, _commentaire);
    end if;

    insert into kao.association_role(enregistrement, type)
    values (enregistrement_personne, 5);

    insert into kao.staff(enregistrement, telephone)
    values (enregistrement_personne, _telephone);
end
$$;

-- Procédure pour insérer l'enregistrement d'un professionnel
create or replace procedure creer_enregistrement_professionnel(_idc integer,
                                                               _evenement integer,
                                                               _occupation varchar(255),
                                                               _organisation varchar(255),
                                                               _dernier_diplome integer,
                                                               _commentaire varchar(5000),
                                                               _politique_check boolean)
    language plpgsql as
$$
DECLARE
    enregistrement_personne integer;
BEGIN
    if _politique_check = false then
        raise exception 'Enregistrement impossible si le paramètre _politique_check est de valeur false';
    end if;

    insert into kao.enregistrement(compte, evenement, politique_check, check_in)
    values (_idc, _evenement, _politique_check, false);

    select kao.enregistrement.idenr
    into enregistrement_personne
    from kao.enregistrement
    where kao.enregistrement.compte = _idc;

    if _commentaire is not null then
        insert into kao.commentaire(enregistrement, commentaire)
        values (enregistrement_personne, _commentaire);
    end if;

    insert into kao.public(enregistrement, occupation, organisation)
    values (enregistrement_personne, _occupation, _organisation);

    insert into kao.association_role(enregistrement, type)
    values (enregistrement_personne, 2);

    insert into kao.association_diplome(enregistrement, type)
    values (enregistrement_personne, _dernier_diplome);
end
$$;

-- Procédure pour insérer l'enregistrement d'un étudiant
create or replace procedure creer_enregistrement_etudiant(_idc integer,
                                                          _evenement integer,
                                                          _occupation varchar(255),
                                                          _organisation varchar(255),
                                                          _dernier_diplome integer,
                                                          _commentaire varchar(5000),
                                                          _politique_check boolean,
                                                          _matricule kao.matricule,
                                                          _cip kao.cip)
    language plpgsql as
$$
DECLARE
    enregistrement_personne integer;
BEGIN
    if _politique_check = false then
        raise exception 'Enregistrement impossible si le paramètre _politique_check est de valeur false';
    end if;

    insert into kao.enregistrement(compte, evenement, politique_check, check_in)
    values (_idc, _evenement, _politique_check, false);

    select kao.enregistrement.idenr
    into enregistrement_personne
    from kao.enregistrement
    where kao.enregistrement.compte = _idc;

    if _commentaire is not null then
        insert into kao.commentaire(enregistrement, commentaire)
        values (enregistrement_personne, _commentaire);
    end if;

    insert into kao.public(enregistrement, occupation, organisation)
    values (enregistrement_personne, _occupation, _organisation);

    if _matricule is not null or _cip is not null then
        insert into etudiant_udes(enregistrement, matricule, cip)
        values (enregistrement_personne, _matricule, _cip);
    end if;

    insert into kao.association_role(enregistrement, type)
    values (enregistrement_personne, 1);

    insert into kao.association_diplome(enregistrement, type)
    values (enregistrement_personne, _dernier_diplome);
end
$$;

-- Procédure pour insérer l'enregistrement d'un conférencier
create or replace procedure creer_enregistrement_conferencier(_idc integer,
                                                              _evenement integer,
                                                              _telephone numero_telephone,
                                                              _commentaire varchar(5000),
                                                              _politique_check boolean)
    language plpgsql as
$$
DECLARE
    enregistrement_personne integer;
BEGIN
    if _politique_check = false then
        raise exception 'Enregistrement impossible si le paramètre _politique_check est de valeur false';
    end if;

    insert into kao.enregistrement(compte, evenement, politique_check, check_in)
    values (_idc, _evenement, _politique_check, false);

    select kao.enregistrement.idenr
    into enregistrement_personne
    from kao.enregistrement
    where kao.enregistrement.compte = _idc;

    if _commentaire is not null then
        insert into kao.commentaire(enregistrement, commentaire)
        values (enregistrement_personne, _commentaire);
    end if;

    insert into kao.association_role(enregistrement, type)
    values (enregistrement_personne, 3);

    insert into kao.staff(enregistrement, telephone)
    values (enregistrement_personne, _telephone);
end
$$;

create or replace procedure inserer_pref_alimentaire(_idEnr integer, _preference_alimentaire integer)
    language plpgsql as
$$
begin
    insert into kao.association_pref(enregistrement, type)
    values (_idEnr, _preference_alimentaire);
end
$$;

create or replace procedure inserer_intol_alimentaire(_idEnr integer, _intolerence_alimentaire integer)
    language plpgsql as
$$
begin
    insert into kao.association_intol(enregistrement, type)
    values (_idEnr, _intolerence_alimentaire);
end
$$;

-- Procédure pour insérer une gestion
create or replace procedure inserer_gestion(_idEnr integer, _theme integer)
    language plpgsql as
$$
DECLARE
    type_role             integer;
    theme_evenement       integer;
    responsable_evenement integer;
BEGIN
    select kao.association_role.type
    into type_role
    from kao.association_role
    where kao.association_role.enregistrement = _idEnr;

    select kao.theme.evenement
    into theme_evenement
    from kao.theme
    where kao.theme.idt = _theme;

    select kao.enregistrement.evenement
    into responsable_evenement
    from kao.enregistrement
    where kao.enregistrement.idenr = _idEnr;

    if type_role = 4 and theme_evenement = responsable_evenement then
        insert into kao.gestion(enregistrement, theme)
        values (_idEnr, _theme);
    else
        raise exception 'Seul les responsables peuvent gérer un thème du même événement que celui-ci';
    end if;
end
$$;

-- Procédure pour insérer un animateur
create or replace procedure inserer_animateur(_idEnr integer, _activite integer)
    language plpgsql as
$$
DECLARE
    type_role           integer;
    activite_evenement  integer;
    animateur_evenement integer;
BEGIN
    select kao.association_role.type
    into type_role
    from kao.association_role
    where kao.association_role.enregistrement = _idEnr;

    select kao.evenement.idevn
    into activite_evenement
    from kao.evenement
             join kao.theme on evenement.idevn = theme.evenement
             join kao.activite on theme.idt = activite.theme
    where kao.activite.ida = _activite;

    select kao.enregistrement.evenement
    into animateur_evenement
    from kao.enregistrement
    where kao.enregistrement.idenr = _idEnr;

    if (type_role = 3 or type_role = 4) and activite_evenement = animateur_evenement then
        insert into kao.animation(enregistrement, activite)
        values (_idEnr, _activite);
    else
        raise exception 'Seul les conférenciers et les responsables peuvent animer une activité du même événement que celle-ci';
    end if;
end
$$;

-- Procédure pour attribuer une chambre
create or replace procedure inserer_chambre(
    _enregistrement integer,
    _hotel kao.nom_hotel,
    _adresse kao.adresse_hotel,
    _debut date,
    _fin date
)
    language plpgsql as
$$
DECLARE
    type_role integer;
BEGIN
    select kao.association_role.type
    into type_role
    from kao.association_role
    where kao.association_role.enregistrement = _enregistrement;

    if type_role = 3 then
        insert into kao.chambre(enregistrement, hotel, adresse, debut, fin)
        values (_enregistrement, _hotel, _adresse, _debut, _fin);
    else
        raise exception 'Seul les conférenciers peuvent avoir une chambre';
    end if;
END
$$;

create or replace function
    verif_absences_ins()
    returns trigger
    language plpgsql as
$$
declare
    abs         absence;
    declare act activite;
begin

    select debut, fin, a.enregistrement
    into act
    from activite
             join animation a on a.activite = activite.ida
    where a.enregistrement = new.enregistrement
      and cast(fin as timestamp) > cast(now() as timestamp);
    if (act is not null) then
        if (cast(act.debut as timestamp) < new.debut and cast(act.fin as timestamp) > new.debut) or
           (cast(act.debut as timestamp) < new.fin and cast(act.fin as timestamp) > new.fin) or
           (cast(act.debut as timestamp) > new.debut and cast(act.fin as timestamp) < new.fin) then
            raise notice 'L''insertion de cette absence ne peut pas être faite puisque le conférencier a des obligations lors de cette période.';
            raise exception 'Insertion Invalide';
        end if;
    end if;

    select *
    into abs
    from absence
    where absence.enregistrement = new.enregistrement
      and cast(fin as timestamp) >= new.debut
      and cast(debut as timestamp) <= new.debut;

    if abs is NOT NULL then
        if cast(abs.fin as timestamp) < new.fin then
            call correction_absence(abs, new.fin);
            raise notice 'Un conflit de dates a été détecté, l''insertion de l''absence a étée remplacée par la modification d''une ancienne.';
        else
            raise notice 'La nouvelle absence était contenu dans une absence déjà présente, aucune modification n''a étée effectuée.';
        end if;
        return old;
    else
        return new;
    end if;
end;
$$;

create or replace procedure correction_absence(_abs absence, _nFin timestamp)
    language sql as
$$
update absence
set fin = _nFin
where absence.enregistrement = _abs.enregistrement
  and cast(debut as timestamp) = cast(_abs.debut as timestamp)
  and cast(fin as timestamp) = cast(_abs.fin as timestamp)
$$;

create or replace trigger verif_absences_ins
    before insert
    on absence
    for each row
execute function verif_absences_ins();

create or replace function
    verif_absences_upd()
    returns trigger
    language plpgsql as
$$
declare
    abs         absence;
    declare act activite;
begin

    select debut, fin, a.enregistrement
    into act
    from activite
             join animation a on a.activite = activite.ida
    where a.enregistrement = new.enregistrement
      and cast(fin as timestamp) > cast(now() as timestamp);
    if (act is not null) then
        if (cast(act.debut as timestamp) < new.debut and cast(act.fin as timestamp) > new.debut) or
           (cast(act.debut as timestamp) < new.fin and cast(act.fin as timestamp) > new.fin) or
           (cast(act.debut as timestamp) > new.debut and cast(act.fin as timestamp) < new.fin) then
            raise notice 'L''insertion de cette absence ne peut pas être faite puisque le conférencier a des obligations lors de cette période.';
            raise exception 'Insertion Invalide';
        end if;
    end if;

    select *
    into abs
    from absence
    where absence.enregistrement = new.enregistrement
      and cast(fin as timestamp) >= new.debut
      and cast(debut as timestamp) <= new.debut;

    if abs is NOT NULL then
        raise notice 'Un conflit de dates a été détecté, la modification de l''absence a étée annulée.';
        raise exception 'update invalide';
    else
        return new;
    end if;
end;
$$;

create or replace trigger verif_absences_upd
    before update
    on absence
    for each row
execute function verif_absences_upd();

create or replace procedure inserer_local(_nom_lieu kao.nom_lieu, _adresse kao.adresse_lieu,
                                          _emplacement kao.emplacement_local, _nombre_places integer)
    language plpgsql as
$$
DECLARE
    lieu_existe boolean;
BEGIN
    select exists(select *
                  from kao.local
                  where kao.local.lieu = _nom_lieu
                    and kao.local.adresse = _adresse
                    and kao.local.emplacement = _emplacement)
    into lieu_existe;

    if not lieu_existe then
        insert into kao.local(lieu, adresse, emplacement, nb_places)
        values (_nom_lieu, _adresse, _emplacement, _nombre_places);
    else
        raise exception 'Ce local existe déjà';
    end if;
end
$$;

-- Procédure pour assigner un local à une activité
create or replace procedure assigner_local(_activite integer, _local integer)
    language plpgsql as
$$
DECLARE
    _debut           timestamp;
    _fin             timestamp;
    local_est_occupe boolean;
BEGIN
    select kao.activite.debut into _debut from kao.activite where kao.activite.ida = _activite;
    select kao.activite.fin into _fin from kao.activite where kao.activite.ida = _activite;

    SELECT exists(select *
                  from kao.deroulement
                           full join kao.activite on deroulement.activite = activite.ida
                  where kao.deroulement.local = _local
                    and not ((_debut = kao.activite.fin) or (_fin = kao.activite.debut))
                    and ((_debut, _fin) overlaps (kao.activite.debut, kao.activite.fin)))
    into local_est_occupe;

    if not local_est_occupe then
        insert into kao.deroulement(activite, local)
        values (_activite, _local);
    else
        raise exception 'Ce local est occupé dans cette période';
    end if;
end
$$;

-- Procédure pour insérer un étudiant ou un professionnel dans une équipe
create or replace procedure inserer_dans_equipe(_idEnr integer, _activite integer, _equipe varchar(255))
    language plpgsql as
$$
DECLARE
    type_role                integer;
    type_activite            integer;
    activite_evenement       integer;
    enregistrement_evenement integer;
BEGIN
    select kao.association_role.type
    into type_role
    from kao.association_role
    where kao.association_role.enregistrement = _idEnr;

    select kao.association_type_activite.type
    into type_activite
    from kao.association_type_activite
    where kao.association_type_activite.activite = _activite;

    select kao.enregistrement.evenement
    into enregistrement_evenement
    from kao.enregistrement
    where kao.enregistrement.idEnr= _idEnr; -- old: where kao.enregistrement.evenement= _idEnr;

    select kao.evenement.idevn
    into activite_evenement
    from kao.evenement
             join kao.theme on evenement.idevn = theme.evenement
             join kao.activite on theme.idt = activite.theme
    where kao.activite.ida = _activite;

    if (type_role = 1 or type_role = 2) and (type_activite = 4) and (enregistrement_evenement = activite_evenement) then
        insert into kao.equipe(enregistrement, activite, equipe)
        values (_idEnr, _activite, _equipe);
    else
        raise exception 'Seul les étudiants ou les professionnels peuvent être dans une équipe dans une activité de type « Travail d''équipe »';
    end if;
end
$$;

-- Procédure pour insérer un traiteur
create or replace procedure inserer_traiteur(_nom varchar(255), _evenement integer, date_livraison date)
    language plpgsql as
$$
DECLARE
    fin_evenement   timestamp;
    debut_evenement timestamp;
BEGIN
    select kao.evenement.fin into fin_evenement from kao.evenement where kao.evenement.idevn = _evenement;
    select kao.evenement.debut into debut_evenement from kao.evenement where kao.evenement.idevn = _evenement;

    if date_livraison > fin_evenement or date_livraison < debut_evenement then
        raise exception 'La date de livraison ne peut pas être avant le debut ou après la fin de l''évenement';
    else
        insert into kao.traiteur(nom, evenement, date)
        values (_nom, _evenement, date_livraison);
    end if;
end
$$;

-- Procédure pour insérer un résultat d'évaluation
create or replace procedure inserer_resultat(_idEnr integer, _evaluation integer, _resultat resultat)
    language plpgsql as
$$
DECLARE
    type_activite            integer;
    enregistrement_evenement integer;
    evaluation_evenement     integer;
BEGIN
    select kao.association_type_activite.type
    into type_activite
    from kao.association_type_activite
    where kao.association_type_activite.activite = _evaluation;

    select kao.enregistrement.evenement
    into enregistrement_evenement
    from kao.enregistrement
    where kao.enregistrement.idEnr = _idEnr; -- old: where kao.enregistrement.evenement= _idEnr;

    select kao.evenement.idevn
    into evaluation_evenement
    from kao.evenement
             join kao.theme on evenement.idevn = theme.evenement
             join kao.activite on theme.idt = activite.theme
    where kao.activite.ida = _evaluation;

    if exists(select * from etudiant_udes where etudiant_udes.enregistrement = _idEnr) and type_activite = 3 and
       enregistrement_evenement = evaluation_evenement then
        insert into kao.evaluation(enregistrement, activite, resultat)
        values (_idEnr, _evaluation, _resultat);
    else
        raise exception 'La personne doit être un étudiant de l''Université de Sherbrooke et l''activité une évaluation';
    end if;
end
$$;


-- Procédure pour insérer une absence
create or replace procedure pro_ins_abs(_enregistrement integer, _debut timestamp, _fin timestamp)
language plpgsql as $$
    declare abs absence;
    declare act activite;
        begin

        select debut, fin, a.enregistrement into act
        from activite
        join animation a on a.activite = activite.ida
        where a.enregistrement = _enregistrement and cast(fin as timestamp) > cast(now() as timestamp);
        if(act is not null)then
            if((cast(act.debut as timestamp),cast(act.fin as timestamp))overlaps(_debut,_fin)) then
                    raise notice 'L''insertion de cette absence ne peut pas être faite puisque le conférencier a des obligations lors de cette période.';
                    raise exception 'Insertion Invalide';
            end if;
        end if;

    select * into abs
    from absence
    where absence.enregistrement = _enregistrement and (cast(debut as timestamp),cast(fin as timestamp))overlaps(_debut,_fin);

    if abs is NOT NULL then
        update absence set fin = greatest(abs.fin,_fin),
                           debut=least(abs.debut,_debut)
                       where absence.enregistrement = abs.enregistrement
                         and cast(debut as timestamp) = cast(abs.debut as timestamp)
                         and cast(fin as timestamp) = cast(abs.fin as timestamp);
        raise notice 'Un conflit de dates a été détecté, l''insertion de l''absence a étée remplacée par la modification d''une ancienne.' ;
    else
        insert into absence(enregistrement, debut, fin)
        values (_enregistrement,_debut,_fin);
    end if;
end;
$$;

-- Procédure pour modifier une absence
create or replace procedure pro_upd_abs(_enregistrement integer, _ancien_debut timestamp, _ancien_fin timestamp, _nouveau_debut timestamp, _nouveau_fin timestamp)
language plpgsql as $$
    declare abs_other absence;
    declare abs_modif absence;
    declare act activite;
        begin

        select debut, fin, a.enregistrement into act
        from activite
        join animation a on a.activite = activite.ida
        where a.enregistrement = _enregistrement and cast(fin as timestamp) > cast(now() as timestamp);
        if(act is not null)then
            if((cast(act.debut as timestamp),cast(act.fin as timestamp))overlaps(_nouveau_debut,_nouveau_fin)) then
                    raise notice 'La modification de cette absence ne peut pas être faite puisque le conférencier a des obligations lors de cette période.';
                    raise exception 'Update Invalide';
            end if;
        end if;

    select * into abs_modif
    from absence
    where absence.enregistrement = _enregistrement and absence.fin = _ancien_fin and debut =_ancien_debut;

    if abs_modif is null then
        raise notice 'L''absence n''a pas été trouvée. Veuillez vous assurer que les anciennes dates de début et fin sont correctes' ;
        raise exception 'Update Impossible, Absence Introuvable';
    end if;

    select * into abs_other
    from absence
    where absence.enregistrement = _enregistrement and (debut,fin)overlaps(_nouveau_debut,_nouveau_fin);

    if abs_other is NOT NULL and abs_other != abs_modif then
        raise notice 'Un conflit de dates a été détecté, la modification de l''absence a étée annulée.' ;
        raise exception 'Update 7 Invalide';
    else
        update absence set debut=_nouveau_debut,
                           fin=_nouveau_fin
        where enregistrement=_enregistrement
        and fin = _ancien_fin
        and debut = _ancien_debut;
    end if;
end;
$$;
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
-- Fin de contraintes_cre.sql
-- =========================================================================== Z
*/