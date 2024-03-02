
/* TO CREATE A NEW DATABASE*/

CREATE DATABASE libary_DB;

/* TO SEE ALL DATEBASES IN THE SCHEMA*/

SHOW DATABASES;

/* TO START WORKING THERE IS NEED TO SPECIFY WHICH DATABASE TO WORK WITH*/

USE libary_DB;

/* TO CREATE READERS TABLE AND ITS ATTRIBUTES*/

CREATE TABLE readers (
			readers_id VARCHAR (10),
			first_name VARCHAR (30),
			middle_name VARCHAR (30),
			last_name VARCHAR (15),
			city VARCHAR (20),
			phone_no VARCHAR (12),
			occupation VARCHAR (12),
			date_birth DATE,
CONSTRAINT readers_pk PRIMARY KEY (readers_id));

SHOW TABLES;

/* TO INSERT THE ATTRIBUTES EACH FIELDS*/

INSERT INTO readers VALUES ('N0001', 'Joseph', 'Brown', 'Taiye', 'Festac', '90772486900', 'Coach', '1997-2-10'),
							('N0002', 'Joan', 'Wealth', 'White', 'Victoria Island', '90322486902', 'Engineer', '2000-02-10'),
							('N0003', 'Benjamin', 'Femi', 'Alex', 'Yaba', '90778653401', 'Doctor', '1999-12-09'),
							('N0004', 'Mariam', 'Bisi', 'Obinwa', 'Epe', '70217248690', 'Nurse', '2001-11-08'),
							('N0005', 'Rechael', 'Ada', 'Obi', 'Akoka', '8014248651', 'Nurse', '2002-04-08'),
							('N0006', 'John', Null, 'Tolu', 'Agege', '80772484521', 'Lecturer', '1986-01-12'),
							('N0007', 'Honesty', Null, 'Femi', 'Ikeja', '70528096411', 'Researcher', '2002-03-03'),
							('N0008', 'Salim', Null, 'Brokley', 'Sabo', '8137248652', 'Consultant', '1989-07-07'),
							('N0009', 'Kate', Null, 'Adam', 'Shomolu', '7059240020', 'Marketer', '1994-10-10'),
							('N0010', 'Sharon', 'Believe', 'Peter', 'Obalende', '91872116974', 'Blogger', '1990-09-09');

/* TO VIEW THE TABLE AND ATTRIBUTES INSRTED*/

SELECT * FROM readers;

/* TO CREATE BOOK TABLE AND ITS ATTRIBUTES*/

CREATE TABLE book (
			book_id VARCHAR (10),
			book_name VARCHAR (30),
            book_domain VARCHAR (30),
CONSTRAINT book_id_pk primary key (book_id));
            
/* TO INSERT THE ATTRIBUTES IN EACH FIELDS*/

INSERT INTO book VALUES ('B0001', 'The Praying Woman', 'Devotional'),
						('B0002', 'The Praying Wife', 'Devotional'),
						('B0003', 'Machine Learning', 'Educational'),
						('B0004', 'Things Fall Apart', 'Story'),
						('B0005', 'Why you Act the Way You Do', 'Story'),
						('B0006', 'Have You Been There', 'Story'),
						('B0007', 'Health Is Wealth', 'Educational'),
						('B0008', 'My Home Is Blessed', 'Devotional'),
						('B0009', 'Data Analytics Basics', 'Educational'),
						('B0010', 'You Lost Me', 'Story');
                        
/* TO VIEW THE TABLE AND ATTRIBUTES INSERTED*/             
SELECT * FROM book;

/* TO CREATE ACTIVE_READERS TABLE */          
 CREATE TABLE active_readers(
				account_id VARCHAR (10),
                reader_id VARCHAR (10),
                book_id VARCHAR (10),
                account_type VARCHAR (15),
                account_status VARCHAR (15),
CONSTRAINT active_readers_account_id_pk PRIMARY KEY (account_id),
CONSTRAINT account_reader_id_fk FOREIGN KEY (reader_id) REFERENCES readers(readers_id),
CONSTRAINT account_book_id_fk FOREIGN KEY (book_id) REFERENCES book(book_id));

DROP TABLE active_readers;

SELECT * FROM active_readers;

INSERT INTO active_readers VALUES ('A0001','N0001','B0001','Premium','Active'),
								('A0002', 'N0002', 'B0002',' Premium','Acitve'),
								('A0003', 'N0003', 'B0003',' Regular','Suspended'),
								('A0004', 'N0004', 'B0004',' Premium','Acitve'),
								('A0005', 'N0005', 'B0005',' Regular','Terminated'),
								('A0006', 'N0006', 'B0006',' Premium','Acitve'),
								('A0007', 'N0007', 'B0007',' Regualar','Suspended'),
								('A0008', 'N0008', 'B0008',' Premium','Acitve'),
								('A0009', 'N0009', 'B0009',' Regular','Terminated'),
								('A0010', 'N0010', 'B0010',' Premiun','Acitve');
            
/* TO CREATE BOOKISSUE_DETAILS TABLE */   
CREATE TABLE bookissue_details (issue_number VARCHAR (10),
								account_id VARCHAR (10),
                                book_id VARCHAR (10),
                                book_name VARCHAR (30),
                                nos_of_book_issued INT (7),
CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issue_number),
CONSTRAINT trandetails_account_id_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id));
								
SELECT * FROM bookissue_details;

INSERT INTO bookissue_details VALUES ('T0001', 'A0001', 'B0001', 'The Praying Woman', '002'),
									('T0002', 'A0002', 'B0002', 'The Praying Wife', '005'),
                                    ('T0003', 'A0003', 'B0003', 'Machine Learning', '003'), 
                                    ('T0004', 'A0004', 'B0004', 'Things Fall Apart', '001'),
                                    ('T0005', 'A0005', 'B0005', 'Why You Act the Way You Do', '006');  
                                    
                                    
/*TO QUERY THE DATA*/

-- Get the id, type and status of accont that are terminated and suspended-- QUESTION ONE
SELECT * FROM active_readers;

SELECT account_id, account_type, account_status 
FROM active_readers
WHERE account_status IN ('Suspended','Terminated');


-- I WANT TO SEE THE NUMBER OF BOOKS IN THE LIBARY-- QUESTION TWO--

SELECT * FROM book;

SELECT COUNT(*) book_id FROM book;

-- Get the id and book name of books that contain praying-- QUESTON THREE
SELECT book_id, book_name 
FROM book
WHERE book_name LIKE '%praying%';


DROP TABLE readers;