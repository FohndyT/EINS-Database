set schema 'kao';

--« Combien y a-t-il de personnes inscrites à un évènement ? » R01
select titre as "Évènement",edition as "Édition",count(distinct idenr) as "Nombre d'enregistrements"
from evenement
join kao.enregistrement e on evenement.idevn = e.evenement
group by titre, edition;