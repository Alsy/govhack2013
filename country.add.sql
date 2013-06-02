
insert
into    country
values  ("XZ", "International Waters", "International Waters")
;

insert
into    country
values  ("QO", "Outlying Oceania", "Outlying Oceania")
;

insert
into    country
values  ("ZZ", "Unknown", "Unknown")
;

insert
into    country
values  ("AN", "Netherlands Antilles", "Netherlands Antilles")
;

update  country
set     country = "Serbia"
where   alt_country = "Serbia"
;

insert
into    country
values  ("CS", "Serbia & Montenegro", "Serbia & Montenegro")
;

insert
into    country
values  ("NT", "Neutral Zone", "Neutral Zone")
;

update  country
set     country     = "Antigua & Barbuda"
where   alt_country = "Antigua and Barbuda"
;

update  trade
set     country = "China"
where   country = "Hong Kong (SAR of China)"
;

update  trade
set     country = "China"
where   country = "Macau (SAR of China)"
;

update  trade
set     country = "Unknown"
where   country = "No Country Details"
;

update  trade
set     country = "Unknown"
where   country = "Confidential (Alumina Special Case)"
;

update  trade
set     country = "Democratic Republic of the Congo"
where   country = "Republic of Congo"
;

update  trade
set     country = "Korea, Republic of"
where   country = "Republic of Korea"
;

update  trade
set     country = "International Waters"
where   country = "Ships Stores"
;

update  country
set     country     = "St Vincent & Grenadines"
where   alt_country = "Saint Vincent and the Grenadines"
;

update  country
set     country     = "St Pierre & Miquelon"
where   alt_country = "Saint Pierre and Miquelon"
;

update  trade
set     country = "Unknown"
where   country = "Unkown"
;

update  trade
set     country = ""
where   country = ""
;

update  country
set     country     = ""
where   alt_country = ""
;
