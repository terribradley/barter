--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Guest";

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE ratings (
    id integer NOT NULL,
    rating integer
);


ALTER TABLE ratings OWNER TO "Guest";

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ratings_id_seq OWNER TO "Guest";

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE ratings_id_seq OWNED BY ratings.id;


--
-- Name: ratings_users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE ratings_users (
    id integer NOT NULL,
    user_id integer,
    rating_id integer
);


ALTER TABLE ratings_users OWNER TO "Guest";

--
-- Name: ratings_users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE ratings_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ratings_users_id_seq OWNER TO "Guest";

--
-- Name: ratings_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE ratings_users_id_seq OWNED BY ratings_users.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Guest";

--
-- Name: skills; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE skills (
    id integer NOT NULL,
    description character varying,
    user_id integer,
    title character varying
);


ALTER TABLE skills OWNER TO "Guest";

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skills_id_seq OWNER TO "Guest";

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE skills_id_seq OWNED BY skills.id;


--
-- Name: skills_tags; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE skills_tags (
    id integer NOT NULL,
    skill_id integer,
    tag_id integer
);


ALTER TABLE skills_tags OWNER TO "Guest";

--
-- Name: skills_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE skills_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skills_tags_id_seq OWNER TO "Guest";

--
-- Name: skills_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE skills_tags_id_seq OWNED BY skills_tags.id;


--
-- Name: skills_trades; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE skills_trades (
    id integer NOT NULL,
    skill_id integer,
    trade_id integer
);


ALTER TABLE skills_trades OWNER TO "Guest";

--
-- Name: skills_trades_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE skills_trades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skills_trades_id_seq OWNER TO "Guest";

--
-- Name: skills_trades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE skills_trades_id_seq OWNED BY skills_trades.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE tags OWNER TO "Guest";

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO "Guest";

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: tags_users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE tags_users (
    id integer NOT NULL,
    tag_id integer,
    user_id integer
);


ALTER TABLE tags_users OWNER TO "Guest";

--
-- Name: tags_users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE tags_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_users_id_seq OWNER TO "Guest";

--
-- Name: tags_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE tags_users_id_seq OWNED BY tags_users.id;


--
-- Name: trades; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE trades (
    id integer NOT NULL,
    terms text,
    deadline date,
    agree boolean
);


ALTER TABLE trades OWNER TO "Guest";

--
-- Name: trades_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE trades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trades_id_seq OWNER TO "Guest";

--
-- Name: trades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE trades_id_seq OWNED BY trades.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password character varying,
    zipcode integer,
    phone character varying,
    rating integer,
    bio text,
    photo character varying
);


ALTER TABLE users OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ratings ALTER COLUMN id SET DEFAULT nextval('ratings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ratings_users ALTER COLUMN id SET DEFAULT nextval('ratings_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY skills ALTER COLUMN id SET DEFAULT nextval('skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY skills_tags ALTER COLUMN id SET DEFAULT nextval('skills_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY skills_trades ALTER COLUMN id SET DEFAULT nextval('skills_trades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY tags_users ALTER COLUMN id SET DEFAULT nextval('tags_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY trades ALTER COLUMN id SET DEFAULT nextval('trades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2016-07-25 18:05:08.604336	2016-07-25 18:05:08.604336
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ratings (id, rating) FROM stdin;
21	1
22	1
23	5
24	5
25	5
26	5
27	5
28	5
29	5
30	5
31	5
32	5
33	5
34	3
35	3
36	5
37	5
38	1
\.


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('ratings_id_seq', 38, true);


--
-- Data for Name: ratings_users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ratings_users (id, user_id, rating_id) FROM stdin;
16	23	21
17	19	22
18	19	23
19	19	24
20	19	25
21	19	26
22	19	27
23	19	28
24	19	29
25	19	30
26	19	31
27	19	32
28	23	33
29	27	34
30	27	35
31	25	36
32	26	37
33	28	38
\.


--
-- Name: ratings_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('ratings_users_id_seq', 33, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY schema_migrations (version) FROM stdin;
20160725172935
20160725173231
20160725175622
20160725175632
20160725225912
20160726183945
20160726225058
20160727225326
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY skills (id, description, user_id, title) FROM stdin;
11	I swab all the decks	19	Swabbin decks
13	Swimming with monkeys and sea turtles\r\n	19	swimming
15	I can knit you a custom pair of pants. Custom fit, and color. The sky is the limit to my knitting powers. 	24	Knitting pants
16	Custom bikes, built to size and your specifications. 	25	Bike builder
17	Let me transform your space with custom cabinets. Choose from black walnut, oak, or cherry. Specialty hardware available. Allow 2-3 months for design and installation.	25	Custom cabinets
18	I love to bake cookies!	23	Baking
19	If you want to learn from the best, forget the rest. I will teach you to be the next Muhammad Ali, guaranteed.	26	Boxing Lessons
20	The sensual art of tamborine has been misunderestimated for decades. Forget your preconceptions, and join me on a journey. I do weddings as well.	26	Rhythmic Tamborine 
21	I make flowers and awesome green stuff. 	27	Gardening
22	I make a mean loaf of sourdough. 	27	Baking bread
23	I have been classically trained at the Culinary Institute of Peru. I can teach you to braise llama like you've never seen before.	27	Cooking lessons
24	Let's jam woodland style.	28	Jazz flute
25	Atop the highest mountain, or in the deepest sea...even in a tree! I will be there, playing the accordion. Hire me for your next barbecue.	29	All-Terrain Accordion Playing
\.


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('skills_id_seq', 25, true);


--
-- Data for Name: skills_tags; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY skills_tags (id, skill_id, tag_id) FROM stdin;
36	18	16
37	18	17
38	19	15
39	19	18
40	19	20
41	20	21
42	15	17
49	21	19
50	21	20
51	22	16
52	22	19
53	16	15
54	16	17
55	17	17
56	11	20
57	13	15
58	13	18
59	13	20
60	23	16
61	23	18
62	23	19
63	24	18
64	24	21
65	25	15
66	25	21
\.


--
-- Name: skills_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('skills_tags_id_seq', 66, true);


--
-- Data for Name: skills_trades; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY skills_trades (id, skill_id, trade_id) FROM stdin;
21	11	12
23	11	13
33	13	18
39	13	21
40	11	21
43	11	23
45	16	24
46	18	24
\.


--
-- Name: skills_trades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('skills_trades_id_seq', 50, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY tags (id, name) FROM stdin;
15	sports
16	cooking
17	craft
18	education
19	food
20	health
21	music
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('tags_id_seq', 21, true);


--
-- Data for Name: tags_users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY tags_users (id, tag_id, user_id) FROM stdin;
7	17	19
8	15	19
\.


--
-- Name: tags_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('tags_users_id_seq', 8, true);


--
-- Data for Name: trades; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY trades (id, terms, deadline, agree) FROM stdin;
12	please accept my trade	2016-08-05	t
18	more stuff	2016-08-24	t
21	all day!	2016-08-05	f
13	Please accept my awesome cookies	2016-08-06	t
23	test trade for the money	2016-08-06	t
24	Take some rice crispy treats in exchange for a Harley	2016-08-05	t
\.


--
-- Name: trades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('trades_id_seq', 26, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users (id, first_name, last_name, email, password, zipcode, phone, rating, bio, photo) FROM stdin;
20	Admin	Admin	admin	adminpassword	23456	\N	\N	\N	Admin
22	Brett	New	email	BrettNew	34567	\N	\N	\N	Brett
19	Julia	D	email	password	12345	\N	4	Here's a bio about me	Julia
24	Alissa	C	alissaemail	alissapassword	98765	\N	\N	I'm an expert knitter, and base jumper. 	Alissa
23	Brett	New	email	brettpassword	98765	\N	3	\N	Brett
27	Jordan	Meyers	jordanemail	jordanpassword	98765	\N	3	I specialize in organic gardening practices, and permaculture. I also make a mean chocolate chip cookie	Jordan
25	Meg	Jones	megemail	megpassword	98765	\N	5	\N	Meg
26	Mike	Von	mikeemail	mikepassword	98765	\N	5	Boxing is my hobby. Tambourine is my passion. I've been teaching professional tambourine boxing for 12 years, and currently I've got openings for new students.	Mike
28	Penelope	Smith	penelopeemail	penelopepassword	98765	\N	1	\N	Penelope
29	Tim	Burton	timemail	timpassword	98765	\N	\N	I love to trade.	Tim
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('users_id_seq', 29, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: ratings_users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ratings_users
    ADD CONSTRAINT ratings_users_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: skills_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY skills_tags
    ADD CONSTRAINT skills_tags_pkey PRIMARY KEY (id);


--
-- Name: skills_trades_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY skills_trades
    ADD CONSTRAINT skills_trades_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tags_users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY tags_users
    ADD CONSTRAINT tags_users_pkey PRIMARY KEY (id);


--
-- Name: trades_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

