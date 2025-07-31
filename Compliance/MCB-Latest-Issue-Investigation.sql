select c.us_states from compliance_setting c ;


select * from screening_request sr where sr.transaction_reference_no = 197487;

select * from screening_item si where si.ofac_reference_no = '1336339065239560192'

select * from screening_result sr where sr.item_id = 'b014e88f-7d13-456c-b71e-30bb2cdbebb3'
-- for distinct payments which me might have submitted multipe times for rescanning

-- Total Number of payment
select count(*) from screening_request sr ;

-- Total Count which got submitted more than once
select
	count(*)
from
	screening_request sr
where
	sr.ofac_reference_no in (
	select
		distinct si.ofac_reference_no
	from
		screening_item si
	inner join (
		select
			sr.item_id,
			count(sr.item_id) as hitCount
		from
			screening_result sr
		group by
			sr.item_id
	) temp on ( si.item_id = temp.item_id)
	where
		si.numberOfHits <> temp.hitCount
	)
order by
	Date(sr.created_date) asc;

-- date wise breakup for submitting request multiple times 
select
	Date(sr.created_date),
	sr.transaction_reference_no 
from
	screening_request sr
where
	sr.ofac_reference_no in (
	select
		distinct si.ofac_reference_no
	from
		screening_item si
	inner join (
		select
			sr.item_id,
			count(sr.item_id) as hitCount
		from
			screening_result sr
		group by
			sr.item_id
	) temp on ( si.item_id = temp.item_id)
	where
		si.numberOfHits <> temp.hitCount
	)
order by
	Date(sr.created_date) asc;

-- date wise breakup for submitting request multiple times 
select
-- 	Date(sr.created_date),
	count(*)
from
	screening_request sr
where
	sr.ofac_reference_no in (
	select
		distinct si.ofac_reference_no
	from
		screening_item si
	inner join (
		select
			sr.item_id,
			count(sr.item_id) as hitCount
		from
			screening_result sr
		group by
			sr.item_id
	) temp on ( si.item_id = temp.item_id)
	where
		si.numberOfHits <> temp.hitCount
	)
-- group by
-- 	Date(sr.created_date)
-- order by
-- 	Date(sr.created_date) asc;

-- Result Details
select count(*) from screening_request;
select * from screening_request sr where sr.transaction_reference_no = '27996'

select * from screening_item si where si.ofac_reference_no = '1266051151850958848'

select * from screening_result sr where sr.item_id = '32c70775-90cc-4560-8af0-8d0e2f20c478'

select * from screening_result_backup sr where sr.item_id = '32c70775-90cc-4560-8af0-8d0e2f20c478'

select
	sr2.*
from
	screening_item si
inner join screening_result sr2 on
	(sr2.item_id = si.item_id )
where
	si.ofac_reference_no = '1359495886423842816'
	
select
	sr2.*
from
	screening_item_backup  si
inner join screening_result_backup sr2 on
	(sr2.item_id = si.item_id )
where
	si.ofac_reference_no = '1359495886423842816'
	

-- this will list all the payments for which score is > 100 which is not correct
select
	*
from
	screening_request sr
where
	sr.ofac_reference_no in (
	select
		si.ofac_reference_no
	from
		screening_item si
	where
		si.item_id in (
		select
			sr.item_id
		from
			screening_result sr
		where
			sr.score > 100)
		
	)
	
select
	distinct si.name
from
	screening_item si
left join screening_result sr on
	(si.item_id = sr.item_id )
where
-- 	si.ofac_reference_no = '1262378866659573760'
	sr.score > 100;
	

select
	si.name,
	sr.score
from
	screening_item_backup si
left join screening_result_backup sr on
	(si.item_id = sr.item_id )
where
	si.item_id = '22916c82-a576-4439-94a0-3257a02f3566'
	
select
	si.name,
	sr.score
from
	screening_item si
left join screening_result sr on
	(si.item_id = sr.item_id )
where
	si.item_id = '22916c82-a576-4439-94a0-3257a02f3566'
	
	
-- 

select * from screening_result sr where sr.result_id = '0c87d420-79a3-4381-a016-e291c3068bac'

-- This is issue number 2
select * from screening_request_backup srb where srb.transaction_reference_no = '16459'

select * from screening_request srb where srb.transaction_reference_no = '16459'



select
	count(1)
from
	screening_request_backup  sr
where
	sr.ofac_reference_no in (
	select
		si.ofac_reference_no
	from
		screening_item_backup  si
	where
		si.item_id in (
		select
			sr.item_id
		from
			screening_result_backup  sr
		where
			sr.score > 100)
	)
	
select
	si.name,
	sr2.matching_name ,
	sr2.program_identifier ,
	si.*,
	sr2.*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where 
	sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84