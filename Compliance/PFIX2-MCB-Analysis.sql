



select * from screening_request_backup sr where sr.transaction_reference_no = 279833;


select
	sr.transaction_reference_no,
	count(sr.transaction_reference_no) payment_count
from
	screening_request sr
group by
	sr.transaction_reference_no
having payment_count > 1
order by sr.transaction_reference_no asc;

101873,
102998,
103636,
104522

select * from screening_request sr where sr.transaction_reference_no in (
98372,
98370,
98369,
101873,
102998,
103636,
104522
)
order by sr.transaction_reference_no;

select
	srb.source_system as Source_System,
	Date(srb.created_date) as Created_Date,
	count(*) as COUNT
from
	screening_request_backup srb
where
	srb.source_system = 'Payments'
group by
	srb.source_system,
	Date(srb.created_date)
order by
	Date(srb.created_date);


SELECT *
FROM screening_request sr
WHERE NOT EXISTS (
    SELECT 1
    FROM screening_request_backup sr1
    WHERE sr.ofac_reference_no = sr1.ofac_reference_no
)
order by sr.created_date desc;


SELECT *
FROM screening_request_backup sr
WHERE NOT EXISTS (
    SELECT 1
    FROM screening_request sr1
    WHERE sr.ofac_reference_no = sr1.ofac_reference_no
)
order by sr.created_date desc;

select
	*
from
	screening_request_backup srb
where
	srb.ofac_reference_no not in (
	select
		sr.ofac_reference_no
	from
		screening_request sr)
order by
	srb.created_date desc,
	srb.transaction_reference_no;

select
	x.`Date`,
	count(*)
from
	(
	select
		Date_format(srb.created_date, "%Y-%m") as Date,
		srb.ofac_reference_no
	from
		screening_request srb
	where
		srb.ofac_reference_no not in (
		select
			sr.ofac_reference_no
		from
			screening_request_backup sr)
	order by
		srb.created_date desc
)x
group BY 
x.`Date`


select
	srb.created_date,
	srb.ofac_reference_no
from
		screening_request srb
where
		srb.ofac_reference_no not in (
	select
		sr.ofac_reference_no
	from
		screening_request_backup sr )
order by srb.created_date desc;

		


select
	sib.ofac_reference_no ,
	sib.address1,
	sib.address2,
	sib.city,
	sib.country,
	sib.countryCode,
	sib.name
-- 	count(*)
from
	screening_item_backup sib
where
	sib.ofac_reference_no in (
	select
		sr.ofac_reference_no
	from
		screening_request_backup sr
	where
		sr.transaction_reference_no in ('235099', '222753', '215970', '198426', '196429', '196375', '192734', '183856', '144257', '76025', '72065', '69258')
-- 	sr.transaction_reference_no in ('235099')
)
order by
	sib.address1,
	sib.address2,
	sib.city,
	sib.country,
	sib.countryCode,
	sib.name;

select
	srb.transaction_reference_no ,
	sib.ofac_reference_no ,
	sib.address1,
	sib.address2,
	sib.city,
	sib.country,
	sib.countryCode,
	sib.name,
	sib.`type`
from
	screening_request_backup srb
inner join screening_item_backup sib on
	(srb.ofac_reference_no = sib.ofac_reference_no )
where
		srb.transaction_reference_no in ('235099', '222753', '215970', '198426', '196429', '196375', '192734', '183856', '144257', '76025', '72065', '69258')
-- srb.transaction_reference_no in ('235099')
order by
	srb.transaction_reference_no ,
	sib.address1,
	sib.address2,
	sib.city,
	sib.country,
	sib.countryCode,
	sib.name;


select * from screening_request sr ;

select * from screening_item si ;

select * from screening_result sr


select * from mismatch_detail md ;

select
	sr.created_date ,
	sr.transaction_reference_no ,
	sr.ofac_reference_no,
	sib.highestScore as PROD_SCORE,
	sib.numberOfHits PROD_HITS,
	si.highestScore as PFIX_SCORE,
	si.numberOfHits PFIX_HITS
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_item_backup sib on
	(sr.ofac_reference_no = sib.ofac_reference_no )
where
	sr.source_system = 'Payments'
order BY
	sr.created_date;



select * from screening_request_backup srb where srb.transaction_reference_no = '14523'

select * from screening_item_backup sib where sib.ofac_reference_no = '1248355710873665536'

select * from screening_request srb where srb.transaction_reference_no = '214140'

select * from screening_item sib where sib.ofac_reference_no = '1346207474233282560'

select * from screening_request srb where srb.transaction_reference_no = '156566'

select
	sib.ofac_reference_no as ofac_reference_no ,
	max(sib.highestScore) as HightestScore,
	sum(sib.numberOfHits) as NumberOfHits
from
	screening_item sib
where
	sib.ofac_reference_no = '1313283012643729408'
group BY 
	sib.ofac_reference_no


select * from screening_request_backup srb where srb.transaction_reference_no = '214140'

select * from screening_item_backup sib where sib.ofac_reference_no = '1346207474233282560'

select
	*
from
	screening_result sr
where
	sr.item_id in (
	select
		sib.item_id
	from
		screening_item sib
	where
		sib.ofac_reference_no = '1248386923072094208')
		
select * from screening_request_backup srb where srb.transaction_reference_no = '144257'

select * from screening_request srb where srb.transaction_reference_no = '144257'


select * from screening_request sr ;

-- Report --

-- Tranx Reference No	OFAC Reference No	Source System	Score	Payment Status	Reviewer	Approver	Description	Last Updated Date Time (EST)	Comments
-- Type	Name	Address	Hits	Score	Program	Matching Name	Reviewer	Appover	Comments

select * from screening_item si ;

-- Report Query --
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
	sr.comments as "Comments",
	si.`type` as "Type",
	concat(si.address1, " ", si.address2) as "Address",
	si.numberOfHits as "Hits",
	si.score as "Score",
	sr2.program as "Program",
	sr2.matching_name as "Matching Name",
	si.reviewer as "Reviewer",
	si.approver as "Approver",
	sr2.comments as "Comments"
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	Date(sr.last_updated_date) >= '2025-05-15'
order by sr.last_updated_date asc;	
	

-- Query --


-- This should give us the details of records for which we should have highlighted the matching_name but didn't  --
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
	sr2.matching_name  NOT REGEXP '<strong>.*</strong>'
order by sr.last_updated_date asc;	


-- This should give us the count of records for which we should have highlited the matching_name but didn't  --
select
	count(*)
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name NOT REGEXP '<strong>.*</strong>';
-- 	and sr.score >= 85
	
-- order by
-- 	sr.last_updated_date asc;	


select
	count(*)
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	Date(sr.last_updated_date) >= '2025-05-01'
	

select
	count(*)
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name  NOT REGEXP '<strong>.*</strong>'
	and sr.score >= 85
	
-- sr2.matching_name  REGEXP '<strong>.*</strong>'
	
	
-- Start of the Analysis : 236985
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
	si.name as "Name",
	concat(si.address1, " ", si.address2) as "Address",
	si.numberOfHits as "Hits",
	si.score as "Score",
	sr2.program as "Program",
	sr2.matching_name as "Matching Name",
	sr2.matching_address as "Matching Address",
	si.reviewer as "Reviewer",
	si.approver as "Approver",
	sr2.comments as "Comments"
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = '236985'
	and sr.ofac_reference_no = '1359495886423842816'
	and si.`type` = 'Instructing FI';
	
	
select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = '236985'
	and sr.ofac_reference_no = '1359495886423842816'
	and si.`type` = 'Instructing FI';


select
	*
from
	screening_request sr
where
	sr.transaction_reference_no = '236985'
	and sr.ofac_reference_no = '1359495886423842816'

select
	*
from
	screening_item si
where
	si.ofac_reference_no = '1359495886423842816'
	and si.`type` = 'Instructing FI'
	
select
	*
from
	screening_result sr
where
	sr.item_id = '06a8d528-0f98-4d58-94d5-e2b9df8d97a7'
	
	
-- End of the query --
	
	
-- Start of the Analysis : 236985
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
	si.name as "Name",
	concat(si.address1, " ", si.address2) as "Address",
	si.numberOfHits as "Hits",
	si.score as "Score",
	sr2.program as "Program",
	sr2.matching_name as "Matching Name",
	sr2.matching_address as "Matching Address",
	si.reviewer as "Reviewer",
	si.approver as "Approver",
	sr2.comments as "Comments"
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = '236985'
	and sr.ofac_reference_no = '1359495886423842816'
	and si.`type` = 'Instructing FI';
	
	
select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = '236985'
	and sr.ofac_reference_no = '1359495886423842816'
	and si.`type` = 'Instructing FI';


select
	*
from
	screening_request sr
where
	sr.transaction_reference_no = '236985'
-- 	and sr.ofac_reference_no = '1359495886423842816'

select
	*
from
	screening_item si
where
-- 	si.ofac_reference_no = '1359427062349168640'
	si.ofac_reference_no = '1359495886423842816'
	and si.`type` = 'Instructing FI'
	
select
	distinct sr.matching_name 
from
	screening_result sr
where
	sr.item_id = '06a8d528-0f98-4d58-94d5-e2b9df8d97a7'
	
	
	
-- End of the query --
	
	
	
	
select * from compliance_setting cs ;
	

select * from screening_request sr where sr.transaction_reference_no = '197085'

select * from screening_item si where si.ofac_reference_no = '1336071287919575040'


select * from compliance_setting ;


	
	
select * from screening_request sr where sr.transaction_reference_no = '15878'

select si.item_id from screening_item si where si.ofac_reference_no = '1262457370935754752'

select * from screening_result sr;

select * from screening_result sr where sr.item_id in (select si.item_id from screening_item si where si.ofac_reference_no = '1262457370935754752')

select * from screening_result sr where sr.item_id = 'ecfa7307-2fad-47ac-a3b5-106202c6e231'


-- RUSSIA-EO14024	LIMITED LIABILITY COMPANY KLIN GLASSWORKS;LLC AGC FLAT GLASS KLIN

-- select * from programitem_program pp where pi.p

-- IFSR;SDGT	CITY BASE GROUP LIMITED

select * from programitem_name pn ;


select * from screening_request sr where sr.transaction_reference_no in (
'14522',
'14523',
'14524',
'14525'
);

select * from screening_item si where si.ofac_reference_no in (
1248312711544872960,
1248355710873665536,
1248364817814020096,
1248386923072094208
)
order by si.ofac_reference_no;



select
	sr.transaction_reference_no as "Tranx Reference No",
	sr.ofac_reference_no as "OFAC Reference No",
	sr.source_system as "Source System",
	sr.score as "Score",
	sr.status as "Payment Status",
	sr.reviewer as "Reviewer",
	sr.approver as "Approver",
	sr.last_updated_date as "Last Updated Date Time (UTC)",
	sr.created_date as "Created Date (UTC)",
	si.`type` as "Type",
	concat(si.address1, " ", si.address2) as "Address",
	si.numberOfHits as "Hits",
	si.score as "Score",
	sr2.program as "Program",
	sr2.matching_name as "Matching Name",
	si.reviewer as "Reviewer",
	si.approver as "Approver"
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	
	
order by
	sr.last_updated_date asc;


select cs.name_noise_words, cs.address_noise_words from compliance_setting cs ;


select * from screening_request_backup sr where sr.transaction_reference_no = 15163;

select * from screening_request sr where sr.transaction_reference_no = 15163;

select * from screening_item si where si.ofac_reference_no = 1262394428865396736;

select * from screening_result sr where sr.item_id = '3532b54f-f56b-4bba-90ce-dd38ff6debd1'

-- Example 1
select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no in ('16240');


select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result_backup sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no in ('16240')
	and sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	
-- Example 2
select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
left join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no in ('15901');


select
	sr.transaction_reference_no,
	sr.ofac_reference_no,
	si.name,
	sr2.matching_name,
	si.`type`
-- 	distinct si.name
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	-- 	sr.transaction_reference_no in ('15901')
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	-- 	and type in ('Beneficiary Intermediary Bank','Beneficiary FI')
	-- 	and type in ('Beneficiary FI')
	-- 	and type in ('Beneficiary')
	-- 	and type in ('Ultimate Receiver')
	-- 	and type in ('Beneficiary Bank')
	and type in (
'Beneficiary',
'Beneficiary Bank',
'Ultimate Receiver',
'Beneficiary FI',
'Instructing FI'
	)
	and si.name = 'SRI LLC'
	
-- order by si.name;
	
	
-- 0258771a-c786-48bc-a5c2-f5f80cddf86e
	
select
	*
from
	screening_result si
where
	si.item_id = '0258771a-c786-48bc-a5c2-f5f80cddf86e'
	and si.matching_name NOT LIKE '%<strong>%'

select * from screening_item si where si.ofac_reference_no = '1273289505729007616'
	
-- Example 4
	
select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
left join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no in ('61901');

select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
where
	sr.transaction_reference_no in ('62227');

select * from screening_result sr where sr.item_id = '307a53c7-1ebf-4d5d-a050-6db9c2482038'


select * from screening_request sr where sr.transaction_reference_no = 15045;


select * from screening_item si where  si.ofac_reference_no = '1262380083036016640'

select * from screening_result sr where sr.item_id = 'cba6890c-6985-471d-a74e-a0bcc1ca7dce'

select * from screening_result_backup sr where sr.item_id = 'cba6890c-6985-471d-a74e-a0bcc1ca7dce'


select * from screening_result sr ;


select * from screening_request sr where sr.transaction_reference_no = 16240;

select * from screening_item si where si.ofac_reference_no = '1262498498028179456'

select * from screening_result sr where sr.item_id in (
'165c537d-93b7-446c-aed3-05815dd2dc5d',
'2fed71e8-8200-402b-9384-65814b9fdd6a',
'77db6638-0abf-4a6e-b5e7-87a3cac9e5d8',
'a1925030-c188-4061-a246-08e3967a93f4',
'b77788c0-e44b-418d-8fd9-a6b6b08492d4',
'c2b63a2e-a9ca-47f7-94f0-36bc1c07b661'
);


select * from screening_result_backup sr where sr.item_id in (
'165c537d-93b7-446c-aed3-05815dd2dc5d',
'2fed71e8-8200-402b-9384-65814b9fdd6a',
'77db6638-0abf-4a6e-b5e7-87a3cac9e5d8',
'a1925030-c188-4061-a246-08e3967a93f4',
'b77788c0-e44b-418d-8fd9-a6b6b08492d4',
'c2b63a2e-a9ca-47f7-94f0-36bc1c07b661'
);


select * from screening_request sr where sr.transaction_reference_no = 17520;

select * from screening_item si where si.ofac_reference_no = '1262825162117677056'

select * from screening_result sr where sr.item_id = 'a1925030-c188-4061-a246-08e3967a93f4'

select * from screening_result_backup  sr where sr.item_id = 'a1925030-c188-4061-a246-08e3967a93f4'


select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
left join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no in (17520);

----   analysiss


select
-- 	sr.transaction_reference_no,
-- 	sr.ofac_reference_no,
-- 	si.name,
-- 	sr2.matching_name,
-- 	si.`type`
-- 	distinct si.name
	distinct sr2.matching_name 
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	-- 	sr.transaction_reference_no in ('15901')
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	and si.name = 'SRI LLC'
	
-- 
	
select
-- 		sr.transaction_reference_no,
-- 		sr.ofac_reference_no,
-- 		si.name,
-- 		sr2.matching_name,
-- 		si.`type`
	-- 	distinct si.name
		distinct sr2.matching_name
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	-- 	sr.transaction_reference_no in ('15901')
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	and si.name = 'SRI LLC'
	
select
-- 		sr.transaction_reference_no,
-- 		sr.ofac_reference_no,
-- 		si.name,
-- 		sr2.matching_name,
-- 		si.`type`
	-- 	distinct si.name
		distinct sr2.matching_name
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	-- 	sr.transaction_reference_no in ('15901')
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	and si.name = 'NEPA 305 LLC'
	
select
			sr.transaction_reference_no,
			sr.ofac_reference_no,
			si.name,
			sr2.matching_name,
			sr2.scanned_string ,
			si.`type`
	-- 	distinct si.name
-- 		distinct sr2.matching_name
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	-- 	sr.transaction_reference_no in ('15901')
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	and si.name = 'IAL BANK'
	
	
select * from compliance_setting cs ;

-- abcdefghijklmnopqrstuvwxyz
	
-- 5th 3rd Bank
-- BANCO CORPORATIVO SA;BANCORP;BANCO NACIONAL;BANCO NATIONAL;NATIONAL BANK


select
	si.name,
	sr2.matching_name,
	sr2.program,
	sr2.program_identifier
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	and si.name = '5th 3rd Bank'
group BY 
	si.name,
	sr2.matching_name,
	sr2.program,
	sr2.program_identifier
	
	-- Carol Bealexis PADILLA DE ARRETURETA
	-- SAMANE GOSTAR SAHAB PARDAZ PRIVATE LIMITED COMPANY;SAHAB PARDAZ CO.
	
	

select
	si.name,
	sr2.matching_name,
	sr2.program,
	sr2.program_identifier
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
group BY 
	si.name,
	sr2.matching_name,
	sr2.program,
	sr2.program_identifier
	
-- - Jorge Luis LLANOS GAZIA;Jorge Luis LLANOS GAZZIA
	
-- 1634 DEAN	Jorge Luis LLANOS GAZIA;Jorge Luis LLANOS GAZZIA	SDNTK	SDN12296 > 1 aka
	
	
-- Issue Investigation --
	
select
	max(sr.created_date) max_created_date,
	min(sr.created_date) min_created_date
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	
-- Record Count >> Check PROD support to get the count
select
	count(*) as record_count
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	and Date(sr.created_date) > '2025-05-05'


select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	and Date(sr.created_date) > '2025-01-05'
	
---- Investigation
-- 1336020542752186368
-- score = 100

select
	*
from
	screening_request sr
where
	sr.transaction_reference_no = '196572'
	
-- Score = 0
select
	*
from
	screening_request_backup  sr
where
	sr.transaction_reference_no = '196572'
	
	
select * from screening_item si where si.ofac_reference_no = '1336020542752186368'

select * from screening_item_backup si where si.ofac_reference_no = '1336020542752186368'


select
	*
from
	screening_result sr
where
	sr.item_id in (
	select
		si.item_id
	from
		screening_item si
	where
		si.ofac_reference_no = '1336020542752186368'
)


select
	*
from
	screening_result_backup  sr
where
	sr.item_id in (
	select
		si.item_id
	from
		screening_item_backup si
	where
		si.ofac_reference_no = '1336020542752186368'
)


select cs.name_noise_words from compliance_setting cs ;

-- o,co.,llc,ltd,rd,st,dr,cir,corp,al,el,the,of,an,a,for,,1,2,3,4,5,6,7,8,9,0,dr.,apt,ct,attn,th,ave,floor,transfer,inc,cap,ow,and,&,hs,unit,reference,inv,invoice,national,na,n.a.

-- st,dr,road,rd,llc,bldg,po.,po,post box,postbox,no,no.,cir,al,el,the,of,an,a,for,1,2,3,4,5,6,7,8,9,0,main,street,p o box,floor,fl,th


-- Sender to receiver info,Originator To Beneficiary Information,Payment Note1,Payment Note2,Reference for beneficiary,Receiver FI Information

-- invoice,reference,purpose,transfer,fund transfer,cap,memo,swf,self transfer,ref,inv,Metropolitan Commercial Bank

select * from compliance_setting cs ;



