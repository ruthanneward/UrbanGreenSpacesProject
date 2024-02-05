-- Author: Ruthanne Ward
-- Title:  Urban Green Spaces
-- Descritption: This SQL query file is used to create data tables of urban green spaces in 
-- Worcester. It is also used to do spatial analysis of these green spaces. 

--Delete NULL values from parks
SELECT osm_id, name, ST_Area(way) as area
FROM planet_osm_polygon
WHERE leisure = 'park'
ORDER BY area DESC;
DELETE FROM planet_osm_polygon
WHERE name IS NULL

--Create table for massachusetts green spaces 
CREATE TABLE mass_green_spaces (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	location GEOMETRY(Point, 3857),
	area_sq_m NUMERIC
);

-- Populate mass_green_spaces table
INSERT INTO mass_green_spaces (name, location, area_sq_m)
SELECT name, ST_Centroid(way), ST_Area(way)
FROM planet_osm_polygon
WHERE leisure = 'park';

--Use QGIS to filter green spaces to Worcester. 
--Import newly created table worcester_green_spaces to SQL

--View newly create table
SELECT *
FROM worcester_green_spaces

--Determine total # of parks, total area of parks and average park area. 
SELECT COUNT(*) AS total_parks, SUM(area_sq_m) AS total_area, AVG(area_sq_m)
FROM worcester_green_spaces;
--Total Parks: 65
--Total Area: 9225812 sq m
--Average Area: 141935 sq m

--Determine five largest parks
SELECT name, area_sq_m as area
FROM worcester_green_spaces
ORDER BY area DESC
LIMIT 5;
--Green Hill Park:	       3406405.5 sq m
--Lake Park:	           552886.03 sq m
--Hadwen Park:	           415548.88 sq m
--Institute Park:          339504.68 sq m
--Newton Hill at Elm Park: 287947.79 sq m
