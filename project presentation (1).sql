use project;
select * from year_lf;
select * from quarter_lf;
select * from month_lf;
select * from carrier_lf;
select * from top10_carriers;
select * from top_routes;
select * from week_lf;
call project.search_flights('United States','South Carolina','Myrtle Beach, SC','United States','New Jersey','Newark, NK');
select * from distancegroups; 