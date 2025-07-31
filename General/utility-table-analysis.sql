select
	a.table_name,
	a.table_rows,
	concat('SELECT * FROM ', a.table_name, ' ;') as 'SQL'
from
	(
	SELECT
		table_name,
		table_rows
	FROM
		INFORMATION_SCHEMA.TABLES
	WHERE
		TABLE_SCHEMA = 'galaxy_admin_banka'
	order by
		table_rows desc
)a;


select * from user_account_entitlement uae ;

select * from user_account ua ;

select * from user;

SELECT * FROM department ;

SELECT * FROM user_preferences ;

SELECT * FROM role ;


select * from accounting_event ae ;
