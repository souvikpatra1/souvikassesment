create database gopi;
show databases;
use gopi;
Create table Souvik(
Id int primary key auto_increment,
Title varchar(40) not null,
Director varchar(40) not null,
Year1 int not null,
Length_minutes int not null
);
select * from Souvik;
select * from Movie_table;
select * from Direction;
select * from Production;
select * from BoxOffice;
show tables;



##1st question
select m.Title,m.Cast,p.ProductionName from Movie_table as m join Production as p on m.ProductionID=p.ProductionID;
#2nd question
select m.Title,d.Director,date_format(d.ReleaseDate, "%D/%M/%Y") from Movie_table as m join direction as d on m.MovieID=d.MovieID;
select m.Title , d.Director,d.ReleaseDate,date_format(str_to_date(d.ReleaseDate,'%d/%m/%Y'),'%dth of %M %Y') as Release_Date from Movie_table as m inner join direction as d on m.MovieID = d.MovieID;
#3rd question
select m.Title,m.Cast,d.Director,p.ProductionName,d.ReleaseDate from Direction as d join Movie_table as m on d.MovieID=m.MovieID join production as p on m.ProductionID=p.ProductionID;
#4th Question
select Title, Cast,count(*) from Movie_table where Cast LIKE '%Samuthirakani%Yogi babu%' group by 1,2;
14:31:31	select Title, Cast from Movie_table group by Title having Cast LIKE '%Samuthirakani%' AND cast like'%Yogi babu%' LIMIT 0, 1000	Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'gopi.Movie_table.Cast' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.00057 sec

#5th Question
select m.Title,m.Cast,d.Director from Movie_table as m inner join Direction as d  on m.MovieID=d.MovieID where m.Cast like concat('%',Director,'%');

#6th Question
select ProductionName,count(ProductionName) from Production as p join Movie_table as m on p.ProductionID=m.ProductionID group by(ProductionName) having count(ProductionName)>1  ;
#7th question
select count(Title),(month(ReleaseDate)) from Movie_table join Direction group by month(ReleaseDate);
select count(Title),(quarter(ReleaseDate)) from Movie_table as m join Direction as d group by quarter(ReleaseDate);

#8th question
select substring_index(Cast,',',1) from Movie_table;
#9th question
select Movie_table.Title ,Direction.ReleaseDate from Movie_table inner join Direction on Movie_table.MovieID=Direction.MovieID where month(Direction.ReleaseDate) between '06' and '09';
#10th question
select Movie_table.MovieID,Movie_table.Title from Movie_table where MovieID in(select MovieID from BoxOffice);