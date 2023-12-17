set schema 'kao';

--« Quels sont les endroits où se déroulent les pauses d’un évènement ? » R04
select e.titre as "Évènement", e.edition as "Édition", a.titre as "Activité", l.lieu as "Lieu", l.emplacement as "Local"
from evenement e
join theme t on e.idevn = t.evenement
join activite a on t.idt = a.theme
join association_type_activite ata on a.ida = ata.activite
join type_activite ta on ata.type = ta.idtypact
join deroulement d on a.ida = d.activite
join local l on d.local = l.idl
where ta.idtypact = 5 or ta.idtypact = 6;