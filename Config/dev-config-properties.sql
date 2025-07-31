--DEV Config Properties --

select * from properties p where p.prop_key like '%AwsRegion%'


select * from properties p 
where p.value like '%compliance-response%'


select * from properties p 
where p.value like '%fx-confirmation%'


select * from properties p 
where p.prop_key = 'bankos.messaging.topic.accounting.transaction'

select * from properties p 
where p.prop_key = 'bankos.messaging.sqs.accounting.transaction'


select * from properties p
where p.prop_key = 'base.serverless.url'

select * from properties p
where p.prop_key  = 'bankos.galaxy_serverless.api_secret'


select
	*
from
	properties p
where
	p.prop_key like '%bankos.finzly.deposit.tenant%'
	
select
	*
from
	properties p
where
	p.prop_key like '%bankos.tenant%.auth.url%'
	
	
	select
	*
from
	properties p
where
	p.prop_key like '%bankos.tenant%.url%'
	
	