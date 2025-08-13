-- UAT2 Re-Scanning Issue Investigation

-- example - 276072
select
	sr.transaction_reference_no ,
	sr.ofac_reference_no ,
	si.name ,
	sr2.matching_name ,
	sr2.program ,
	sr2.program_identifier 
-- 	si.*,
-- 	sr2.*
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	(si.item_id = sr2.item_id )
where
-- 	sr.transaction_reference_no = 280117 ;
	sr.transaction_reference_no = 276072 ;

-- example : 249151 : Other programitem names are still active. we can validate it SDN.xml file

select
	sr.transaction_reference_no ,
	sr.ofac_reference_no ,
	si.item_id ,
	si.name,
	si.highestScore ,
	si.numberOfHits ,
	sr2.matching_name ,
	sr2.score ,
		sr2.program ,
	sr2.program_identifier
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	(si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = 249151
order by sr.ofac_reference_no ,si.item_id ;

select
	distinct sr2.program_identifier 
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	(si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = 249151 ;

-- Validating the bolding question
select
		sr.transaction_reference_no ,
	sr.ofac_reference_no ,
	si.item_id ,
	si.name,
	sr2.matching_name,
	sr2.program ,
	sr2.program_identifier 
from
	screening_request_backup sr
inner join screening_item_backup si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result_backup sr2 on
	(si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = 249151
order by
	sr.ofac_reference_no ,
	si.item_id ;

select * from screening_request sr where sr.transaction_reference_no = 249151 ;

select * from screening_request_backup sr where sr.transaction_reference_no = 249151 ;

select * from
	screening_request_backup sr
inner join screening_item_backup si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result_backup sr2 on
	(si.item_id = sr2.item_id )	
where
	sr.transaction_reference_no = 249151;

-- Example: 263249 
-- Could be seens as problem
select
	sr.transaction_reference_no ,
	sr.ofac_reference_no ,
	si.item_id ,
	si.name,
	si.highestScore ,
	si.numberOfHits ,
	sr2.matching_name ,
	sr2.score ,
	sr2.program ,
	sr2.program_identifier
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	(si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = 263249
order by sr.ofac_reference_no ,si.item_id ;

select * from screening_request sr ;

select
	*
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
order by sr.created_date desc;



select
-- 	w.whitelist_id ,
-- 	w.screening_result_id ,
-- 	w.ofac_reference_no ,
-- 	w.program_identifier ,
-- 	w.field_type ,
-- 	w.whitelisted_word ,
-- 	w.stop_descriptor 
distinct w.program_identifier 
from
	whitelist w
where
	w.program_identifier not like 'SDN%'
	and w.program_identifier not like 'CONS%'
	and w.status = 'Approved'
-- 	and w.whitelisted_word like '%Revolut%'
order by w.program_identifier ;

select * from screening_result sr2 


select * from whitelist w where w.whitelisted_word like '%Revolut%'

select
	w.program_identifier ,
	w.whitelisted_word ,
	w.stop_descriptor 
from
	whitelist w
where
	w.program_identifier = 'f5748620ffc3e8d88fefc1412ee6cd59'



select * from whitelist w where w.program_identifier not like 'SDN%'
-- 55e5cf1a-d053-4504-bdd0-658a7a2e32e4	82913a54-8a21-4ee6-9122-ea7affcc6561	1263574648570806272	SDN6912	Name	TRUIST BANK

select * from screening_result_backup sr where sr.result_id = '82913a54-8a21-4ee6-9122-ea7affcc6561'


-- select * from screening_result sr where sr.matching_name like '%<strong>POLA</strong> MAKARIA%'


select cs.name_noise_words  from compliance_setting cs ;


select
-- 	w.whitelist_id ,
-- 	w.screening_result_id ,
-- 	w.ofac_reference_no ,
-- 	w.program_identifier ,
-- 	w.field_type ,
-- 	w.whitelisted_word ,
-- 	w.stop_descriptor 
distinct w.program_identifier 
from
	whitelist w
where
	w.program_identifier like 'SDN%'
	or w.program_identifier like 'CONS%'
	and w.status = 'Approved'
order by w.program_identifier ;


select * from whitelist w where w.program_identifier = 'SDN30128'