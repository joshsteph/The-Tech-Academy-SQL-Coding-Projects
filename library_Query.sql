/* Tech Academy Library Database Project */
USE master
GO
CREATE DATABASE db_library
GO
USE db_library
GO
CREATE SCHEMA Library;
GO
CREATE TABLE Library.LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY IDENTITY (1,1) NOT NULL, 
	BranchName varchar(50) NOT NULL,
	Address varchar(100) NOT NULL
	)
;

CREATE TABLE Library.PUBLISHER (
	PublisherName varchar(100) PRIMARY KEY NOT NULL, 
	Address varchar(100) NOT NULL,
	Phone varchar(30) NOT NULL
	)
;
CREATE TABLE Library.BOOKS (
	BookID INT PRIMARY KEY IDENTITY (1,1) NOT NULL, 
	Title varchar(200) NOT NULL,
	PublisherName varchar(100) FOREIGN KEY REFERENCES Library.PUBLISHER(PublisherName)
	)
;
CREATE TABLE Library.BOOK_AUTHORS (
	BookID INT FOREIGN KEY REFERENCES Library.BOOKS(BookID) NOT NULL, 
	AuthorName varchar(100) NOT NULL
	)
;
CREATE TABLE Library.BOOK_COPIES (
	BookID INT FOREIGN KEY REFERENCES Library.BOOKS(BookID) NOT NULL, 
	BranchID INT FOREIGN KEY REFERENCES Library.LIBRARY_BRANCH(BranchID) NOT NULL,
	Number_Of_Copies INT NOT NULL
	)
;
CREATE TABLE Library.BORROWER (
	CardNo INT PRIMARY KEY IDENTITY (100,1) NOT NULL, 
	Name varchar(100) NOT NULL,
	Address varchar(100) NOT NULL,
	Phone varchar (30) NOT NULL
	)
;
CREATE TABLE Library.BOOK_LOANS (
	BookID INT FOREIGN KEY REFERENCES Library.BOOKS(BookID) NOT NULL, 
	BranchID INT FOREIGN KEY REFERENCES Library.LIBRARY_BRANCH(BranchID) NOT NULL,
	CardNo INT FOREIGN KEY REFERENCES Library.BORROWER(CardNo) NOT NULL,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
	)
;
INSERT INTO Library.LIBRARY_BRANCH (BranchName,Address)
	VALUES 
	('Green Hills','1200 Levi Rd'),
	('Richmond','1009 Fifth Ave'),
	('Westover','281 Sellers Ln'),
	('Eastside','840 High St'),
	('Laurelhurst','2971 Beech Rd'),
	('Edgefield','111 Woodmont Blvd'),
	('Gill','1200 Gill St'),
	('Cherokee','511 Lawrence Branch Rd'),
	('Sharpstown','339 Elm St'),
	('Central','9008 W 21st Ave')
;
INSERT INTO Library.PUBLISHER (PublisherName, Address, Phone)
	VALUES
	('Chronicle Books',	'1221 Bridge Cr',	'212-333-4444'),
	('Orbit',	'220 Pacific St',	'442-244-4455'),
	('Hay House UK',	'13311 Gloucester Rd',	'698-566-9985'),
	('HMH Books For Young Readers',	'2365 Enron Park Blvd',	'890-773-4892'),
	('Minotaur Books',	'1111 Maze Pl',	'573-584-9382'),
	('Knopf',	'789 Nights Way',	'634-234-5464'),
	('Grand Central Publishing',	'212 Burnside',	'287-221-6574'),
	('DC Comics',	'443 Metropolis Pkwy',	'998-332-5883'),
	('Scribner',	'3332 Red Cedar Ridge ',	'574-355-8373'),
	('Vintage',	'7865 Crystal View Dr',	'736-334-6544'),
	('Black Sparrow Press',	'223 Oregon Ave',	'838-556-9282'),
	('Ecco',	'8887 Lost Hwy',	'773-837-8838')
;
INSERT INTO Library.BOOKS (Title, PublisherName)
	VALUES
	('It Does Not Have to Be Crazy at Work',	'Vintage'),
	('I Wish You More',	'Chronicle Books'),
	('The Last Wish: Introducing the Witcher',	'Orbit'),
	('Witch: Unleashed. Untamed. Unapologetic.',	'Hay House UK'),
	('Mouse Shapes',	'HMH Books for Young Readers'),
	('The Bitterroots: A Novel',	'Minotaur Books'),
	('There There: A novel',	'Knopf'),
	('Blood Orange',	'Grand Central Publishing'),
	('Mister Miracle',	'DC Comics'),
	('Elevation',	'Scribner'),
	('The Outsider: A Novel',	'Scribner'),
	('The Institute: A Novel',	'Scribner'),
	('The Sun Dog',	'Scribner'),
	('11/22/63: A Novel',	'Scribner'),
	('Killing Commendatore: A novel',	'Knopf'),
	('Colorless Tsukuru Tazaki and His Years of Pilgrimage','Vintage'),
	('Norwegian Wood',	'Vintage'),
	('Kafka on the Shore',	'Vintage'),
	('A Wild Sheep Chase: A Novel',	'Vintage'),
	('Men Without Women: Stories (Vintage International)',	'Vintage'),
	('Hard-Boiled Wonderland and the End of the World: A Novel (Vintage International)',	'Vintage'),
	('1Q84 (Vintage International)',	'Vintage'),
	('You Get So Alone at Times That It Just Makes Sense',	'Black Sparrow Press'),
	('Love is a Dog From Hell',	'Ecco'),
	('Ham on Rye: A Novel',	'Ecco'),
	('Women: A Novel',	'Ecco'),
	('The Lost Tribe',	'Chronicle Books ')
;


INSERT INTO Library.BOOK_AUTHORS 
	VALUES
	(1,	'Fried, Jason'),	
	(2,	'Rosenthal, Amy'),	
	(3,	'Sapkowski, Andrz'),	
	(4,	'Lister, Lisa'),	
	(5,	'Walsh, Ellen Stoll'),	
	(6,	'Box, C.J.'),	
	(7,	'Orange, Tommy'),	
	(8,'Tyce, Harriet'),	
	(9,'King, Tom'),	
	(10,'King, Stephen'),	
	(11,'King, Stephen'),	
	(12,'King, Stephen'),	
	(13,'King, Stephen'),	
	(14,'King, Stephen'),	
	(15,'Murakami, Haruki'),	
	(16,'Murakami, Haruki'),	
	(17,'Murakami, Haruki'),	
	(18,'Murakami, Haruki'),	
	(19,'Murakami, Haruki'),	
	(20,'Murakami, Haruki'),	
	(21,'Murakami, Haruki'),	
	(22,'Murakami, Haruki'),	
	(23,'Bukowski, Charles'),	
	(24,'Bukowski, Charles'),	
	(25,'Bukowski, Charles'),	
	(26,'Bukowski, Charles'),
	(27,'Reston, Ima')
;
INSERT INTO Library.BOOK_COPIES
	VALUES
	(1,	1,	5),
	(2,	1,	5),
	(3,	1,	5),
	(4,	1,	5),
	(5,	1,	5),
	(6,	1,	5),
	(7,	1,	5),
	(8,	1,	5),
	(9,	1,	5),
	(10,	1,	5),
	(11,	1,	5),
	(12,	1,	5),
	(13,	1,	5),
	(14,	1,	5),
	(15,	1,	5),
	(16,	1,	5),
	(17,	1,	5),
	(18,	1,	5),
	(19,	1,	5),
	(20,	1,	5),
	(21,	1,	5),
	(22,	1,	5),
	(23,	1,	5),
	(24,	1,	5),
	(25,	1,	5),
	(26,	1,	5),
	(27,	1,	5),
	(1,	2,	5),
	(2,	2,	5),
	(3,	2,	5),
	(4,	2,	5),
	(5,	2,	5),
	(6,	2,	5),
	(7,	2,	5),
	(8,	2,	5),
	(9,	2,	5),
	(10,	2,	5),
	(11,	2,	5),
	(12,	2,	5),
	(13,	2,	5),
	(14,	2,	5),
	(15,	2,	5),
	(16,	2,	5),
	(17,	2,	5),
	(18,	2,	5),
	(19,	2,	5),
	(20,	2,	5),
	(21,	2,	5),
	(22,	2,	5),
	(23,	2,	5),
	(24,	2,	5),
	(25,	2,	5),
	(26,	2,	5),
	(27,	2,	5),
	(1,	3,	5),
	(2,	3,	5),
	(3,	3,	5),
	(4,	3,	5),
	(5,	3,	5),
	(6,	3,	5),
	(7,	3,	5),
	(8,	3,	5),
	(9,	3,	5),
	(10,	3,	5),
	(11,	3,	5),
	(12,	3,	5),
	(13,	3,	5),
	(14,	3,	5),
	(15,	3,	5),
	(16,	3,	5),
	(17,	3,	5),
	(18,	3,	5),
	(19,	3,	5),
	(20,	3,	5),
	(21,	3,	5),
	(22,	3,	5),
	(23,	3,	5),
	(24,	3,	5),
	(25,	3,	5),
	(26,	3,	5),
	(27,	3,	5),
	(1,	4,	5),
	(2,	4,	5),
	(3,	4,	5),
	(4,	4,	5),
	(5,	4,	5),
	(6,	4,	5),
	(7,	4,	5),
	(8,	4,	5),
	(9,	4,	5),
	(10,	4,	5),
	(11,	4,	5),
	(12,	4,	5),
	(13,	4,	5),
	(14,	4,	5),
	(15,	4,	5),
	(16,	4,	5),
	(17,	4,	5),
	(18,	4,	5),
	(19,	4,	5),
	(20,	4,	5),
	(21,	4,	5),
	(22,	4,	5),
	(23,	4,	5),
	(24,	4,	5),
	(25,	4,	5),
	(26,	4,	5),
	(27,	4,	5),
	(1,	5,	5),
	(2,	5,	5),
	(3,	5,	5),
	(4,	5,	5),
	(5,	5,	5),
	(6,	5,	5),
	(7,	5,	5),
	(8,	5,	5),
	(9,	5,	5),
	(10,	5,	5),
	(11,	5,	5),
	(12,	5,	5),
	(13,	5,	5),
	(14,	5,	5),
	(15,	5,	5),
	(16,	5,	5),
	(17,	5,	5),
	(18,	5,	5),
	(19,	5,	5),
	(20,	5,	5),
	(21,	5,	5),
	(22,	5,	5),
	(23,	5,	5),
	(24,	5,	5),
	(25,	5,	5),
	(26,	5,	5),
	(27,	5,	5),
	(1,	6,	5),
	(2,	6,	5),
	(3,	6,	5),
	(4,	6,	5),
	(5,	6,	5),
	(6,	6,	5),
	(7,	6,	5),
	(8,	6,	5),
	(9,	6,	5),
	(10,	6,	5),
	(11,	6,	5),
	(12,	6,	5),
	(13,	6,	5),
	(14,	6,	5),
	(15,	6,	5),
	(16,	6,	5),
	(17,	6,	5),
	(18,	6,	5),
	(19,	6,	5),
	(20,	6,	5),
	(21,	6,	5),
	(22,	6,	5),
	(23,	6,	5),
	(24,	6,	5),
	(25,	6,	5),
	(26,	6,	5),
	(27,	6,	5),
	(1,	7,	5),
	(2,	7,	5),
	(3,	7,	5),
	(4,	7,	5),
	(5,	7,	5),
	(6,	7,	5),
	(7,	7,	5),
	(8,	7,	5),
	(9,	7,	5),
	(10,	7,	5),
	(11,	7,	5),
	(12,	7,	5),
	(13,	7,	5),
	(14,	7,	5),
	(15,	7,	5),
	(16,	7,	5),
	(17,	7,	5),
	(18,	7,	5),
	(19,	7,	5),
	(20,	7,	5),
	(21,	7,	5),
	(22,	7,	5),
	(23,	7,	5),
	(24,	7,	5),
	(25,	7,	5),
	(26,	7,	5),
	(27,	7,	5),
	(1,	8,	5),
	(2,	8,	5),
	(3,	8,	5),
	(4,	8,	5),
	(5,	8,	5),
	(6,	8,	5),
	(7,	8,	5),
	(8,	8,	5),
	(9,	8,	5),
	(10,	8,	5),
	(11,	8,	5),
	(12,	8,	5),
	(13,	8,	5),
	(14,	8,	5),
	(15,	8,	5),
	(16,	8,	5),
	(17,	8,	5),
	(18,	8,	5),
	(19,	8,	5),
	(20,	8,	5),
	(21,	8,	5),
	(22,	8,	5),
	(23,	8,	5),
	(24,	8,	5),
	(25,	8,	5),
	(26,	8,	5),
	(27,	8,	5),
	(1,	9,	5),
	(2,	9,	5),
	(3,	9,	5),
	(4,	9,	5),
	(5,	9,	5),
	(6,	9,	5),
	(7,	9,	5),
	(8,	9,	5),
	(9,	9,	5),
	(10,	9,	5),
	(11,	9,	5),
	(12,	9,	5),
	(13,	9,	5),
	(14,	9,	5),
	(15,	9,	5),
	(16,	9,	5),
	(17,	9,	5),
	(18,	9,	5),
	(19,	9,	5),
	(20,	9,	5),
	(21,	9,	5),
	(22,	9,	5),
	(23,	9,	5),
	(24,	9,	5),
	(25,	9,	5),
	(26,	9,	5),
	(27,	9,	5),
	(1,	10,	5),
	(2,	10,	5),
	(3,	10,	5),
	(4,	10,	5),
	(5,	10,	5),
	(6,	10,	5),
	(7,	10,	5),
	(8,	10,	5),
	(9,	10,	5),
	(10,	10,	5),
	(11,	10,	5),
	(12,	10,	5),
	(13,	10,	5),
	(14,	10,	5),
	(15,	10,	5),
	(16,	10,	5),
	(17,	10,	5),
	(18,	10,	5),
	(19,	10,	5),
	(20,	10,	5),
	(21,	10,	5),
	(22,	10,	5),
	(23,	10,	5),
	(24,	10,	5),
	(25,	10,	5),
	(26,	10,	5),
	(27,	10,	5)
;
INSERT INTO Library.BORROWER (Name,Address,Phone)
	VALUES
	('Bill Basket','131 Porch Ln','389-684-7054'),
	('Cindy Weatherhoof','442 Ace Campbell St','764-389-6444'),
	('Margaret Breathworst','155 Beech Rd','684-677-3333'),
	('George Thinkle','532 Oak St','959-333-2222'),
	('Peggy Burkton','593 Ricellon Blvd','696-775-3325'),
	('Cal Fondue','521 Vernon Rd','776-336-7754'),
	('Terry Pinkerton','3559 Minerva Ave','865-443-2252'),
	('Sid Dressler','362 Soapbox Rd','664-336-3367')
;

INSERT INTO Library.BOOK_LOANS
	VALUES
	(1,1,100,'2019-03-01','2019-03-14'),
	(2,1,100,'2019-03-01','2019-03-14'),
	(3,1,100,'2019-03-01','2019-03-14'),
	(4,1,100,'2019-03-01','2019-03-14'),
	(5,1,100,'2019-03-01','2019-03-14'),
	(6,1,100,'2019-03-01','2019-03-14'),
	(7,2,101,'2019-03-01','2019-03-14'),
	(8,2,101,'2019-03-01','2019-03-14'),
	(9,2,101,'2019-03-01','2019-03-14'),
	(10,2,101,'2019-03-01','2019-03-14'),
	(11,2,101,'2019-03-01','2019-03-14'),
	(12,2,101,'2019-03-01','2019-03-14'),
	(13,3,102,'2019-03-01','2019-03-14'),
	(14,3,102,'2019-03-01','2019-03-14'),
	(15,3,102,'2019-03-01','2019-03-14'),
	(16,3,102,'2019-03-01','2019-03-14'),
	(17,3,102,'2019-03-01','2019-03-14'),
	(18,3,102,'2019-03-01','2019-03-14'),
	(19,4,103,'2019-03-01','2019-03-14'),
	(20,4,103,'2019-03-01','2019-03-14'),
	(21,4,103,'2019-03-01','2019-03-14'),
	(22,4,103,'2019-03-01','2019-03-14'),
	(23,5,106,'2019-03-01','2019-03-14'),
	(24,5,106,'2019-03-01','2019-03-14'),
	(25,4,106,'2019-03-01','2019-03-14'),
	(26,4,106,'2019-03-01','2019-03-14'),
	(27,4,106,'2019-03-01','2019-03-14'),
	(1,6,105,'2019-03-01','2019-03-14'),
	(2,6,107,'2019-03-01','2019-03-14'),
	(3,6,105,'2019-03-01','2019-03-14'),
	(4,7,105,'2019-03-01','2019-03-14'),
	(5,7,105,'2019-03-01','2019-03-14'),
	(6,7,106,'2019-03-01','2019-03-14'),
	(7,7,106,'2019-03-01','2019-03-14'),
	(8,1,106,'2019-03-01','2019-03-14'),
	(9,1,106,'2019-03-01','2019-03-14'),
	(10,1,107,'2019-03-01','2019-03-14'),
	(11,1,107,'2019-03-01','2019-03-14'),
	(12,4,107,'2019-03-01','2019-03-14'),
	(13,4,107,'2019-03-01','2019-03-14'),
	(14,4,107,'2019-03-01','2019-03-14'),
	(15,8,100,'2019-01-01','2019-01-14'),
	(16,8,100,'2019-01-01','2019-01-14'),
	(17,8,102,'2019-01-01','2019-01-14'),
	(18,10,103,'2019-01-01','2019-01-14'),
	(19,8,105,'2019-01-01','2019-01-14'),
	(20,10,107,'2019-01-01','2019-01-14'),
	(21,10,100,'2019-01-01','2019-01-14'),
	(22,8,100,'2019-01-01','2019-01-14'),
	(23,10,102,'2019-01-01','2019-01-14'),
	(24,9,103,'2019-01-01','2019-01-14'),
	(25,2,105,'2019-01-01','2019-01-14'),
	(26,3,107,'2019-01-01','2019-01-14'),
	(27,9,101,'2019-01-01','2019-01-14')
;



/*Stored Procedure 1 */

USE db_library
GO
CREATE PROC usp_getLOSTsharp
AS
SELECT BranchName, Title, Number_of_Copies
FROM Library.BOOK_COPIES
JOIN Library.BOOKS 
ON BOOK_COPIES.BookID = BOOKS.BookID
JOIN Library.LIBRARY_BRANCH
ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE BranchName = 'Sharpstown'
AND Title = 'The Lost Tribe';

GO

/*Stored Procedure 2 */

CREATE PROC usp_getLOSTall
AS
SELECT BranchName, Title, Number_of_Copies
FROM Library.BOOK_COPIES
JOIN Library.BOOKS 
ON BOOK_COPIES.BookID = BOOKS.BookID
JOIN Library.LIBRARY_BRANCH
ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE Title = 'The Lost Tribe';

GO
/*Stored Procedure 3 */

CREATE PROC usp_getNONEcheckedOUT
AS
SELECT Name
FROM Library.BORROWER
LEFT JOIN Library.BOOK_LOANS
ON BOOK_LOANS.CardNo = BORROWER.CardNo
WHERE BOOK_LOANS.CardNo IS NULL;

GO
/*Stored Procedure 4 */

CREATE PROC usp_getPASTdueSHARPSTOWN
AS
DECLARE @date1 as DATE
SET @date1 = GetDate()
SELECT Title,Name,BORROWER.Address, DateDue 
FROM Library.BORROWER
JOIN Library.BOOK_LOANS
ON BORROWER.CardNo = BOOK_LOANS.CardNo
JOIN Library.BOOKS
ON BOOK_LOANS.BookID = BOOKS.BookID
JOIN Library.LIBRARY_BRANCH 
ON BOOK_LOANS.BranchID = LIBRARY_BRANCH.BranchID
WHERE BOOK_LOANS.DateDue <= @date1
AND BranchName = 'Sharpstown';

GO
/*Stored Procedure 5 */

CREATE PROC usp_getBOOKloansBYbranch
AS
SELECT Library.LIBRARY_BRANCH.BranchName, COUNT(BOOK_LOANS.BranchID) AS "Number of Book Loans"
FROM Library.BOOK_LOANS
LEFT JOIN Library.LIBRARY_BRANCH
ON BOOK_LOANS.BranchID= LIBRARY_BRANCH.BranchID
GROUP BY BranchName;

GO
/*Stored Procedure 6 */

CREATE PROC usp_get5booksORmore
AS
SELECT Library.BORROWER.Name,Address, COUNT(BOOK_LOANS.CardNo) AS "Number of Books Checked Out"
FROM (Library.BOOK_LOANS
INNER JOIN Library.BORROWER
ON BOOK_LOANS.CardNo = BORROWER.CardNo)
GROUP BY Name, Address
HAVING COUNT(BOOK_LOANS.CardNo) >5;

GO
/*Stored Procedure 7 */

CREATE PROC usp_getKINGtitlesCENTRAL
AS
SELECT Title, Number_of_Copies
FROM Library.BOOKS
JOIN Library.BOOK_AUTHORS
ON BOOKS.BookID = BOOK_AUTHORS.BookID
JOIN Library.BOOK_COPIES
ON BOOKS.BookID = BOOK_COPIES.BookID
INNER JOIN Library.LIBRARY_BRANCH
ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
WHERE AuthorName = 'King, Stephen' AND BranchName = 'Central';