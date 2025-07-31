-- PM-30917 Fedwire ISO || UAT || MCB || Issues with the compliance scanning


show tables;

select * from screening_request sr where sr.transaction_reference_no = 51608;

select * from screening_item si where si.ofac_reference_no = '1397615344072060928'

select
	*
from
	screening_request sr
inner join screening_item si on
	(sr.ofac_reference_no = si.ofac_reference_no)
order by
	sr.created_date desc;

select * from screening_item 

-- 
select * from programitem_name pn where pn.programitem_id in (
-- 'a14c1cc7f13fd511e9d77923cd2ff3617a1d4a0767121a1838abfa12',
'3a60b7460f14c609f804dec1effa7d34',
'22614f24de8285839dec792f2bcd736a'
)



select * from programitem_name pn where pn.programitem_id in (
'SDN45908',
'SDN17244',
'SDN45669',
'SDN43093',
'SDN41087',
'SDN6704',
'782582ab1ad190f11da50ef3d0d17a18',
'SDN41978',
'SDN15050',
'SDN27189',
'SDN44082',
'SDN8225',
'SDN17284',
'SDN19036',
'SDN7946',
'SDN15186',
'SDN7201',
'SDN16036',
'b288f34ad9701e5ca3290e0761c96489',
'SDN15922',
'SDN23983',
'SDN41476',
'SDN51671',
'SDN41135',
'SDN22803',
'SDN47929',
'5738f6c648ab4704e607672ca424169e',
'2137069a84144deb7d6d33aa8d82d2a1',
'SDN22244',
'SDN28006',
'13e00e881972b4aeef0c002af906b93d',
'SDN23845',
'843f6f5d74a694171c6f405120368896',
'SDN16135',
'SDN12928',
'SDN10352',
'SDN47350',
'SDN9597',
'SDN15609',
'SDN7835',
'SDN23332',
'SDN12056',
'SDN6908',
'f4df9a6973f61ed02900a93d1710513e',
'8fa3b3018f189a774bbb2d2d03ab51de',
'SDN41139',
'db640d0d01baef1af06017f133a18589',
'SDN28536',
'SDN47600',
'SDN4700'
)
order by pn.name;

-- Example: 276072
select * from programitem_name pn where pn.programitem_id in (
'd09bd976b9e2a44dd6e1b57a1cc72e3e',
'6cccff0b0d5cc179836fce14b8ce9de9'
);


-- Example : 249151 : 
select * from programitem_name pn where pn.programitem_id in (
'SDN11867',
'SDN13430',
'SDN11866',
'SDN48887',
'SDN50905',
'SDN50373',
'SDN47827',
'SDN53980',
'SDN47943',
'SDN50396',
'SDN49468',
'SDN52494',
'SDN43073',
'SDN26119',
'SDN42200',
'SDN40561',
'9e3f1ec4edac3943e43777043dce504f91967822528449955cc35d55',
'SDN50405'
);


select
	*
from
	programitem_program pp
inner join programitem_name pn on
	(pp.programitem_id = pn.programitem_id)
where
	pn.programitem_id in (
'SDN11867',
'SDN13430',
'SDN11866',
'SDN48887',
'SDN50905',
'SDN50373',
'SDN47827',
'SDN53980',
'SDN47943',
'SDN50396',
'SDN49468',
'SDN52494',
'SDN43073',
'SDN26119',
'SDN42200',
'SDN40561',
'9e3f1ec4edac3943e43777043dce504f91967822528449955cc35d55',
'SDN50405'
);

select * from programitem_name pn where pn.programitem_id = 'SDN48887'

-- SDN54246
select * from programitem_name pn where pn.programitem_id = 'SDN54246'

select
	*
from
	programitem_program pp
inner join programitem_name pn on
	(pp.programitem_id = pn.programitem_id)
where
	pn.programitem_id in ('SDN54246')
-- 

-- Issue # 33962 – still triggering on old SDN records	
select
	*
from
	programitem_program pp
inner join programitem_name pn on
	(pp.programitem_id = pn.programitem_id)
where
-- 	pn.programitem_id in ('SDN54246')
	pp.program like '%RUSSIA-EO14024%'
	and pn.name like '%LIMITED LIABILITY PART%'
	

select
	*
from
	programitem_program pp
inner join programitem_name pn on
	(pp.programitem_id = pn.programitem_id)
where
	pn.programitem_id in ('SDN26119')
-- 	pp.program like '%RUSSIA-EO14024%'
-- 	and pn.name like '%LIMITED LIABILITY PART%'
	
	