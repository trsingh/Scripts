show tables;

select * from COMPONENT_MASTER cm ;

select * from COMPONENT_RELEASE_MAPPING crm ;

select * from ENV_MASTER em ;

select * from PRODUCT_MASTER pm ;

select * from DEPLOYMENT_HISTORY dh ;

select * from DEPLOYMENT_SNAPSHOT ds ;

select * from NOTIFICATION_MASTER nm ;


select
	*
from
	DEPLOYMENT_HISTORY dh
where
	dh.comp_cd = 'galaxy-irs'
order by dh.deployment_id desc;


select
	distinct em.env_name
from
	ENV_MASTER em
order by
	em.env_name ;

select
	*
from
	DEPLOYMENT_SNAPSHOT ds
order by
	ds.comp_cd ,
	ds.env_cd ;


select
	em.env_name,
	ds.comp_cd ,
	ds.comp_release ,
	ds.build_number ,
	ds.deployment_datetime ,
	ds.updated_datetime ,
	cm.group_code ,
	cm.comp_release ,
	cm.dev_branch 
from
	PRODUCT_MASTER pm
inner join COMPONENT_MASTER cm on
	(pm.product_master_cd = cm.product_master_cd)
inner join ENV_MASTER em on
	(em.product_master_cd = pm.product_master_cd)
inner join DEPLOYMENT_SNAPSHOT ds on
	(ds.comp_cd = cm.comp_cd
		and ds.env_cd = em.env_cd)
where 
	pm.product_master_cd = 'bankos-na'
	and cm.comp_cd = 'galaxy-compliance'
-- 	and em.env_name = 'UAT3'
-- 	and em.env_name in ('UAT1','UAT2','UAT3','UAT4')
-- 	and em.env_name = 'DEV3'
order by
	em.env_name ,
	cm.comp_cd

