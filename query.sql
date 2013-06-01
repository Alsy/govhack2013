-- Country code query
select  direction,
        year,
        t.country,
        c.code,
        comm_code,
        value
from    trade   t,
        country c
where   t.country = c.country;

-- trade direction
select  sum(value) as total_trade,
        sum(if(direction = "Exports", value, 0)) as export_trade,
        sum(if(direction = "Imports", value, 0)) as import_trade,
        country
from    trade
where   year = 2006
group by country
order by country
;

select  sum(value) as total_trade,
        sum(if(direction = "Exports", value, 0)) as export_trade,
        sum(if(direction = "Imports", value, 0)) as import_trade,
        country,
        year
from    trade
group by country, year
order by year, country
;

select  sum(value) as total_trade,
        sum(if(direction = "Exports", value, 0)) as export_trade,
        sum(if(direction = "Imports", value, 0)) as import_trade,
        t.country,
        c.code,
        year
from    trade   t,
        country c
where   t.country = c.country
group by country, year
order by year, country
;

select  sum(value) as total_trade,
        sum(if(direction = "Exports", value, 0)) as export_trade,
        sum(if(direction = "Imports", value, 0)) as import_trade,
        t.country,
        c.code,
        year
from    trade   t,
        country c
where   t.country = c.country
group by country, year
order by year, country
;

