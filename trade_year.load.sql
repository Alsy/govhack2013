insert
into    trade_year
select  sum(value)                                      as total,
        sum(if(direction = "Exports", value, 0))        as export,
        sum(if(direction = "Imports", value, 0))        as import,
        sum(if(direction = "Imports", -value, value))   as balance,
        t.country,
        c.code,
        year
from    trade   t,
        country c
where   t.country = c.country
group by country, year
order by year, country
;

