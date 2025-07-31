show tables;

select
	*
from
	user usr
	inner join user_role_mapping urm on ( urm.user_id = usr.user_id)
-- 	inner join user_account ua on ( ua.user_id = usr.user_id)
-- 	inner join user_account ua2 on ( ua2.user_id = usr.user_id)
-- 	inner join user_account_entitlement uae on ( uae.user_account_id = ua2.account_id)
where
	/*usr.user_type = 'BANK'
	and usr.login_id = 'ganesh'*/
	-- usr.user_type = 'BANK';
	usr.login_id = 'amruta.dev2';

select * From user_account ua ;

select * from `role` r ;

select * from role rl where rl.le_shortname = 'divya_test2'

select * from user_role_mapping urm where urm.user_name = 'divya_test2'

select * from account_role_map arm ;

select
	*
from
	`role` r
	inner join role_entitlement_mapping rem on ( r.role_id = rem.role_id)
where
	r.role_name = 'ADMIN BFX'

select * From role_entitlement_mapping rem 

select * from application a ;

select * from `user` u where u.user_id 

select * from `role` r where r.role_id = 'cd22a0de-ac8b-4ce3-ace8-35c0c7f358fc'

select * from role_entitlement_mapping rem where rem.role_id  = 'cd22a0de-ac8b-4ce3-ace8-35c0c7f358fc';

select * from user_role_mapping urm where urm.role_id = 'cd22a0de-ac8b-4ce3-ace8-35c0c7f358fc'

select * From `user` u where u.login_id = 'appa_cashos_dev2';

-- appa_cashos_dev2
select
	*
from
	`role` r
	inner join role_entitlement_mapping rem on ( r.role_id = rem.role_id)
	inner join application a on (a.app_code = rem.app_code)
where 
	-- r.type = 'BANK'
	r.`type` = 'BANK'
	-- and r.role_name  = 'OpenAPINewROLE1'
order by 
	rem.app_code ;
	

select
	*
from
	user usr
	inner join user_role_mapping urm on ( urm.user_id = usr.user_id)
where
	urm.role_name = 'ADMIN BFX'
	
	
select * from user_role_mapping urm where urm.role_name = 'ADMIN BFX'

select * From `role` r where r.role_name = 'ADMIN BFX'

select * From role_entitlement_mapping rem where rem.role_name  = 'ADMIN BFX'

select * From user_account ua where ua.user_id  = 'ab3a070b-e1a2-4d7a-9e48-e280b027dda1'


	
	
-- User --
	
select
	u.user_id ,
	u.login_id ,
	u.status ,
	u.user_type ,
	u.legal_entity_id 
from
	`user` u
where
	u.login_id = 'surendradev2'
	
	
select distinct u.legal_entity_id from `user` u;

select
	distinct u.user_type 
from
	`user` u ;

select
	*
from
	`user` u
WHERE 
	-- u.login_id = 'akshay.dev2.bank'
	u.login_id = '102030';

select * From user_role_mapping urm where urm.user_id = '5c321598-cc7d-4a92-a5cb-2b7496653aa7'

select * from `role` r where r.role_name = 'CashOS Admin'


select * from `user` u where u.legal_entity_id = 11949;

