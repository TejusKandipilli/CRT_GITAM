-- SELECT
-- 1. Basic Movie Listing
Select  * from pt.movie_ratings

-- 2. Top 5 Highest Rated Movies
Select moviename,released_year from pt.movie_ratings order by rating desc LIMIT 5

-- 3. Movies by a specific actor
select * from pt.movie_ratings where director = 'S.S. Rajamouli'

-- 4. Movies Starring a Particular Actor
select * from pt.movie_ratings where actor = 'Nani'

-- 5. Movies released in last 5 years
select * from pt.movie_ratings where released_year >= 2020

-- 6. Search movies by keyword in review
select * from pt.movie_ratings where review like '%Mass%' or review like '%performances%'

-- 7. Average rating by actor (with minimum 2 movies)
select actor,avg(rating) from pt.movie_ratings group by actor having actor in  (select actor from pt.movie_ratings group by actor having count(*) >=2)

-- 8. Year wise movie statistics
select released_year,count(*),avg(rating) from pt.movie_ratings group by released_year order by avg(rating) desc

-- 9. Movies with rating between 4.5 and 5.0
select * from pt.movie_ratings where rating >= 4.5 and rating <= 5.0

-- 10. Full Movie Details with formatted output
select moviename, released_year,actor,director,rating from pt.movie_ratings

-- 11. Movies with long reviews
select * from pt.movie_ratings where length(review) > 50

-- 12. Count of movies by rating range
select 
CASE
	WHEN rating >= 4.5 THEN '4.5-5'
	WHEN rating >= 4.0 THEN '4-4.5'
	ELSE '<2.0'
END AS rating_group,
count(*)
from pt.movie_ratings group by rating_group order by rating_group desc

-- UPDATE
-- 1. Update rating for a specific movie
update pt.movie_ratings set rating = 5.0 where moviename = 'Baahubali: The Beginning'
select * from pt.movie_ratings where moviename = 'Baahubali: The Beginning'

--2. update review text
update pt.movie_ratings set review = 'Shit Movie' where moviename = 'Ala Vaikunthapurramuloo'
select * from pt.movie_ratings where moviename = 'Ala Vaikunthapurramuloo'

-- 3. Update multiple columns (Rating and Review)
update pt.movie_ratings set rating = 5.0, review = 'peak character study and the path of self destruction and love' where moviename = 'Arjun Reddy'
select * from pt.movie_ratings where moviename = 'Arjun Reddy'

-- 4. Conditional update
update pt.movie_ratings set review = 'shit' where rating = 4.3
select * from pt.movie_ratings where rating = 4.3

-- 5. Update director name for multiple movies
update pt.movie_ratings set director = 'Copy Master' where director = 'Trivikram Srinivas'
select * from pt.movie_ratings where director = 'Copy Master'

-- 8. Increment all ratings by 0.1 (Max 5.0)
update pt.movie_ratings set rating = LEAST(rating+0.1,5.0) 

-- 9. update with subquery (Movies below average rating)
update pt.movie_ratings set review = 'Below Average' where rating < (select avg(rating) from pt.movie_ratings)


-- ALTER
-- 1. Add a new column (Box Office Collection)
alter table pt.movie_ratings add column box_office NUMERIC(12,2)
select * from pt.movie_ratings

-- 2. Drop a column
alter table pt.movie_ratings drop column last_updated





















 