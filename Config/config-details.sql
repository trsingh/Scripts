show tables;

select * from properties p 
where prop_key = 'service.admin.internal.url'

select
	prop_key,
	value
from
	properties p
where
	p.prop_key in ( 'bankos.tenant.banka.auth.url', 'bankos.tenant.banka.security.url')


select
	p.prop_key ,
	p.value 
from
	properties p
where
	p.prop_key like 'bankos.%.tenant.banka.apiaccount.clientId'
order by p.prop_key; 

select * From properties p where value like 'bankos-paymentgalaxy-%'

select
	p.prop_key,
	p.value
from
	properties p
where
	p.prop_key = 'base.serverless.url'

select
	p.prop_key,
	p.value
from
	properties p
where
	p.prop_key = 'bankos.galaxy_serverless.api_secret'
	
	

select * from properties where value = 'bankos-messaging-sqs-test-banka-compliance-request'

select * from properties wh

select * from properties p
where p.value = 'bankos-messaging-sqs-dev2-compliance-request'

select * from properties p
where p.prop_key like '%compliance%'
order by p.prop_key desc;

select prop_key,value from properties p 
where p.prop_key like '%compliance%'
order by p.prop_key ;

select prop_key,value from properties p 
where p.prop_key like 'bankos.%.tenant.%.apiaccount%'
order by p.prop_key ;

bankos.finzly.compliance.tenant.mcb.apiacount.clientId

select * from properties p where p.prop_key = 'bankos.messaging.compliance.sdn.email.sqs.queue'
-- bankos-messaging-sqs-pfix2-compliance-sdn-update-email-queue

select prop_key,value from properties p 
where p.prop_key like 'base.%'


select * from properties p where p.prop_key like 'bankos.paymenthub.tenant.axos%'

-- bankos.paymenthub.tenant.axosbank.apiaccount.clientId


SELECT * FROM properties where prop_key like 'base%';

select * from properties p where prop_key = 'bankos.messaging.compliance.sdn.email.sqs.queue'
