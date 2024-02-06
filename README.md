# Urban Green Spaces Project
## Author: Ruthanne Ward
## Class: Spatial Database
## Assignment: Lab 1
## Description: During this lab I learned how to set up a git repostitory, commit changes to the repo, upoad data from OSM into SQL, write SQL queries to analyze the data and connect QGIS to visualize the data. This lab taught me the foundational basics of using SQL, GIT and QGIS.

Objectives

My objectives are to learn how to learn how to download OSM data, slect green spaces from this data and perform spatial queries on this data. My final objective is to visualize the urban green spaces in Worcester, MA. 

Methods

During Step 1 I created a new SQL database, created a git repository and downloaded OSM data for Massachusetts from Geofabirk. Origionally I had dowloaded data from BBBike and had to go back and repeat this step because the bounding box I drew was not big enough. I ended up downloading OSM data for the entire state of MA just for good measure. I also created a .gitignore file that remained empty until later. I eventually added the osm data to the .gitignore file.

During Step 2 I downloaded osm2pgsql and imported the OSM data to my database in the command line. I then cleaned the data by deleting any row that had a NULL 'name' value when leisure = 'park'. I then created a mass_green_spaces table and populated it with the name, location and area of each park. I then used QGIS to create a connection to my urban_green_spaces SQL database. I used QGIS selection query to select only the parks within the Worcester city boundary. I exported the new table with only Worcester green spaces to the SQL database. 

During step 3 I used SQL queries to gain new information about the urban green spaces in Worcester. I performed spatial queries to learn how many parks there are in worcester, the total area of parsk, the average park area and the five biggest parks in worcester. I then used QGIS to visualize those parks and highlight the five largest parks in the area through selecting by value.

Findings

I learned that there are 65 parks in worcester, the total area of green spaces in the city is 9225812 sq m and the average area of a park in worcester is 141935 sq m. I also learned that the five largest parks in Worcester are:
1. Green Hill Park:	        3406405.5 sq m
2. Lake Park:	              552886.03 sq m
3. Hadwen Park:	            415548.88 sq m
4. Institute Park:          339504.68 sq m
5. Newton Hill at Elm Park: 287947.79 sq m

I am a bit confused because the area values are much larger than they should be. I am not sure how to interpret this becuase the values themselves are uneddited. They have only been selected from the database. Also, the order of size is correct. I crossreferenced the SQL results with the size of the polygons in QGIS. The only thing I can think of is that I have the wrong units. But, all only sources seem to say that the way_area column is in sq meters.


Visualizations

The following image is a screenshot of the QGIS visualization of urban green spaces in Worcester, MA with the five largest parks highlighted in dark green. 

![Screenshot 2024-02-05 194544](https://github.com/ruthanneward/UrbanGreenSpacesProject/assets/98286245/77a21177-d922-4521-a673-932acded1f74)
