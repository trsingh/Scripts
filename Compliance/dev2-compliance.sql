show tables;
   
-- Hits by Date
SELECT
    DATE(sh.updated) AS date,
    SUM(sh.hits) AS total_hits,
    count(*) request
FROM
    screening_history sh
WHERE
    sh.updated BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) AND CURRENT_DATE()
GROUP BY
    DATE(sh.updated)
ORDER BY
    date DESC;
   
-- Hits by source system  
SELECT
	sh.source_system ,
    SUM(sh.hits) AS total_hits,
    count(*) as request
FROM
    screening_history sh
WHERE
    sh.updated BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) AND CURRENT_DATE()
GROUP BY
    sh.source_system
ORDER BY
    sh.source_system DESC;
   
-- By Countries
select
	sh.country,
	sum(sh.hits) as totalHits,
	count(sh.id) as requestCount,
	Year(sh.updated) as year,
	Month(sh.updated) as month
from
	screening_history sh
WHERE 
	sh.country is not null
	and sh.country <> ''
	and (sh.updated BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) AND CURRENT_DATE())
group by
	sh.country ,
	Year(sh.updated),
	Month(sh.updated);


 
   
select
	sh.hits,
	sh.updated 
from
	screening_history sh
where
	(sh.updated BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) AND CURRENT_DATE())
order by sh.updated desc;


select
	sh.country,
	sum(sh.hits) as totalHits,
	count(sh.id) as requestCount,
	Year(sh.updated) as year,
	Month(sh.updated) as month
from
	screening_history sh 
WHERE 
	sh.country is not null and sh.country <> ''
	and (sh.updated BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) AND CURRENT_DATE())
group by
	sh.country , Year(sh.updated), Month(sh.updated);

select CURRENT_DATE();

SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY);

SELECT
    *
FROM
    screening_history sh
WHERE
    sh.updated BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) AND CURRENT_DATE()
ORDER BY
    updated ASC;

select * from programitem_program pp ;

select * from programitem_name pn ;

select
	DISTINCT pp.program
from
	programitem_program pp
inner join programitem_name pn 
on
	pp.programitem_id = pn.programitem_id
inner join program_item pi2 
on
	pi2.programitem_id = pp.programitem_id
where
	pn.name like '%SOURCE%'
order by
	pp.program ;

select * from programitem_address pa ;

select DISTINCT pi2.`type` from program_item pi2 ;

select pp.* From programitem_program pp order by pp.program;

select * from programitem_name pn where pn.name like '%SOURCE%'

select * From programitem_address pa ;

select * From programitem_country pc ;

select * from programitem_moreinfo pm ;

select * from compliance_setting cs ;

select * from compliance_aliasword ca ;

select * from screening_item si ;

select * From screening_request sr order by sr.transaction_reference_no desc;
select * from screening_item si order by ofac_reference_no desc;


select * From screening_request sr where sr.transaction_reference_no = '999390527040'

select * from screening_item si where si.ofac_reference_no = '1262117006374940672'

select * from screening_result sr where sr.item_id = 'fb20c4d4-b308-4f7b-9639-bc21ef6a017a'

select * from screening_result sr;

select * from whitelist w where w.whitelisted_word like '%CITI%'

-- Screeni
select * from screening_result sr 
inner join screening_item si on ( sr.item_id = si.item_id)
WHERE 
	si.ofac_reference_no = '76587653234565'
	
	
select
	sr.ofac_reference_no SCREEN_REQ_OFAC_NO,
	sr.created_date ,
	si.item_id as scr_item_item_id,
	si.address1 as scr_item_address1,
	si.address2 as scr_item_address2,
	si.approver as scr_item_approver,
	si.city as scr_item_city,
	si.country as scr_item_country,
	si.highestScore as scr_item_highestScore,
	si.name as scr_item_name,
	si.numberOfHits as scr_item_numberOfHits,
	si.reviewer as scr_item_reviewer,
	si.score as scr_item_score,
	si.state as scr_item_state,
	si.type as scr_item_type,
	si.ofac_reference_no as scr_item_ofac_reference_no,
	si.status as scr_item_status,
	si.high_risk_country as scr_item_high_risk_country,
	si.countryCode as scr_item_countryCode,
	sr2.additional_info as scr_result_additional_info,
	sr2.comments as scr_result_comments,
	sr2.escalated as scr_result_escalated,
	sr2.matching_address as scr_result_matching_address,
	sr2.matching_name as scr_result_matching_name,
	sr2.program as scr_result_program,
	sr2.score as scr_result_score,
	sr2.status as scr_result_status,
	sr2.program_identifier as scr_result_program_identifier,
	sr2.field_type as scr_result_field_type,
	sr2.scanned_string as scr_result_scanned_string
from
	screening_request sr
left join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no)
left join screening_result sr2 on
	(si.item_id = sr2.item_id)
WHERE 
	si.ofac_reference_no = '' 
	and si.score >=80
order by
	sr.ofac_reference_no ;
	
select * from screening_list sl ;

select * from screening_request sr ;

select * from screening_item si ;


select * from dashboard_data dd ;

select * from dashboard_data_by_country ddbc ;


show tables;

select * From compliance_setting cs ;
	
select * from allowed_word_rules awr ;

desc compliance_setting ;

select * from dashboard_data dd order by updated desc;

select distinct status from screening_request sr;

select * from screening_request sr where sr.status = ''


select * from screening_request sr where sr.ofac_reference_no = '1314651475188137984';

select
	*
from
	screening_item si
where
	si.ofac_reference_no = '1314651475188137984'

select
	si.ofac_reference_no ,
	count(*) screening_item_count
from
	screening_item si

	
explain analyze select 
-- 	sr.ofac_reference_no ,
-- 	count(*)
 sr.*
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no)
where 
	Date(sr.created_date) = '2024-09-13'
group BY 
	sr.ofac_reference_no 
order by sr.ofac_reference_no ;



explain analyze select * from screening_request sr  where Date(sr.created_date) = '2024-09-13';

explain select * from screening_item si ;

select * From screening_list sl ;

select * from screening_result sr 

explain analyze select
	s1_0.source_system,
	sum(s1_0.hits),
	count(s1_0.id)
from
	screening_history s1_0
where
	s1_0.updated between '2023-12-01' and '2024-12-13'
group by
	s1_0.source_system

	
-- show full processlist;
	
select @errorcount;


select * from whitelist w ;



select * from field_audit fa ;


desc compliance_setting ;




select * from screening_request sr where sr.ofac_reference_no = '1334426967172513792'

select * from screening_item si where si.ofac_reference_no = '1334426967172513792'

select * from screening_result sr;

select * from screening_result sr 
inner join screening_item si on ( sr.item_id = si.item_id)
WHERE 
	si.ofac_reference_no = '1334426967172513792'
	and si.score >=80;

select * from programitem_name pn where pn.programitem_id = 'CONSL9639'

select * from programitem_program pp where pp.program = 'NS-PLC' 
and pp.programitem_id = 'CONSL9639'


select * from galaxy_compliance_finzly.programitem_name pn ;

select * from programitem_program pp ;

select * from programitem_moreinfo pm ;

select * from program_item pi2 ;

select * from programitem_name pn where pn.name = 'AVIA IMPORT'




