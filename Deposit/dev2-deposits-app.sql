show tables;

-- CombinedView
-- DATABASECHANGELOG
-- DATABASECHANGELOGLOCK
-- child_account
-- debit_card
-- deposit_account
-- deposit_account_notification
-- deposit_account_party
-- deposit_familybanking
-- deposit_int1099_statements
-- deposit_product
-- deposit_resets
-- deposit_sequence
-- filter
-- filter_column
-- int_job_progress
-- job_status
-- jv_commit
-- jv_commit_property
-- jv_global_id
-- jv_snapshot
-- rates
-- system_date
-- trancode_details
-- transaction
-- transaction1
-- transfer_funds
-- user_default_preference
-- virtual_account


select * From virtual_account va ;

select * from debit_card dc ;

select * from deposit_product dp where enable_debit_card <> 0;

select * from debit_card dc 
inner join deposit_product dp on ( dc.id = dp.id and dp.enable_debit_card <> 0)
WHERE 
dp.product_name like 'Saving None';


select * From deposit_account da 
inner join deposit_product dp on (da.product_code = dp.product_code)
WHERE 
dp.product_name like 'Saving None';

select * From deposit_account da where da.product_code = 'SAVENONE'

select * From debit_card dc ;

select * from deposit_account da ;

select * from deposit_product dp ;


select * From deposit_product dp where dp.product_code like '%BUSCHECK%'


select * from deposit_account da where da.product_code = 'BUSCHECK' and da.account_number = 'BS00000088'

select * From deposit_account_party dap where deposit_account_id  = 95
