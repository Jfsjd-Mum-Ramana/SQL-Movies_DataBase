create table ACTOR(
Act_id int primary key,
Act_Name varchar(100),
Act_Gender char(1) check(Act_Gender in('M','F'))
);

create table DIRECTOR(
Dir_id int primary key,
Dir_name varchar(200) not null,
Dir_Phone numeric unique);

create table MOVIES(
Mov_id int primary key,
Mov_Title varchar(100),
Mov_Year numeric,
Mov_Lang varchar(20),
Dir_id int,
FOREIGN KEY (Dir_id) REFERENCES DIRECTOR(Dir_id)
);

create table MOVIE_CAST(
Act_id int,
Mov_id int,
FOREIGN KEY (Act_id) REFERENCES ACTOR(Act_id),
FOREIGN KEY (Mov_id) REFERENCES MOVIES(Mov_id),
Role varchar(200));

create table RATING(
Mov_id int,
FOREIGN KEY (Mov_id) REFERENCES MOVIES(Mov_id),
Rev_Stars numeric);


insert into ACTOR values
( 10 ,'Choodamani' ,'F'),
( 16 ,'Choodamani' ,'F'),
( 11 ,'SAI King' ,'M'),
( 12 ,'VINAY vatt' ,'M'),
( 13 ,'Prathyusha' ,'M'),
( 14 ,'Jaya' ,'F'),
( 15 , 'Ajju' , 'F');

INSERT INTO DIRECTOR VALUES
(20, 'Chandu', 123456789),
(21, 'Hitchcock', 234567891),
(22, 'abcd', 345678912),
(23, 'ramana', 456789123),
(24, 'Hitchcock', 534567891),
(28, 'Vinay', 236567891),
(26, 'Sai', 789456123),
(27, 'Hitchcock', 023456789);

INSERT INTO MOVIES VALUES
(01, 'RRR', 2022, 'Telugu', 20),
(02, 'KGF' , 2018 , 'KANNADA' , 21),
(03, 'PUSHPA' , 2021 , 'TELUGU' , 22),
(04, 'AJJU BHAI' ,2021 , 'ENGLISH' , 23),
(05,  'Chandan' , 2023 ,'MALAYALAM' , 24);

INSERT INTO movie_cast values
(10 , 01, 'HERO'),
(11 , 02, 'SIDE ACTOR'),
(12 , 03, 'COMEDIEAN'),
(13 , 04, 'HEROINE'),
(14 , 05, 'SIDE'),
(15 , 06, 'HERO'),
(13 , 04, 'HEROINE'),
(11 , 05, 'VILLAN'),
(13 , 06, 'Vilan2');

insert into rating values
(01, 10),
(03, 8),
(04, 9),
(02, 10),
(05, 9);

select Mov_Title from movies
 where Dir_id=22;
 
  
SELECT mov_title 
FROM movies 
WHERE mov_id IN (
SELECT mov_id 
FROM movie_cast 
WHERE act_id IN (
SELECT act_id 
FROM actor 
WHERE act_id IN (
SELECT act_id 
FROM movie_cast GROUP BY act_id 
HAVING COUNT(act_id)>2)));

SELECT Mov_Title  FROM movies
INNER JOIN actor
ON movies.mov_year = actor.Act_Name;

select act_name from Actor
where act_id in(select a.act_id 
from (select act_id from Movie_cast natural join Movies
where mov_year<2023)a 
inner join  (select act_id from Movie_cast natural join Movies 
where mov_year>2015)b on a.act_id=b.act_id);

SELECT mov_title, MAX(rev_stars)
FROM movies
INNER JOIN rating USING(mov_id)
GROUP BY mov_title 
HAVING MAX(rev_stars)>6
ORDER BY mov_title;

UPDATE RATING
SET REV_STARS=10
where mov_id in
(select mov_id from movies
where dir_id in
(select dir_id from director
where Dir_name='Ramana'));

USE movies;









