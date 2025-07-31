-- Admin App
-- galaxy-admin-banka
-- List of Tables
show tables;


-- User Details
select
	u.user_id,
	u.login_id,
	u.first_name,
	u.middle_name,
	u.last_name,
	u.status,
	u.user_type,
	u.legal_entity_id,
	u.department_code,
	u.other_departments,
	u.shortname,
	u.action_user_type,
	u.creator_type
from
	`user` u
-- where
-- 	u.login_id like '%tej%'

-- User & User Roles
select
	u.user_id,
	u.login_id ,
	u.user_type,
	u2.role_name
from
	`user` u
inner join user_role_mapping u2 on
	(u.user_id = u2.user_id )
order by
	u.login_id,
	u2.role_name;

--

select * from le_application l ;

select * from le_app_entitlement_groups l ;




