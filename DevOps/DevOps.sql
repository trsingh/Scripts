show tables;

-- COMPONENT_MASTER
-- COMPONENT_RELEASE_MAPPING
-- DEPLOYMENT_HISTORY
-- DEPLOYMENT_SNAPSHOT
-- ENV_MASTER
-- NOTIFICATION_MASTER
-- PRODUCT_MASTER
-- RELEASE_ENV_MAPPING


-- List of Envs : this might be obsolete
select
	distinct em.env_name
from
	ENV_MASTER em
order by
	em.env_name ;

-- this gives better picture
select
	distinct dh.env_cd
from
	DEPLOYMENT_HISTORY dh
order by dh.env_cd ;

select
	distinct ds.env_cd
from
	DEPLOYMENT_SNAPSHOT ds
order by
	ds.env_cd;


-- List of apps
select
	distinct cm.comp_name
from
	COMPONENT_MASTER cm
order by cm.comp_name ;



select
	distinct ds.comp_cd
from
	DEPLOYMENT_SNAPSHOT ds
-- where
-- 	ds.env_cd = 'DEV'
order by ds.comp_cd ;



select
	ds.deployment_id ,
	ds.comp_cd ,
	ds.env_cd ,
	ds.comp_release ,
	ds.deployed_by ,
	ds.build_number,
	ds.deployment_datetime ,
	ds.updated_by ,
	ds.updated_datetime,
	CASE 
		when ds.env_cd like 'DEV%' then 1
		when ds.env_cd like 'QA%' then 2
		when ds.env_cd like 'TEST%' then 3
		when ds.env_cd like 'UAT%' then 4
		when ds.env_cd like 'PFIX%' then 5
		when ds.env_cd like 'PROD%' then 6
		else 10
	END as rank_col
from
	DEPLOYMENT_SNAPSHOT ds
inner join (
	select
			ds0.env_cd ,
			ds0.comp_cd ,
			MAX(ds0.deployment_datetime) as latest_deployment_datetime
	from
			DEPLOYMENT_SNAPSHOT ds0
	group by
			ds0.env_cd ,
			ds0.comp_cd 
	) ds2 on
	( ds.env_cd = ds2.env_cd
		and ds.comp_cd = ds2.comp_cd
		and ds.deployment_datetime = ds2.latest_deployment_datetime)
WHERE 
	YEAR(ds.deployment_datetime) >= 2025
	and MONTH(ds.deployment_datetime) >= 01
	and not (ds.env_cd like 'UAT%'
		or ds.env_cd like '%PFIX%'
		or ds.env_cd like '%PROD%')
	-- 	and (ds.env_cd like 'UAT%' or ds.env_cd like '%PFIX%' or ds.env_cd like '%PROD%')
	and ds.comp_cd like '%teller%'
	-- 	and em.env_name like 'PROD%'
	-- 	and ds.env_cd like 'PFIX%'
	-- 	and ds.env_cd = 'DEV'
order by
	rank_col ,
	ds.env_cd,
	ds.comp_cd,
	ds.deployment_datetime desc;


select
	*
from
	DEPLOYMENT_SNAPSHOT ds
where
	ds.comp_cd like '%nostro%'
	and ds.env_cd like 'DEV%'








