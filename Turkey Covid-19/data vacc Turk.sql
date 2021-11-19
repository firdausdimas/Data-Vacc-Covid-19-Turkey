
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
