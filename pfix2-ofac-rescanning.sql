

select
	count(*)
from
	programitem_name pn
where
	Date(pn.last_updated_date) = '2025-06-30'
	and status = 'Created'

select
-- 		sum(prh.total_records)
*
from
	program_refresh_history prh
WHERE 	
	Date(prh.refreshed_on) = '2025-06-30'
	and prh.list_id in (
	select
		sl.list_id
	from
		screening_list sl
	where
		Date(sl.last_refreshed_on) = '2025-06-30'
			and sl.list_name = 'SDN'
	)
	
	
	
select * from programitem_program pp ;

select * from programitem_name pn ;

select pi2.programitem_id  from program_item pi2 where source = 'SDN'

select *  from program_item pi2 where source = 'SDN'


select * from program_refresh_history prh ;


select
	sl.list_id
from
	screening_list sl
where
	Date(sl.last_refreshed_on) =  '2025-06-30'
	and sl.list_name = 'SDN'

select * from compliance_sdn_load_tracker cslt ;

select * from staging_history sh ;

	
select * from programitem_name pn ;


select * from compliance_setting cs ;

-- 1
select programitem_id from programitem_program pp where pp.program = 'IRAN-TRA';

-- 2
select * from programitem_name pn where pn.programitem_id like '%SDN50345%'



select
	pn.programitem_id,
	count(pn.programitem_id) as total
from
	programitem_name pn
group by
	pn.programitem_id
having
	count(pn.programitem_id) = 2;

select programitem_id from programitem_program pp where pp.program = 'IRAN-TRA';

-- RUSSIA-EO14024	SDN50405
-- RUSSIA-EO14024	SDN49484
-- RUSSIA-EO14024	SDN47415
-- RUSSIA-EO14024	SDN50377
-- RUSSIA-EO14024	SDN49472
-- RUSSIA-EO14024	SDN50373

select programitem_id from programitem_program pp where pp.program = 'RUSSIA-EO14024';

select * from programitem_name pn where pn.programitem_id in (
'SDN50405',
'SDN49484',
'SDN47415',
'SDN50377',
'SDN49472',
'SDN50373'
);


select
	*
from
	programitem_name pn
where
	pn.programitem_id in (
	select
		programitem_id
	from
		programitem_program pp
	where
		pp.program = 'IRAN-TRA'
)


select
	*
from
	programitem_name pn
where
	pn.programitem_id in (
	select
		programitem_id
	from
		programitem_program pp
	where
		pp.program = 'RUSSIA-EO14024')
	and pn.name like '%SONIS%'
	
select
	*
from
	programitem_address pa
where
	pa.address like '%Pr-kt Mosk%'
-- 	pa.programitem_id in (
-- 'SDN47415',
-- 'SDN47415'
-- )

select
	*
from
	file_ingestion_monitor fim
where
	status = 'Failed'
order by
	fim.`date` desc;

select count(*) from programitem_name pn ;

select * from program_item pi2 ;

select * from programitem_name pn where lower(pn.name) like lower('%ABLV%')

select * from programitem_name pn where lower(pn.name) like lower('%Joint Stock Company Obninsk Research and Production Enterprise Technologiya Named %')

"Joint Stock Company Obninsk Research and Production Enterprise Technologiya Named After A.G. Romashin"




SELECT
	COUNT(*) AS current_count,
	CASE WHEN COUNT(*) >= 76 THEN 'Target reached'
	ELSE CONCAT('Remaining: ', 76 - COUNT(*))
END AS status
FROM 
    file_ingestion_monitor
WHERE 
    `date` >= DATE('2024-11-12');


select * from programitem_name pn order by last_updated_date desc;

select * from program_refresh_history prh ;

select * from program_refresh_history_details prhd ;


select * from status_monitor sm ;

select * from reload_status rs ;





select * from programitem_address pa where pa.address like '%PARRAS%'

select programitem_id 
from
	programitem_program pp
where
	pp.program in ('ILLICIT-DRUGS-EO14059','SDGT');


-- IFSR;SDGT	CITY BASE GROUP LIMITED

select
	*
from
	programitem_name pn
where
	pn.programitem_id in (
	select
		programitem_id 
	from
		programitem_program pp
	where
		pp.program in ('ILLICIT-DRUGS-EO14059', 'SDGT'));
-- 	pn.name like '%%H1%';

select * from program_item pi2 where source = 'ILLICIT-DRUGS-EO14059'


select
	*
from
	programitem_name pn
where 
	pn.name like '%BNC%';


-- SDN50345	LIMITED LIABILITY COMPANY MECHEL INFORMATSIONNYYE TEKHNOLOGII;LLC MECHEL INFOTEKH

-- 1634 DEAN	HAVIN BANK LIMITED;HAVANA INTERNATIONAL BANK, LTD	SDN906

select * from programitem_name pn where pn.programitem_id = 'SDN906'

-- WHERE column_name REGEXP '^[A-Za-z][0-9]+$'
select * from programitem_name pn where pn.name REGEXP '^[A-Za-z][0-9]+$';


select * from programitem_name pn where pn.name like '%DEAN%'
