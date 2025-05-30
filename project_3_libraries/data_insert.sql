DROP TABLE authors;
CREATE TABLE authors(
    id              NUMBER(3) NOT NULL,
    name            VARCHAR2(30),
    surname         VARCHAR2(30),
    gender          CHAR(1)
);

DROP TABLE books;
CREATE TABLE books(
    id              NUMBER(4) NOT NULL,
    name            VARCHAR2(50),
    id_author       NUMBER(3),
    id_dept         NUMBER(1),
    rating          NUMBER(1),
    borrowed        NUMBER(1) 
);

DROP TABLE departments;
CREATE TABLE departments(
    id              NUMBER(1) NOT NULL,
    genre           VARCHAR2(20),
    street          VARCHAR2(30),
    capacity        NUMBER(4),
    id_librarian    NUMBER(3)
);
    
DROP TABLE librarians;
CREATE TABLE librarians(
    id              NUMBER(3) NOT NULL,
    name            VARCHAR2(30),
    surname         VARCHAR2(30),
    stock_taker     NUMBER(1)
);
----------------------------------------------------------------------------------------------------
DROP SEQUENCE seq_authors;
CREATE SEQUENCE seq_authors START WITH 1 INCREMENT BY 1 NOCACHE;

DROP SEQUENCE seq_books;
CREATE SEQUENCE seq_books START WITH 1 INCREMENT BY 1 NOCACHE;

DROP SEQUENCE seq_departments;
CREATE SEQUENCE seq_departments START WITH 1 INCREMENT BY 1 NOCACHE;

DROP SEQUENCE seq_librarians;
CREATE SEQUENCE seq_librarians START WITH 1 INCREMENT BY 1 NOCACHE;

----------------------------------------------------------------------------------------------------
TRUNCATE TABLE authors;

INSERT INTO authors VALUES (seq_authors.nextVal, 'Liana', 'Kartouzská', 'f');
INSERT INTO authors VALUES (seq_authors.nextVal, 'Hermann', 'Schmidt', 'm'); 
INSERT INTO authors VALUES (seq_authors.nextVal, 'Peter', 'Ennis', 'm'); 
INSERT INTO authors VALUES (seq_authors.nextVal, 'Irene', 'Berlioz', 'f'); 
INSERT INTO authors VALUES (seq_authors.nextVal, 'Lene', 'Ulrich', 'f'); 
INSERT INTO authors VALUES (seq_authors.nextVal, 'Rene', 'Trevis', 'm'); 

----------------------------------------------------------------------------------------------------
TRUNCATE TABLE books;


INSERT INTO books VALUES (seq_books.nextVal, 'The Dragon''s Call', 1, 1, 5, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Mystic Realms', 2, 1, 4, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'The Enchanted Forest', 3, 1, 5, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Legend of the Phoenix', 4, 1, 3, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'The Wizard''s Quest', 5, 1, 4, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Realm of Magic', 6, 1, 5, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Tales of the Ancients', 1, 1, 4, 1);


INSERT INTO books VALUES (seq_books.nextVal, 'Galactic Wars', 5, 2, 5, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'The Quantum Enigma', 6, 2, 4, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Time Travelers', 1, 2, 5, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Alien Invasion', 2, 2, 4, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Mars Colony', 3, 2, 3, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Future Frontiers', 4, 2, 5, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Robo-Revolution', 5, 2, 4, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Space Explorers', 6, 2, 5, 1);


INSERT INTO books VALUES (seq_books.nextVal, 'Love in Paris', 3, 3, 5, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'A Heart''s Journey', 4, 3, 4, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Eternal Flame', 5, 3, 5, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Whispered Promises', 6, 3, 4, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'The Secret Admirer', 1, 3, 5, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Romance by the Lake', 2, 3, 4, 0);


INSERT INTO books VALUES (seq_books.nextVal, 'Old World Tales', 1, 4, 5, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Timeless Stories', 2, 4, 4, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'The Forgotten Chronicles', 3, 4, 5, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Ancient Legends', 4, 4, 3, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Classic Adventures', 5, 4, 4, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Historical Epics', 6, 4, 5, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Myths of Old', 1, 4, 4, 0);
INSERT INTO books VALUES (seq_books.nextVal, 'Tales of Yore', 2, 4, 5, 1);
INSERT INTO books VALUES (seq_books.nextVal, 'Legends Revisited', 3, 4, 4, 0);

----------------------------------------------------------------------------------------------------
TRUNCATE TABLE departments;

INSERT INTO departments VALUES (seq_departments.nextVal, 'Fantasy', 'Wallace', 50, 1);
INSERT INTO departments VALUES (seq_departments.nextVal, 'Science Fiction', 'Hight', 40, 2);
INSERT INTO departments VALUES (seq_departments.nextVal, 'Romance', 'Oak', 50, 3);
INSERT INTO departments VALUES (seq_departments.nextVal, 'Classics', 'Victory', 45, 4);

----------------------------------------------------------------------------------------------------
TRUNCATE TABLE librarians;

INSERT INTO librarians VALUES (seq_librarians.nextVal, 'Emily', 'Carter', 1);
INSERT INTO librarians VALUES (seq_librarians.nextVal, 'Oliver', 'Stone', 0);
INSERT INTO librarians VALUES (seq_librarians.nextVal, 'Emma', 'Watson', 1);
INSERT INTO librarians VALUES (seq_librarians.nextVal, 'Sophia', 'Miller', 0);
INSERT INTO librarians VALUES (seq_librarians.nextVal, 'Ava', 'Taylor', 1);
INSERT INTO librarians VALUES (seq_librarians.nextVal, 'Mia', 'Anderson', 0);
INSERT INTO librarians VALUES (seq_librarians.nextVal, 'Noah', 'Martin', 1);
INSERT INTO librarians VALUES (seq_librarians.nextVal, 'Ethan', 'Moore', 0);

--dROP TABLE LIBRARIANS;
--dROP TABLE DEPARTMENTS;
--DROP TABLE AUTHORS;
--DROP TABLE BOOKS;
