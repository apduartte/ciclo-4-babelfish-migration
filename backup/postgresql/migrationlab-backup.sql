--
-- PostgreSQL database dump
--

\restrict YrvcgPK0TocSS95GxXmJkHmOIXYgayeWdYbvuuUAmFdd6czO2zBODd0LkYqI5PV

-- Dumped from database version 15.18 (Debian 15.18-1.pgdg13+1)
-- Dumped by pg_dump version 15.18 (Debian 15.18-1.pgdg13+1)

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
-- Name: migration; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA migration;


ALTER SCHEMA migration OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clientes; Type: TABLE; Schema: migration; Owner: postgres
--

CREATE TABLE migration.clientes (
    id integer NOT NULL,
    nome character varying(100),
    criado_em timestamp without time zone DEFAULT now()
);


ALTER TABLE migration.clientes OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: migration; Owner: postgres
--

CREATE SEQUENCE migration.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migration.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: migration; Owner: postgres
--

ALTER SEQUENCE migration.clientes_id_seq OWNED BY migration.clientes.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: migration; Owner: postgres
--

ALTER TABLE ONLY migration.clientes ALTER COLUMN id SET DEFAULT nextval('migration.clientes_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: migration; Owner: postgres
--

COPY migration.clientes (id, nome, criado_em) FROM stdin;
1	Ana Paula	2026-05-19 15:24:31.885529
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: migration; Owner: postgres
--

SELECT pg_catalog.setval('migration.clientes_id_seq', 3, true);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: migration; Owner: postgres
--

ALTER TABLE ONLY migration.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict YrvcgPK0TocSS95GxXmJkHmOIXYgayeWdYbvuuUAmFdd6czO2zBODd0LkYqI5PV

