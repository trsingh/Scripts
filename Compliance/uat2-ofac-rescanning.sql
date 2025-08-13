
select * from screening_request sr where sr.transaction_reference_no = 94439;

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
		sr.transaction_reference_no = 94439)

select * from screening_result sr where sr.item_id in (
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
		sr.transaction_reference_no = 94439)
)

select
	*
from
	screening_request sr
WHERE
	status IS NULL
	AND YEAR(created_date) = 2024
	AND source_system = 'Payments';



select * from screening_request sr ;

-- type = 'Entity'

-- APPROVED
-- COMPLIANCE_REVIEW
-- COMPLIANCE_SUBMITTED
-- OPERATIONS_REVIEW

select distinct status from screening_request s ;


-- Check the highlight issue
SELECT
	*
FROM
	screening_result s
WHERE
	LOWER(s.matching_name) NOT LIKE LOWER('%<STRONG>%');

-- Spot check the score

select * from screening_request sr where sr.score > 100;

select * from screening_item s where s.score > 100;


select * from screening_result sr ;

select * from screening_request sr where sr.transaction_reference_no = 14911;

-- SDN22692
-- 018a182385db6e972272b6a7bac7d469490e25e77b53b6adb7d1c1dc
-- f141fd0db1477b00206a04d0b208ee5291c85cab4630f2eba7807e9f
-- a548c9246ed21d804753231e771a1a2eaa647d2a5f237ca6c0c910b1
-- SDN22693

select * from whitelist w where w.whitelisted_word like '%Revolut%' and w.stop_descriptor like '%ISLAMIC REVOLUTIONARY GUARD CORPS AEROSPACE FORCE%'

-- 3a60b7460f14c609f804dec1effa7d34
-- Name	Revolut	<strong>ISLAMIC REVOLUTIONARY GUARD CORPS AEROSPACE FORCE</strong>;IRGC-ASF;Aerospace Division of IRGC;Aerospace Force of the Army of the Guardians of the Islamic Revolution;AFAGIR;Air Force, IRGC;IRGC Aerospace Force;IRGC Air Force;IRGCAF;IRGCASF;Islamic Revolution Guards Corps Air Force;Islamic Revolutionary Guards Corps Air Force;and Sepah Pasdaran Air Force Damavand Tehran Highway, Tehran, Tehran Province, IR
-- SDN22692


select
sr.transaction_reference_no ,
sr.ofac_reference_no ,
si.`type` ,
si.name ,
sr2.*
-- 	distinct sr2.program_identifier 
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no )
left join screening_result sr2 on (sr2.item_id = si.item_id)
where
-- 	sr.transaction_reference_no = 272472 and
	si.`type` = 'Sender' and si.name = 'Revolut'
	and sr2.matching_name like '%ISLAMIC <STRONG>REVOLUTIONARY</STRONG> GUARD CORPS AEROSPACE FORCE%'
	and sr2.program = 'BIS EL'
	and sr.ofac_reference_no like '%6336'
-- 	and si.`type` = 'Sender' and si.name = 'Revolut'
order by sr.transaction_reference_no desc;

--  GUARD CORPS AEROSPACE FORCE </STRONG>
select
	*
from
	whitelist w
where
	w.whitelisted_word = 'Revolut'
	/*and w.ofac_reference_no = '1261667748192526336'		
	and lower(w.stop_descriptor) like LOWER('%<strong>ISLAMIC REVOLUTIONARY GUARD CORPS AEROSPACE FORCE</strong>%')*/


-- UAT2 Whitelist issue investigation
-- SDN12928	CONSPIRACY OF THE NUCLEI OF FIRE
-- Example 1
select distinct w.program_identifier from whitelist w ;

select * from whitelist w order by w.program_identifier ;

select * from whitelist w where w.program_identifier = 'SDN12928'
	
select * from screening_result sr where sr.program_identifier = 'SDN12928';

select * from screening_item si where si.item_id in (
'18a0b718-41cc-4340-93ec-3db4700e2daa',
'0fe6de7f-8d25-480c-8b23-300e4910c890',
'51ddbd4d-88aa-407c-9b0c-d3b727c1036c'
);

select * from screening_request sr where sr.ofac_reference_no in (	
1319777749797261312,
1298007971034722304,
1385623285946515456
)


-- Example 2

select * from whitelist w where w.program_identifier = 'SDN17284'
	
select * from screening_result sr where sr.program_identifier = 'SDN17284';

select
	*
from
	screening_item si
where
	si.item_id in (
	select
		sr.item_id
	from
		screening_result sr
	where
		sr.program_identifier = 'SDN17284'
);

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
			sr.program_identifier = 'SDN17284'
	)
) 
order by sr.transaction_reference_no ;


select * from screening_item si where si.ofac_reference_no = '1267891036991893504'