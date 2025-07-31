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
		TABLE_SCHEMA = 'galaxy_accounts_banka'
	order by
		table_rows desc
)a;


select
	a.category ,
	a.account_name ,
	a.account_number,
	count(*)
From
	account a
where 
	a.processing_org_id = 11949
group by
	a.category ,
	a.account_name ,
	a.account_number
order by
	a.category ,
	a.account_name ,
	a.account_number
	
	 
select
	*
from
	account a
where
	a.category = 'Assets'
	and a.processing_org_id = 11949
order by
	a.account_name desc;
	

select * from account a where a.account_number in ( 20000001,10000001,10000002,33333331);

where a.account_name like '%seize%'


select * from account a where a.account_currency = 'USD'