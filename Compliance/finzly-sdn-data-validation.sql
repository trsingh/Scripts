show tables;

-- 7c99a8d704a83d8af0fe6a7d27159d74caedd98577ae4aac017fb0e9

-- BIS DPL - Denied Persons List (DPL) - Bureau of Industry and Security
-- BIS EL - Entity List (EL) - Bureau of Industry and Security
-- Consolidated SDN
-- Export  - Military End User (MEU) List - Bureau of Industry and Security
-- Fincen
-- SDN
-- STATE DTC  - ITAR Debarred (DTC) - State Department
-- STATE ISN - Nonproliferation Sanctions (ISN) - State Department	&& Chemical and Biological Weapons Act
-- STATE UVL - Unverified List (UVL) - Bureau of Industry and Security


select distinct pi2.source from program_item pi2 ;

select
	*
from
	program_item pi2
where
-- 	pi2.programitem_id = '99e6630bc69f13f4aa190cf6255121581cb7f867eed3c1c0f2436c65'
	pi2.source = 'STATE ISN'
	
	
select
	*
from
	program_item
where
	source like 'BIS DPL'
order by last_updated_date desc;


select * from programitem_program pp where pp.programitem_id = '34fe415dbd3347cbbc05c83cd4234a6b'

select * from programitem_name pn where pn.programitem_id = '34fe415dbd3347cbbc05c83cd4234a6b'

select
	*
from
	programitem_name pn
where 
	pn.name like '%KOREA SOBAEKSU TRADING CORPORATION%'
order by
	pn.last_updated_date desc;