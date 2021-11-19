#--- Vaccination Rates by City ---#
#--- Vaccination Rates by City (1st Dose) ---#
SELECT ID, CITY, _1DOSE, _TOTAL, POPULATION, 
       ROUND(_1DOSE * 100.0 / POPULATION, 1) AS 1_dose_perc
FROM dimassql.covid19vaccination
ORDER BY ID, 1_dose_perc DESC;
#--------------------------------------------#
#---------------------------------#