select * from sales;
select Amount, Customers, Boxes from sales;

select SaleDate, Amount , Boxes, Amount / Boxes from sales;
select SaleDate, Amount , Boxes, Amount / Boxes as 'Amount per Box' from sales;

select * from sales
where Amount > 10000
order by Amount desc;

select * from sales
where GeoID = "g1"
order by PID, Amount desc;

select * from sales
where Amount>10000 and SaleDate > '2022-01-01';

select * from sales
where Boxes >0 and Boxes >=50 ;

select * from sales
where Boxes between 0 and 50;

select *, weekday(saleDate) as 'Day of Week'
from sales;

select * from people
where team = 'jucies' or Team = 'delish';

select * from people
where Team in ('delish','jucies');

select * from people
where Salesperson like 'B%';

select * from sales;

select 	SaleDate, Amount,
		case 	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount category'
from sales;