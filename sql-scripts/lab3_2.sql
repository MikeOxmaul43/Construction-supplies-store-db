CREATE DATABASE library;
\c library

CREATE TABLE book (
                      id SERIAL,
                      title TEXT,
                      publication_date DATE,
                      copies_count INTEGER,
                      isbn VARCHAR(20),
                      storage_id INTEGER,
                      publisher_id INTEGER
);

CREATE TABLE author (
                        id SERIAL,
                        name VARCHAR(100),
                        country VARCHAR(100)
);

CREATE TABLE book_author (
                             author_id INTEGER,
                             book_id INTEGER,
                             writing_date DATE
);

CREATE TABLE storage_location (
                                  id SERIAL,
                                  cabinet INTEGER,
                                  shelf INTEGER,
                                  room INTEGER
);

CREATE TABLE publisher (
                           id SERIAL,
                           name VARCHAR(100),
                           email VARCHAR(100),
                           phone VARCHAR(20),
                           address TEXT
);

CREATE TABLE fine (
                      id SERIAL,
                      reason TEXT,
                      penalty TEXT,
                      added_date DATE,
                      is_active BOOLEAN
);

CREATE TABLE loan (
                      id SERIAL,
                      issue_date DATE,
                      return_date DATE
);

CREATE TABLE reservation (
                             id SERIAL,
                             start_date DATE,
                             end_date DATE
);

CREATE TABLE librarian (
                           id SERIAL,
                           name VARCHAR(100),
                           phone VARCHAR(20),
                           email VARCHAR(100)
);

CREATE TABLE student (
                         id SERIAL,
                         name VARCHAR(100),
                         class_number INTEGER,
                         phone VARCHAR(20),
                         fines_count INTEGER
);

INSERT INTO author (name, country)
VALUES ('Leo Tolstoy', 'Russia');

INSERT INTO publisher (name, email, phone, address)
VALUES ('Eksmo', 'info@eksmo.ru', '+79991234567', 'Moscow');

INSERT INTO storage_location (cabinet, shelf, room)
VALUES (1, 2, 101);

INSERT INTO book (title, publication_date, copies_count, isbn, storage_id, publisher_id)
VALUES ('War and Peace', '1869-01-01', 5, '9785170674535', 1, 1);

INSERT INTO librarian (name, phone, email)
VALUES ('Anna Petrova', '+79990001122', 'anna@library.ru');

INSERT INTO student (name, class_number, phone, fines_count)
VALUES ('Ivan Ivanov', 10, '+79998887766', 0);

INSERT INTO fine (reason, penalty, added_date, is_active)
VALUES ('Late return', 'Warning', '2025-03-01', TRUE);

INSERT INTO loan (issue_date, return_date)
VALUES ('2025-03-01', '2025-03-15');

INSERT INTO reservation (start_date, end_date)
VALUES ('2025-03-05', '2025-03-10');

INSERT INTO book_author (author_id, book_id, writing_date)
VALUES (1, 1, '1867-01-01');


ALTER TABLE book
    ADD COLUMN genre VARCHAR(50);

ALTER TABLE student
    ADD COLUMN birth_date DATE;

ALTER TABLE librarian
    ADD COLUMN hire_date DATE;


ALTER TABLE student
    ALTER COLUMN fines_count TYPE SMALLINT;

ALTER TABLE publisher
    RENAME COLUMN phone TO contact_phone;

ALTER TABLE fine
    DROP COLUMN penalty;


ALTER TABLE book
    ADD CONSTRAINT fk_book_storage
        FOREIGN KEY (storage_id)
            REFERENCES storage_location(id);

ALTER TABLE book
    ADD CONSTRAINT fk_book_publisher
        FOREIGN KEY (publisher_id)
            REFERENCES publisher(id);

ALTER TABLE book_author
    ADD CONSTRAINT fk_book_author_author
        FOREIGN KEY (author_id)
            REFERENCES author(id);

ALTER TABLE book_author
    ADD CONSTRAINT fk_book_author_book
        FOREIGN KEY (book_id)
            REFERENCES book(id);


ALTER TABLE book
    ADD CONSTRAINT pk_book PRIMARY KEY (id);

ALTER TABLE author
    ADD CONSTRAINT pk_author PRIMARY KEY (id);

ALTER TABLE student
    ADD CONSTRAINT pk_student PRIMARY KEY (id);

ALTER TABLE book
    ADD CONSTRAINT unique_isbn UNIQUE (isbn);

ALTER TABLE book
    ADD CONSTRAINT check_copies_positive
        CHECK (copies_count >= 0);

ALTER TABLE book_author
    DROP CONSTRAINT fk_book_author_book;

ALTER TABLE book_author
    ADD CONSTRAINT fk_book_author_book
        FOREIGN KEY (book_id)
            REFERENCES book(id)
            ON DELETE CASCADE;

DROP TABLE IF EXISTS book_author;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS storage_location;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS book_reservation;
DROP TABLE IF EXISTS librarian;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS library_fine;

\c postgres;
DROP DATABASE library;