--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: lookup_bookauthors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookup_bookauthors (
    bookid character varying(17) NOT NULL,
    authorid uuid NOT NULL
);


ALTER TABLE public.lookup_bookauthors OWNER TO postgres;

--
-- Name: tbl_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_authors (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(24) DEFAULT 'Unknown'::character varying NOT NULL,
    birthdate date
);


ALTER TABLE public.tbl_authors OWNER TO postgres;

--
-- Name: tbl_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_books (
    isbn character varying(17) NOT NULL,
    title character varying(64) NOT NULL,
    publisher character varying(64) NOT NULL,
    yearpublished smallint NOT NULL,
    description text DEFAULT 'No Description'::text NOT NULL
);


ALTER TABLE public.tbl_books OWNER TO postgres;

--
-- Data for Name: lookup_bookauthors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lookup_bookauthors (bookid, authorid) FROM stdin;
978-3-16-148410-0	ffabad35-6044-4150-b5ca-bf2eee5b5836
234-3-16-304925-0	ef239e72-2d34-4ff3-bf3a-877546e89aee
256-3-16-304920-0	ef239e72-2d34-4ff3-bf3a-877546e89aee
256-3-16-304920-0	443bac45-55d3-47e2-8290-f3c3367548e2
579-3-16-506594-0	97cf8e84-4c4d-42c7-97e5-c11415f85c8f
759-3-16-342340-0	60ed4e42-43b8-4292-86c6-a038d4396750
359-3-16-234321-0	443bac45-55d3-47e2-8290-f3c3367548e2
359-3-16-234321-0	97cf8e84-4c4d-42c7-97e5-c11415f85c8f
086-3-16-094238-0	5fcadfd9-25ff-44ca-99a0-232dc5bef701
356-3-16-434503-0	60ed4e42-43b8-4292-86c6-a038d4396750
457-3-16-456786-0	ffabad35-6044-4150-b5ca-bf2eee5b5836
247-3-16-345625-0	5fcadfd9-25ff-44ca-99a0-232dc5bef701
135-3-16-456258-0	ffabad35-6044-4150-b5ca-bf2eee5b5836
135-3-16-456258-0	97cf8e84-4c4d-42c7-97e5-c11415f85c8f
135-3-16-456258-0	60ed4e42-43b8-4292-86c6-a038d4396750
321-3-16-789675-0	5fcadfd9-25ff-44ca-99a0-232dc5bef701
\.


--
-- Data for Name: tbl_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_authors (id, name, birthdate) FROM stdin;
ffabad35-6044-4150-b5ca-bf2eee5b5836	Chuck Billiard	1967-01-08
5fcadfd9-25ff-44ca-99a0-232dc5bef701	Gracy Bunkle	1979-02-08
60ed4e42-43b8-4292-86c6-a038d4396750	Trish Grummon	1996-08-06
97cf8e84-4c4d-42c7-97e5-c11415f85c8f	Tommy Talons	1962-11-25
443bac45-55d3-47e2-8290-f3c3367548e2	Heather Grey	2001-01-17
ef239e72-2d34-4ff3-bf3a-877546e89aee	Bjork	1965-10-21
\.


--
-- Data for Name: tbl_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_books (isbn, title, publisher, yearpublished, description) FROM stdin;
978-3-16-148410-0	Good People and Their Dogs	Nice Reads LLC	1987	This is a book about Good People and their dogs.
234-3-16-304925-0	Things That Are Good	Nice Reads LLC	1986	The definative guide to what is good.
256-3-16-304920-0	Eating Cake In The Rain	Nice Reads LLC	1987	This is a book about Good People and their dogs.
579-3-16-506594-0	Godspeed You! Black Emperor	Legend and Myth	2002	The car was on fire. No driver at the wheel
759-3-16-342340-0	Mum - Green Grass of Tunnel	Legend and Myth	2001	Beyond two hills here, there is a brook
359-3-16-234321-0	Sung Tongs	Legend and Myth	2000	Hungry bread and butter hustle... it was only fair
086-3-16-094238-0	Lover, The Lord Has Left Us	Legend and Myth	2005	Float like ants in hose water
356-3-16-434503-0	Sunlandic Twins	Legend and Myth	2006	Well... Bunny aint no kind of rider.
457-3-16-456786-0	How I Know You Lose	Phenomenal Dissent	1987	A collection of short stories about historical failures.
247-3-16-345625-0	I Object!	Phenomenal Dissent	1934	A self help guide being a likeable person.
135-3-16-456258-0	Lemme Double Check	Phenomenal Dissent	1986	Everything is fine.
321-3-16-789675-0	Nope. Nah. Pssh	Phenomenal Dissent	1999	The art of making art is probably subjective, I would imagine.
\.


--
-- Name: lookup_bookauthors lookup_bookauthors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookup_bookauthors
    ADD CONSTRAINT lookup_bookauthors_pkey PRIMARY KEY (bookid, authorid);


--
-- Name: tbl_authors tbl_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_authors
    ADD CONSTRAINT tbl_authors_pkey PRIMARY KEY (id);


--
-- Name: tbl_books tbl_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_books
    ADD CONSTRAINT tbl_books_pkey PRIMARY KEY (isbn);


--
-- Name: idx_authorid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_authorid ON public.lookup_bookauthors USING btree (authorid);


--
-- Name: idx_bookid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bookid ON public.lookup_bookauthors USING btree (bookid);


--
-- Name: lookup_bookauthors fk_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookup_bookauthors
    ADD CONSTRAINT fk_author_id FOREIGN KEY (authorid) REFERENCES public.tbl_authors(id) ON DELETE CASCADE;


--
-- Name: lookup_bookauthors fk_book_isbn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookup_bookauthors
    ADD CONSTRAINT fk_book_isbn FOREIGN KEY (bookid) REFERENCES public.tbl_books(isbn) ON DELETE CASCADE;


--
-- Name: lookup_bookauthors lookup_bookauthors_authorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookup_bookauthors
    ADD CONSTRAINT lookup_bookauthors_authorid_fkey FOREIGN KEY (authorid) REFERENCES public.tbl_authors(id) ON DELETE CASCADE;


--
-- Name: lookup_bookauthors lookup_bookauthors_bookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookup_bookauthors
    ADD CONSTRAINT lookup_bookauthors_bookid_fkey FOREIGN KEY (bookid) REFERENCES public.tbl_books(isbn) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

