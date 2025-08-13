-- UAT2 Ofac Rescanning Data Analysis


select
	*
from
	screening_request sr
where
	sr.transaction_reference_no = 52311
	
select
	*
from
	screening_item si
where
	si.ofac_reference_no = 1400530346337898496


-- Highlighting Issue : Not resolved
select
	sr.transaction_reference_no ,
	sr.ofac_reference_no ,
	si.name,
	sr2.matching_name,
	sr2.score,
	sr2.scanned_string
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	(si.item_id = sr2.item_id )
WHERE 
	lower(sr2.matching_name) not like '%<strong>%'
	and sr2.score > 84
order BY 
	sr.transaction_reference_no asc;

-- score more than 100 : Discuss this with Durai

select * from screening_request sr where sr.score > 100;

select * from screening_result sr where sr.score > 100;

select
	sr.transaction_reference_no ,
	sr.ofac_reference_no ,
	si.name,
	sr2.matching_name,
	sr2.score,
	sr2.scanned_string
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	(si.item_id = sr2.item_id )
WHERE
	sr.score > 100
-- 	lower(sr2.matching_name) not like '%<strong>%'
-- 	sr2.score > 100

-- Duplicate : 282060
	
select * from screening_request sr where sr.transaction_reference_no = 282060;

select
	sr.transaction_reference_no,
	sr.ofac_reference_no,
	sr.*,
	si.*
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
where
	sr.transaction_reference_no = 282060
order by
	sr.transaction_reference_no,
	sr.ofac_reference_no

	
-- 279778

select * from screening_request_backup sr where sr.transaction_reference_no = '279778'

select * from screening_item_backup si where si.ofac_reference_no = '1387430987173556224'

-- PROD
select
	*
from
	screening_result_backup srb
where
	srb.item_id in (
	select
		si.item_id
	from
		screening_item_backup si
	where
		si.ofac_reference_no in (
		select
			sr.ofac_reference_no
		from
			screening_request_backup sr
		where
			sr.transaction_reference_no = '279778'))
			
-- UAT2			
select
	*
from
	screening_result srb
where
	srb.item_id in (
	select
		si.item_id
	from
		screening_item si
	where
		si.ofac_reference_no in (
		select
			sr.ofac_reference_no
		from
			screening_request sr
		where
			sr.transaction_reference_no = '279778'))

-- Highlighting Issue
select
	*
from
	screening_result sr
WHERE 
	sr.matching_name not like '%<strong>%'
	and sr.score > 84;


-- Summary Stats
show tables;

-- Total Count
select * from screening_request sr ;

-- 252949
select count(*) from screening_request sr ;

-- 252949 Dt: 7/2/2025
select count(*) from screening_request_backup sr ;

-- 18385
select count(*) from screening_result sr ;

-- 2368068
select count(*) from screening_result_backup sr ;


-- Duplicate Payment Report

select
	sr.transaction_reference_no,
	count(sr.transaction_reference_no) payment_count
from
	screening_request sr
group by
	sr.transaction_reference_no
having
	payment_count > 1
order by
	sr.transaction_reference_no asc;


-- Report
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
	sr.created_date as "Created Date (UTC)", -- this should give us the detail when issue started
	sr.comments as "Comments",
	si.`type` as "Type",
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
-- 	sr2.matching_name  NOT like  '%<strong>%'
	sr.score > 84
order by sr.last_updated_date asc;	


select * from screening_result s ;

select
	sr.transaction_reference_no ,
	si.type,
	si.name
-- count(*)
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
where
	sr.transaction_reference_no in (
279618,
279618,
279618,
279735,
279735,
280044,
280044,
280044,
280044,
280044,
281882
)
order by
	sr.transaction_reference_no

	-- Alabama, AL, Alaska, AK, Arizona, AZ, Arkansas, AR, California, CA, Colorado, CO, Connecticut, CT, Delaware, DE, Florida, FL, Georgia, GA, Hawaii, HI, Idaho, ID, Illinois, IL, Indiana, IN, Iowa, IA, Kansas, KS, Kentucky, KY, Louisiana, LA, Maine, ME, Maryland, MD, Massachusetts, MA, Michigan, MI, Minnesota, MN, Mississippi, MS, Missouri, MO, Montana, MT, Nebraska, NE, Nevada, NV, New Hampshire, NH, New Jersey, NJ, New Mexico, NM, New York, NY, North Carolina, NC, North Dakota, ND, Ohio, OH, Oklahoma, OK, Oregon, OR, Pennsylvania, PA, Rhode Island, RI, South Carolina, SC, South Dakota, SD, Tennessee, TN, Texas, TX, Utah, UT, Vermont, VT, Virginia, VA, Washington, WA, West Virginia, WV, Wisconsin, WI, Wyoming, WY

-- 
-- highRiskCountry
-- us_states
-- us_cities
-- us_citys
	

-- 
	
select * from allowed_word_rules a ;

select c.us_states from compliance_setting c ;

select
*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
left join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = 50494
order BY 
	sr.transaction_reference_no,
	sr.ofac_reference_no ;


select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
left join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
-- 	sr.transaction_reference_no = 50750
-- 	sr.transaction_reference_no = 50753
-- sr.transaction_reference_no = 50756
sr.transaction_reference_no = 50757

order BY 
	sr.transaction_reference_no,
	sr.ofac_reference_no ;

desc screening_history;

select * from screening_request;

select * from screening_item s ;




