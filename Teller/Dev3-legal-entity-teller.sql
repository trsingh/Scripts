-- Dev3 Legal Entity
-- Testing Teller App

-- Cost Center

select
	*
from
	cost_center c
-- where
-- 	c.`type` = 'Branch'

show tables;

select
	*
from
	bank_account b
where
	b.status = 'Active'
	and b.account_number = '9901020802'
	
select * from legal_entity l where l.id = 857;

select
	l.fullname,
	l.shortname,
	l.*
from
	legal_entity l
where
	l.fullname like '%Chi%'
	
select
	*
from
	legal_entity l
inner join beneficiary b on
	(l.id = b.legalentity_id )
where
	lower(b.status)  = lower('Active');
	
select * from legal_entity l where l.id = 1138;

select
	b.benename,
	b.legalentity_id ,
	l.shortname ,
	l.fullname ,
	b.*
from
	beneficiary b
	inner join legal_entity l on (b.legalentity_id = l.id )
where
	b.bene_currency = 'USD'
	and b.status = 'Active'
order by l.legal_entity_id;


select distinct b.cost_center from bank_account b ;

select * from bank_account b where b.cost_center = 'New Cost Center'

select * from legal_entity l where l.legal_entity_id = 1188

select * from beneficial_owner b ;

select distinct b.system_of_records from bank_account b ;

select * from bank_account b where b.account_number = '112288'

-- 
select
	b.cost_center ,
	b.account_number,
	b.name ,
	b.`type` ,
	b.sub_type ,
	b.system_of_records ,
	l.fullname ,
	l.shortname ,
	l.`type` ,
	b2.benename ,
	b2.bene_currency ,
	b2.benebank_name ,
	l.*
from
	bank_account b
left join legal_entity l on
	(b.legalentity_id = l.id )
left join beneficiary b2 on
	(l.id = b2.legalentity_id )
where
-- 	b.status = 'Active'
-- 	and l.cost_center = 'Global'
-- 	l.cost_center = 'New Cost Center'
-- 	and b.account_number = '112233'
-- 	and b.account_number like '%2288'
-- 	and b2.bene_currency = 'USD'
-- 	and b.currency = 'USD'
-- 	and b.system_of_records = 'Other Core'
-- 	and b.account_number = '112288'
-- 	and b.account_number not in ('10200000324')
b.account_number not in ('9901020301')