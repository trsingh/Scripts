select
	xyz.list_name,
	sum(xyz.total_records)
from
	(
	select
		sl.list_name ,
		prh.program,
		SUM(prh.total_records) as total_records
	from
		program_refresh_history prh
	inner join screening_list sl
on
		prh.list_id = sl.list_id
	where
		sl.list_name = 'SDN'
		and prh.refreshed_on = 
		(
		select
			MAX(refreshed_on)
		from
			program_refresh_history prh1
		inner join screening_list sl1 on
			prh1.list_id = sl1.list_id
		where
			sl1.list_name = 'SDN'
			and DATE(prh1.refreshed_on) = '2024-09-11')
		and (prh.program is null
			or prh.program = ''
			or prh.program like CONCAT('%', prh.program, '%'))
	group by
		prh.program,
		prh.refreshed_on
) xyz
group by
	xyz.list_name


--

select * from screening_list sl ;

select * from program_refresh_history prh ;


select
		MAX(refreshed_on)
from
		program_refresh_history
inner join screening_list on
		program_refresh_history.list_id = screening_list.list_id
where
		screening_list.list_name = 'SDN'
	and DATE(refreshed_on) = '2024-09-11'
	
	
select
	*
from
	screening_list sl
inner join program_refresh_history prh on
	(sl.list_id = prh.list_id )
where
		sl.list_name = 'SDN'
	and DATE(prh.refreshed_on) = '2024-09-11'
	
	
select * from whitelist w where w.expiry_date  between '2025-01-14' and '2025-01-30'


select distinct status from program_item pi2 ;

select * from program_item pi2 ;

select * from program_item pi2 

select * from programitem_program pp ;

select * from programitem_name pn ;


select
	*
from
	program_refresh_history prh
where
-- 	Date(refreshed_on) = '2025-02-15'
	records_added > 0
-- 	and program = 'BIS EL'
order by refreshed_on asc;

select
	*
from
	program_refresh_history prh
where
-- 	Date(refreshed_on) = '2025-02-15'
-- 	records_added > 0
	program = 'SDGT'
order by refreshed_on desc;


select
	-- 	count(*)
*
from
	program_refresh_history_details prhd
where
	history_id in (
	120325,
	120858
	)


-- 3236 >> 9708
-- 46026

select
	sum(records_added),
	sum(records_updated),
	sum(records_deleted) ,
	sum(total_records),
	Date(refreshed_on)
from
	program_refresh_history
group by
	Date(refreshed_on)
order by Date(refreshed_on) desc;

--- 






select * from screening_list sl where sl.list_id in (
3461,
3460,
3459,
3458
)

select * from screening_history sh ;

select * from compliance_sdn_load_tracker cslt ;

select * from status_monitor sm ;

select
	*
from
	staging_history sh
where
	Date(sh.created_date) = '2025-04-09'
order by
	created_date desc;

show tables;


-- we need to look into this 
select * from screening_list order by last_refreshed_on desc;

select
	*
from
	program_refresh_history_details prhd
	
where
	Date(prhd.last_updated_date) = '2024-07-23';

select * from program_item pi2 ;

select distinct source from program_item pi2

select * from program_item pi2 where programitem_id  = 'SDN36'

select * from programitem_name pn ;

select * from programitem_address pa ;

select * fr

-- 1.0	0.0	0.0	20630.0
select
	Date(last_refreshed_on),
	list_name,
	sum(new_records) as new_records,
	sum(updated_records) as updated_records,
	sum(removed_records) as removed_records,
	sum(total_records) as total_records
from
	screening_list
where
	list_name = 'SDN'
group by
	Date(last_refreshed_on),
	list_name
order by
	Date(last_refreshed_on) desc;

-- 2025-04-10	Created	73675
-- 2025-04-10	Updated	20831

select
	count(pi2.programitem_id)
from
	program_item pi2 
where
	pi2.status = 'Created'

	


select * from screening_list sl ;

	
-- records_added records_updated records_deleted
select
	Date(prh.refreshed_on ),
	sl.list_name ,
	sum(prh.total_records) as program_count,
	sum(prh.records_added ) as program_added,
	sum(prh.records_updated ) as program_updated,
	sum(prh.records_deleted ) as program_deleted
	-- *
from
	program_refresh_history prh
inner join screening_list sl on
	( prh.list_id = sl.list_id )
group by
	Date(prh.refreshed_on),
	sl.list_name
order by
	Date(prh.refreshed_on) asc;

select * from program_refresh_history prh ;

select * from programitem_program pp where program in ('SYRIA','SDGT')

select * from program_refresh_history prh where program in ('SYRIA','SDGT')

select * from programitem_name pn where pn.name like '%NASRALLAH%'

-- SDN2686

select * from programitem_program pp where pp.programitem_id = 'SDN2686'


select * from programitem_program where programitem_id = 'SDN2686' 

select * from program_item pi2 ;

select * from program_item where programitem_id = 'SDN2686'  -- not needed

select * from programitem_name where programitem_id = 'SDN2686';

select * from programitem_address where programitem_id = 'SDN2686';

select * from programitem_country where programitem_id = 'SDN2686';

select * from programitem_moreinfo ;


select
	distinct(pp.programitem_id)
from
	programitem_program pp
WHERE 
	pp.program in ('SYRIA','SDGT')
	and 

select
	distinct 
from
	(
	select
		pp.programitem_id ,
		pn.name
	from
		programitem_program pp
	inner join programitem_name pn on
		(pp.programitem_id = pn.programitem_id )
)xyz;


-- WEST-BANK-EO14115	2	0	0	0	2024-09-11 09:47:02
select
	*
from
	program_refresh_history_details prhd
where
	prhd.program = 'WEST-BANK-EO14115'
-- 	and Date(last_updated_date) = '2024-09-11'
		

-- SELECT
-- 	sum(new_records),
-- 	sum(total_records) ,
-- 	list_name
-- FROM
-- 	galaxy_compliance_finzly.screening_list
-- where
-- 	Date(last_refreshed_on)= "2025-04-08"
-- group by
-- 	list_name;
--  
-- SELECT
-- 	sum(total_records)
-- FROM
-- 	galaxy_compliance_finzly.program_refresh_history
-- where
-- 	Date(refreshed_on)= "2025-04-08" ;
--  
-- SELECT
-- 	sum(total_records)
-- FROM
-- 	galaxy_compliance_finzly.screening_list
-- where
-- 	Date(last_refreshed_on)= "2025-04-08" ;
-- 2025-02-17 16:49:55

select * from screening_list sl where new_records <> 0 order by last_refreshed_on desc;

select * from program_item pi2 ;

select
	Date(pi2.last_updated_date),
	count(*)
from
	program_item pi2
group by
	Date(pi2.last_updated_date)
order by  Date(pi2.last_updated_date ) desc;

select distinct source from program_item pi2 ;

select
	count(*)
from
	program_item pi2
where
	status = 'Created' and source = 'SDN'
	
select
	pi2.created_date ,
	count(*)
from
	program_item pi2
where
	status = 'Created'
	and source = 'SDN'
group by
	Date(pi2.created_date)
order by 
	Date(pi2.created_date) desc;
	


select * from program_refresh_history_details prhd ;

select
	Date(pi2.last_updated_date),
	count(*)
from
	programitem_name pi2
group by
	Date(pi2.last_updated_date)
order by  Date(pi2.last_updated_date ) desc;


show tables;

select * from program_item;

select * from program_refresh_history;

select * from program_refresh_history_details;

select * from programitem_address;

select * from programitem_country;

select * from programitem_moreinfo

select * from programitem_name;

select * from programitem_program;

select
	Date(phd.last_updated_date),
	phd.status,
	count(phd.program_id)
from
	program_refresh_history_details phd
where
	phd.program_id in (
	select
		distinct pi2.programitem_id
	from
		program_item pi2
	inner join programitem_program pp on
		(pi2.programitem_id = pp.programitem_id )
	where
		pi2.source = 'SDN'
	)
group BY 
	Date(phd.last_updated_date),
	phd.status
order by
	Date(phd.last_updated_date) desc,
	phd.status
	
-- 2025-04-10	Created	93971
-- 2025-04-10	Updated	26418

-- 	2025-04-10	SDN	73675.0	20831.0	0.0	17755.0
select
	distinct pi2.programitem_id
from
	program_item pi2
inner join programitem_program pp on
	(pi2.programitem_id = pp.programitem_id )
where
	pi2.source = 'SDN'

select * from program_refresh_history_details prhd 

select * from program_refresh_history prh ;

select distinct source  from program_item pi2 ;


select * from screening_list sl ;
		