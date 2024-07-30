
-- who do muslims cares more for himself or other filter by gender
-- calculate the muslims who cares for other more
SELECT 
    female, COUNT(*) AS count, 'other_afraid' AS category
    from old.`servai how muslem see pandamic`
WHERE
    (female = 'Female' OR female = 'Male')
        AND (cvother LIKE '3. %'
        OR cvother LIKE '4. %'
        OR cvother LIKE '5. %')
        AND (cvself LIKE '1. %' OR cvself LIKE '2. %'
        OR cvself LIKE '3. %')
GROUP BY female
UNION SELECT 
    female, COUNT(*) AS count, 'self_afraid' AS category
FROM
    old.`servai how muslem see pandamic`
WHERE
    (female = 'Female' OR female = 'Male')
        AND (cvself LIKE '3. %' OR cvself LIKE '4. %'
        OR cvself LIKE '5. %')
        AND (cvother LIKE '1. %'
        OR cvother LIKE '2. %'
        OR cvother LIKE '3. %')
GROUP BY female
ORDER BY count , category;



-- who do muslims cares more for himself or other filter by age 
-- calculate the muslims who cares for other more
SELECT agecat,count(*) AS count,
"other_afraid" AS category
FROM old.`servai how muslem see pandamic`
where (cvother like "3. %" or cvother like "4. %" or cvother like "5. %" )
and (cvself like "1. %" or cvself like "2. %" or cvself like "3. %" )
group by agecat


UNION
-- calculate the muslims who cares for them self more
SELECT agecat, count(*) as count,
'self_afraid' AS category 
FROM old.`servai how muslem see pandamic`
where (cvself like "3. %" or cvself like "4. %" or cvself like "5. %" )
and (cvother like "1. %" or cvother like "2. %" or cvother like "3. %" )
group by agecat
order by agecat, category;


-- do muslems afraid of the societal consequences 
select  cvconseq, count(*) as count
FROM old.`servai how muslem see pandamic`
where cvconseq != "" 
group by cvconseq
order by count asc;

-- do muslems afraid of the societal consequences by gender
select  female,cvconseq, count(*) as count
FROM old.`servai how muslem see pandamic`
where cvconseq != "" and female != ""
group by cvconseq,female
order by female,cvconseq;

-- do muslems afraid of the societal consequences by marital status
select  marriage,cvconseq, count(*) as count
FROM old.`servai how muslem see pandamic`
where cvconseq != "" and marriage !=""
group by cvconseq,marriage
order by marriage,cvconseq asc;


-- do muslems see the overall reaction to the Coronavirus exaggerated
select  cvexagg, count(*) as count
FROM old.`servai how muslem see pandamic`
where cvexagg != "" 
group by cvexagg
order by cvexagg asc;


-- do muslems see the overall reaction to the Coronavirus exaggerated by age
select  agecat,cvexagg, count(*) as count
FROM old.`servai how muslem see pandamic`
where cvexagg != "" 
group by cvexagg,agecat
order by agecat,cvexagg asc;


-- do muslems see the overall reaction to the Coronavirus exaggerated by gender
select  female,cvexagg, count(*) as count
FROM old.`servai how muslem see pandamic`
where cvexagg != "" and female !="" 
group by cvexagg,female
order by female,cvexagg asc;

-- is corona a punishment vs not punishment
select count(cvpunish) as count, "not punshed" as catagory
FROM old.`servai how muslem see pandamic`
where cvpunish!= "" 
and (cvpunish like "%1. %" 
or cvpunish like "%2. %")
UNION
select  count(*) as count,"punshed" as catagory
FROM old.`servai how muslem see pandamic`
where cvpunish!= ""
and (cvpunish like "3.%" 
or cvpunish like "%4. %" 
or cvpunish like "%5. %")
order by count, catagory asc;

-- is corona wakeup call vs not wakeup call
select  count(cvwakeup) as count, "wakeup call" as catagory
FROM old.`servai how muslem see pandamic`
where cvwakeup!= "" 
and (cvwakeup like "3.%"
or cvwakeup like "4.%"
or cvwakeup like "5.%")
union
select  count(cvwakeup) as count, "not wakeup call" as catagory
FROM old.`servai how muslem see pandamic`
where cvwakeup!= "" 
and (cvwakeup like "1.%"
or cvwakeup like "2.%")
order by catagory;

-- how many muslems pray 5 
select count(pray5) as count, "pray 5" as catagory 
FROM old.`servai how muslem see pandamic`
where pray5 = "Yes"
union
select count(pray5) as count, "don't pray 5" as catagory 
FROM old.`servai how muslem see pandamic`
where pray5 = "no";


-- is corana manmade?
select  count(cvmanmade) as count, "manmade" as catagory
FROM old.`servai how muslem see pandamic`
where cvmanmade !="" 
and (cvmanmade like "Might or might not" 
or cvmanmade like "Probably yes"
or cvmanmade like "Definitely yes")
union
select  count(cvmanmade) as count, "not_menmade" as catagory
FROM old.`servai how muslem see pandamic`
where cvmanmade != "" 
and (cvmanmade like "Probably not" 
or cvmanmade like "Definitely not")
order by catagory;

-- is corona manmade by age
select  agecat,count(cvmanmade) as count, "manmade" as catagory
FROM old.`servai how muslem see pandamic`
where cvmanmade !="" 
and (cvmanmade like "Might or might not" 
or cvmanmade like "Probably yes"
or cvmanmade like "Definitely yes")
group by agecat
union
select  agecat,count(cvmanmade) as count, "not_menmade" as catagory
FROM old.`servai how muslem see pandamic`
where cvmanmade != "" 
and (cvmanmade like "Probably not" 
or cvmanmade like "Definitely not")
group by agecat
order by count;

-- are muslem afraid of death
select count(feardeath) as count, "afraid of death" as catagory
from old.`servai how muslem see pandamic`
where feardeath !="" 
and (feardeath like "3.%"
or feardeath like "4.%"
or feardeath like "5.%")
union
select count(feardeath) as count, "not afraid of death" as catagory
from old.`servai how muslem see pandamic`
where feardeath !="" 
and (feardeath like "1.%"
or feardeath like "2.%");

-- are muslems afraid of death by age
select agecat,count(feardeath) as count, "afraid of death" as catagory
from old.`servai how muslem see pandamic`
where feardeath !="" 
and (feardeath like "3.%"
or feardeath like "4.%"
or feardeath like "5.%")
group by agecat
union
select agecat,count(feardeath) as count, "not afraid of death" as catagory
from old.`servai how muslem see pandamic`
where feardeath !="" 
and (feardeath like "1.%"
or feardeath like "2.%")
group by agecat
order by count;

-- are muslems afraid of death by sex
select female,count(feardeath) as count, "afraid of death" as catagory
from old.`servai how muslem see pandamic`
where feardeath !="" 
and (feardeath like "3.%"
or feardeath like "4.%"
or feardeath like "5.%")
group by female
union
select female,count(feardeath) as count, "not afraid of death" as catagory
from old.`servai how muslem see pandamic`
where female !="" and feardeath !="" 
and (feardeath like "1.%"
or feardeath like "2.%")
group by female
order by count