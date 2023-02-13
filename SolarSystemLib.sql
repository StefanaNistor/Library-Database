DROP TABLE Proj_Author CASCADE CONSTRAINTS; 
DROP TABLE Proj_Books CASCADE CONSTRAINTS; 
DROP TABLE Proj_Employees CASCADE CONSTRAINTS; 
DROP TABLE Proj_Items CASCADE CONSTRAINTS; 
DROP TABLE Proj_Library CASCADE CONSTRAINTS; 
DROP TABLE Proj_Members CASCADE CONSTRAINTS; 
DROP TABLE Proj_MembershipCard CASCADE CONSTRAINTS; 
DROP TABLE Proj_MemberPrizes CASCADE CONSTRAINTS;
DROP TABLE Proj_Prizes CASCADE CONSTRAINTS; 
DROP TABLE Proj_Purchases CASCADE CONSTRAINTS; 

CREATE TABLE Proj_Library
(
id_library NUMBER(6) CONSTRAINT pk_lib PRIMARY KEY,
library_name VARCHAR(40) NOT NULL,
adress VARCHAR(60)
);

CREATE TABLE Proj_Items
(
id_items NUMBER(6) CONSTRAINT pk_items PRIMARY KEY,
id_library NUMBER(6),
item_type VARCHAR(40),
price NUMBER(4) NOT NULL,
age_range VARCHAR(40),
CONSTRAINT fk_lib FOREIGN KEY (id_library) REFERENCES Proj_Library(id_library)
);

CREATE TABLE Proj_Author
(
id_author NUMBER(6) CONSTRAINT pk_author PRIMARY KEY,
last_name VARCHAR(40) NOT NULL,
first_name VARCHAR(40) NOT NULL,
country VARCHAR(20)
);

CREATE TABLE Proj_Books
(
id_book NUMBER(6) CONSTRAINT pk_book PRIMARY KEY,
book_name VARCHAR(60),
publishing VARCHAR(50),
id_library NUMBER(6),
id_author NUMBER(6),
release_date DATE,
price NUMBER(4) NOT NULL,
no_pages NUMBER(5),
cover_type VARCHAR(20),
genre VARCHAR(30),
CONSTRAINT fk_lib2 FOREIGN KEY (id_library) REFERENCES Proj_Library(id_library),
CONSTRAINT fk_author FOREIGN KEY (id_author) REFERENCES Proj_Author(id_author)
);

CREATE TABLE Proj_Employees
(
id_employees NUMBER(6) CONSTRAINT pk_employees PRIMARY KEY,
id_manager NUMBER(6),
id_library NUMBER(6),
last_name VARCHAR(40) NOT NULL,
first_name VARCHAR(40) NOT NULL,
birth_day DATE NOT NULL,
telephone VARCHAR2(20),
email VARCHAR2(50) CONSTRAINT one_email UNIQUE,
salary NUMBER(6) NOT NULL,
CONSTRAINT fk_lib3 FOREIGN KEY (id_library) REFERENCES Proj_Library(id_library),
CONSTRAINT fk_manager FOREIGN KEY (id_manager) REFERENCES Proj_Employees(id_employees)
);

ALTER TABLE Proj_Employees ADD
(hire_date DATE);

ALTER TABLE Proj_Employees DROP COLUMN hire_date;

ALTER TABLE Proj_Employees ADD
(hire_date DATE NOT NULL);

CREATE TABLE Proj_Prizes
(
id_prize NUMBER(6) CONSTRAINT pk_prize PRIMARY KEY,
prize_type VARCHAR(40),
minim_points NUMBER(5)
);

CREATE TABLE Proj_Members
(
id_member NUMBER(6) CONSTRAINT pk_member PRIMARY KEY,
last_name VARCHAR2(20) NOT NULL,
first_name VARCHAR2(30) NOT NULL,
birth_day DATE NOT NULL,
telephone VARCHAR2(20),
email VARCHAR2(50) CONSTRAINT one_email1 UNIQUE,
address VARCHAR2(60) NOT NULL
);

CREATE TABLE Proj_MembershipCard
(
id_card NUMBER(6) CONSTRAINT pk_card PRIMARY KEY,
card_type VARCHAR(30) NOT NULL,
id_member NUMBER(6) CONSTRAINT one_member UNIQUE,
registration_date DATE,
accumulated_points NUMBER(5),
CONSTRAINT fk_member FOREIGN KEY (id_member) REFERENCES Proj_Members(id_member)
);

CREATE TABLE Proj_MemberPrizes
(
id_card NUMBER(6),
id_prize NUMBER(6),
CONSTRAINT fk_prize1 FOREIGN KEY (id_prize) REFERENCES Proj_Prizes(id_prize),
CONSTRAINT fk_card1 FOREIGN KEY (id_card) REFERENCES Proj_Membershipcard(id_card)
);

CREATE TABLE Proj_Purchases
(
id_purchase NUMBER(6) CONSTRAINT pk_purchase PRIMARY KEY,
id_card NUMBER(6),
id_library NUMBER(6),
id_items NUMBER(6),
id_book NUMBER(6),
CONSTRAINT fk_lib4 FOREIGN KEY (id_library) REFERENCES Proj_Library(id_library),
CONSTRAINT fk_item FOREIGN KEY (id_items) REFERENCES Proj_Items(id_items),
CONSTRAINT fk_purchase FOREIGN KEY (id_card) REFERENCES Proj_Membershipcard(id_card),
CONSTRAINT fk_book FOREIGN KEY (id_book) REFERENCES Proj_Books(id_book)
);
-------------------------
--///AUTHORS///

INSERT INTO Proj_Author VALUES (1,'Tolstoy','Lev','Russia');
INSERT INTO Proj_Author VALUES (2,'Dostoievski','Feodor','Russia');
INSERT INTO Proj_Author VALUES (3,'Murakami','Haruki','Japan');
INSERT INTO Proj_Author VALUES (4,'Austen','Jane','England');
INSERT INTO Proj_Author VALUES (5,'Woolf','Virginia','England');
INSERT INTO Proj_Author VALUES (6,'Wilde','Oscar','Ireland');
INSERT INTO Proj_Author VALUES (7,'Christie','Agatha','England');
INSERT INTO Proj_Author VALUES (8,'Coelho','Paulo','Brazil');
INSERT INTO Proj_Author VALUES (9,'Yalom','Irvin','America');
INSERT INTO Proj_Author VALUES (10,'Kuang','Rebecca','China');
INSERT INTO Proj_Author VALUES (11,'Tartt','Donna','America');
INSERT INTO Proj_Author VALUES (12,'Verne','Jules','France');

--///LIBRARIES///

INSERT INTO Proj_Library VALUES (1,'Mercury Library','Str. Ciocarliei nr. 6, Cluj');
INSERT INTO Proj_Library VALUES (2,'Saturn Library','Bd. Chimiei 13, Ialomita');
INSERT INTO Proj_Library VALUES (3,'Sun Library','Bd. Unirii 12A, Bucuresti');
INSERT INTO Proj_Library VALUES (4,'Mars Library','Bd. Dem Radulescu 38, Ramnicu-Valcea');
INSERT INTO Proj_Library VALUES (5,'Jupiter Library','Str. Republicii 78, Brasov');
INSERT INTO Proj_Library VALUES (6,'Pluto Library','Str. Sforii 66, Chisinau');
INSERT INTO Proj_Library VALUES (7,'Uranus Library','Piata Victoriei 10, Ploiesti');
INSERT INTO Proj_Library VALUES (8,'Neptune Library','Strada Cernei 11, Hunedoara');
INSERT INTO Proj_Library VALUES (9,'Earth Library','Calea lui Traian 84, Ramnicu-Valcea');
INSERT INTO Proj_Library VALUES (10,'Venus Library','Bulevardul Libertatii 17, Hunedoara');

--///MEMBERS///

INSERT INTO Proj_Members VALUES(1,'Georgescu','Catalina','8-MAY-2009','0744908385','catageorgescu@gmail.com','Str. Republicii 18B, Covasna');
INSERT INTO Proj_Members VALUES(2,'Popescu','Catalin','19-JUL-2000','0720209311','popcatalin@gmail.com','Bd. Traian 77, Cluj');
INSERT INTO Proj_Members VALUES(3,'Predescu','Cristiana','12-JUN-1982','0744398934','predescucriss87@icloud.com','Str. Iancului 76, Ialomita');
INSERT INTO Proj_Members VALUES(4,'Rusu','Sergiu','30-AUG-1979','0749331814','sergiurusu12@hotmail.com','Str. Matei Basarab 1E, Hunedoara');
INSERT INTO Proj_Members VALUES(5,'Alexandrescu','Christian','26-MAR-2004','076714100','christianalexandrescu04@gmail.com','Str. Puscasului 51C, Hunedoara');

/*Anna Karenina*/

INSERT INTO Proj_Books VALUES (1,'Anna Karenina','Humanitas',1,1,'22-AUG-2021',74,864,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (2,'Anna Karenina','Penguin',1,1,'11-MAY-2000',64,890,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (3,'Anna Karenina','Artemis',1,1,'14-SEP-2014',40,1200,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (4,'Anna Karenina','Corint',2,1,'7-SEP-2019',35,900,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (5,'Anna Karenina','Nemira',2,1,'23-NOV-2012',45,845,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (6,'Anna Karenina','Humanitas',3,1,'22-AUG-2021',50,1020,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (7,'Anna Karenina','Humanitas',3,1,'22-AUG-2021',74,864,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (8,'Anna Karenina','Penguin',3,1,'8-MAR-2015',64,890,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (9,'Anna Karenina','Artemis',4,1,'16-MAY-2000',40,1200,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (10,'Anna Karenina','Corint',5,1,'7-SEP-2019',35,900,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (11,'Anna Karenina','Egmund',6,1,'12-SEP-2005',64,845,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (12,'Anna Karenina','Humanitas',6,1,'12-JUN-2021',50,1020,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (13,'Anna Karenina','Humanitas',7,1,'22-AUG-2021',74,864,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (14,'Anna Karenina','Nemira',7,1,'23-NOV-2012',80,977,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (15,'Anna Karenina','Artemis',7,1,'6-MAY-2000',40,1200,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (16,'Anna Karenina','Humanitas',8,1,'12-JUN-2021',74,864,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (17,'Anna Karenina','Penguin',8,1,'12-SEP-2015',64,890,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (18,'Anna Karenina','Egmund',9,1,'30-DEC-2010',64,845,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (19,'Anna Karenina','Humanitas',10,1,'12-JUN-2021',50,1020,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (20,'Anna Karenina','Nemira',10,1,'23-NOV-2012',80,977,'Hardcover','Drama');


/*WAR AND PEACE */
INSERT INTO Proj_Books VALUES (21,'War and Peace','Corint',2,1,'1-MAR-2012',42,1225,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (22,'War and Peace','Corint',2,1,'1-MAR-2012',42,1225,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (23,'War and Peace','Humanitas',3,1,'22-JUN-2018',50,1120,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (24,'War and Peace','Humanitas',4,1,'20-DEC-2017',84,1200,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (25,'War and Peace','Penguin',4,1,'9-AUG-2012',67,1190,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (26,'War and Peace','Artemis',4,1,'28-FEB-2019',38,1320,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (27,'War and Peace','Corint',5,1,'1-MAR-2012',42,1225,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (28,'War and Peace','Egmund',6,1,'18-JUL-2021',84,995,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (29,'War and Peace','Nemira',6,1,'3-NOV-2022',70,1450,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (30,'War and Peace','Humanitas',7,1,'22-JUN-2018',84,1200,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (31,'War and Peace','Nemira',7,1,'7-FEB-2017',80,977,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (32,'War and Peace','Penguin',7,1,'13-FEB-2020',40,1224,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (33,'War and Peace','Humanitas',7,1,'22-JUN-2018',84,1200,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (34,'War and Peace','Corint',8,1,'10-MAY-2015',88,1009,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (35,'War and Peace','Corint',9,1,'10-MAY-2015',88,1009,'Hardcover','Drama');
INSERT INTO Proj_Books VALUES (36,'War and Peace','Humanitas',10,1,'22-JUN-2018',50,1120,'Paperback','Drama');


/* CRIME AND PUNISHMENT*/
INSERT INTO Proj_Books VALUES (37,'Crime and Punishment','Humanitas',1,2,'25-JUN-2018',50,850,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (38,'Crime and Punishment','Humanitas',1,2,'27-APR-2021',55,1000,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (39,'Crime and Punishment','Nemira',1,2,'6-JUN-2017',89,896,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (40,'Crime and Punishment','Nemira',2,2,'14-DEC-2002',45,950,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (41,'Crime and Punishment','Corint',2,2,'2-MAY-2018',78,890,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (42,'Crime and Punishment','Corint',2,2,'28-JAN-2018',47,800,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (43,'Crime and Punishment','Nemira',2,2,'25-OCT-2030',77,856,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (44,'Crime and Punishment','Humanitas',3,2,'27-APR-2021',55,1000,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (45,'Crime and Punishment','Humanitas',3,2,'27-APR-2012',45,1200,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (46,'Crime and Punishment','Humanitas',4,2,'27-APR-2021',55,1000,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (47,'Crime and Punishment','Corint',4,2,'2-MAY-2018',78,890,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (48,'Crime and Punishment','Penguin',4,2,'26-JAN-2017',59,823,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (49,'Crime and Punishment','Artemis',5,2,'13-OCT-2005',55,858,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (50,'Crime and Punishment','Libpress',6,2,'1-AUG-2016',32,856,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (51,'Crime and Punishment','Humanitas',6,2,'27-APR-2021',55,1000,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (52,'Crime and Punishment','Artemis',7,2,'5-SEP-2013',57,890,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (53,'Crime and Punishment','Humanitas',7,2,'12-FEB-2015',76,829,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (54,'Crime and Punishment','Penguin',7,2,'26-JAN-2017',58,789,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (55,'Crime and Punishment','Humanitas',8,2,'12-FEB-2015',76,890,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (56,'Crime and Punishment','Humanitas',9,2,'12-FEB-2015',76,829,'Hardback','Drama');
INSERT INTO Proj_Books VALUES (57,'Crime and Punishment','Corint',9,2,'17-NOV-2015',40,1100,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (58,'Crime and Punishment','Corint',10,2,'2-MAY-2018',78,890,'Hardback','Drama');


/*NORWEGIAN WOOD*/
INSERT INTO Proj_Books VALUES (59,'Norwegian Wood','Corint',1,3,'6-MAY-2016',60,500,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (60,'Norwegian Wood','Humanitas',1,3,'7-FEB-2009',48,690,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (61,'Norwegian Wood','Humanitas',2,3,'7-FEB-2009',48,690,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (62,'Norwegian Wood','Corint',3,3,'6-MAY-2016',60,500,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (63,'Norwegian Wood','Corint',4,3,'6-MAY-2016',60,500,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (64,'Norwegian Wood','Corint',5,3,'7-FEB-2009',48,690,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (65,'Norwegian Wood','Nemira',6,3,'27-JAN-2010',38,995,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (66,'Norwegian Wood','Corint',6,3,'2-MAY-2018',78,890,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (67,'Norwegian Wood','Corint',7,3,'2-MAY-2018',78,890,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (68,'Norwegian Wood','Nemira',8,3,'25-JUL-2017',68,880,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (69,'Norwegian Wood','Nemira',9,3,'25-JUL-2017',68,880,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (70,'Norwegian Wood','Corint',10,3,'6-MAY-2016',60,500,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (71,'Norwegian Wood','Nemira',10,3,'27-JAN-2010',38,995,'Paperback','Romance');


/* HARUKI MURAKAMI*/
INSERT INTO Proj_Books VALUES (72,'1Q84','Penguin',2,3,'24-JAN-2010',35,735,'Paperback','Fiction');
INSERT INTO Proj_Books VALUES (73,'1Q84','Nemira',3,3,'2-JUL-2000',38,995,'Hardback','Fiction');
INSERT INTO Proj_Books VALUES (74,'Kafka on the Shore','Nemira',3,3,'7-DEC-1996',28,400,'Paperback','Fantasy');
INSERT INTO Proj_Books VALUES (75,'A Wild Sheep Chase','Nemira',4,3,'12-OCT-2015',68,300,'Paperback','Mystery');
INSERT INTO Proj_Books VALUES (76,'A Wild Sheep Chase','Nemira',5,3,'8-JUN-2016',48,295,'Hardback','Mystery');
INSERT INTO Proj_Books VALUES (77,'Kafka on the Shore','Nemira',6,3,'19-OCT-2019',38,455,'Paperback','Fantasy');
INSERT INTO Proj_Books VALUES (78,'Men Without Women','Nemira',7,3,'10-NOV-2000',50,465,'Paperback','Fiction');
INSERT INTO Proj_Books VALUES (79,'1Q84','Nemira',7,3,'11-JUL-2001',78,660,'Hardback','Fiction');
INSERT INTO Proj_Books VALUES (80,'A Wild Sheep Chase','Nemira',8,3,'5-MAY-2007',42,295,'Paperback','Mystery');


/*JANE AUSTEN*/
INSERT INTO Proj_Books VALUES (81,'Pride and Prejudice','Libpress',1,4,'15-FEB-2022',60,490,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (82,'Sense and Sensibility','Humanitas',1,4,'6-OCT-2000',47,555,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (83,'Persuasion','Nemira',1,4,'21-JUN-2021',47,495,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (84,'Emma','Penguin',1,4,'14-JUL-2003',32,295,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (85,'Pride and Prejudice','Humanitas',1,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (86,'Persuasion','Egmund',1,4,'5-OCT-2017',44,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (87,'Pride and Prejudice','Penguin',1,4,'3-MAR-2003',33,333,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (88,'Emma','Corint',1,4,'23-OCT-2004',42,566,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (89,'Emma','Corint',1,4,'18-NOV-2021',72,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (90,'Emma','Penguin',1,4,'14-JUL-2003',32,295,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (91,'Sense and Sensibility','Humanitas',2,4,'6-OCT-2000',42,505,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (92,'Sense and Sensibility','Nemira',2,4,'12-APR-2014',72,677,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (93,'Emma','Corint',1,4,'23-OCT-2004',42,566,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (94,'Emma','Corint',1,4,'18-NOV-2021',72,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (95,'Pride and Prejudice','Libpress',1,4,'15-FEB-2022',60,490,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (96,'Pride and Prejudice','Humanitas',1,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (97,'Pride and Prejudice','Humanitas',1,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (98,'Pride and Prejudice','Libpress',1,4,'15-FEB-2022',60,490,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (99,'Persuasion','Egmund',1,4,'5-OCT-2017',44,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (100,'Persuasion','Egmund',1,4,'5-OCT-2017',44,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (101,'Persuasion','Egmund',2,4,'5-OCT-2017',44,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (102,'Pride and Prejudice','Artemis',2,4,'20-JUL-2022',52,525,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (103,'Sense and Sensibility','Nemira',2,4,'12-APR-2014',72,677,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (104,'Emma','Corint',3,4,'18-NOV-2021',72,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (105,'Pride and Prejudice','Humanitas',3,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (106,'Emma','Corint',3,4,'18-NOV-2021',72,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (107,'Pride and Prejudice','Humanitas',4,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (108,'Pride and Prejudice','Humanitas',4,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (109,'Pride and Prejudice','Humanitas',4,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (110,'Persuasion','Egmund',4,4,'5-OCT-2017',44,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (111,'Emma','Corint',5,4,'23-OCT-2004',42,566,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (112,'Pride and Prejudice','Humanitas',5,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (113,'Pride and Prejudice','Libpress',5,4,'15-FEB-2022',60,490,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (114,'Persuasion','Egmund',5,4,'5-OCT-2017',44,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (115,'Emma','Corint',6,4,'18-NOV-2021',72,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (116,'Sense and Sensibility','Nemira',6,4,'12-APR-2014',72,677,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (117,'Emma','Libpress',6,4,'7-NOV-2011',42,245,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (118,'Emma','Corint',6,4,'18-NOV-2021',72,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (119,'Persuasion','Egmund',6,4,'5-OCT-2017',44,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (120,'Pride and Prejudice','Humanitas',7,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (121,'Sense and Sensibility','Nemira',7,4,'5-MAR-2007',65,895,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (122,'Emma','Humanitas',7,4,'15-OCT-2021',48,873,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (123,'Sense and Sensibility','Nemira',7,4,'10-APR-2015',34,378,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (124,'Emma','Corint',8,4,'23-OCT-2004',42,566,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (125,'Pride and Prejudice','Humanitas',8,4,'18-JAN-2017',52,563,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (126,'Pride and Prejudice','Corint',8,4,'17-AUG-2007',42,255,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (127,'Persuasion','Egmund',8,4,'5-OCT-2017',44,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (128,'Emma','Corint',9,4,'18-NOV-2021',72,695,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (129,'Sense and Sensibility','Nemira',10,4,'12-APR-2014',78,677,'Hardback','Romance');
INSERT INTO Proj_Books VALUES (130,'Sense and Sensibility','Nemira',10,4,'12-APR-2014',78,677,'Hardback','Romance');

/*VIRGINIA WOOLF*/
INSERT INTO Proj_Books VALUES (131,'To The Lighthouse','Penguin',1,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (132,'Orlando','Nemira',1,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (133,'To The Lighthouse','Libpress',1,5,'4-MAR-2016',47,787,'Paperback','Family');
INSERT INTO Proj_Books VALUES (134,'The Waves','Corint',1,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (135,'To The Lighthouse','Penguin',1,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (136,'Orlando','Egmund',1,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (137,'Orlando','Nemira',2,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (138,'To The Lighthouse','Penguin',2,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (139,'To The Lighthouse','Libpress',2,5,'4-MAR-2016',47,787,'Paperback','Family');
INSERT INTO Proj_Books VALUES (140,'Orlando','Egmund',3,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (141,'To The Lighthouse','Libpress',3,5,'4-MAR-2016',47,787,'Paperback','Family');
INSERT INTO Proj_Books VALUES (142,'Orlando','Nemira',4,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (143,'To The Lighthouse','Penguin',4,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (144,'Orlando','Egmund',4,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (145,'To The Lighthouse','Penguin',4,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (146,'Orlando','Nemira',4,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (147,'To The Lighthouse','Libpress',4,5,'4-MAR-2016',47,787,'Paperback','Family');
INSERT INTO Proj_Books VALUES (148,'The Waves','Corint',5,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (149,'Orlando','Nemira',5,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (150,'To The Lighthouse','Penguin',5,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (151,'Orlando','Egmund',5,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (152,'The Waves','Corint',5,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (153,'The Waves','Corint',6,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (154,'To The Lighthouse','Penguin',6,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (155,'To The Lighthouse','Penguin',6,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (156,'Orlando','Nemira',6,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (157,'To The Lighthouse','Libpress',6,5,'4-MAR-2016',47,787,'Paperback','Family');
INSERT INTO Proj_Books VALUES (158,'Orlando','Egmund',6,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (159,'The Waves','Corint',7,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (160,'To The Lighthouse','Penguin',7,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (161,'Orlando','Nemira',7,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (162,'To The Lighthouse','Libpress',7,5,'4-MAR-2016',47,787,'Paperback','Family');
INSERT INTO Proj_Books VALUES (163,'Orlando','Egmund',7,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (164,'To The Lighthouse','Penguin',7,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (165,'Orlando','Nemira',7,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (166,'The Waves','Corint',7,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (167,'The Waves','Corint',8,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (168,'To The Lighthouse','Libpress',8,5,'4-MAR-2016',47,787,'Paperback','Family');
INSERT INTO Proj_Books VALUES (169,'Orlando','Egmund',8,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (170,'The Waves','Corint',9,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (171,'To The Lighthouse','Penguin',9,5,'26-JAN-2011',68,697,'Hardback','Family');
INSERT INTO Proj_Books VALUES (172,'The Waves','Corint',9,5,'12-APR-2014',78,677,'Paperback','Cryptic');
INSERT INTO Proj_Books VALUES (173,'Orlando','Egmund',9,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (174,'To The Lighthouse','Libpress',10,5,'4-MAR-2016',47,787,'Paperback','Family');
INSERT INTO Proj_Books VALUES (175,'Orlando','Egmund',10,5,'10-APR-2020',43,478,'Paperback','Romance');
INSERT INTO Proj_Books VALUES (176,'Orlando','Nemira',10,5,'30-JUL-2009',89,564,'Hardback','History');
INSERT INTO Proj_Books VALUES (177,'To The Lighthouse','Penguin',10,5,'26-JAN-2011',68,697,'Hardback','Family');


/*OSCAR WILDE*/
INSERT INTO Proj_Books VALUES (178,'The Portrait of Dorian Gray','Penguin',1,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (179,'The Portrait of Dorian Gray','Nemira',1,6,'21-APR-2012',58,697,'Paperback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (180,'The Happy Prince','Corint',1,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (181,'The Portrait of Dorian Gray','Penguin',2,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (182,'The Happy Prince','Corint',2,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (183,'The Happy Prince','Corint',3,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (184,'The Portrait of Dorian Gray','Penguin',3,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (185,'The Portrait of Dorian Gray','Nemira',3,6,'21-APR-2012',58,697,'Paperback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (186,'The Happy Prince','Corint',4,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (187,'The Portrait of Dorian Gray','Penguin',4,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (188,'The Happy Prince','Corint',4,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (189,'The Portrait of Dorian Gray','Nemira',4,6,'21-APR-2012',58,697,'Paperback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (190,'The Happy Prince','Corint',5,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (191,'The Portrait of Dorian Gray','Penguin',5,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (192,'The Portrait of Dorian Gray','Nemira',5,6,'21-APR-2012',58,697,'Paperback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (193,'The Happy Prince','Corint',5,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (194,'The Portrait of Dorian Gray','Nemira',6,6,'21-APR-2012',58,697,'Paperback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (195,'The Portrait of Dorian Gray','Penguin',6,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (196,'The Happy Prince','Corint',6,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (197,'The Portrait of Dorian Gray','Nemira',6,6,'21-APR-2012',58,697,'Paperback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (198,'The Portrait of Dorian Gray','Penguin',6,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (199,'The Happy Prince','Corint',7,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (200,'The Portrait of Dorian Gray','Nemira',7,6,'21-APR-2012',58,697,'Paperback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (201,'The Happy Prince','Corint',8,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (202,'The Portrait of Dorian Gray','Penguin',8,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (203,'The Portrait of Dorian Gray','Nemira',8,6,'21-APR-2012',58,697,'Paperback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (204,'The Happy Prince','Corint',9,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');
INSERT INTO Proj_Books VALUES (205,'The Portrait of Dorian Gray','Penguin',9,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (206,'The Portrait of Dorian Gray','Penguin',10,6,'25-MAR-2021',88,597,'Hardback','Filosofy Fiction');
INSERT INTO Proj_Books VALUES (207,'The Happy Prince','Corint',10,6,'8-FEB-2020',48,397,'Paperback','Fairy Tale');

/*AGATHA CHRISTIE*/
INSERT INTO Proj_Books VALUES (208,'Murder on the Oriend Express','Humanitas',1,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (209,'Murder on the Oriend Express','Humanitas',1,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (210,'Murder on the Oriend Express','Penguin',1,7,'2-JUN-2019',89,427,'Hardback','Murder Mystery');
INSERT INTO Proj_Books VALUES (211,'Death on the Nile','Artemis',1,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (212,'Eleven Minutes','Penguin',10,8,'18-OCT-2011',97,547,'Hardback Special Ed.','Drama');
INSERT INTO Proj_Books VALUES (213,'Death on the Nile','Artemis',4,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (214,'Murder on the Oriend Express','Penguin',2,7,'2-JUN-2019',89,427,'Hardback','Murder Mystery');
INSERT INTO Proj_Books VALUES (215,'Death on the Nile','Artemis',2,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (216,'Murder on the Oriend Express','Humanitas',3,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (217,'Death on the Nile','Artemis',3,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (218,'Murder on the Oriend Express','Humanitas',3,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (219,'Murder on the Oriend Express','Humanitas',4,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (220,'Death on the Nile','Artemis',4,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (221,'Murder on the Oriend Express','Penguin',4,7,'2-JUN-2019',89,427,'Hardback','Murder Mystery');
INSERT INTO Proj_Books VALUES (222,'Murder on the Oriend Express','Humanitas',4,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (223,'Murder on the Oriend Express','Humanitas',5,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (224,'Death on the Nile','Artemis',5,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (225,'Murder on the Oriend Express','Humanitas',6,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (226,'Murder on the Oriend Express','Penguin',6,7,'2-JUN-2019',89,427,'Hardback','Murder Mystery');
INSERT INTO Proj_Books VALUES (227,'Death on the Nile','Artemis',6,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (228,'Death on the Nile','Artemis',6,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (229,'Murder on the Oriend Express','Humanitas',6,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (230,'Murder on the Oriend Express','Humanitas',7,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (231,'Murder on the Oriend Express','Penguin',7,7,'2-JUN-2019',89,427,'Hardback','Murder Mystery');
INSERT INTO Proj_Books VALUES (232,'Death on the Nile','Artemis',7,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (233,'Murder on the Oriend Express','Humanitas',7,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (234,'Murder on the Oriend Express','Humanitas',8,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (235,'Murder on the Oriend Express','Penguin',8,7,'2-JUN-2019',89,427,'Hardback','Murder Mystery');
INSERT INTO Proj_Books VALUES (236,'Death on the Nile','Artemis',8,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (237,'Murder on the Oriend Express','Humanitas',9,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (238,'Death on the Nile','Artemis',9,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (239,'Murder on the Oriend Express','Humanitas',10,7,'23-MAY-2014',49,497,'Paperback','Murder Mystery');
INSERT INTO Proj_Books VALUES (240,'Murder on the Oriend Express','Penguin',10,7,'2-JUN-2019',89,427,'Hardback','Murder Mystery');
INSERT INTO Proj_Books VALUES (241,'Death on the Nile','Artemis',10,7,'7-AUG-2017',52,397,'Paperback','Murder Mystery');


/*PAULO COELHO*/
INSERT INTO Proj_Books VALUES (242,'The Alchemist','Artemis',1,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (243,'Eleven Minutes','Penguin',1,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (244,'The Witch of Portobello','Egmund',1,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (245,'The Alchemist','Artemis',1,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (246,'The Devil and Miss Prym','Corint',1,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (247,'The Alchemist','Humanitas',1,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (248,'Eleven Minutes','Penguin',1,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (249,'The Devil and Miss Prym','Humanitas',1,8,'14-JUL-2020',76,361,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (250,'The Witch of Portobello','Egmund',1,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (251,'The Alchemist','Artemis',2,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (252,'The Witch of Portobello','Egmund',2,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (253,'The Devil and Miss Prym','Corint',2,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (254,'The Alchemist','Artemis',2,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (255,'The Witch of Portobello','Egmund',2,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (256,'The Devil and Miss Prym','Humanitas',2,8,'14-JUL-2020',76,361,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (257,'The Alchemist','Humanitas',2,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (258,'Eleven Minutes','Penguin',2,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (259,'The Alchemist','Artemis',3,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (260,'The Alchemist','Artemis',3,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (261,'The Devil and Miss Prym','Corint',3,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (262,'The Alchemist','Artemis',3,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (263,'The Witch of Portobello','Egmund',3,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (264,'Eleven Minutes','Penguin',3,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (265,'The Devil and Miss Prym','Humanitas',3,8,'14-JUL-2020',76,361,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (266,'The Alchemist','Humanitas',3,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (267,'The Alchemist','Artemis',4,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (268,'The Alchemist','Humanitas',4,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (269,'The Devil and Miss Prym','Corint',4,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (270,'The Devil and Miss Prym','Corint',4,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (271,'The Alchemist','Humanitas',4,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (272,'The Witch of Portobello','Egmund',4,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (273,'The Alchemist','Artemis',5,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (274,'Eleven Minutes','Penguin',5,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (275,'The Devil and Miss Prym','Corint',5,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (276,'The Alchemist','Artemis',5,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (277,'Eleven Minutes','Penguin',5,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (278,'The Alchemist','Humanitas',5,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (279,'Eleven Minutes','Penguin',5,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (280,'The Devil and Miss Prym','Corint',5,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (281,'The Alchemist','Artemis',6,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (282,'The Devil and Miss Prym','Humanitas',6,8,'14-JUL-2020',76,361,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (283,'Eleven Minutes','Penguin',6,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (284,'The Witch of Portobello','Egmund',6,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (285,'The Alchemist','Artemis',6,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (286,'The Alchemist','Humanitas',6,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (287,'The Devil and Miss Prym','Corint',6,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (288,'The Alchemist','Artemis',7,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (289,'The Witch of Portobello','Egmund',7,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (290,'The Alchemist','Humanitas',7,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (291,'The Devil and Miss Prym','Corint',7,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (292,'Eleven Minutes','Penguin',7,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (293,'The Witch of Portobello','Egmund',7,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (294,'Eleven Minutes','Penguin',7,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (295,'The Alchemist','Artemis',8,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (296,'The Devil and Miss Prym','Corint',8,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (297,'The Alchemist','Artemis',8,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (298,'Eleven Minutes','Penguin',8,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (299,'The Devil and Miss Prym','Humanitas',8,8,'14-JUL-2020',76,361,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (300,'The Alchemist','Humanitas',8,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (301,'The Alchemist','Artemis',9,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (302,'Eleven Minutes','Penguin',9,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (303,'The Witch of Portobello','Egmund',9,8,'1-APR-2011',27,431,'Paperback','Fantasy Filosophy');
INSERT INTO Proj_Books VALUES (304,'The Devil and Miss Prym','Corint',9,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (305,'The Alchemist','Artemis',9,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (306,'Eleven Minutes','Penguin',9,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (307,'The Devil and Miss Prym','Humanitas',9,8,'14-JUL-2020',76,361,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (308,'The Alchemist','Humanitas',9,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (309,'The Alchemist','Artemis',10,8,'13-SEP-2015',36,353,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (310,'Eleven Minutes','Penguin',10,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (311,'The Devil and Miss Prym','Humanitas',10,8,'14-JUL-2020',76,361,'Hardback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (312,'The Devil and Miss Prym','Corint',10,8,'4-JUN-2010',26,253,'Paperback','Dramatic Fantasy');
INSERT INTO Proj_Books VALUES (313,'Eleven Minutes','Penguin',10,8,'10-OCT-2021',37,447,'Paperback','Drama');
INSERT INTO Proj_Books VALUES (314,'The Alchemist','Humanitas',10,8,'3-NOV-2018',66,253,'Hardback','Dramatic Fantasy');


/*IRVIN*/
INSERT INTO Proj_Books VALUES (315,'When Nietzsche Wept','Humanitas',1,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (316,'When Nietzsche Wept','Humanitas',2,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (317,'When Nietzsche Wept','Humanitas',2,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (318,'When Nietzsche Wept','Humanitas',3,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (319,'When Nietzsche Wept','Humanitas',4,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (320,'When Nietzsche Wept','Humanitas',5,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (321,'When Nietzsche Wept','Humanitas',5,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (322,'When Nietzsche Wept','Humanitas',6,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (323,'When Nietzsche Wept','Humanitas',7,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (324,'When Nietzsche Wept','Humanitas',8,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (325,'When Nietzsche Wept','Humanitas',9,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (326,'When Nietzsche Wept','Humanitas',10,9,'27-SEP-2006',16,203,'Paperback','Biography');
INSERT INTO Proj_Books VALUES (327,'When Nietzsche Wept','Humanitas',10,9,'27-SEP-2006',16,203,'Paperback','Biography');


/*REBBECCA KUANG*/
INSERT INTO Proj_Books VALUES (328,'The Poppy Wars','Penguin',1,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (329,'Babel','Corint',1,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (330,'The Poppy Wars','Penguin',1,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (331,'The Poppy Wars','Penguin',2,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (332,'Babel','Corint',2,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (333,'Babel','Corint',2,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (334,'The Poppy Wars','Penguin',3,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (335,'Babel','Corint',3,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (336,'The Poppy Wars','Penguin',3,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (337,'The Poppy Wars','Penguin',4,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (338,'The Poppy Wars','Penguin',4,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (339,'The Poppy Wars','Penguin',5,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (340,'Babel','Corint',5,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (341,'The Poppy Wars','Penguin',6,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (342,'Babel','Corint',1,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (343,'The Poppy Wars','Penguin',6,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (344,'The Poppy Wars','Penguin',7,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (345,'Babel','Corint',7,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (346,'The Poppy Wars','Penguin',7,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (347,'The Poppy Wars','Penguin',8,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (348,'Babel','Corint',8,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (349,'Babel','Corint',8,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (350,'The Poppy Wars','Penguin',9,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (351,'Babel','Corint',9,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');
INSERT INTO Proj_Books VALUES (352,'The Poppy Wars','Penguin',10,10,'7-MAY-2007',77,777,'Hardback','Historical Fantasy Drama');
INSERT INTO Proj_Books VALUES (353,'Babel','Corint',10,10,'19-OCT-2022',87,897,'Paperback','Teenage Drama');


/*DONNA TARTT*/
INSERT INTO Proj_Books VALUES (354,'The Secret History','Corint',1,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (355,'The Secret History','Penguin',1,11,'6-JUN-2013',47,524,'Hardback','Psychological Novella');
INSERT INTO Proj_Books VALUES (356,'The Secret History','Corint',2,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (357,'The Secret History','Penguin',2,11,'6-JUN-2013',47,524,'Hardback','Psychological Novella');
INSERT INTO Proj_Books VALUES (358,'The Secret History','Corint',3,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (359,'The Secret History','Corint',4,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (360,'The Secret History','Penguin',4,11,'6-JUN-2013',47,524,'Hardback','Psychological Novella');
INSERT INTO Proj_Books VALUES (361,'The Secret History','Corint',5,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (362,'The Secret History','Corint',6,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (363,'The Secret History','Penguin',6,11,'6-JUN-2013',47,524,'Hardback','Psychological Novella');
INSERT INTO Proj_Books VALUES (364,'The Secret History','Penguin',6,11,'6-JUN-2013',47,524,'Hardback','Psychological Novella');
INSERT INTO Proj_Books VALUES (365,'The Secret History','Corint',7,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (366,'The Secret History','Penguin',7,11,'6-JUN-2013',47,524,'Hardback','Psychological Novella');
INSERT INTO Proj_Books VALUES (367,'The Secret History','Corint',8,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (368,'The Secret History','Penguin',8,11,'6-JUN-2013',47,524,'Hardback','Psychological Novella');
INSERT INTO Proj_Books VALUES (369,'The Secret History','Corint',9,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');
INSERT INTO Proj_Books VALUES (370,'The Secret History','Penguin',9,11,'6-JUN-2013',47,524,'Hardback','Psychological Novella');
INSERT INTO Proj_Books VALUES (371,'The Secret History','Corint',10,11,'21-JUN-2013',64,627,'Paperback','Psychological Novella');


/*JULES VERNE*/
INSERT INTO Proj_Books VALUES (372,'Journey to the Center of the Earth','Humanitas',1,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (373,'Journey to the Center of the Earth','Humanitas',1,12,'12-NOV-2013',52,334,'Hardback','Adventure');
INSERT INTO Proj_Books VALUES (374,'Journey to the Center of the Earth','Humanitas',1,12,'8-SEP-2012',43,279,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (375,'Journey to the Center of the Earth','Humanitas',2,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (376,'Journey to the Center of the Earth','Humanitas',3,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (377,'Journey to the Center of the Earth','Humanitas',3,12,'12-NOV-2013',52,334,'Hardback','Adventure');
INSERT INTO Proj_Books VALUES (378,'Journey to the Center of the Earth','Humanitas',4,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (379,'Journey to the Center of the Earth','Humanitas',5,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (380,'Journey to the Center of the Earth','Nemira',5,12,'18-OCT-2017',55,354,'Hardback','Adventure');
INSERT INTO Proj_Books VALUES (381,'Journey to the Center of the Earth','Humanitas',6,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (382,'Journey to the Center of the Earth','Humanitas',6,12,'8-SEP-2012',43,279,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (383,'Journey to the Center of the Earth','Humanitas',7,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (384,'Journey to the Center of the Earth','Humanitas',8,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (385,'Journey to the Center of the Earth','Nemira',8,12,'18-OCT-2017',55,354,'Hardback','Adventure');
INSERT INTO Proj_Books VALUES (386,'Journey to the Center of the Earth','Humanitas',9,12,'8-SEP-2012',34,424,'Paperback','Adventure');
INSERT INTO Proj_Books VALUES (387,'Journey to the Center of the Earth','Humanitas',10,12,'8-SEP-2012',34,424,'Paperback','Adventure');

--null values

INSERT INTO Proj_Books VALUES (388,'Jungle Coloring Book','Penguin',7,null,'8-SEP-2012',34,161,'Hardback','Coloring Book');
INSERT INTO Proj_Books VALUES (389,'Farm Animals for Kids','Nemira',5,null,'8-SEP-2012',27,231,'Paperback','Coloring Book');
INSERT INTO Proj_Books VALUES (390,'Kids Book','Humanitas',1,null,'8-SEP-2012',22,221,'Paperback','Coloring Book');

--///ITEMS///
INSERT INTO Proj_Items VALUES(1,1,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(2,1,'Puzzle', 34,'5-7 years');
INSERT INTO Proj_Items VALUES(3,1,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(4,1,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(5,1,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(6,1,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(7,1,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(8,2,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(9,2,'Puzzle', 34,'5-7 years');
INSERT INTO Proj_Items VALUES(10,2,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(11,2,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(12,2,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(13,2,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(14,2,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(15,3,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(16,3,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(17,3,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(18,3,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(19,3,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(20,3,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(21,4,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(22,4,'Puzzle', 34,'5-7 years');
INSERT INTO Proj_Items VALUES(23,4,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(24,4,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(25,4,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(26,4,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(27,4,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(28,5,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(29,5,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(30,5,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(31,5,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(32,5,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(33,5,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(34,6,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(35,6,'Puzzle', 34,'5-7 years');
INSERT INTO Proj_Items VALUES(36,6,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(37,6,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(38,6,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(39,6,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(40,6,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(41,7,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(42,7,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(43,7,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(44,7,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(45,7,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(46,7,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(47,8,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(48,8,'Puzzle', 34,'5-7 years');
INSERT INTO Proj_Items VALUES(49,8,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(50,8,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(51,8,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(52,8,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(53,8,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(54,9,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(55,9,'Puzzle', 34,'5-7 years');
INSERT INTO Proj_Items VALUES(56,9,'Train Set', 44,'10-12 years');
INSERT INTO Proj_Items VALUES(57,9,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(58,9,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(59,9,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(60,9,'Pen', 7,'7 years minimum');

INSERT INTO Proj_Items VALUES(61,10,'Puzzle', 50,'3-5 years');
INSERT INTO Proj_Items VALUES(62,10,'Train Set', 34,'10-12 years');
INSERT INTO Proj_Items VALUES(63,10,'Doll Set', 64,'9-13 years');
INSERT INTO Proj_Items VALUES(64,10,'Magazines', 24,'15-20 years');
INSERT INTO Proj_Items VALUES(65,10,'Pencil Case', 14,'10-20 years');
INSERT INTO Proj_Items VALUES(66,10,'Pen', 7,'7 years minimum');

--//PRIZEZ///

INSERT INTO Proj_Prizes VALUES(1,'10% discount',10);
INSERT INTO Proj_Prizes VALUES(2,'20% discount',20);
INSERT INTO Proj_Prizes VALUES(3,'30% discount',30);
INSERT INTO Proj_Prizes VALUES(4,'free book',500);
INSERT INTO Proj_Prizes VALUES(5,'free pencil',100);
INSERT INTO Proj_Prizes VALUES(6,'free magazine',200);
INSERT INTO Proj_Prizes VALUES(7,'free newspaper',300);
INSERT INTO Proj_Prizes VALUES(8,'free toy',400);
INSERT INTO Proj_Prizes VALUES(9,'free charm',150);
INSERT INTO Proj_Prizes VALUES(10,'free bookmark',50);

--//EMPLOYEES

INSERT INTO Proj_Employees VALUES(1,null,1,'Nistor','Stefana-Teodora','12-JUN-2002','0735429211','nistorstefana21@stud.ase.ro',7777,'07-JUL-2007');
INSERT INTO Proj_Employees VALUES(2,null,2,'Petrescu','Garbiela-Roxana','04-OCT-2002','0717629281','petrescuroxana@yahoo.com',7777,'07-JUL-2007');
INSERT INTO Proj_Employees VALUES(3,null,3,'Lixandru','Teodora','31-MAY-2002','0744165531','lix_thea22@yahoo.com',7777,'07-JUL-2007');
INSERT INTO Proj_Employees VALUES(4,null,4,'Rata','Stefania','02-NOV-2001','0740017521','stefaniaarata@yahoo.com',7777,'07-JUL-2007');
INSERT INTO Proj_Employees VALUES(5,null,5,'Milea','Robert','10-JAN-2003','0747559284','robmilea@hotmail.com',7777,'06-JAN-2008');
INSERT INTO Proj_Employees VALUES(6,null,6,'Ilie','Andrei Virgil','27-APR-2003','0711235271','andreivirgil32@gmail.com',7777,'06-JAN-2008');
INSERT INTO Proj_Employees VALUES(7,null,7,'Georgescu','Alexandra-Elena','23-MAY-2002','0727649231','alexandraelena23@yahoo.com',7777,'06-JAN-2008');
INSERT INTO Proj_Employees VALUES(8,null,8,'Suleyman','Vasilica','05-FEB-1977','0720029281','suleymanmagnificul@yahoo.com',7777,'19-FEB-2009');
INSERT INTO Proj_Employees VALUES(9,null,9,'Coman','Alexia','17-OCT-1996','0727673981','comannalexia_56@yahoo.com',7777,'19-FEB-2009');
INSERT INTO Proj_Employees VALUES(10,null,10,'Georgescu','Ioana-Elena','01-JUL-1992','0717842781','georgescuioanaele@gmail.com',7777,'19-FEB-2009');


-- MANAGERS

--EMPLOYEES:

INSERT INTO Proj_Employees VALUES(11,1,1,'Ionescu','Vladimir','12-JUN-2002','0735483211','ionescuvlad@yah00.com',3100,'17-JUL-2007');
INSERT INTO Proj_Employees VALUES(12,1,1,'Popescu','Madalin-Mihai','16-MAR-2005','0749269211','popescumadalin@icloud.com',3300,'15-JUL-2007');

INSERT INTO Proj_Employees VALUES(13,2,2,'Ruxandru','Teodora','03-JUN-1967','0738462928','ruxteodora@yahoo.com',3300,'11-JUL-2007');
INSERT INTO Proj_Employees VALUES(14,2,2,'Mihail','Cosmina-Maria','04-SEP-2000','0782630781','cosminamaria11@gmail.com',3200,'10-JUL-2007');

INSERT INTO Proj_Employees VALUES(15,3,3,'Mihai','Mihail','18-JUL-1996','0766155531','mmihaimmih@yahoo.com',3200,'09-JUL-2007');
INSERT INTO Proj_Employees VALUES(16,3,3,'Niculae','Stefan','10-FEB-1992','0735428231','stefanniculae92@stud.ase.ro',3200,'08-JUL-2007');

INSERT INTO Proj_Employees VALUES(17,4,4,'Apostol','Ion','02-NOV-2003','0720008521','apostolion@yahoo.com',3000,'17-JUL-2007');
INSERT INTO Proj_Employees VALUES(18,4,4,'Necsoiu','Sebastian-Andrei','27-OCT-1990','0735436211','sebastianandrei21@hotmail.com',3300,'27-JUL-2007');

INSERT INTO Proj_Employees VALUES(19,5,5,'Andrei','Robert','21-OCT-2001','0747529844','andreirobert@hotmail.com',3200,'07-JAN-2008');
INSERT INTO Proj_Employees VALUES(20,5,5,'Prepelita','Nicolae','28-AUG-1993','0735390211','croitorumaria77@gmail.com',3200,'09-JAN-2008');

INSERT INTO Proj_Employees VALUES(21,6,6,'Camataru','Andreea-Maria','27-APR-2000','0711289101','camatarumaria@gmail.com',3200,'23-JAN-2008');
INSERT INTO Proj_Employees VALUES(22,6,6,'Croitoru','Anamaria-Maria','13-AUG-2002','0700029211','criotoruanamaria21@yahoo.com',3100,'16-JAN-2008');

INSERT INTO Proj_Employees VALUES(23,7,7,'Serban','Catalina','22-MAR-1982','0745600231','serbancatalina@yahoo.com',3300,'19-JAN-2008');
INSERT INTO Proj_Employees VALUES(24,7,7,'Vasilescu','Rares-Christian','12-JUL-1994','0735892211','vasilescu_chris@hotmail',3200,'23-JAN-2008');

INSERT INTO Proj_Employees VALUES(25,8,8,'Popa','Viviana','05-JAN-1987','0729069281','vivi_popa05@yahoo.com',3300,'20-JAN-2008');
INSERT INTO Proj_Employees VALUES(26,8,8,'Predescu','Rosalia Elena','11-MAY-2000','0765929211','rosalia_elena@yahoo.com',3200,'07-JAN-2008');

INSERT INTO Proj_Employees VALUES(27,9,9,'Olaru','Razvan-Iulian','01-NOV-1991','0727236781','olarurazvan@yahoo.com',3200,'25-FEB-2009');
INSERT INTO Proj_Employees VALUES(28,9,9,'Necula','Alexandra','10-MAR-2001','0789429341','neculaa_alex@icloud.com',3200,'27-FEB-2009');

INSERT INTO Proj_Employees VALUES(29,10,10,'Ispasu','Diana Elena','07-JUL-1977','0717948081','ispasudiana0707@gmail.com',3400,'21-FEB-2009');
INSERT INTO Proj_Employees VALUES(30,10,10,'Voicu','Gabriela','16-OCT-1995','0700292119','voicugabriela95@stud.ase.ro',3200,'20-FEB-2009');
INSERT INTO Proj_Employees VALUES(31,10,10,'Buturuga','Bogdan','11-MAR-1997','0728362119','bogdaanbut97@stud.ase.ro',3300,'21-FEB-2009');

--//membership cards

INSERT INTO Proj_MembershipCard VALUES(1,'student',1,'22-JUN-2021',15);
INSERT INTO Proj_MembershipCard VALUES(2,'student',2,'22-JUN-2021',5);
INSERT INTO Proj_MembershipCard VALUES(3,'student',3,'20-APR-2020',35);
INSERT INTO Proj_MembershipCard VALUES(4,'standard',4,'02-MAR-2012',100);
INSERT INTO Proj_MembershipCard VALUES(5,'retired',5,'12-NOV-2018',120);
--points- la fiecare 50 de lei primesti 10 puncte  aka la fiecare 25 primesti 5

--//purchases
INSERT INTO Proj_Purchases VALUES(1,1,4,22,null);
INSERT INTO Proj_Purchases VALUES(2,1,4,27,null);
INSERT INTO Proj_Purchases VALUES(3,1,3,18,null);

INSERT INTO Proj_Purchases VALUES(4,2,3,null,140);

INSERT INTO Proj_Purchases VALUES(5,3,7,44,165);
INSERT INTO Proj_Purchases VALUES(6,3,2,null,255);

INSERT INTO Proj_Purchases VALUES(7,4,6,37,226);
INSERT INTO Proj_Purchases VALUES(8,4,10,63,212);
INSERT INTO Proj_Purchases VALUES(9,4,10,64,206);
INSERT INTO Proj_Purchases VALUES(10,4,1,1,null);
INSERT INTO Proj_Purchases VALUES(11,4,5,null,190);

INSERT INTO Proj_Purchases VALUES(12,5,10,null,371);
INSERT INTO Proj_Purchases VALUES(13,5,4,23,142);
INSERT INTO Proj_Purchases VALUES(14,5,6,null,118);
INSERT INTO Proj_Purchases VALUES(15,5,1,4,null);
INSERT INTO Proj_Purchases VALUES(16,5,7,43,14);
INSERT INTO Proj_Purchases VALUES(17,5,5,28,49);
INSERT INTO Proj_Purchases VALUES(18,5,1,null,87);



--//member prizes
--here you can find the UPDATE
INSERT INTO Proj_MemberPrizes VALUES(1,1);

INSERT INTO Proj_MemberPrizes VALUES(2,null);

INSERT INTO Proj_MemberPrizes VALUES(3,1);
INSERT INTO Proj_MemberPrizes VALUES(3,2);
INSERT INTO Proj_MemberPrizes VALUES(3,3);

INSERT INTO Proj_MemberPrizes VALUES(4,1);
INSERT INTO Proj_MemberPrizes VALUES(4,2);
INSERT INTO Proj_MemberPrizes VALUES(4,3);
INSERT INTO Proj_MemberPrizes VALUES(4,5);
INSERT INTO Proj_MemberPrizes VALUES(4,10);

UPDATE Proj_Membershipcard
SET accumulated_points=150
WHERE id_card=5;

INSERT INTO Proj_MemberPrizes VALUES(5,1);
INSERT INTO Proj_MemberPrizes VALUES(5,2);
INSERT INTO Proj_MemberPrizes VALUES(5,3);
INSERT INTO Proj_MemberPrizes VALUES(5,5);
INSERT INTO Proj_MemberPrizes VALUES(5,10);
INSERT INTO Proj_MemberPrizes VALUES(5,9);

