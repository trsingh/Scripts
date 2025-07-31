-- QA3 System Validation

show tables;

select distinct p.payment_status  from payment p order by p.payment_status ;

select distinct p.channel from payment p order by p.channel desc;

select
	p.payment_type ,
	p.channel ,
	p.book ,
	p.counter_party ,
	p.receiver_account_number ,
	p.receiver_name,
	p.receiver_address1 ,
	p.receiver_bank_id_type ,
	p.receiver_bank_id ,
	p.*
from
	payment p
where
	p.payment_status = 'PROCESSED'
	and p.sender_currency = 'USD'
order by p.payment_id desc;
-- 	and p.payment_type = 'WIRE'
-- order by p.creation_date_time desc;


select * from fedwire_details fd where fd.payment_id = 299248;

select * from payment p where p.payment_id = 299248;

select * from workflow_action wa ;


select
	*
from
	legal_entity le ;




