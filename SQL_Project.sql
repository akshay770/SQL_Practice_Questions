CREATE DATABASE baguu;
USE baguu;

CREATE TABLE Actor(
    act_id int PRIMARY KEY,
    act_fname char(20),
    act_Iname char(20),
    act_gender char(1)
);

CREATE TABLE director(
   dir_id INT PRIMARY KEY,
   dir_fname char(20),
   dir_Iname char(20)
);


CREATE TABLE movie(
   mov_id int PRIMARY KEY,
   mov_title char(50),
   mov_year int,
   mov_time int,
   mov_lang char(50),
   mov_dt_rel date,
   mov_rel_country char(50)
 );
 
 SELECT mov_title, mov_year FROM movie;
 
CREATE TABLE reviewer(
   rev_id int PRIMARY KEY,
   rev_name char(50)
);

 
 CREATE TABLE genres(
    gen_id INT PRIMARY KEY,
    gen_title char(20)
 );
 

  
CREATE TABLE movie_cast(
   act_id int,
   mov_id int,
   role char(30),
   FOREIGN KEY (act_id) REFERENCES Actor(act_id),
   FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);



CREATE TABLE movie_direction(
  dir_id int,
  mov_id int,
  FOREIGN KEY (dir_id) REFERENCES director(dir_id),
  FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);



 CREATE TABLE movie_genres(
    mov_id int,
    gen_id int,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
 );
 

 
 CREATE TABLE rating(
	mov_id int,
    rev_id int,
    rev_stars int,
    num_o_ratings int,
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)    
 );
 
SELECT * FROM baguu.Actor;
SELECT * FROM baguu.genres;
SELECT * FROM baguu.director;
SELECT * FROM baguu.movie;
SELECT * FROM baguu.movie_genres;
SELECT * FROM baguu.movie_direction;
SELECT * FROM baguu.reviewer;
SELECT * FROM baguu.rating;
SELECT * FROM baguu.movie_cast;  


SELECT mov_title, mov_year
FROM movie;


SELECT mov_year
FROM movie
WHERE mov_title = 'American Beauty';

SELECT mov_title
FROM movie
WHERE mov_year = 1999;

SELECT mov_title
FROM movie
WHERE mov_year < 1998;

SELECT reviewer.rev_name
FROM reviewer
UNION
SELECT movie.mov_title
FROM movie;

SELECT reviewer.rev_name
FROM reviewer, rating
WHERE rating.rev_id = reviewer.rev_id
AND rating.rev_stars >= 7 
AND reviewer.rev_name IS NOT NULL;

SELECT mov_title
FROM movie
WHERE mov_id NOT IN (
    -- Subquery: Selecting 'mov_id' from the 'rating' table
    SELECT mov_id 
    FROM rating
);


SELECT mov_title
FROM movie
WHERE mov_id IN (905, 907, 917);

SELECT mov_id, mov_title, mov_year
FROM movie
WHERE mov_title LIKE '%Boogie%Nights%'
ORDER BY mov_year ASC;

SELECT act_id
FROM Actor 
WHERE act_fname='Woody' 
AND act_Iname='Allen';