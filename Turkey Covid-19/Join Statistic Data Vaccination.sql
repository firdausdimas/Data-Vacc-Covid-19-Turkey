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