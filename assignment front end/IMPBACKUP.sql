CREATE TABLE SALESPEOPLE(SNUM numeric(5) PRIMARY KEY,  SNAME CHAR(10),  CITY CHAR(20),  COMM DECIMAL(8,3));
INSERT INTO SALESPEOPLE VALUES (1001, 'Peel', 'London',0.12); 
INSERT INTO SALESPEOPLE VALUES(1002, 'Serres','San Jose',0.13); 
select * from SALESPEOPLE;

CREATE TABLE CUST(CNUM numeric(5) PRIMARY KEY,  CNAME CHAR(20),  CITY CHAR(20), RATING numeric(3),SNUM numeric(4));

INSERT INTO CUST VALUES (2001, 'Hoffman', 'London',100,1001); 
INSERT INTO CUST VALUES (2002, 'Giovanne', 'Rome',200,1003);

select* from ORDERS

CREATE TABLE ORDERS(ONUM numeric(5) PRIMARY KEY,  AMT numeric(5,2), ODATE Date, CNUM numeric(4),SNUM numeric(4));

INSERT INTO ORDERS VALUES (3009,1713.23,'04-10-94',2002,1003); 
    INSERT INTO ORDERS VALUES (3011,9891.88,'06-10-94',2006,1001);  
    			
    
    SELECT * FROM ORDERS
    
    Select snum, sname, city, comm from salespeople;
    Select sname,comm from salespeople where CITY='London';
    
    Select distinct snum from orders;
    Select cname from cust where rating = 100;
    
    Select onum, amt, odate from orders;
    
    select cname from cust where rating > 200;
    
    Select cname from cust where CITY='LONDON' or rating > 200;
    Select *  from orders where amt > 1000; 
    
    select * from SALEsPEOPLE;
	Select sname, city from salespeople where comm > 0.10 and city ='London';
	
	Select cname from cust where rating <= 100 or city = 'Rome'; 
	Select cname from cust where rating <= 100 or city ='Rome';
	
	
	Select cname from cust where city is null; 
	Select sname, comm from salespeople where comm > 0.10 and comm < 0.12;
	
	Select * from orders where odate in ('03-10-94','04-10-94');
	
	select * from orders;
	select * from SALESPEOPLE
	
	Select cname from cust, orders where orders.cnum = cust.cnum and 
	orders.snum in ( select snum from salespeople where sname in('Peel','Motika')); 
	
	
	Select onum from orders where amt != 0 or amt is not null;
	
	Select count(distinct snum) from orders; 
	
	Select odate, snum, max(amt) from orders group by odate, snum order by odate,snum;
	Select odate, snum, max(amt) from orders where amt > 3000 group by odate, snum order by odate,snum;
	
	Select odate, amt, snum, cnum from orders where amt = (select max(amt)  from orders)
	
	Select count(*) from orders where odate='1994-03-10';
	
			Select count(distinct city) from cust;
			
			Select cnum, min(amt) from orders group by cnum; 
			
			Select min(cname) from cust where cname like 'G%'; 
			
			Select 'For' || to_char(odate,'dd/mm/yy') || 'there are' || count(*) || 'Orders' from orders group by odate;

			Select onum, snum, amt, amt * 0.12 from orders order by snum; 
			
			Select 'For the city ('|| city ||'), the highest rating is : (' ||  max(rating) || ')' from cust group by city;
			
			Select odate, count(onum) from orders group by odate order by count(onum); 
			
			Select sname, cname from salespeople, cust where salespeople.city = cust.city; 
			
			Select cname, sname from cust, salespeople where cust.snum = salespeople.snum 
			
			Select onum, cname from orders, cust where orders.cnum = cust.cnum;
			
			Select onum, sname, cname from orders, cust, salespeople where orders.cnum = cust.cnum and orders.snum = salespeople.snum;
			
			Select cname, sname, comm from cust, salespeople where comm > 0.12 and cust.snum = salespeople.snum; 
			
			Select sname, amt * comm from orders, cust, salespeople where rating > 100 and salespeople.snum = cust.snum and salespeople.snum = orders.snum and cust.cnum = orders.cnum 
			
			Select a.cname, b.cname,a.rating from cust a, cust b where a.rating = b.rating and a.cnum != b.cnum 
			
			Select a.cname, b.cname,a.rating from cust a, cust b where a.rating = b.rating and a.cnum != b.cnum and a.cnum <= b.cnum; 
			
			Select cname, sname from salespeople, cust where sname in  ( select sname  from salespeople where rownum <= 3) order by cname;
			
			Select cname from cust where cust.city = ( select cust.city  from cust, salespeople
where cust.snum = salespeople.snum and sname = 'Serres');

Select cname from cust where snum in (select snum from cust group by snum having count(snum) > 1); 
Select distinct a.cname from cust a ,cust b where a.snum = b.snum and a.rowid != b.rowid;

Select cname, city from cust where rating = (select rating from cust where cname = 'Hoffman') and cname != 'Hoffman'; 

Select Onum from orders	where snum = ( select snum from salespeople where sname ='Motika'); 

Select onum, sname, cname, amt from orders a, salespeople b, cust c where a.snum = b.snum and a.cnum = c.cnum and a.snum = ( select snum from orders where cnum = ( select cnum from cust where cname = 'Hoffman'));

Select *  from orders where amt > ( select avg(amt)  from orders where odate = '03-OCT-94');

Select avg(comm) from salespeople where city ='London';  

Select snum, cnum  from orders where cnum in (select cnum  from cust where city = 'London');

Select comm from salespeople where snum in (select snum from cust where city ='London');

Select cnum, cname from cust where cnum > ( select snum+1000  from salespeople where sname = 'Serres');
Select cnum, rating from cust where rating > ( select avg(rating)  from cust where city = 'San Jose');
select * from orders
alter table orders ALTER column odate date (dd-mmm-yyyy); 
SELECT ODATE FROM ORDERS
select CNUM,CONVERT(DATE,ODATE,10) AS ODATE from orders;
SELECT * FROM ORDERS
alter table orders alter column amt float(8);

INSERT INTO ORDERS VALUES (3005,5160.45,03-10-1994,2003,1002);
CREATE TABLE ORDERS(ONUM NUMBER(5) PRIMARY KEY,  AMT number(5,2), ODATE Date, CNUM NUMBER(4),SNUM NUMBER(4));
