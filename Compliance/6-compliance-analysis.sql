-- Investigating wire 236985 

select
	si.`type`,
	sr2.matching_name
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
inner join screening_result sr2 on
	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = 236985 and sr.ofac_reference_no = '1359427062349168640';


select * from screening_request sr where sr.transaction_reference_no = 236985;

select * from screening_item si where si.item_id = '2ec94ecd-3d78-4e92-b79e-ab3cdc3aa3f2'

select * from screening_item si where si.ofac_reference_no = '1359427062349168640'

-- Investigation of 196572

select
	*
from
	screening_request sr
inner join screening_item si on
	( sr.ofac_reference_no = si.ofac_reference_no )
-- left join screening_result sr2 on
-- 	( si.item_id = sr2.item_id )
where
	sr.transaction_reference_no = 196572;

select * from screening_result sr where sr.item_id in (
'3a9c9817-bdcc-43cf-b9b9-ab5792d83277',
'4673c304-4291-441e-82bf-fcce168a9605',
'5b1aaaf5-1a4b-4fbe-8b16-07606a3b35c6',
'6e6a7499-0712-452e-9406-1e4cf55e0400',
'781f334e-547f-4d5a-ba83-f4e7bf5d6907',
'79618bfa-ca1b-4a3d-a899-d847e03e7572',
'7a0bac54-a8dc-493c-ac4e-6192f7ad0262'
)
	
	
	
	



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
	and sr2.program_identifier in ('SDN12751', 'SDN32332', 'SDN15585', 'SDN53501')
	
	
-- 249151

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
	sr.transaction_reference_no   = '231834'
and	 sr2.matching_name NOT LIKE '%<strong>%'
	and sr.score > 84
	
select * from screening_item si where name like '%cap%'
	
	
