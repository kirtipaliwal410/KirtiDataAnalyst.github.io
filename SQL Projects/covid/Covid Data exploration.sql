select * from coviddeaths;
select location,date,population,total_cases,new_cases,total_deaths
from coviddeaths
order by 1,2;
-- covid data exploration of germany
-- total cases vs total deaths
-- shows persentage of death 
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as death_persentage from coviddeaths
where location like 'germany'
order by 1,2;

-- total cases vs population
-- shows percentage of population affected by covid
select location,date,total_cases,population,(total_cases/population)*100 as affected_populationpersentage from coviddeaths
where location like 'germany';

-- highest death rated country
select continent,max(cast(total_deaths as decimal)) as total_death_count from coviddeaths
where continent is not null
group by continent
order by max(cast(total_deaths as decimal)) desc;

-- continents with highest deathcount
select continent,max(cast(total_deaths as decimal)) as total_death_count from coviddeaths
where continent <> '' and continent is not null
group by continent
order by max(cast(total_deaths as decimal)) desc;

select replace(continent,"''","test") as from coviddeaths where continent = '';

update coviddeaths
set continent = 'TestContinent'
where continent = '';

select distinct continent from coviddeaths;


select * from coviddeaths where continent = '';

select * from coviddeaths;

-- global numbers;
select date, sum(new_cases) as total_cases,sum(new_deaths) as total_deaths,  sum(new_cases)/sum(new_deaths) as deathpercentage from coviddeaths
group by date;

select * from covidvaccinations;

select dea.continent,dea.location,dea.date,dea.population,
sum(vac.new_vaccinations) over(partition by dea.location order by dea.location,dea.date) as people_vaccinated,vac.total_vaccinations from coviddeaths  dea
join covidvaccinations  vac
on vac.location=dea.location
and dea.date=vac.date
;






















