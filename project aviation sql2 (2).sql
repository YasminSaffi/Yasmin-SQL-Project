SELECT * FROM project.`yearly load factor`;
create table Year_LF as select year,round(avg(ifnull(if(transported_passengers = 0 or available_seats = 0,null, transported_passengers / available_seats),0))*100,2) as LoadFactor from maindata group by year;
select * from Year_LF;
create table Quarter_LF as select quarter,round(avg(ifnull(if(transported_passengers = 0 or available_seats = 0,null, transported_passengers / available_seats),0))*100,2) as LoadFactor from maindata group by quarter;
select * from quarter_lf;
create table Month_LF select month_name ,round(avg(ifnull(if(transported_passengers = 0 or available_seats = 0,null, transported_passengers / available_seats),0))*100,2) as LoadFactor from maindata group by Month_Name;
create table Carrier_LF as select Carrier_Name ,round(avg(ifnull(if(transported_passengers = 0 or available_seats = 0,null, transported_passengers / available_seats),0))*100,2) as LoadFactor from maindata group by Carrier_Name;
select * from carrier_lf;
create table top10_carriers as select carrier_name, sum(transported_passengers) from maindata
 group by Carrier_Name
 order by sum(Transported_Passengers) desc
 limit 10;
 select * from top10_carriers;
 create table top_routes as select from_to_city, sum(departures_performed) from maindata
 group by From_To_City
 order by sum(Departures_Performed) desc
 limit 10;
 select * from top_routes;
 create table week_LF as select weekday_weekend,round(avg(ifnull(if(transported_passengers = 0 or available_seats = 0,null, transported_passengers / available_seats),0))*100,2) as LoadFactor
 from maindata
 group by weekday_weekend;
 alter table distance_groups
 change Distance_Group_ID distance_group_id int;
 alter table distance_groups
 modify column distance_group_id int primary key;
 alter table maindata
add constraint dist_grp
foreign key (distance_group_id) references distance_groups(distance_group_id);
create table dist_group as SELECT distance_groups.distance_group_id, distance_groups.distance_interval, SUM(maindata.departures_performed) AS total_departures
FROM distance_groups
JOIN maindata
ON distance_groups.distance_group_id = maindata.distance_group_id
GROUP BY distance_groups.distance_group_id;
create table distancegroups as select distance_interval as distance, Total_departures as number_of_flights from dist_group;

 
	