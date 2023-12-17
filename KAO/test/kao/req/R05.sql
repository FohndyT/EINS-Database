set schema 'kao';

--« Combien de nuits d’hôtel faut-il réserver pour chaque conférencier(ière) pour tous les évènements ? » R05
select titre as "Évènement",edition as "Édition", concat(c.prenom,' ',c.nom) as "Conférencier", coalesce( ch.fin-ch.debut,0) as "Nombre de nuits d'hôtel"
from evenement
join enregistrement e on evenement.idevn = e.evenement
join association_role ar on e.idenr = ar.enregistrement
join type_role tr on ar.type = tr.idrole
join compte c on e.compte = c.idc
left join chambre ch on e.idenr = ch.enregistrement
where tr.idrole = 3;