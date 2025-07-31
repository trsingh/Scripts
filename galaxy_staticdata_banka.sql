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
		TABLE_SCHEMA = 'galaxy_staticdata_banka'
	order by
		table_rows desc
)a;