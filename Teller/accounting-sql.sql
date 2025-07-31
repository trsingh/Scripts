-- Accounting Rules --
select
	ar.book ,
	ar.event_description ,
	ar.event_code ,
	ar.debit_account_name ,
	ar.debit_account_number,
	ar.credit_account_name ,
	ar.credit_account_number 
from
	accounting_rule ar
where
	ar.book = 'GALAXYOUTGOING'
order by
	ar.event_code ;

-- Account Names
select
	*
from
	account a
order by
	a.account_name 

-- Accounting Events
select
	*
from
	accounting_event ae
order by
	ae.application ,
	ae.product ;

select distinct a.category from account a ;

select * from account a where a.account_name = 'Assets'

select
	a.category ,
	a.account_currency ,
	a.account_name,
	a.cost_center ,
	a.processing_org_id,
	count(*)
from
	account a
group by
	a.category ,
	a.account_currency ,
	a.account_name,
	a.cost_center ,
	a.processing_org_id 
order by
	a.category ,
	a.account_currency ,
	a.account_name,
	a.cost_center ,
	a.processing_org_id
	
	
select distinct a.processing_org_id from account a ;



