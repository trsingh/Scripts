select * from screening_list sl ;


select
-- 	count(*)
*
from
	program_refresh_history_details prhd
where
	prhd.status = 'Deleted'
-- 	and Date(prhd.last_updated_date) = '2025-05-02';
order by prhd.last_updated_date desc;

-- 	prhd.status = 'Deleted'
-- 	and Date(prhd.last_updated_date) = '2025-05-01';

select * from program_refresh_history_details prhd ;


SELECT
-- 	pi2.programitem_id,
-- 	pi2.source,
-- 	pi2.status,
-- 	pi2.gov_updated_date,
-- 	pi2.last_updated_date,
-- 	pin.name AS programitem_name,
-- 	pia.address AS programitem_address,
-- 	pic.country AS programitem_country,
-- 	pip.program AS programitem_program,
-- 	pim.moreinfo AS programitem_moreinfo
-- 	count(*)
	pi2.*
FROM
	program_item pi2
-- LEFT JOIN programitem_name pin ON
-- 	pi2.programitem_id = pin.programitem_id
-- LEFT JOIN programitem_address pia ON
-- 	pi2.programitem_id = pia.programitem_id
-- LEFT JOIN programitem_country pic ON
-- 	pi2.programitem_id = pic.programitem_id
-- LEFT JOIN programitem_moreinfo pim ON
-- 	pi2.programitem_id = pim.programitem_id
-- LEFT JOIN programitem_program pip ON
-- 	pi2.programitem_id = pip.programitem_id
WHERE
	pi2.status = "Deleted"
	and pi2.source = "SDN"
	and Date(pi2.last_updated_date) = '2025-05-02';


select * from program_item pi2 ;