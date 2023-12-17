set schema 'kao';

--« Combien y a-t-il de conférenciers(ières) à un évènement ? » R02
select titre as "Évènement",edition as "Édition",count(distinct idenr) as "Nombre de Conférencier"
from evenement
join kao.enregistrement e on evenement.idevn = e.evenement
join association_role ar on e.idenr = ar.enregistrement
join type_role tr on ar.type = tr.idrole
where tr.idrole = 3
group by titre, edition;