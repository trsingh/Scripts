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

