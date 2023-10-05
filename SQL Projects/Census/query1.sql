select * from dataset1;

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

-- Avg sex_ratio
select state, Avg(Sex_Ratio) as avg_sex_ratio from dataset1 group by state;














