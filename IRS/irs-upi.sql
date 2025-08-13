show tables;

select * from upi_master;


-- Asset Class	Set	M	Rates
-- Instrument Type	Set	M	Swap
-- Product	Set	M	Fixed_Float
-- Level	Set	M	UPI
-- Notional Currency	Enum	M	EUR
-- Underlier ID	Enum	M	EUR-EURIBOR-Reuters
-- Underlier ID Source	Enum	M	FPML
-- Reference Rate Term Value	Integer	M	3
-- Reference Rate Term Unit	Enum	M	MNTH
-- Notional Schedule	Enum	M	Constant
-- Delivery Type	Enum	M	PHYS


select
-- 	um.asset_class ,
-- 	um.instrument_type ,
-- 	um.product,
-- 	um.`level` ,
-- 	um.notional_currency,
-- 	um.reference_rate ,
-- 	um.delivery_type ,
	um.*
from
	upi_master um
where
	um.asset_class = 'Rates'
	and um.instrument_type = 'Swap'
	-- and um.product = 'Fixed_Float'
	and um.use_case = 'Fixed_Float'
	and um.notional_currency = 'USD'
	and um.`level` = 'UPI'
	
	
-- Classification Type
-- Short Name
-- Underlier Name
-- Underlying Asset Type
-- Single or Multi Currency
-- CFI Delivery Type
	
select
	um.classification_type ,
	um.short_name ,
	um.underlier_name ,
	um.underlying_asset_type ,
	um.delivery_type ,
	um.*
from
	upi_master um 
where
	um.classification_type like 'SRH%'

	
select * from upi_master um where um.classification_type in ('SRCISN', 'SRCISC')