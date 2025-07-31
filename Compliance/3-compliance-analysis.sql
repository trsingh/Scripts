select * from screening_request sr where sr.ofac_reference_no = 1262335484537094144;


select
	si.type,
	si.name,
	concat(si.address1, ' ', si.address2) as address,
	si.city,
	si.state,
	'' as countryCode ,
	'' as zipCode,
	si.country,
	si.score as Standard
from
	screening_item si
where
	si.score >= 80
	and si.score <= 100
order by
	si.ofac_reference_no ,
	si.score desc
limit 500;


select distinct status from screening_request sr ;

select * from screening_request sr where sr.ofac_reference_no in (
select
	distinct ofac_reference_no 
from
	screening_item si
where
	si.score >= 80
	and si.score <= 100
)
and sr.status <> 'APPROVED'
limit 500;



select
	si.type,
	si.name,
	concat(si.address1, ' ', si.address2) as address,
	si.city,
	si.state,
	'' as countryCode ,
	'' as zipCode,
	si.country,
	si.score as Standard
from
	screening_item si
where
	si.score >= 80
	and si.score <= 100
	and
	si.ofac_reference_no in (
	'1262733134119792640',
'1263135227940073472',
'1265632196379873280',
'1270095575555878912',
'1270494945241063424',
'1278459922884755456',
'1279179663215427584',
'1280469475213967360',
'1280599776669990912',
'1280883350492192768',
'1287883023954808832',
'1289196093875138560',
'1289202902850932736',
'1291051876215738368',
'1291062341758017536',
'1291064780486922240',
'1291065935035031552',
'1291066360656224256',
'1291067118687277056',
'1291072308074438656',
'1291381811304255488',
'1291382629642326016',
'1291382687423057920',
'1291383177601802240',
'1291383740264665088',
'1291383836683325440',
'1295789813286100992',
'1308443675019485184',
'1308467926820757504',
'1308547239532339200',
'1311319469958688768',
'1311319476202520576',
'1311337545362108416',
'1317154516387553280',
'1317184042968346624',
'1318612237144121344',
'1319025033170214912',
'1319025087922659328',
'1322315897559404544',
'1325895001972236288',
'1327364938526363648',
'1333530206028263424',
'1334884462332968960',
'1336006092041117696',
'1336048206221303808',
'1336050178075119616'
	)
	
	
select
	*
from
	screening_request sr
where
	Date(sr.created_date) >= '2024-06-01'
	and Date(sr.created_date) <= '2024-08-01'
	
	
SELECT 
    YEAR(sr.created_date) AS year,
    MONTH(sr.created_date) AS month,
    COUNT(*) AS total_rows
FROM 
    screening_request sr
GROUP BY 
    YEAR(sr.created_date),
    MONTH(sr.created_date)
ORDER BY 
    year, month;


SELECT 
    year,
    MONTHNAME(STR_TO_DATE(CONCAT('2025-', month, '-01'), '%Y-%m-%d')) AS month_name,
    total_rows
FROM (
    SELECT 
        YEAR(sr.created_date) AS year,
        MONTH(sr.created_date) AS month,
        COUNT(*) AS total_rows
    FROM 
        screening_request sr
    GROUP BY 
        YEAR(sr.created_date),
        MONTH(sr.created_date)
) AS subquery
ORDER BY 
    year, 
    month;


select
	*
from
	screening_list list
where
-- 	Date(list.last_refreshed_on) > '2025-04-02'
	status = 'Inprogress'
order by 


SELECT
	*
FROM  
	galaxy_compliance_finzly.screening_list list
WHERE
LOWER(list.status) = LOWER('inprogress')
order by list.last_refreshed_on desc;

-- 	screening_list.last_refreshed_on like "2025-04-03 %"
-- 	AND LOWER(screening_list.status) = LOWER('inprogress');







	