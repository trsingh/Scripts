-- MCB Prod Issue Analysis
s
select * from screening_list sl ;

-- Query to get total record count

select
	Date(last_refreshed_on),
	list_name,
	sum(new_records) as new_records,
	sum(updated_records) as updated_records,
	sum(removed_records) as removed_records,
	sum(total_records) as total_records
from
	screening_list
where
	list_name = 'SDN'
group by
	Date(last_refreshed_on),
	list_name
order by
	Date(last_refreshed_on) desc;





with daily_changes as (
select
	DATE(last_updated_date) as updated_date,
	SUM(case when status = 'Created' then 1 else 0 end) as created,
	SUM(case when status = 'Updated' then 1 else 0 end) as updated,
	SUM(case when status = 'Deleted' then 1 else 0 end) as deleted,
	SUM(case 
                when status = 'Created' then 1 
                when status = 'Deleted' then -1 
                else 0 
            end) as net_change
from
	program_item
group by
	DATE(last_updated_date)
),
with_created_cumsum as (
select
	*,
	SUM(created) over (
	order by updated_date rows unbounded preceding) as created_cumsum
from
	daily_changes
),
adjusted_changes as (
select
	updated_date,
	created,
	updated,
	deleted,
	case
		when created_cumsum = 0 then 0
		else net_change
	end as adjusted_net_change
from
	with_created_cumsum
)
select
	updated_date,
	created,
	updated,
	deleted,
	SUM(adjusted_net_change) over (
	order by updated_date rows unbounded preceding) as total_records
from
	adjusted_changes
order by
	updated_date;

 

