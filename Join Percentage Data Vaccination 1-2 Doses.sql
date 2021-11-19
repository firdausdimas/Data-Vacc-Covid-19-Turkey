#--- Join Percentage Data Vaccination ---#
SELECT ID, CITY, _1DOSE, _2DOSE, _TOTAL, POPULATION, 
       ROUND(_1DOSE * 100.0 / POPULATION, 1) AS 1_dose_perc,
       ROUND(_2DOSE * 100.0 / POPULATION, 1) AS 2_dose_perc
FROM dimassql.covid19vaccination
ORDER BY CITY, _1DOSE, 1_dose_perc, 2_dose_perc;
#----------------------------------------#