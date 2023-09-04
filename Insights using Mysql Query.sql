USE JOB_ANALYSIS;

SELECT * FROM COMPANY;
SELECT * FROM JOBS;
SELECT * FROM DETAILS;


# (1) Comparison of number of jobs across different cities for different level 
SELECT location AS City,designation AS Job_Level,COUNT(*) AS Number_Of_Jobs
FROM
jobs 
GROUP BY 1,2
ORDER BY 1,2;

#(2)Generate some insight with respect to number of jobs distribution across various industry,
#give top_10 highest job generated sectors
Select sectors,count(*) as number_of_jobs
from jobs
group by 1
order by 2 desc
limit 10;


# (3) For instance, what is the total number of jobs in Software Industry as compared to Marketing
SELECT CASE
WHEN designation LIKE '%Software%' THEN 'Software Industry'
WHEN designation LIKE '%Marketing%' THEN 'Marketing Industry'
END AS Industry,
COUNT(*) AS Number_Of_Jobs
FROM
jobs
WHERE designation LIKE '%Software%' OR designation LIKE '%Marketing%'
GROUP BY Industry;





# (4)Generate insights into number of opening with respect to the current employee count - Number of opening in a 
# company with more than 1000 employees in comparison to number of openings in a company with 100 employees
# 'More than 1000 employees', '50 - 200 employees'
SELECT CASE
WHEN employees_counts = 'More than 1000 employees' THEN 'More than 1000 employees'
WHEN employees_counts = '50 - 200 employees' THEN '50 - 200 employees'
Else 'others'
END AS EmployeeCategory,
count(*) as number_of_opening
FROM
company
group by EmployeeCategory;




#(5) Give top_10 highest job generated locations
SELECT location AS City,COUNT(*) AS Number_Of_jobs
FROM
jobs
GROUP BY 1
ORDER BY 2 desc
limit 10;





#(6)Count the number of jobs across different designation across different locations. 
SELECT location,designation,COUNT(*) AS Number_Of_Jobs
FROM
jobs
GROUP BY 1,2
ORDER BY 1,2;



#(7) count the number of jobs across different locations with in different sectors
SELECT location,sectors,COUNT(*) AS Number_Of_Jobs
FROM
jobs
GROUP BY 1,2
ORDER BY 1,2;





#(8) For instance, how many Frontend Engineer jobs are there in Bangalore as 
#compared to Data Analytics jobs in Bangalore, 
SELECT location,designation,COUNT(*) AS NumberOfJobs
FROM
jobs
WHERE (designation = 'Frontend Engineer' OR designation = 'Data Analytics') AND location = 'Bangalore'
GROUP BY 1,2;




# (9) how many Data Analytics jobs are there in Bangalore as compared to number of Data Scientists job in Gurgaon 
SELECT location,sectors,COUNT(*) AS Number_Of_Jobs
FROM
jobs
WHERE (sectors = 'Data Analyst' AND location = 'Bangalore') AND (sectors = 'Data Scientist' AND location = 'Gurgaon')
GROUP BY 1,2;




#(10) Find the companies size 
SELECT Employees_counts as Company_size,count(company_id) as number_of_companies 
FROM COMPANY
group by 1
order by 2 desc
limit 6;
