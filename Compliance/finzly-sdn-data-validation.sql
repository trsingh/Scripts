show tables;


select * from program_item;

select
	*
from
	programitem_name pn
where 
	pn.name like '%KOREA SOBAEKSU TRADING CORPORATION%'
order by
	pn.last_updated_date desc;