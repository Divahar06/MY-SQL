---- Create cars database -----
create database cars;

------ set cars as default schema ----
use cars;

-------- view all the details about the tabel -------
------- Question 1 to read the data in the tabel------
select * from car_dekho;

--------- Question 2 to get the count of total Record in the tabel-----
select count(*) as Toral_records from car_dekho;


--------- Question 3 to get number of  cars on year 2023 tabel-----

select count(*) as car_count_2023 from car_dekho
where year = 2023;

--------- Question 4 to get number of  cars on year 2020,2021,2022 -----

select year, count(*) as car_count from car_dekho
where year in (2020,2021,2022)
group by year ;


------------ to view the table----------

select * from car_dekho;

-- to find which year has max no fo cars -----------

select year,  count(*) as no_of_cars from car_dekho
group by year
order by no_of_cars desc ;

---- to find the distinct type of fuel -----

select distinct(fuel) from car_dekho;

----- no of diesel cars in year 2020-----

select count(*) no_of_cars from car_dekho
where year = 2020 and fuel = 'diesel';

----- no of Petrol cars in year 2020-----

select count(*) no_of_cars from car_dekho
where year = 2020 and fuel = 'petrol';



select * from car_dekho;

-- to seperate mileage into numerical and text as mileage unit same for ------

alter table car_dekho
add column mileage_ float,
add column mileage_unit varchar(10);

SET SQL_SAFE_UPDATES = 0;

UPDATE car_dekho
SET mileage_ = CAST(SUBSTRING_INDEX(mileage, ' ', 1) AS FLOAT),
    mileage_unit = SUBSTRING_INDEX(mileage, ' ', -1);
    
SET SQL_SAFE_UPDATES = 1;


-- to find the count of cars based on year and fuel tyep ----------------

select year, fuel,count(*) as car_count from car_dekho
where fuel in ("petrol","diesel","cng")
group by year ,fuel
order by year ,fuel;

---- to find the number of years where the number of cars with the fuel type "petrol" is greater than or equal to 100-----
select year , count(*) car_count from car_dekho 
where fuel = "petrol"
group by year 
having car_count >= 100
order by year ;

---------- to filter only the cars between 2010 and 2022-------------
select * from car_dekho
where year between 2010 and 2022;


---- to find the car wih maximum and minimum selling price -----
select name, year,max(selling_price) as max_price ,km_driven,fuel from car_dekho
group by name, year,km_driven,fuel ;



------- to find the avg km driven by each car in year 2020 ---------------------------

 select avg(km_driven) as avg_km from car_dekho
 where year = 2020;
 
 













