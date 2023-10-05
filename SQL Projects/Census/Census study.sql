select avg(sex_ratio)*100 from dataset1 where state in ('kerala');

-- total rows in our dataset1
select count(*) from dataset1;

-- total rows in our dataset2
select count(*) from dataset2;

-- dataset for jharkhand and bihar
select * from dataset1 
where state in	('jharkhand','bihar');

-- total population of india
select sum(Population) as total_population from dataset2;

-- Avg growth 
select state, Avg(growth)*100 as avg_population from dataset1 group by state;

-- Highest Avg sex_ratio state
select state, round(Avg(Sex_Ratio),0) as avg_sex_ratio from dataset1 group by state order by avg_sex_ratio desc;


-- Highest Avg litracy state
select state, round(Avg(literacy),0) as avg_literacy from dataset1 group by state order by avg_literacy desc;

-- states having literacy count more then 90
select state, round(Avg(literacy),0) as avg_literacy from dataset1 
group by state having round(Avg(literacy),0)>90
order by avg_literacy desc;

-- top 3 states showing highest growth rate
select state, Avg(growth)*100 as avg_growth_rate from dataset1 group by state order by avg_growth_rate desc limit 3;

-- bottom 3 states showing lowest sex_ratio
select state, round(Avg(Sex_Ratio),0) as avg_sex_ratio from dataset1 group by state order by avg_sex_ratio asc limit 3;

-- top and bottom 3 states in literacy
with
top3 as
(select state, Avg(growth)*100 as avg_growth_rate from dataset1 group by state order by avg_growth_rate desc limit 3)
,
bottom3 as
(select state, Avg(growth)*100 as avg_growth_rate from dataset1 group by state order by avg_growth_rate asc limit 3)

-- union operator
select * from top3
union
select * from bottom3
;
-- states starts with letter a or b 
select distinct state from dataset1 where state like 'a%' or state like 'b%';

-- joins
select * from dataset1;
select * from dataset2;

select d1.district,d1.state,d1.sex_ratio,d2.population
from dataset1 as d1
inner join
dataset2 as d2 
on d1.district=d2.district;

select d1.district,d1.state,d1.sex_ratio,d2.population
from dataset1 as d1
left join
dataset2 as d2 
on d1.district=d2.district;

select d1.district,d1.state,d1.sex_ratio,d2.population
from dataset1 as d1
right join
dataset2 as d2 
on d1.district=d2.district;























