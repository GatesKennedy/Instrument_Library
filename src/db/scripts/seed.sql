--  DB_NAME     DB_USER     DB_PASS     DB_PORT     ENCODING
--  db_library  ohnodamn    instrument  5432        utf8
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  Clean
DROP TABLE IF EXISTS tbl_authors            CASCADE;
DROP TABLE IF EXISTS tbl_books              CASCADE;
DROP TABLE IF EXISTS lookup_bookAuthors     CASCADE;

--  Tool
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--  Table
CREATE TABLE IF NOT EXISTS tbl_authors(
    id          UUID            NOT NULL DEFAULT uuid_generate_v4(),
    name        VARCHAR(24)     NOT NULL DEFAULT 'Unknown',
    birthdate   DATE,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tbl_books(
    ISBN            ISBN13          NOT NULL,
    title           VARCHAR(64)     NOT NULL,
    publisher       VARCHAR(64)     NOT NULL,
    yearPublished   SMALLINT        NOT NULL,
    description     TEXT            NOT NULL DEFAULT 'No Description',
    PRIMARY KEY(ISBN)
);

CREATE TABLE IF NOT EXISTS lookup_bookAuthors(
    ISBN        ISBN13      REFERENCES tbl_books(ISBN) ON DELETE CASCADE,
    authorID    UUID        REFERENCES tbl_authors(id) ON DELETE CASCADE,
    PRIMARY KEY(ISBN, authorID)
);

-- Insert
INSERT INTO tbl_authors(id, name, birthdate)
VALUES 
    ('ffabad35-6044-4150-b5ca-bf2eee5b5836',    'Chuck Billiard',   '1967-01-08'),
    ('5fcadfd9-25ff-44ca-99a0-232dc5bef701',    'Gracy Bunkle',     '1979-02-08'),
    ('60ed4e42-43b8-4292-86c6-a038d4396750',    'Trish Grummon',    '1996-08-06'),
    ('97cf8e84-4c4d-42c7-97e5-c11415f85c8f',    'Tommy Talons',     '1962-11-25'),
    ('443bac45-55d3-47e2-8290-f3c3367548e2',    'Heather Grey',     '2001-01-17'),
    ('ef239e72-2d34-4ff3-bf3a-877546e89aee',    'Bjork',            '1965-10-21')
;

INSERT INTO tbl_books(ISBN, title, publisher, yearPublished, description)
VALUES 
    ('978-3-16-148410-0',   'Good People and Their Dogs',  'Nice Reads LLC',   '1987', 'This is a book about Good People and their dogs.'),
    ('234-3-16-304925-0',   'Things That Are Good',        'Nice Reads LLC',   '1986', 'The definative guide to what is good.'),
    ('256-3-16-304920-0',   'Eating Cake In The Rain',     'Nice Reads LLC',   '1987', 'This is a book about Good People and their dogs.'),
    ('579-3-16-506594-0',   'Godspeed You! Black Emperor', 'Legend and Myth',  '2002', 'The car was on fire. No driver at the wheel'),
    ('759-3-16-342340-0',   'Mum - Green Grass of Tunnel', 'Legend and Myth',  '2001', 'Beyond two hills here, there is a brook'),
    ('359-3-16-234321-0',   'Sung Tongs',                  'Legend and Myth',  '2000',  'Hungry bread and butter hustle... it was only fair'),
    ('086-3-16-094238-0',   'Lover, The Lord Has Left Us', 'Legend and Myth',  '2005', 'Float like ants in hose water'),
    ('356-3-16-434503-0',   'Sunlandic Twins',             'Legend and Myth',  '2006', 'Well... Bunny aint no kind of rider.'),
    ('457-3-16-456786-0',   'How I Know You Lose',         'Phenomenal Dissent', '1987', 'A collection of short stories about historical failures.'),
    ('247-3-16-345625-0',   'I Object!',                   'Phenomenal Dissent', '1934', 'A self help guide being a likeable person.'),
    ('135-3-16-456258-0',   'Lemme Double Check',          'Phenomenal Dissent', '1986'),
    ('321-3-16-789675-0',   'Nope. Nah. Pssh',             'Phenomenal Dissent', '1999', 'The art of making art is probably subjective, I would imagine.'),
;

INSERT INTO lookup_bookAuthors(ISBN, authorID)
VALUES 
    ('978-3-16-148410-0', 'ffabad35-6044-4150-b5ca-bf2eee5b5836'),
    ('234-3-16-304925-0', 'ef239e72-2d34-4ff3-bf3a-877546e89aee'),
    ('256-3-16-304920-0', 'ef239e72-2d34-4ff3-bf3a-877546e89aee'),
    ('256-3-16-304920-0', '443bac45-55d3-47e2-8290-f3c3367548e2'),
    ('579-3-16-506594-0', '97cf8e84-4c4d-42c7-97e5-c11415f85c8f'),
    ('759-3-16-342340-0', '60ed4e42-43b8-4292-86c6-a038d4396750'),
    ('359-3-16-234321-0', '443bac45-55d3-47e2-8290-f3c3367548e2'),
    ('359-3-16-234321-0', '97cf8e84-4c4d-42c7-97e5-c11415f85c8f'),
    ('086-3-16-094238-0', '5fcadfd9-25ff-44ca-99a0-232dc5bef701'),
    ('356-3-16-434503-0', '60ed4e42-43b8-4292-86c6-a038d4396750'),
    ('457-3-16-456786-0', 'ffabad35-6044-4150-b5ca-bf2eee5b5836'),
    ('247-3-16-345625-0', '5fcadfd9-25ff-44ca-99a0-232dc5bef701'),
    ('135-3-16-456258-0', 'ffabad35-6044-4150-b5ca-bf2eee5b5836'),
    ('135-3-16-456258-0', '97cf8e84-4c4d-42c7-97e5-c11415f85c8f'),
    ('135-3-16-456258-0', 'ffabad35-6044-4150-b5ca-bf2eee5b5836'),
    ('321-3-16-789675-0', '5fcadfd9-25ff-44ca-99a0-232dc5bef701')
;



-- Index
CREATE INDEX idx_ISBN       ON lookup_bookAuthors(ISBN);
CREATE INDEX idx_authorID   ON lookup_bookAuthors(authorID);