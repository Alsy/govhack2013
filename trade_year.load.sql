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

