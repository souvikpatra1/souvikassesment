use newdb;
show tables;
select * from customers2;
create table Prime_ministers(
names varchar(50),
pm_parties varchar(250),
took_offices varchar(250),
left_offices varchar(250)
);
select * from Prime_ministers;
create database webscrap;
use webscrap;
use newdb;
Select * from corona;
select date,positive from corona order by date;
select EXTRACT(YEAR FROM date) as year1 ,EXTRACT(MONTH FROM date) As Months,sum(hospitalizedIncrease) As Total_Hospitalized from corona group by EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date);




create database webscrap1;
use webscrap1;
select * from primeministers;
select Name,datediff(`Left office`,`Took office`)AS year_difference from primeministers;
select name,count(name) from primeministers group by name;
select sum(datediff(`Left office`,`Took office`))AS year_difference from primeministers group by Name;
select Name,sum(datediff(`Left office`,`Took office`))AS year_difference from primeministers group by Name order by year_difference desc limit 2,1 ;



