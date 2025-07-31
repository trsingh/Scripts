select
	*
from
	properties p
where
	p.prop_key like 'bankos.tenant.%.coreadapter.internal.url'
order by
	p.value ;
	

select * from properties p where p.prop_key like 'base.bank.url'

select * from properties p  where p.prop_key  = 'bankos.tenant.wcu.coreadapter.internal.url'


select
	*
from
	properties p
order by
	p.field_group,
	p.application,
	p.prop_key ;
	
select
	*
from
	properties p
	where p.prop_key like '%tenant.firstbank%'
order by
	p.field_group,
	p.application,
	p.prop_key ;