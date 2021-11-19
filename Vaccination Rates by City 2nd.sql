#--- Vaccination Rates by City ---#
#--- Vaccination Rates by City (2nd Dose) ---#
SELECT ID, CITY, _2DOSE, _TOTAL, POPULATION, 
       ROUND(_2DOSE * 100.0 / POPULATION, 1) AS 2_dose_perc
FROM dimassql.covid19vaccination
ORDER BY 2_dose_perc DESC;
#--------------------------------------------#
#---------------------------------#