# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select * from city where name like 'ping%' ORDER BY population ASc;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
select * from city where name like 'ran%' ORDER BY population desc;
#
# 3: Count all cities
select count(*) from city;
#
# 4: Get the average population of all cities
select avg(population) from city;
#
# 5: Get the biggest population found in any of the cities
select * from city order by population desc LIMIT 1;
-- can also use: SELECT MAX(population) from city;

# 6: Get the smallest population found in any of the cities
select * from city order by population asc LIMIT 1;
-- can also use: SELECT MIN(population) from city;
#
# 7: Sum the population of all cities with a population below 10000
select sum(population) from city where population <10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
select count(*) from city where CountryCode in('MOZ','VNM') group by CountryCode;
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
select ci.CountryCode,  count(ci.CountryCode) from city ci where ci.CountryCode in('MOZ','VNM') group by ci.CountryCode;
#
# 10: Get average population of cities in MOZ and VNM
select avg(population) from city where CountryCode in('MOZ','VNM') group by CountryCode;
#
# 11: Get the countrycodes with more than 200 cities
select countrycode from city group by countrycode having count(*)>=200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
select countrycode from city group by countrycode having count(*)>=200 order by count(*) desc;
#
# 13: What language(s) is spoken in the city with a population beween 400 and 500 ?
select  cl.language from city ci inner join countrylanguage cl on ci.CountryCode = cl.CountryCode
where ci.population between 400 and 500;
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
select ci.name, cl.language from countrylanguage cl inner join city ci on ci.countrycode = cl.countrycode
where ci.population between 500 and 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT city.name from city where countryCode IN (SELECT countryCode FROM city WHERE population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT city.name from city where population <> 122199 AND countryCode IN (SELECT countryCode FROM city WHERE population = 122199);
#
# 17: What are the city names in the country where Luanda is capital?
SELECT city.name from city where CountryCode IN (SELECT CountryCode FROM City Where city.name = 'Luanda');

# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
select ci.name from city ci inner join country co on ci.ID = co.capital where region in(
select co.region from country co inner join city ci on ci.countrycode = co.code where ci.name = 'yaren');


# 19: What unique languages are spoken in the countries in the same region as the city named Riga
select distinct cl.language from country co inner join countrylanguage cl on co.code = cl.CountryCode where region in(
select co.region from country co inner join city ci on ci.countrycode = co.code where ci.name = 'riga');
-- Distinct is used above to eliminate duplicate values.
#
select * from countrylanguage;
# 20: Get the name of the most populous city
select name from city ORDER BY population desc LIMIT 1;