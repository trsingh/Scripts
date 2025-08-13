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

	-- En-Wei <strong>ERIC</strong> Chang 
<strong>PATRICK NEE</strong> 

select
	*
from
	programitem_program pp
inner join programitem_name pn on
	(pp.programitem_id = pn.programitem_id)
where
-- 	pn.programitem_id in ('SDN30346')
-- pn.programitem_id in ('PATRIC')
pn.name like '%ERIC%'

-- <strong>ISLAMIC REVOLUTIONARY GUARD CORPS RESEARCH AND SELF-SUFFICIENCY JIHAD ORGANIZATION</strong>;IRGC SSJO;Islamic Revolutionary Guard Corps Self-Sufficiency Jehad Organization;IRGC Research and Self Sufficiency Jehad Organization;Self-Sufficiency Jihad Organization;IRGC’s Arms and Military Equipment Self-Sufficiency Program;IRGC Jihad Self-Sufficiency Organization;Jihad Self-Sufficiency Organization of Islamic Revolution Iranian Revolutionary Guards;Self Sufficiency Jihad Organization;IRGC’s Self-Sufficiency and Industrial Research Center;IRGC’s Self-Sufficiency and Industrial Research Centre;IRGC Missile Research Center;IRGC Self-Sufficiency Organization;and IRGC's Research and Self-Sufficiency Organization Tehran and Isfahan, Tehran, IR
-- 	pp.program like '%RUSSIA-EO14024%'
-- 	and pn.name like '%LIMITED LIABILITY PART%'

-- <strong>BRANCH SHIRAZ REVOLUTIONARY COURT</strong>;
-- BRANCH 1 OF THE SHIRAZ REVOLUTIONARY COURT;
-- FIRST BRANCH OF THE SHIRAZ REVOLUTIONARY COURT;
-- FIRST BRANCH OF THE REVOLUTIONARY COURT OF SHIRAZ New Quran Boulevard, District 3 Shiraz City Fars Province Iran
select * from 

select * from programitem_name pn where lower(pn.name) like lower('%SHIRAZ%')

select * from programitem_program pp where pp.programitem_id = '1e37bac67e5deedaa6375b0b0fbe59e4'  -- STATE DTC
-- 00b1f0d28c803e097fb423f4cd5d93e0

select * from programitem_name pn where pn.programitem_id = 'SDN29906'

select * from programitem_program pp where pp.programitem_id = '1e37bac67e5deedaa6375b0b0fbe59e4'  -- STATE DTC

select * from programitem_program pp order by pp.programitem_id ;

select * from programitem_program pp where pp.program = 'STATE DTC'


select * from program_refresh_history_details prhd ;


-- <strong>SAVING BANK</strong>;<strong>SAVINGS BANK</strong>;GENERAL ESTABLISHMENT MAIL SAVING FUND;POST SAVING FUND;THE GENERAL ESTABLISHMENT OF MAIL SAVING FUND;THE POST SAVING FUND Amous Square Damascus Syria;P.O. Box: 5467 Al-Furat St. Merjeh Damascus Syria

select * from programitem_name pn where pn.name like '%ERIC%'

-- En-Wei <strong>ERIC</strong> Chang 
-- Michael Edward <strong>TODD</strong> 
-- Shenzhen <strong>RION</strong> Technology 4/F Block 1. Fuan Second Industrial Park, D Yang Tian, Da Yang Road, Ruyo, Shenzhen, CN
select
	*
from
	programitem_name pn
where
	pn.name like '%RION%'
	and 
pn.programitem_id not like 'SDN%'
	and pn.programitem_id not like 'CONS%';


select
	*
from
	programitem_name pn
where
	pn.programitem_id = '7a5f40483d2901ad396da929b2fd56a96823f9bdd352cac44f0a25ec'
	
select
	*
from
	programitem_name pn
where
	pn.programitem_id in (
	'785f921326402c2c7c9637f855f9b7789d6c309b2104d199cf8a71df',
	'cb4cce5e20ce05bcbdc6504997520f5693116a716819444773f45631',
	'a59117757c8e0b05beaa95414d5189c15649fa86990e626d53a97db0',
	'400c4f242e8246c48227ed52c8913e05',
	'a14c1cc7f13fd511e9d77923cd2ff3617a1d4a0767121a1838abfa12'
	)
	
select * from programitem_name pn where pn.programitem_id = 'SDN30128'

select  distinct pn.programitem_id from programitem_name pn where pn.programitem_id in (
'CONSL15268',
'CONSL17017',
'CONSL18273',
'CONSL18285',
'CONSL18298',
'CONSL18725',
'CONSL18726',
'CONSL18737',
'CONSL18742',
'CONSL19675',
'CONSL20002',
'CONSL20294',
'CONSL20315',
'CONSL20319',
'CONSL20621',
'CONSL20685',
'CONSL32078',
'SDN10133',
'SDN10226',
'SDN10352',
'SDN10391',
'SDN10410',
'SDN10411',
'SDN10465',
'SDN10923',
'SDN10928',
'SDN11238',
'SDN11239',
'SDN11246',
'SDN11366',
'SDN11496',
'SDN11637',
'SDN11753',
'SDN11868',
'SDN11905',
'SDN11971',
'SDN12055',
'SDN12056',
'SDN12294',
'SDN12299',
'SDN12453',
'SDN12549',
'SDN12552',
'SDN12605',
'SDN12696',
'SDN12727',
'SDN12803',
'SDN12882',
'SDN12928',
'SDN13011',
'SDN13059',
'SDN13137',
'SDN13146',
'SDN13156',
'SDN13422',
'SDN13446',
'SDN15039',
'SDN15050',
'SDN15073',
'SDN15186',
'SDN15418',
'SDN15488',
'SDN15492',
'SDN15585',
'SDN15588',
'SDN15609',
'SDN15611',
'SDN15718',
'SDN15922',
'SDN16036',
'SDN16135',
'SDN16318',
'SDN16364',
'SDN16535',
'SDN16696',
'SDN17017',
'SDN17229',
'SDN17244',
'SDN17245',
'SDN17284',
'SDN18273',
'SDN18725',
'SDN18726',
'SDN18737',
'SDN18868',
'SDN18888',
'SDN18951',
'SDN18964',
'SDN19032',
'SDN19036',
'SDN19136',
'SDN19188',
'SDN19509',
'SDN19682',
'SDN20315',
'SDN20569',
'SDN21070',
'SDN22244',
'SDN22261',
'SDN22692',
'SDN22693',
'SDN22747',
'SDN22803',
'SDN22985',
'SDN23063',
'SDN23266',
'SDN23325',
'SDN23326',
'SDN23332',
'SDN23334',
'SDN23475',
'SDN23520',
'SDN23630',
'SDN23725',
'SDN23845',
'SDN23848',
'SDN23900',
'SDN23983',
'SDN24392',
'SDN24667',
'SDN24673',
'SDN24676',
'SDN25019',
'SDN25417',
'SDN25430',
'SDN25455',
'SDN25456',
'SDN25467',
'SDN25578',
'SDN25626',
'SDN25663',
'SDN25681',
'SDN25802',
'SDN25944',
'SDN26120',
'SDN26417',
'SDN26418',
'SDN26582',
'SDN26586',
'SDN26719',
'SDN26720',
'SDN26725',
'SDN26889',
'SDN26984',
'SDN27189',
'SDN27190',
'SDN27191',
'SDN27192',
'SDN27207',
'SDN27318',
'SDN28006',
'SDN28536',
'SDN28659',
'SDN28695',
'SDN28703',
'SDN28859',
'SDN29020',
'SDN29069',
'SDN29159',
'SDN29260',
'SDN29282',
'SDN29360',
'SDN29906',
'SDN30108',
'SDN30128',
'SDN30162',
'SDN30346',
'SDN30399',
'SDN30522',
'SDN30610',
'SDN30651',
'SDN31372',
'SDN31632',
'SDN32064',
'SDN32451',
'SDN32671',
'SDN32691',
'SDN32726',
'SDN32734',
'SDN32891',
'SDN33919',
'SDN33948',
'SDN33959',
'SDN33974',
'SDN33983',
'SDN33993',
'SDN34742',
'SDN34745',
'SDN35021',
'SDN35855',
'SDN36468',
'SDN36659',
'SDN37061',
'SDN37262',
'SDN37483',
'SDN37485',
'SDN37486',
'SDN37517',
'SDN37527',
'SDN37761',
'SDN37776',
'SDN37828',
'SDN37924',
'SDN38180',
'SDN38377',
'SDN38396',
'SDN38536',
'SDN39181',
'SDN39197',
'SDN39539',
'SDN39671',
'SDN40186',
'SDN40380',
'SDN40577',
'SDN40783',
'SDN40943',
'SDN40967',
'SDN40978',
'SDN41041',
'SDN41079',
'SDN41085',
'SDN41086',
'SDN41087',
'SDN41088',
'SDN41089',
'SDN41090',
'SDN41091',
'SDN41092',
'SDN41093',
'SDN41094',
'SDN41099',
'SDN41131',
'SDN41133',
'SDN41135',
'SDN41136',
'SDN41138',
'SDN41139',
'SDN41140',
'SDN41141',
'SDN41476',
'SDN41478',
'SDN41493',
'SDN41965',
'SDN41978',
'SDN42062',
'SDN42064',
'SDN42065',
'SDN42191',
'SDN42238',
'SDN42311',
'SDN42600',
'SDN42998',
'SDN43093',
'SDN43249',
'SDN43317',
'SDN43318',
'SDN43456',
'SDN43842',
'SDN43996',
'SDN44082',
'SDN44141',
'SDN44259',
'SDN44450',
'SDN44499',
'SDN44519',
'SDN44638',
'SDN45066',
'SDN45621',
'SDN45669',
'SDN45692',
'SDN45693',
'SDN45787',
'SDN45810',
'SDN45908',
'SDN45946',
'SDN46005',
'SDN46410',
'SDN46488',
'SDN46499',
'SDN46729',
'SDN4691',
'SDN4693',
'SDN4697',
'SDN4700',
'SDN4709',
'SDN4710',
'SDN4713',
'SDN4714',
'SDN4715',
'SDN47350',
'SDN47418',
'SDN47600',
'SDN47689',
'SDN47929',
'SDN47991',
'SDN48070',
'SDN48073',
'SDN48075',
'SDN48092',
'SDN48096',
'SDN48103',
'SDN48261',
'SDN48309',
'SDN48557',
'SDN48764',
'SDN48845',
'SDN49026',
'SDN49181',
'SDN49265',
'SDN49284',
'SDN49306',
'SDN49513',
'SDN50246',
'SDN50525',
'SDN51665',
'SDN51671',
'SDN51819',
'SDN51825',
'SDN51941',
'SDN6703',
'SDN6704',
'SDN6861',
'SDN6908',
'SDN6912',
'SDN6937',
'SDN7140',
'SDN7142',
'SDN7149',
'SDN7154',
'SDN7201',
'SDN7262',
'SDN7474',
'SDN7598',
'SDN7631',
'SDN7771',
'SDN7835',
'SDN7946',
'SDN8124',
'SDN8158',
'SDN8225',
'SDN8408',
'SDN8593',
'SDN8734',
'SDN8745',
'SDN8761',
'SDN9540',
'SDN9595',
'SDN9596',
'SDN9597',
'SDN9603',
'SDN9616',
'SDN9756'
)


