-- Latest Date : 2025-02-03
select max(sr.created_date ) from screening_request sr;

-- Last Date: 2024-06-06
select min(sr.created_date ) from screening_request sr;

-- Total Request Records (170K)
select count(*) from screening_request sr ;

-- Total Results (2Mil)
select count(*) from screening_result sr ;

-- check 1
select
	count(*)
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name NOT like '%<strong>%'
	and sr.score > 84;

-- check 2
select
-- 	count(*)
*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.score is null
order by sr.last_updated_date desc;

-- Count Validation

select count(*) from screening_request s ;
select count(*) from screening_item s ;

select
	*
from
	screening_request sr
where
	sr.status is null;


SELECT
	YEAR(sr.created_date) AS year,
	MONTH(sr.created_date) AS month,
	COUNT(*) AS count
FROM
	screening_request sr
where
	sr.source_system = 'Payments'
-- 	YEAR(sr.created_date) = 2025
-- 	and MONTH(sr.created_date) = 2
GROUP BY
	YEAR(sr.created_date),
	MONTH(sr.created_date)
ORDER BY
	year,
	month;

SELECT
	YEAR(sr.created_date) AS year,
	MONTH(sr.created_date) AS month,
	COUNT(*) AS count
FROM
	screening_request sr
-- 	inner join screening_item si on (sr.ofac_reference_no = si.ofac_reference_no)
-- 	left join screening_result sr2 on (sr2.item_id = si.item_id )
-- where
-- 	YEAR(sr.created_date) = 2025
-- 	and MONTH(sr.created_date) = 2
GROUP BY
	YEAR(sr.created_date),
	MONTH(sr.created_date)
ORDER BY
	year,
	month;

select
	sr.transaction_reference_no ,
	sr.ofac_reference_no ,
	sr.*
from
	screening_request sr
where
	YEAR(sr.created_date) = 2024
	and MONTH(sr.created_date) = 10
	and sr.source_system = 'Payments'
	and sr.status is not null
	AND sr.status != 'COMPLIANCE_SUBMITTED';


SELECT
	YEAR(sr.created_date) AS year,
	MONTH(sr.created_date) AS month,
	COUNT(*) AS count
FROM
	screening_request_backup sr
-- 	inner join screening_item si on (sr.ofac_reference_no = si.ofac_reference_no)
-- 	inner join screening_result sr2 
-- where
-- 	YEAR(sr.created_date) = 2025
-- 	and MONTH(sr.created_date) = 2
GROUP BY
	YEAR(sr.created_date),
	MONTH(sr.created_date)
ORDER BY
	year,
	month;

select * from screening_request sr ;

select * from screening_item si ;




-- OFAC Summary Report
-- Ofac-Disposition-report
select
	sr.transaction_reference_no as "Tranx Reference No", 
	sr.ofac_reference_no as "OFAC Reference No",
	sr.source_system as "Source System",
	sr.score as "Score",
	sr.status as "Payment Status",
	sr.reviewer as "Reviewer",
	sr.approver as "Approver",
	sr.description as "Description",
	sr.last_updated_date as "Last Updated Date Time (UTC)",
	sr.created_date as "Created Date (UTC)",
	-- this should give us the detail when issue started
	sr.comments as "Comments",
	si.`type` as "Type",
	si.name as "Name",
	concat(si.address1, " ", si.address2) as "Address",
	si.numberOfHits as "Hits",
	si.score as "Score",
	sr2.program as "Program",
	sr2.matching_name as "Matching Name",
	si.reviewer as "Reviewer",
	si.approver as "Approver",
	sr2.comments as "Comments",
	sr2.program_identifier
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.score > 84
	and sr.source_system = 'Payments'
	and YEAR(sr.created_date) = 2024
	and MONTH(sr.created_date) = 12
-- 	and DAYOFMONTH(sr.created_date) BETWEEN 1 AND 15
	and DAYOFMONTH(sr.created_date) BETWEEN 16 AND 32
order by
	sr.last_updated_date asc;


select
	max(sr.created_date ),
	min(sr.created_date )
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.score > 84
	and sr.source_system = 'Payments'
	and YEAR(sr.created_date) = 2024
	and MONTH(sr.created_date) = 10
	and DAYOFMONTH(sr.created_date) BETWEEN 16 AND 31