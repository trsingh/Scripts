show tables;

-- Account Subtypes
select
	distinct account_subtype
from
	deposit_product dp
order by
	dp.account_subtype ;

select * from deposit_account da ;


