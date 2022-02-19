--1. How many rows are in the data_analyst_jobs table?--
--1a. 1793 rows--
select count(*)
from data_analyst_jobs

--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?--
--2a. 
Select *
from data_analyst_jobs
limit 10;

--3.How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?--
--3a. 21 postings--
--3b. 27 postings--

select count(title)
from data_analyst_jobs
where location in ('TN')

select count(title)
from data_analyst_jobs
where location in ('TN','KY')

--4. How many postings in Tennessee have a star rating above 4?--
--4a. 3 postings--
select count(*)
from data_analyst_jobs
where location = 'TN'
AND star_rating > 4;

--5. How many postings in the dataset have a review count between 500 and 1000?--
--5a. 151 postings--
Select count(title)
From data_analyst_jobs
Where review_count between '500' and '1000'

/*6.Show the average star rating for companies in each state. 
The output should show the state as state and the average rating for 
the state as avg_rating. Which state shows the highest average rating?*/
--6. NE--

Select location as state, AVG(star_rating) as avg_rating
From data_analyst_jobs
group by location 
order by avg_rating desc;

--7.Select unique job titles from the data_analyst_jobs table. How many are there?--
--7a. 881--

select distinct(title)
from data_analyst_jobs
order by title

--8. How many unique job titles are there for California companies?--
--8a. 230--

Select distinct (title)
from data_analyst_jobs
Where location = 'CA'

/*9. Find the name of each company and its average star rating for all companies that 
have more than 5000 reviews across all locations. How many companies are there with more 
that 5000 reviews across all locations?*/
--9. 40 companies. 41 if you count the null'd company--

Select company, avg(star_rating) as avg_rating
From data_analyst_jobs
Where review_count > 5000 and company is not null
group by company

/*10. Add the code to order the query in #9 from highest to lowest average star rating.
Which company with more than 5000 reviews across all locations in the dataset
has the highest star rating? What is that rating?*/
--10a. I got Meijer, Microsoft, Nordstrom, Cognizant etc.  I also got Unilever when I didn't do a round average.--

Select company, avg(star_rating) as avg_rating
From data_analyst_jobs
Where review_count > 5000 and company is not null
group by company
order by avg_rating desc;

--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? --
--11a. 1636 job titles--

Select count(title)
From data_analyst_jobs
Where title like '%Analyst%'

/*12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?*/
--12a. 4 job titles--

Select count(title)
From data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' AND title NOT LIKE UPPER('%Analyst%') AND title NOT LIKE LOWER('%Analyst%') AND title NOT LIKE '%Analytics%' AND title NOT LIKE UPPER('%Analytics%') AND title NOT LIKE LOWER('%Analytics%');


--Bonus--

/*You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
*Disregard any postings where the domain is NULL.
*Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
*Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?*/

--Bonus answer: Internet and Software, Banks and Financial Services, Consulting and Business Services, and Health Care
--How many jobs have been listed for more than 3 weeks of the top 4?: 232--

Select domain, count(domain) as count_older_than_3_weeks
From data_analyst_jobs
Where skill like '%SQL%' AND
 days_since_posting > 21
 and domain is not null
 group by domain
 order by count_older_than_3_weeks desc;


Select count (days_since_posting) as count_older_than_3_weeks
From data_analyst_jobs
Where skill like '%SQL%' AND days_since_posting > 21
  and domain is not null
 and domain in ('Internet and Software', 'Banks and Financial Services', 'Consulting and Business Services', 'Health Care')
 order by count_older_than_3_weeks desc



