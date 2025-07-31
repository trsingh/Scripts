select
	p.payment_date ,
	p.payment_id ,
	p.payment_status ,
	p.*
from
	payment p
where
	p.department = 'Payments'
-- 	p.payment_id = 900238217
-- 	and p.payment_status = 'COMPLIANCE_APPROVED'
order by
	p.payment_date   desc;


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
	p.department = 'Payments'
-- 	p.payment_id = 900238217
-- 	and p.payment_status = 'COMPLIANCE_APPROVED'
order by
	p.payment_date   desc;


select
	distinct p.payment_status
from
	payment p
order by
	p.payment_status desc;

show tables;