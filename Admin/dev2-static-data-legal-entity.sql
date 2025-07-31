-- Legal Entity --

show tables;

select * from legal_entity le where le.shortname = 'BMO'

select * From legal_entity le where le.id  = 11949;

select * From legal_entity le where le.id = 846;

select * From legal_entity le where le.shortname = 'BANKA'

select * From legal_entity le where le.processing_org = '846'

select
	distinct `type`
from
	legal_entity le 
order by le.`type` ;


select * From legal_entity le where le.id in (
11949,
11997,
11960,
11994,
11995,
11984,
12061,
11954,
12160
);


select * from legal_entity le where le.shortname = 'BANKA'


select * From legal_entity le where le.id not in (
11949,
11950,
11961,
11972,
11976,
11979,
11982,
11986,
11993,
11995,
12005,
12017,
12027,
12033,
12034,
12035,
12040,
12045,
12132,
12138,
12152,
12163,
12164,
12165
)


select * from bank_account ba ;