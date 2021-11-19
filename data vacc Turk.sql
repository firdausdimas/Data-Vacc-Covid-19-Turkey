#--- Dupicat Data ---#
SELECT ID, POPULATION, COUNT(POPULATION) COUNTS
FROM dimassql.covid19vaccination
GROUP BY POPULATION 
HAVING COUNTS > 1;
#--------------------#

#--- Missing Data ---#
SELECT * 
FROM dimassql.covid19vaccination
WHERE DIFF_1DOSE = 0 AND DIFF_2DOSE = 0;
#--------------------#

#--- Delete Data ---#
ALTER TABLE dimassql.covid19vaccination 
DROP COLUMN PREVID;

DELETE FROM dimassql.covid19vaccination 
WHERE CITY = 'Zonguldak';
#-------------------#

#--- Count Percenatge Data ---#
#--- Percentage _1DOSE ---#
SELECT _1DOSE, POPULATION, 
       ROUND(_1DOSE * 100.0 / POPULATION, 1) AS 1_dose_perc
FROM dimassql.covid19vaccination
ORDER BY 1_dose_perc;
#-------------------#

#--- percentage _2DOSE ---#
SELECT _2DOSE, POPULATION, 
       ROUND(_2DOSE * 100.0 / POPULATION, 1) AS 2_dose_perc
FROM dimassql.covid19vaccination
ORDER BY 2_dose_perc;
#-------------------#
#-----------------------------#

#--- Statistik Data ---#
#--- POPULATION ---#
SELECT COUNT(POPULATION) as COUNT
FROM dimassql.covid19vaccination;

SELECT AVG(POPULATION) as AVG
FROM dimassql.covid19vaccination;

SELECT std(POPULATION) as STD
FROM dimassql.covid19vaccination;

SELECT min(POPULATION) as MIN
FROM dimassql.covid19vaccination;

SELECT max(POPULATION) as MAX 
FROM dimassql.covid19vaccination;
#------------------#

#--- VACC _1DOSE ---#
SELECT COUNT(_1DOSE) as COUNT
FROM dimassql.covid19vaccination;

SELECT AVG(_1DOSE) as AVG
FROM dimassql.covid19vaccination;

SELECT std(_1DOSE) as STD
FROM dimassql.covid19vaccination;

SELECT min(_1DOSE) as MIN
FROM dimassql.covid19vaccination;

SELECT max(_1DOSE) as MAX 
FROM dimassql.covid19vaccination;
#-------------------#

#--- VACC _2DOSE ---#
SELECT COUNT(_2DOSE) as COUNT
FROM dimassql.covid19vaccination;

SELECT AVG(_2DOSE) as AVG
FROM dimassql.covid19vaccination;

SELECT std(_2DOSE) as STD
FROM dimassql.covid19vaccination;

SELECT min(_2DOSE) as MIN
FROM dimassql.covid19vaccination;

SELECT max(_2DOSE) as MAX 
FROM dimassql.covid19vaccination;
#-------------------#

#--- Percentage _1DOSE ---#
SELECT _1DOSE, POPULATION,
	  COUNT(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as COUNT
FROM dimassql.covid19vaccination;

SELECT _1DOSE, POPULATION,
	  AVG(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as AVG
FROM dimassql.covid19vaccination;

SELECT _1DOSE, POPULATION, 
	  std(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as STD
FROM dimassql.covid19vaccination;

SELECT _1DOSE, POPULATION, 
	  min(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as MIN
FROM dimassql.covid19vaccination;

SELECT _1DOSE, POPULATION,
	   max(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as MAX 
FROM dimassql.covid19vaccination;
#-------------------------#

#--- Percentage _2DOSE ---#
SELECT _2DOSE, POPULATION,
	  COUNT(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as COUNT
FROM dimassql.covid19vaccination;

SELECT _2DOSE, POPULATION,
	  AVG(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as AVG
FROM dimassql.covid19vaccination;

SELECT _2DOSE, POPULATION, 
	  std(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as STD
FROM dimassql.covid19vaccination;

SELECT _2DOSE, POPULATION, 
	  min(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as MIN
FROM dimassql.covid19vaccination;

SELECT _2DOSE, POPULATION,
	   max(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as MAX 
FROM dimassql.covid19vaccination;
#-------------------------#
#----------------------#

#--- Vaccination Rates by City ---#
#--- Vaccination Rates by City (1st Dose) ---#
SELECT ID, CITY, _1DOSE, _TOTAL, POPULATION, 
       ROUND(_1DOSE * 100.0 / POPULATION, 1) AS 1_dose_perc
FROM dimassql.covid19vaccination
#WHERE 
ORDER BY ID, 1_dose_perc DESC;
#--------------------------------------------#

#--- Vaccination Rates by City (2nd Dose) ---#
SELECT ID, CITY, _2DOSE, _TOTAL, POPULATION, 
       ROUND(_2DOSE * 100.0 / POPULATION, 1) AS 2_dose_perc
FROM dimassql.covid19vaccination
#WHERE 
ORDER BY 2_dose_perc DESC;
#--------------------------------------------#
#---------------------------------#

#--- Join Data ---#
SELECT ID, CITY, _1DOSE, _2DOSE, _TOTAL, POPULATION, 
       ROUND(_1DOSE * 100.0 / POPULATION, 1) AS 1_dose_perc,
       ROUND(_2DOSE * 100.0 / POPULATION, 1) AS 2_dose_perc
FROM dimassql.covid19vaccination
ORDER BY CITY, _1DOSE, 1_dose_perc, 2_dose_perc;
#-----------------#

#--- Join w/"UNION" Statistic Data ---#
SELECT COUNT(POPULATION) as COUNT, 
	   AVG(POPULATION) as AVG, 
       std(POPULATION) as STD, 
       min(POPULATION) as MIN, 
       max(POPULATION) as MAX 
FROM dimassql.covid19vaccination
UNION
SELECT COUNT(_1DOSE) as COUNT, 
	   AVG(_1DOSE) as AVG, 
       std(_1DOSE) as STD, 
       min(_1DOSE) as MIN, 
       max(_1DOSE) as MAX 
FROM dimassql.covid19vaccination
UNION
SELECT COUNT(_2DOSE) as COUNT, 
	   AVG(_2DOSE) as AVG , 
       std(_2DOSE) as STD, 
       min(_2DOSE) as MIN, 
       max(_2DOSE) as MAX 
FROM dimassql.covid19vaccination
UNION
SELECT 
	  COUNT(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as COUNT,
	  AVG(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as AVG, 
	  std(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as STD,
	  min(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as MIN,
	  max(ROUND(_1DOSE * 100.0 / POPULATION, 1)) as MAX 
FROM dimassql.covid19vaccination
UNION
SELECT 
	   COUNT(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as COUNT, 
       AVG(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as AVG,
	   std(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as STD, 
       min(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as MIN,
	   max(ROUND(_2DOSE * 100.0 / POPULATION, 1)) as MAX 
FROM dimassql.covid19vaccination;
#---------------------------#