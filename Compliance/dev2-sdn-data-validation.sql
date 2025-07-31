-- Validating SDN DATA

select * from programitem_program pp where pp.program = 'RUSSIA-EO14024';

-- This should give me Program and associsted program names
select
	*
from
	programitem_name pn
	inner join programitem_program pp on (pn.programitem_id = pp.programitem_id)
where
	pp.program = 'RUSSIA-EO14024'
	and pn.status = 'Created'
	and pn.name like '%LLC NGF%'
order by
	pn.programitem_id , pn.name ;

-- This should give me the list of names to be displayed in UI
select * from programitem_name pn where pn.programitem_id = 'SDN42200'

-- associated address for program name
select
	*
from
	programitem_address pa
where
	pa.programitem_id = 'SDN42200'