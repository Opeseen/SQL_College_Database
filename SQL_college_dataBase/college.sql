-- (SECTION A)
-- CREATING A SCHEMA NAMED COLLEGE
-- CREATE SCHEMA college;

-- NOW..WORKING INSIDE THE SCHEMA CRREATED
USE college;

-- SECTION B
-- CREATE TABLE
-- FIRST TABLE
CREATE TABLE class_one(
ID	SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
Last_name VARCHAR(20),
First_name VARCHAR(20),
Gender CHAR(10) NOT NULL,
Assignment_score TINYINT UNSIGNED,
Test_score TINYINT UNSIGNED,
Exam_score TINYINT UNSIGNED,
PRIMARY KEY (ID),
CHECK (Test_score <= 25 ),
CHECK (Assignment_score <= 15),
CHECK (Exam_score <= 60)
);

/* INSERTING VALUES INTO THE RESPECTIVE COLUMNS OF
   THE CLASS_ONE TABLE CREATED..
*/
INSERT INTO class_one
(ID,First_name,Last_name,Gender,Assignment_score,Test_score,Exam_score)
VALUES
	(1,'murphy','cole','male',11,18,50),
	(2,'mary','johnson','female',13, 22, 49),
    (3,'williams','smith','male',15,22,55),
    (4,'jenifer','brown','female',11,23,40),
    (5,'john','raymond','male',5,11,22),
    (6,'micheal','shaft','male',15,22,55),
    (7,'solomon','james','male',11,15,50),
    (8,'tosin','mariam','female',15,25,53),
    (9,'kenneth','daniel','male',11,24,59),
    (10,'mariam','grace','female',15,23,55),
    (11,'yisa','anderson','female',13,21,48),
    (12,'jenifer','davis','female',14,23,32),
    (13,'taylor','scot','male',11,9,53),
    (14,'jessica','hall','female',14,22,47),
    (15,'angel','green','female',14,23,57);
    
-- Adding a new column in class_one TABLE "Total_score"...
ALTER table class_one
ADD Total_score TINYINT UNSIGNED
CHECK (Total_score <= 100);

-- checking if the new column has been included..
SELECT * from class_one;

-- Updating the TotalScore column
UPDATE class_one
SET Total_score = Assignment_score + Test_score + Exam_score
WHERE id > 0;

-- Checking if TotalScore has been updated..
SELECT * FROM class_one;
    
-- SECOND TABLE
-- CREATING ANOTHER TABLE INSDE THE SCHEMA AND NAME IT AS CLASS_TWO..
CREATE TABLE class_two(
ID	SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
Last_name VARCHAR(20),
First_name VARCHAR(20),
Gender CHAR(10) NOT NULL,
Assignment_score TINYINT UNSIGNED,
Test_score TINYINT UNSIGNED,
Exam_score TINYINT UNSIGNED,
Total_score TINYINT UNSIGNED NULL,
PRIMARY KEY (ID),
CHECK (Test_score <= 25 ),
CHECK (Assignment_score <= 15),
CHECK (Exam_score <= 60),
CHECK (Total_score <= 100)
);

/* INSERTING VALUES INTO THE RESPECTIVE COLUMNS OF
   THE CLASS_TWO TABLE CREATED..
*/
INSERT INTO class_two
(ID,First_name,Last_name,Gender,Assignment_score,Test_score,Exam_score)
VALUES
	(1,'cynthia','young','female',12,15,40),
	(2,'mariam','john','female',10, 12, 29),
    (3,'john','smitthen','male',14,23,56),
    (4,'jemmy','brown','female',13,21,49),
    (5,'johnson','ray','male',6,12,52),
    (6,'micheal','andrew','male',15,22,55),
    (7,'collins','james','male',13,15,48),
    (8,'victory','mariam','female',11,15,33),
    (9,'kenneth','moses','male',13,21,49),
    (10,'victoria','cole','female',15,23,55),
    (11,'yisa','anderson','female',9,12,28),
    (12,'david','jenifer','male',13,23,42),
    (13,'micheal','taylor','male',11,9,33),
    (14,'kattie','hall','female',12,22,57),
    (15,'queen','wemmy','female',14,23,47);

-- Updating the class_two TotalScore column
UPDATE class_two
SET Total_score = Assignment_score + Test_score + Exam_score
WHERE id > 0;

-- Selecting the first FIVE(5) rows...
SELECT * from class_two
LIMIT 5;

-- THIRD TABLE
-- CREATING ANOTHER TABLE INSDE THE SCHEMA AND NAME IT AS CLASS_THREE..
CREATE TABLE class_three(
ID	SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
Last_name VARCHAR(20),
First_name VARCHAR(20),
Gender CHAR(10) NOT NULL,
Assignment_score TINYINT UNSIGNED,
Test_score TINYINT UNSIGNED,
Exam_score TINYINT UNSIGNED,
Total_score TINYINT UNSIGNED NULL,
PRIMARY KEY (ID),
CHECK (Test_score <= 25 ),
CHECK (Assignment_score <= 15),
CHECK (Exam_score <= 60),
CHECK (Total_score <= 100)
);

/* INSERTING VALUES INTO THE RESPECTIVE COLUMNS OF
   THE CLASS_THREE TABLE CREATED..
*/
INSERT INTO class_three
(ID,First_name,Last_name,Gender,Assignment_score,Test_score,Exam_score)
VALUES
	(1,'mellisa','king','female',2,5,10),
	(2,'sharon','hall','female',6, 9, 37),
    (3,'philip','frances','male',13,13,46),
    (4,'stephen','amanda','male',11,21,41),
    (5,'parker','nelson','male',12,23,42),
    (6,'wood','lori','male',11,23,56),
    (7,'bond','james','male',14,25,38),
    (8,'theresa','watson','female',7,12,43),
    (9,'prince','kelly','male',10,24,48),
    (10,'princess','cole','female',13,12,50),
    (11,'rachel','barnes','female',4,8,18),
    (12,'paul','foster','male',11,21,52),
    (13,'annie','russell','female',11,19,43),
    (14,'diana','alexander','female',12,22,47),
    (15,'simon','philip','male',10,23,37);

-- Updating the class_three TotalScore column
UPDATE class_three
SET Total_score = Assignment_score + Test_score + Exam_score
WHERE id > 0;

-- Selecting the first FIVE(5) Rows..
SELECT * from class_three
LIMIT 5;

-- SECTION C
-- Selecting Maximum total_score from class_one..
SELECT max(total_score) as Maximum_score
FROM class_one;

-- Selecting Minimum totaL_score from class_one..
SELECT min(total_score) as Minimum_score
FROM class_one;

-- Slicing and Selecting Minimum TotalScore from class_one using SUBQUERIES..
SELECT Last_name, First_name, Gender, Total_score 
FROM class_one
WHERE total_score = (SELECT min(total_score) as Minimum_score
FROM class_one);

-- Slicing and Selecting Maximum TotalScore from class_one using SUBQUERIES..
SELECT Last_name, First_name, Gender, Total_score 
FROM class_one
WHERE total_score = (SELECT max(total_score) as Maximum_score
FROM class_one);

-- Using SQL Case Statement to Grade Score..
SELECT last_name, first_name, total_Score,
CASE
WHEN total_score <= 50 THEN 'D'
WHEN total_score BETWEEN 50 AND 59 THEN 'C'
WHEN total_score BETWEEN 60 AND 69 THEN 'B'
WHEN total_score BETWEEN 70 AND 75 THEN 'A'
ELSE 'A+'
END Grade
FROM class_one;

-- Counting the Total Occurrence of each Grade from "class_one"
SELECT count(*) as Grade_count,
CASE
WHEN total_score <= 50 THEN 'D'
WHEN total_score BETWEEN 50 AND 59 THEN 'C'
WHEN total_score BETWEEN 60 AND 69 THEN 'B'
WHEN total_score BETWEEN 70 AND 75 THEN 'A'
ELSE 'A+'
END Grade
FROM class_one
GROUP BY CASE
WHEN total_score <= 50 THEN 'D'
WHEN total_score BETWEEN 50 AND 59 THEN 'C'
WHEN total_score BETWEEN 60 AND 69 THEN 'B'
WHEN total_score BETWEEN 70 AND 75 THEN 'A'
ELSE 'A+'
END;

-- (SECTION D)
-- JOINING TABLES ----
-- JOINING class_one AND class_two together...
SELECT c1.id, c1.last_name, c1.first_name, c1.total_score AS Class_one_total_score, 
 c2.id, c2.last_name, c2.first_name, c2.total_score AS Class_two_total_score
FROM class_one AS c1
JOIN class_two AS c2 
ON c1.id = c2.id
LIMIT 7;