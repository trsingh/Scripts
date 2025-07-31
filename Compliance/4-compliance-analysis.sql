select
	xyz.list_name,
-- 	xyz.refreshed_on ,
	sum(xyz.total_records)
from
	(
	select
		sl.list_name ,
		prh.program,
-- 		prh.refreshed_on,
		SUM(prh.total_records) as total_records
	from
		program_refresh_history prh
	inner join screening_list sl
on
		prh.list_id = sl.list_id
	where
		sl.list_name = 'SDN'
		and DATE(prh.refreshed_on) = '2025-03-07'
		and (prh.program is null
			or prh.program = ''
			or prh.program like CONCAT('%', prh.program, '%'))
	group by
		prh.program,
		prh.refreshed_on
) xyz
group by
	xyz.list_name
-- 	xyz.refreshed_on


--

select * from screening_list sl ;

select * from program_refresh_history prh ;


select
		Date(MAX(refreshed_on))
from
		program_refresh_history
inner join screening_list on
		program_refresh_history.list_id = screening_list.list_id
where
		screening_list.list_name = 'SDN'
	and DATE(refreshed_on) = '2025-03-07'
	

select distinct sl.list_name  from screening_list sl ;
-- Fincen
-- SDN
-- Consolidated SDN
-- NonSDN
	
select
	sl.list_name ,
	sum(prh.total_records)
from
	screening_list sl
inner join program_refresh_history prh on
	(sl.list_id = prh.list_id )
where
	DATE(prh.refreshed_on) = '2025-02-26'
	and sl.status = 'Active'
group by 
	sl.list_name;


select
sl.list_name ,
prh.*
from
	screening_list sl
inner join program_refresh_history prh on
	(sl.list_id = prh.list_id )
where
	DATE(prh.refreshed_on) = '2025-02-26'
	and sl.status = 'Active'
	and sl.list_name = 'SDN'
order BY 
	prh.program;


select
	sl.list_name,
	sum(sl.total_records)
from
	screening_list sl
where 
	DATE(sl.last_refreshed_on) = '2025-03-07%'
	and sl.status = 'Active'
group BY 
	sl.list_name

SELECT
	SUM(new_records) AS total_new_records,
	SUM(removed_records) AS total_removed_records,
	SUM(total_records) AS total_records_count
FROM
	screening_list sl
WHERE
	sl.last_refreshed_on like '2025-03-07%'
	AND sl.list_name = 'SDN'


select * from program_item pi2 where pi2.programitem_id = 'SDN49810'

select * From program_item pi2 where pi2.programitem_id = 'SDN49968'

SDN49968

select * from programitem_name pn where name like '%LEHAVA%'

select * from programitem_address pa where pa.programitem_id = 'SDN49968'

select * from programitem_country pc where pc.programitem_id = 'SDN49968'


select * from programitem_name pn where name like '%BURREN%'

select * from programitem_address pa where pa.programitem_id = 'SDN49707'

select * from programitem_country pc where pc.programitem_id = 'SDN49707'

select * from programitem_program pp where pp.program = 'WEST-BANK-EO14115'

select * from program_item pi2 where pi2.programitem_id = 'WEST-BANK-EO14115'


SELECT
	*
FROM
	program_refresh_history_details
WHERE
	DATE(last_updated_date) IN (
    '2024-07-13', '2024-07-21', '2024-07-22', '2024-07-23', '2024-07-24', 
    '2024-07-25', '2024-07-26', '2024-07-27', '2024-07-28', '2024-07-29', 
    '2024-07-30', '2024-07-31', '2024-08-01', '2024-08-02', '2024-08-03', 
    '2025-01-18', '2025-01-22', '2025-02-07', '2025-02-08', '2025-02-14', 
    '2025-02-15', '2025-02-25', '2025-02-26', '2025-02-27', '2025-02-28', 
    '2025-03-01', '2025-03-05', '2025-03-06'
)
order by last_updated_date asc;

SELECT
	pi.*
FROM
	program_item pi
JOIN programitem_name pin ON
	pi.programitem_id = pin.programitem_id
WHERE
	pin.name LIKE '%Al-sabah%'
	OR pin.name LIKE '%Zohar%';

PT - Bank User
 - COmmunity Bank1 - CUstomer User
 

