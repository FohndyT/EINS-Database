/*
-- =========================================================================== A
-- Création des vues
-- -----------------------------------------------------------------------------
Produit  : BD pour application de gestion d'événements scientifiques
Version  : 1.0.0
Statut   : Complet
-- =========================================================================== A
*/
--
set schema 'kao';
create or replace view vue_etudiants(compte, enregistrement, nom, prenom, courriel, evenement, édition, diplome, occupation, organisation, matricule, cip, preference_alimentaire, intolerance_alimentaire) as
    select kao.compte.idc,
       kao.enregistrement.idenr,
       kao.compte.nom,
       kao.compte.prenom,
       kao.compte.courriel,
       kao.evenement.titre,
       kao.evenement.edition,
       kao.type_diplome.nom,
       kao.public.occupation,
       kao.public.organisation,
       coalesce(kao.etudiant_udes.matricule, 'N/A'),
       coalesce(kao.etudiant_udes.cip,'N/A'),
       kao.type_pref.nom,
       replace(replace(rtrim(ltrim(cast(array_agg(kao.type_intol.nom) as text),'{'),'}'),',',', '),'"',''),
       kao.commentaire.commentaire
from kao.compte
        join kao.enregistrement on compte.idc = enregistrement.compte
        join evenement on enregistrement.evenement = evenement.idevn

        left join kao.association_role on enregistrement.idenr = association_role.enregistrement

        left join kao.association_diplome on enregistrement.idenr = association_diplome.enregistrement
        left join kao.type_diplome on association_diplome.type = type_diplome.iddip

        left join kao.public on enregistrement.idenr = public.enregistrement

        full join kao.etudiant_udes on public.enregistrement = etudiant_udes.enregistrement

        left join kao.association_pref on enregistrement.idenr = association_pref.enregistrement
        left join kao.type_pref on association_pref.type = type_pref.idpref

        left join kao.association_intol on enregistrement.idenr = association_intol.enregistrement
        left join kao.type_intol on association_intol.type = type_intol.idintol

        full join kao.commentaire on enregistrement.idenr = commentaire.enregistrement

where kao.association_role.type = 1
group by kao.compte.idc, kao.enregistrement.idenr, kao.compte.nom, kao.compte.prenom, kao.compte.courriel, kao.evenement.titre, kao.evenement.edition, kao.type_diplome.nom, kao.public.occupation, kao.public.organisation, kao.etudiant_udes.matricule, kao.etudiant_udes.cip, kao.type_pref.nom, kao.commentaire.commentaire;

create or replace view vue_professionnels(compte, enregistrement, nom, prenom, courriel, événement, édition, diplome, occupation, organisation, preference_alimentaire, intolerance_alimentaire, commentaire) as
select kao.compte.idc,
       kao.enregistrement.idenr,
       kao.compte.nom,
       kao.compte.prenom,
       kao.compte.courriel,
       kao.evenement.titre,
       kao.evenement.edition,
       kao.type_diplome.nom,
       kao.public.occupation,
       kao.public.organisation,
       kao.type_pref.nom,
       replace(replace(rtrim(ltrim(cast(array_agg(kao.type_intol.nom) as text),'{'),'}'),',',', '),'"',''),
       kao.commentaire.commentaire

from kao.compte
         join kao.enregistrement on compte.idc = enregistrement.compte
    join evenement on enregistrement.evenement = evenement.idevn

         left join kao.association_role on enregistrement.idenr = association_role.enregistrement

         left join kao.association_diplome on enregistrement.idenr = association_diplome.enregistrement
         left join kao.type_diplome on association_diplome.type = type_diplome.iddip

         left join kao.public on enregistrement.idenr = public.enregistrement

         left join kao.association_pref on enregistrement.idenr = association_pref.enregistrement
         left join kao.type_pref on association_pref.type = type_pref.idpref

         left join kao.association_intol on enregistrement.idenr = association_intol.enregistrement
         left join kao.type_intol on association_intol.type = type_intol.idintol

         full join kao.commentaire on enregistrement.idenr = commentaire.enregistrement

where kao.association_role.type = 2
group by kao.compte.idc, kao.enregistrement.idenr, kao.compte.nom, kao.compte.prenom, kao.compte.courriel, kao.evenement.titre, kao.evenement.edition, kao.type_diplome.nom, kao.public.occupation, kao.public.organisation, kao.type_pref.nom, kao.commentaire.commentaire;

create or replace view vue_conferenciers(compte, enregistrement, nom, prenom, courriel, evenement, édition, telephone, preference_alimentaire, intolerance_alimentaire, commentaire) as
select kao.compte.idc,
       kao.enregistrement.idenr,
       kao.compte.nom,
       kao.compte.prenom,
       kao.compte.courriel,
       kao.evenement.titre,
       kao.evenement.edition,
       kao.staff.telephone,
       kao.type_pref.nom,
       replace(replace(rtrim(ltrim(cast(array_agg(kao.type_intol.nom) as text),'{'),'}'),',',', '),'"',''),
       kao.commentaire.commentaire
from kao.compte
         join kao.enregistrement on compte.idc = enregistrement.compte
    join evenement on enregistrement.evenement = evenement.idevn
         join kao.staff on enregistrement.idenr = staff.enregistrement
         left join kao.association_role on enregistrement.idenr = association_role.enregistrement
         left join kao.association_pref on enregistrement.idenr = association_pref.enregistrement
         left join kao.type_pref on association_pref.type = type_pref.idpref
         left join kao.association_intol on enregistrement.idenr = association_intol.enregistrement
         left join kao.type_intol on association_intol.type = type_intol.idintol
         full join kao.commentaire on enregistrement.idenr = commentaire.enregistrement
where kao.association_role.type = 3
group by kao.compte.idc, kao.enregistrement.idenr, kao.compte.nom, kao.compte.prenom, kao.compte.courriel, kao.evenement.titre, kao.evenement.edition, kao.staff.telephone, kao.type_pref.nom, kao.commentaire.commentaire;

create or replace view vue_responsables(compte, enregistrement, nom, prenom, courriel, evenement, édition, telephone, preference_alimentaire, intolerance_alimentaire, commentaire) as
select kao.compte.idc,
       kao.enregistrement.idenr,
       kao.compte.nom,
       kao.compte.prenom,
       kao.compte.courriel,
       kao.evenement.titre,
       kao.evenement.edition,
       kao.staff.telephone,
       kao.type_pref.nom,
       replace(replace(rtrim(ltrim(cast(array_agg(kao.type_intol.nom) as text),'{'),'}'),',',', '),'"',''),
       kao.commentaire.commentaire
from kao.compte
         join kao.enregistrement on compte.idc = enregistrement.compte
    join evenement on enregistrement.evenement = evenement.idevn
         join kao.staff on enregistrement.idenr = staff.enregistrement
         left join kao.association_role on enregistrement.idenr = association_role.enregistrement
         left join kao.association_pref on enregistrement.idenr = association_pref.enregistrement
         left join kao.type_pref on association_pref.type = type_pref.idpref
         left join kao.association_intol on enregistrement.idenr = association_intol.enregistrement
         left join kao.type_intol on association_intol.type = type_intol.idintol
         full join kao.commentaire on enregistrement.idenr = commentaire.enregistrement
where kao.association_role.type = 4
group by kao.compte.idc, kao.enregistrement.idenr, kao.compte.nom, kao.compte.prenom, kao.compte.courriel, kao.evenement.titre, kao.evenement.edition, kao.staff.telephone, kao.type_pref.nom, kao.commentaire.commentaire;

create or replace view vue_benevoles(compte, enregistrement, nom, prenom, courriel, evenement, édition, telephone, preference_alimentaire, intolerance_alimentaire, commentaire) as
select kao.compte.idc,
       kao.enregistrement.idenr,
       kao.compte.nom,
       kao.compte.prenom,
       kao.compte.courriel,
       kao.evenement.titre,
       kao.evenement.edition,
       kao.staff.telephone,
       kao.type_pref.nom,
       replace(replace(rtrim(ltrim(cast(array_agg(kao.type_intol.nom) as text),'{'),'}'),',',', '),'"',''),
       kao.commentaire.commentaire
from kao.compte
         join kao.enregistrement on compte.idc = enregistrement.compte
    join evenement on enregistrement.evenement = evenement.idevn
         left join kao.staff on enregistrement.idenr = staff.enregistrement
         left join kao.association_role on enregistrement.idenr = association_role.enregistrement
         left join kao.association_pref on enregistrement.idenr = association_pref.enregistrement
         left join kao.type_pref on association_pref.type = type_pref.idpref
         left join kao.association_intol on enregistrement.idenr = association_intol.enregistrement
         left join kao.type_intol on association_intol.type = type_intol.idintol
         full join kao.commentaire on enregistrement.idenr = commentaire.enregistrement
where kao.association_role.type = 5
group by kao.compte.idc, kao.enregistrement.idenr, kao.compte.nom, kao.compte.prenom, kao.compte.courriel, kao.evenement.titre, kao.evenement.edition, kao.staff.telephone, kao.type_pref.nom, kao.commentaire.commentaire;

create or replace view vue_programme_details as
(
with Conf as (select concat(c.prenom, ' ', c.nom) as "Conférencier", a3.ida
              from evenement
                       join enregistrement e on evenement.idevn = e.evenement
                       join association_role ar on e.idenr = ar.enregistrement
                       join type_role tr on ar.type = tr.idrole
                       join compte c on e.compte = c.idc
                       join kao.animation a2 on e.idenr = a2.enregistrement
                       join activite a3 on a2.activite = a3.ida
              where tr.idrole = 3)
select e.titre                                       as "Évènement",
       e.edition                                     as "Édition",
       t.sujet                                       as "Thème",
       a.titre                                       as "Activité",
       cast(a.debut as date)                         as "Date",
       cast(a.debut as time)                         as "Début",
       cast(a.fin as time)                           as "Fin",
       coalesce(l.lieu, 'indéterminé')               as "Endroit",
       coalesce(l.emplacement, 'indéterminé')        as "Local",
       coalesce("Conférencier", 'Aucun/indéterminé') as "Animateur(e)s"
from evenement e
         join kao.theme t on e.idevn = t.evenement
         join kao.activite a on t.idt = a.theme
         left join kao.deroulement d on a.ida = d.activite
         left join Conf on a.ida = Conf.ida
         left join local l on d.local = l.idl
order by a.debut
    );

create or replace view repas_sommaire(
    "Évènement",
    "Édition",
    "Journée",
    "Viande incluant poisson",
    "Viande sans poisson",
    "Végétariens",
    "Végans",
    "Pas de préférence",
    "Nominales",
    "Traiteur") as(

    with Vi_P as(select idevn as ev, coalesce(count(distinct(enr.idenr)),0) as "Viande incluant poisson"
             from evenement
                 join traiteur t on evenement.idevn = t.evenement
                 join enregistrement enr on evenement.idevn = enr.evenement
                 join kao.association_pref ap on enr.idenr = ap.enregistrement
                 join type_pref on ap.type = type_pref.idpref
                 where type_pref.nom similar to 'Viande incluant poisson'
                    and not exists(select *
                                  from association_intol
                                  where association_intol.enregistrement=ap.enregistrement)
                    and not exists(
                                    with dindin as(
                                                 select activite.debut,activite.fin,e.idevn
                                                 from activite
                                                    join kao.theme t2 on t2.idt = activite.theme
                                                    join kao.evenement e on e.idevn = t2.evenement
                                                    join kao.association_type_activite ata on activite.ida = ata.activite
                                                where cast(activite.debut as date)=t.date and type = 6)

                                    select *
                                    from absence
                                        join dindin on dindin.idevn=evenement.idevn
                                    where enr.idenr = absence.enregistrement
                                    and (absence.debut,absence.fin)overlaps(dindin.debut,dindin.fin)
                                )
             group by ev),

    Vi_sP as(select idevn as ev, coalesce(count(distinct(enr.idenr)),0) as "Viande sans poisson"
             from evenement
                 join traiteur t on evenement.idevn = t.evenement
                 join enregistrement enr on evenement.idevn = enr.evenement
                 join kao.association_pref ap on enr.idenr = ap.enregistrement
                 join type_pref on ap.type = type_pref.idpref
                 where type_pref.nom similar to 'Viande sans poisson'
                    and not exists(select *
                                  from association_intol
                                  where association_intol.enregistrement=ap.enregistrement)
                    and not exists(
                                    with dindin as(
                                                 select activite.debut,activite.fin,e.idevn
                                                 from activite
                                                    join kao.theme t2 on t2.idt = activite.theme
                                                    join kao.evenement e on e.idevn = t2.evenement
                                                    join kao.association_type_activite ata on activite.ida = ata.activite
                                                where cast(activite.debut as date)=t.date and type = 6)

                                    select *
                                    from absence
                                        join dindin on dindin.idevn=evenement.idevn
                                    where enr.idenr = absence.enregistrement
                                    and (absence.debut,absence.fin)overlaps(dindin.debut,dindin.fin)
                                )
             group by ev),

    Vege as(select idevn as ev, coalesce(count(distinct(enr.idenr)),0) as "Végétarien"
             from evenement
                 join traiteur t on evenement.idevn = t.evenement
                 join enregistrement enr on evenement.idevn = enr.evenement
                 join kao.association_pref ap on enr.idenr = ap.enregistrement
                 join type_pref on ap.type = type_pref.idpref
                 where type_pref.nom similar to 'Végétarien'
                    and not exists(select *
                                  from association_intol
                                  where association_intol.enregistrement=ap.enregistrement)
                    and not exists(
                                    with dindin as(
                                                 select activite.debut,activite.fin,e.idevn
                                                 from activite
                                                    join kao.theme t2 on t2.idt = activite.theme
                                                    join kao.evenement e on e.idevn = t2.evenement
                                                    join kao.association_type_activite ata on activite.ida = ata.activite
                                                where cast(activite.debut as date)=t.date and type = 6)

                                    select *
                                    from absence
                                        join dindin on dindin.idevn=evenement.idevn
                                    where enr.idenr = absence.enregistrement
                                    and (absence.debut,absence.fin)overlaps(dindin.debut,dindin.fin)
                                )
             group by ev),

    Vgn as(select idevn as ev, coalesce(count(distinct(enr.idenr)),0) as "Végan"
             from evenement
                 join traiteur t on evenement.idevn = t.evenement
                 join enregistrement enr on evenement.idevn = enr.evenement
                 join kao.association_pref ap on enr.idenr = ap.enregistrement
                 join type_pref on ap.type = type_pref.idpref
                 where type_pref.nom similar to 'Végan'
                    and not exists(select *
                                  from association_intol
                                  where association_intol.enregistrement=ap.enregistrement)
                    and not exists(
                                    with dindin as(
                                                 select activite.debut,activite.fin,e.idevn
                                                 from activite
                                                    join kao.theme t2 on t2.idt = activite.theme
                                                    join kao.evenement e on e.idevn = t2.evenement
                                                    join kao.association_type_activite ata on activite.ida = ata.activite
                                                where cast(activite.debut as date)=t.date and type = 6)

                                    select *
                                    from absence
                                        join dindin on dindin.idevn=evenement.idevn
                                    where enr.idenr = absence.enregistrement
                                    and (absence.debut,absence.fin)overlaps(dindin.debut,dindin.fin)
                                )
             group by ev),

    NP as(select idevn as ev, coalesce(count(distinct(enr.idenr)),0) as "Aucune préférence"
             from evenement
                 join traiteur t on evenement.idevn = t.evenement
                 join enregistrement enr on evenement.idevn = enr.evenement
                 join kao.association_pref ap on enr.idenr = ap.enregistrement
                 join type_pref on ap.type = type_pref.idpref
                 where type_pref.nom similar to 'Aucune préférence'
                    and not exists(select *
                                  from association_intol
                                  where association_intol.enregistrement=ap.enregistrement)
                    and not exists(
                                    with dindin as(
                                                 select activite.debut,activite.fin,e.idevn
                                                 from activite
                                                    join kao.theme t2 on t2.idt = activite.theme
                                                    join kao.evenement e on e.idevn = t2.evenement
                                                    join kao.association_type_activite ata on activite.ida = ata.activite
                                                where cast(activite.debut as date)=t.date and type = 6)

                                    select *
                                    from absence
                                        join dindin on dindin.idevn=evenement.idevn
                                    where enr.idenr = absence.enregistrement
                                    and (absence.debut,absence.fin)overlaps(dindin.debut,dindin.fin)
                                )
             group by ev),

    Exep as (select idevn as ev, coalesce(count(distinct(enr.idenr)),0) as "Nominales"
             from evenement
                 join traiteur t on evenement.idevn = t.evenement
                 join enregistrement enr on evenement.idevn = enr.evenement
                 join kao.association_intol ai on enr.idenr = ai.enregistrement
             where not exists(
                              with dindin as(
                                             select activite.debut,activite.fin,e.idevn
                                             from activite
                                                join kao.theme t2 on t2.idt = activite.theme
                                                join kao.evenement e on e.idevn = t2.evenement
                                                join kao.association_type_activite ata on activite.ida = ata.activite
                                            where cast(activite.debut as date)=t.date and type = 6)

                                select *
                                from absence
                                    join dindin on dindin.idevn=evenement.idevn
                                where enr.idenr = absence.enregistrement
                                and (absence.debut,absence.fin)overlaps(dindin.debut,dindin.fin)
                                )
             group by ev)

select
    kao.evenement.titre,
    kao.evenement.edition,
    t.date,
    coalesce(vip."Viande incluant poisson",0),
    coalesce(visp."Viande sans poisson",0),
    coalesce(vege."Végétarien",0),
    coalesce(vgn."Végan",0),
    coalesce(np."Aucune préférence",0),
    coalesce(exep."Nominales",0),
    t.nom

from kao.evenement
join kao.traiteur t on evenement.idevn = t.evenement
left join Vi_P vip on evenement.idevn = vip.ev
left join Vi_sP visp on evenement.idevn = visp.ev
left join Vege vege on evenement.idevn = vege.ev
left join Vgn vgn on evenement.idevn = vgn.ev
left join NP np on evenement.idevn = np.ev
left join Exep exep on evenement.idevn = exep.ev);

create or replace view repas_nominal(
    "Évènement",
    "Édition",
    "Journée",
    "Personne",
    "Préférence",
    "Intolérence",
    "Traiteur") as

select
        kao.evenement.titre,
        kao.evenement.edition,
        t.date,
        concat(c.prenom,' ',c.nom) as perso,
        type_pref.nom,
        replace(replace(rtrim(ltrim(cast(array_agg(kao.type_intol.nom) as text),'{'),'}'),',',', '),'"',''),
        t.nom
from kao.evenement
        left join kao.traiteur t on evenement.idevn = t.evenement
        join enregistrement e on evenement.idevn = e.evenement
        join compte c on e.compte = c.idc
        join kao.association_pref p on e.idenr = p.enregistrement
        join type_pref on p.type = type_pref.idpref
        join kao.association_intol i on e.idenr = i.enregistrement
        join type_intol on i.type = type_intol.idintol
group by t.nom, kao.evenement.titre, kao.evenement.edition, t.date, c.prenom, c.nom, type_pref.nom;


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
-- Fin de vue_cre.sql
-- =========================================================================== Z
*/