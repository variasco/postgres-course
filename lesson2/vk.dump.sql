--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: subscriptions_communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscriptions_communities (
    id integer NOT NULL,
    subscriber_id integer NOT NULL,
    to_community_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.subscriptions_communities OWNER TO gb_user;

--
-- Name: subscriptions_communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.subscriptions_communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_communities_id_seq OWNER TO gb_user;

--
-- Name: subscriptions_communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.subscriptions_communities_id_seq OWNED BY public.subscriptions_communities.id;


--
-- Name: subscriptions_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscriptions_users (
    id integer NOT NULL,
    subscriber_id integer NOT NULL,
    to_user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.subscriptions_users OWNER TO gb_user;

--
-- Name: subscriptions_users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.subscriptions_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_users_id_seq OWNER TO gb_user;

--
-- Name: subscriptions_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.subscriptions_users_id_seq OWNED BY public.subscriptions_users.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: subscriptions_communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_communities ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_communities_id_seq'::regclass);


--
-- Name: subscriptions_users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_users ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_users_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
416	faucibus lectus, a	63	2021-11-09 10:11:21
417	ut eros	50	2022-03-31 22:34:07
418	In mi	80	2022-01-03 22:15:28
419	sed dolor. Fusce	85	2022-07-05 00:46:33
420	et, lacinia	29	2021-12-14 22:53:36
421	nunc sed libero.	17	2022-07-20 20:32:37
422	erat. Sed nunc	21	2022-07-08 10:55:18
423	pede	12	2021-10-03 21:15:11
424	quam. Pellentesque habitant	40	2021-10-28 06:25:41
425	sit	83	2021-12-07 15:15:15
426	placerat eget, venenatis	95	2021-12-21 18:12:09
427	eu, placerat	95	2022-01-01 04:37:09
428	inceptos hymenaeos.	23	2022-03-04 11:16:20
429	aliquet,	14	2022-08-19 17:06:07
430	eleifend vitae, erat.	68	2022-05-04 00:09:02
431	velit. Quisque	84	2022-04-14 00:42:32
432	accumsan interdum	8	2022-05-21 18:19:13
433	ante	12	2022-07-25 22:33:34
434	pede, malesuada vel,	78	2022-09-15 15:50:31
435	Quisque ornare tortor	41	2022-07-28 13:24:59
436	elit.	70	2022-04-14 11:17:51
437	habitant morbi tristique	16	2021-10-18 07:31:30
438	enim. Suspendisse	83	2022-02-26 06:50:16
439	eget, volutpat	25	2022-04-07 00:43:07
440	a purus.	8	2022-01-21 19:36:45
441	dolor. Fusce	8	2021-11-25 10:21:49
442	quis massa.	93	2022-03-01 20:12:44
443	Nunc lectus pede,	92	2022-08-18 22:04:00
444	consectetuer rhoncus.	74	2021-10-12 09:46:36
445	Donec fringilla. Donec	64	2022-09-06 01:33:49
446	at, iaculis quis,	93	2022-06-15 00:00:23
447	aliquet, metus	7	2021-12-16 08:39:49
448	risus.	22	2021-12-22 12:08:48
449	dignissim	61	2022-04-26 02:06:56
450	Integer	62	2022-06-12 10:49:24
451	vitae, orci. Phasellus	83	2022-01-07 19:37:47
452	lobortis augue	12	2022-08-08 13:17:20
453	Sed nunc	86	2022-02-18 19:42:10
454	amet ornare	28	2022-04-18 09:20:17
455	arcu.	65	2022-03-10 00:10:45
456	vel arcu	11	2022-03-11 10:29:01
457	Proin nisl	69	2022-02-13 05:12:30
458	amet	83	2022-08-23 03:47:00
459	elit elit fermentum	77	2022-09-09 18:12:18
460	ullamcorper, nisl	85	2021-12-14 19:36:49
461	sem, consequat nec,	78	2022-05-26 12:40:42
462	dolor.	10	2022-06-24 11:35:16
463	cursus. Integer	94	2022-06-18 16:54:24
464	leo.	30	2022-03-01 13:26:06
465	Cum	33	2022-03-13 19:08:15
466	ut eroso	94	2022-01-27 12:43:27
467	nibh dolor,	32	2021-12-15 23:54:10
468	ipsum dolor	52	2022-01-22 08:16:37
469	eu	19	2022-02-23 08:47:46
470	adipiscing	3	2022-09-07 04:11:32
471	aliquet	5	2022-04-02 05:59:53
472	eget	46	2021-09-22 17:57:37
473	ac tellus. Suspendisse	94	2021-11-25 10:25:52
474	lacus.	67	2021-10-29 09:33:35
475	habitant morbi tristiq	48	2022-06-02 23:38:38
476	augue	53	2022-08-31 13:32:18
477	vulputate	78	2022-06-15 17:41:04
478	vitae, posuere	1	2022-03-07 13:10:57
479	consequat enim diam	94	2021-11-05 05:23:25
480	tincidunt aliquam	82	2022-08-31 19:03:38
481	felis orci, adipiscing	18	2022-07-07 07:53:32
482	neque.	38	2022-08-10 15:20:19
483	tincidunt nibh.	21	2022-02-26 01:32:44
484	Cras eget	23	2022-07-30 22:59:23
485	dignisim	8	2021-09-26 21:41:34
486	pede sagittis	97	2021-10-14 21:07:34
487	mi pede,	66	2022-07-28 06:57:23
488	congue,	4	2022-03-25 13:04:27
489	nec ligula	69	2022-09-18 00:24:00
490	Cras vehicula	43	2021-10-30 19:46:29
491	tempor, est	48	2022-02-10 12:18:36
492	interdum enim	50	2021-11-04 13:17:59
493	morbi tristique	26	2021-09-24 10:07:48
494	ante. Maecenas	93	2022-04-22 04:59:40
495	neque. Sed eget	8	2022-05-05 16:27:08
496	tellus	76	2021-12-03 04:53:26
497	sit amet	50	2022-01-07 14:10:15
498	tempus scelerisque,	4	2022-02-06 07:34:44
499	ipsum. Suspendisse non	13	2022-04-12 03:13:46
500	Pellentesque habitant	4	2021-11-24 20:32:33
501	amet, consectetuer	73	2022-05-05 03:06:50
502	cursus luctus,	39	2022-03-08 22:57:07
503	est.	45	2022-01-20 04:48:52
504	augue scelerisque	11	2021-12-01 12:32:16
505	sollicitudin commodo ipsum.	39	2022-06-03 20:08:02
506	cursuss Integer	91	2022-02-19 04:32:53
507	lacus	93	2021-12-24 03:23:03
508	sagittis. Duis	83	2022-02-19 20:55:47
509	aliquam eu, accumsan	75	2022-05-22 13:26:45
510	Suspendisse commodo	48	2022-05-12 17:31:25
511	lacus. Nulla	84	2022-02-24 08:42:19
512	blandit congue. In	76	2021-12-28 01:13:47
513	hymenaeos.	63	2022-09-15 14:38:33
514	elit. Nulla	23	2021-12-05 12:05:41
515	montes, nascetur	10	2021-10-24 20:47:28
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
94	99	2022-03-28 05:38:38
2	24	2022-02-26 16:34:46
76	62	2022-09-04 23:01:05
11	56	2022-05-10 06:53:44
88	45	2022-01-15 13:01:13
79	59	2022-08-21 18:01:35
2	35	2022-06-02 11:37:26
38	25	2022-02-12 16:11:25
25	96	2022-09-07 19:07:44
41	8	2022-07-02 20:51:51
47	48	2022-04-10 23:08:00
77	6	2022-05-20 11:31:56
3	78	2022-06-07 16:35:15
34	14	2021-10-07 09:40:09
2	99	2021-12-29 09:27:08
42	20	2022-04-17 09:55:11
88	38	2022-08-11 09:42:58
87	83	2022-06-01 16:47:24
95	22	2022-01-10 05:01:07
56	25	2022-06-13 23:32:35
61	29	2022-02-09 00:25:44
78	61	2021-10-23 00:59:09
92	82	2022-06-30 02:24:44
39	21	2022-08-31 16:18:35
51	88	2022-04-25 20:27:16
78	73	2022-02-23 08:09:52
70	91	2022-08-14 05:39:49
63	60	2022-06-10 10:52:35
90	80	2022-02-24 08:17:33
84	61	2022-09-17 09:36:26
43	59	2022-02-21 13:06:21
70	28	2022-01-30 02:04:48
90	84	2021-12-15 23:45:43
32	20	2021-11-11 03:21:09
72	2	2022-01-05 03:19:17
64	91	2021-11-27 16:42:06
55	16	2021-12-26 05:49:46
42	63	2022-05-03 16:20:55
43	39	2022-02-06 15:32:43
99	37	2022-03-15 03:15:07
85	36	2022-07-21 12:25:10
22	48	2022-03-26 14:46:44
23	99	2021-09-24 13:48:10
11	44	2022-06-17 19:08:10
13	13	2022-04-14 03:33:36
99	80	2022-01-06 03:15:29
20	58	2021-11-30 17:13:30
57	40	2022-02-22 19:27:50
19	28	2022-03-19 09:37:29
16	84	2022-07-15 17:54:40
100	29	2021-11-07 15:24:47
54	93	2022-03-27 12:10:12
70	47	2022-07-12 13:12:47
26	78	2021-11-16 04:32:15
97	99	2022-08-22 01:17:21
70	56	2021-10-06 11:45:32
70	9	2021-11-06 06:17:38
25	42	2022-04-26 18:17:47
49	52	2021-11-20 21:50:39
78	68	2021-12-08 00:46:42
48	84	2021-10-30 22:03:10
82	82	2022-06-28 16:41:01
59	85	2022-02-25 15:59:46
85	71	2022-06-10 08:28:54
94	23	2022-08-05 15:16:57
52	58	2022-01-19 23:30:11
17	6	2021-12-17 21:20:04
37	8	2021-12-24 21:36:41
27	25	2022-07-24 13:25:13
44	10	2022-02-20 03:47:14
51	30	2021-09-21 23:21:32
3	42	2021-10-23 14:24:05
18	97	2022-02-03 20:09:03
21	78	2022-03-24 05:15:55
38	70	2021-11-16 08:58:18
13	10	2022-04-27 03:56:04
49	45	2022-03-30 09:00:37
62	44	2021-10-28 19:19:57
21	40	2022-06-26 09:01:05
23	70	2022-07-29 09:44:36
18	2	2022-06-12 07:54:59
95	61	2022-01-11 17:46:19
90	40	2022-04-27 19:24:28
11	91	2022-04-03 13:12:19
53	94	2022-08-26 02:45:15
98	25	2022-05-06 21:04:54
12	57	2021-09-22 21:04:34
42	47	2021-12-20 21:44:34
84	35	2022-04-07 22:48:40
66	87	2021-10-01 18:46:59
93	71	2021-12-26 18:42:44
34	65	2022-09-09 16:00:14
89	96	2022-06-30 20:50:03
85	66	2021-09-19 00:00:11
65	39	2022-08-28 12:25:43
22	9	2022-05-21 14:06:34
68	13	2021-09-20 03:12:39
2	74	2022-01-19 18:44:27
17	20	2022-02-10 00:07:08
22	80	2022-08-21 14:30:51
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	36	77	2	2022-05-15 15:17:26	2022-01-15 00:33:09
2	27	57	2	2021-12-19 14:12:35	2022-03-30 11:52:57
3	38	18	3	2022-01-27 10:27:00	2022-01-26 19:32:05
4	55	73	2	2022-05-28 17:11:35	2022-04-26 23:14:57
5	62	3	2	2022-08-22 04:30:41	2022-09-07 03:36:03
6	32	19	2	2021-11-12 23:37:01	2021-12-08 20:19:28
7	31	16	3	2022-08-11 16:19:49	2021-12-02 01:53:16
8	17	3	3	2022-01-09 23:38:05	2022-07-16 22:13:05
9	92	78	3	2022-03-01 14:16:20	2022-06-15 19:05:17
10	8	37	1	2022-02-21 20:32:53	2022-07-08 22:35:14
11	95	20	2	2022-08-02 03:50:52	2022-05-10 17:46:24
12	90	46	3	2022-05-12 08:42:30	2021-10-15 00:05:50
13	33	24	1	2022-01-09 07:51:07	2021-12-07 13:29:19
14	15	26	1	2021-11-04 06:46:07	2021-11-02 03:12:38
15	52	77	1	2022-02-04 21:53:28	2021-12-25 11:12:17
16	4	52	3	2021-11-20 05:55:44	2022-04-14 11:41:18
17	84	80	1	2021-10-31 00:19:25	2022-05-17 07:27:52
18	65	12	2	2021-10-01 16:41:10	2022-04-06 01:55:55
19	78	8	1	2022-04-21 11:20:33	2022-07-06 13:55:06
20	42	56	2	2021-09-24 05:33:57	2022-06-30 05:55:09
21	87	1	1	2022-08-17 17:27:26	2022-08-15 04:53:32
22	92	33	2	2021-10-05 18:14:03	2021-12-12 03:00:49
23	73	92	3	2022-08-17 17:09:03	2022-06-09 06:00:05
24	43	72	3	2022-06-22 10:46:59	2022-01-23 18:57:45
25	20	89	2	2022-09-03 16:13:22	2021-12-09 05:50:37
26	94	7	2	2021-11-20 22:58:21	2022-03-10 18:10:41
27	23	85	1	2021-09-19 09:01:48	2022-01-01 22:28:53
28	37	78	2	2022-07-07 08:34:53	2021-12-02 14:59:01
29	17	67	3	2022-03-27 23:16:22	2022-07-14 11:10:29
30	17	42	1	2021-10-25 09:04:39	2022-04-05 19:01:12
31	19	58	2	2022-04-25 00:41:53	2022-02-01 20:57:36
32	80	98	1	2022-05-21 15:55:58	2022-07-06 03:24:22
33	51	8	2	2022-08-03 05:44:49	2022-01-18 10:20:35
34	9	100	3	2021-10-17 06:43:00	2021-11-15 17:02:42
35	91	13	1	2022-01-03 05:31:14	2021-11-16 21:58:36
36	60	48	1	2022-07-04 16:41:38	2021-10-07 08:22:56
37	55	32	2	2022-03-15 18:34:59	2022-03-01 10:30:24
38	95	62	3	2021-11-08 18:00:03	2022-01-05 23:57:33
39	70	30	3	2021-11-18 14:03:28	2021-10-30 18:08:18
40	93	50	3	2021-11-08 01:51:04	2022-05-12 21:20:11
41	86	17	3	2022-09-12 18:38:43	2022-08-25 05:07:56
42	19	76	3	2022-04-19 14:01:25	2022-01-25 16:37:54
43	73	7	3	2022-01-16 20:31:02	2021-11-21 13:24:54
44	56	70	1	2022-04-10 09:45:57	2022-04-26 02:34:35
45	29	39	1	2022-05-01 02:43:59	2022-08-10 15:06:43
46	9	88	2	2021-12-07 20:06:25	2021-12-28 17:17:34
47	81	99	2	2021-12-05 05:19:31	2022-01-04 02:50:48
48	20	9	3	2022-01-02 00:52:30	2021-10-19 13:09:48
49	70	26	1	2022-04-26 04:05:47	2022-04-04 10:24:52
50	31	93	3	2022-04-10 06:32:27	2021-10-11 02:04:15
51	65	10	2	2022-05-08 22:08:13	2022-03-14 13:53:57
52	79	39	1	2021-12-30 06:33:01	2022-05-04 20:15:57
53	46	3	2	2022-03-17 10:03:50	2022-08-09 05:44:29
54	36	26	1	2021-12-06 09:40:59	2021-11-11 16:05:13
55	59	7	2	2021-10-03 12:17:17	2022-09-10 20:10:20
56	5	95	1	2022-03-24 04:20:07	2021-12-21 00:51:40
57	6	6	3	2021-09-28 16:04:18	2022-03-31 01:54:34
58	83	7	2	2022-07-04 20:28:29	2022-08-31 17:44:50
59	47	57	3	2021-11-02 00:26:58	2022-02-21 13:40:43
60	31	33	3	2021-11-28 18:12:06	2022-08-01 17:33:54
61	46	51	2	2021-10-19 16:14:19	2022-02-08 07:26:00
62	82	7	3	2022-02-21 20:29:35	2022-02-15 22:43:22
63	6	34	2	2022-07-25 08:10:32	2022-07-02 00:12:31
64	75	32	3	2021-09-24 15:42:42	2021-12-10 08:48:15
65	18	94	2	2021-10-28 11:39:56	2022-02-14 09:22:16
66	10	68	2	2022-05-20 04:05:19	2021-12-27 05:50:38
67	30	61	2	2022-02-18 23:53:24	2022-07-03 04:54:32
68	9	48	2	2021-11-06 22:35:08	2022-03-25 19:26:21
69	50	77	2	2022-06-26 01:58:24	2022-07-02 20:14:16
70	1	83	2	2022-03-25 06:26:17	2022-04-11 02:18:25
71	78	38	2	2022-01-01 06:53:41	2022-07-01 13:35:13
72	69	74	3	2021-11-07 17:13:29	2022-06-05 23:52:42
73	19	69	2	2021-10-19 15:21:28	2021-10-11 01:41:29
74	55	83	2	2022-02-14 04:46:51	2022-07-27 03:09:20
75	53	31	2	2022-06-01 16:46:36	2022-04-22 10:49:37
76	79	80	2	2022-04-08 12:13:29	2022-03-16 00:55:17
77	24	89	1	2021-10-30 23:00:37	2022-07-30 21:19:02
78	88	87	2	2022-03-24 12:33:51	2021-12-18 07:13:06
79	71	65	1	2022-07-26 08:58:28	2022-01-16 07:29:05
80	3	95	1	2022-08-09 08:56:06	2021-11-25 18:28:52
81	38	74	2	2022-07-07 21:52:50	2022-04-30 06:31:45
82	51	46	2	2022-01-08 05:34:34	2021-10-15 12:23:02
83	42	17	2	2022-06-02 22:12:53	2021-09-29 11:34:20
84	68	55	1	2021-10-11 04:31:25	2021-12-01 21:54:48
85	97	28	2	2022-09-15 16:45:29	2021-12-13 15:42:00
86	12	100	2	2021-10-16 22:39:18	2022-09-06 11:41:00
87	48	32	2	2021-10-12 18:46:17	2022-09-16 19:00:30
88	69	57	3	2022-04-07 04:41:37	2021-10-25 21:41:51
89	67	76	2	2022-03-25 21:29:01	2022-08-28 21:52:24
90	29	95	1	2022-03-29 19:51:12	2021-09-23 20:46:00
91	18	67	2	2021-09-29 12:58:32	2021-12-19 22:20:27
92	13	61	2	2022-09-15 06:27:04	2022-06-08 01:35:26
93	39	7	2	2021-12-04 00:05:47	2022-08-19 02:27:42
94	65	13	3	2022-01-08 16:16:54	2022-09-07 07:53:00
95	45	73	2	2021-10-27 22:27:07	2022-06-08 11:42:24
96	95	18	1	2021-10-05 08:58:31	2022-01-19 22:26:15
97	61	33	1	2022-09-10 09:08:39	2022-02-24 12:46:40
98	64	81	3	2022-09-07 16:07:18	2021-10-03 09:32:39
99	84	64	1	2022-08-07 03:15:48	2022-02-09 10:53:33
100	83	23	1	2022-07-07 04:02:48	2022-06-16 14:21:32
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	requested
2	declined
3	approved
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	17	37	nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam	t	t	2021-11-24 22:07:35
2	47	77	natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel	f	t	2022-06-01 17:12:52
3	61	83	arcu. Curabitur ut odio vel est	f	t	2021-10-22 12:48:11
4	100	77	Suspendisse non leo. Vivamus	t	t	2021-11-06 12:21:55
5	42	82	ut, sem. Nulla interdum. Curabitur dictum.	t	t2021-11-07 14:51:17
6	56	60	varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor	t	t	2021-12-19 16:07:24
7	92	62	mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis	f	f	2022-05-14 09:34:37
8	72	37	volutpat. Nulla dignissim. Maecenas ornare egestas ligula.	t	t	2022-01-05 12:39:34
9	2	80	odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque	f	f	2022-06-28 00:46:35
10	41	81	ultrices posuere cubilia Curae Donec tincidunt. Donec	tf	2022-02-10 17:16:56
11	59	44	malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce	f	t	2022-05-19 06:45:34
12	27	2	fermentum arcu. Vestibulum ante ipsum primis in faucibust	t	2021-12-03 23:48:35
13	97	65	molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,	f	f	2022-01-29 15:42:56
14	33	63	Cras eu tellus eu augue porttitor interdum. Sed auctor odio	t	t	2021-12-02 13:35:33
15	35	5	Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec,	t	f	2021-12-21 20:36:19
16	86	17	enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus	f	t	2021-09-21 04:58:01
17	7	64	nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus	t	f	2022-06-14 12:10:31
18	6	48	lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet	f	f	2022-08-25 08:53:44
19	3	23	sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.	f	f	2022-05-24 19:52:04
20	15	4	ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla,	t	f	2022-01-21 11:22:40
21	40	39	sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida.	t	t	2022-03-14 16:39:28
22	99	81	non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer	t	f	2022-04-03 02:00:18
23	56	97	fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus	t	f	2021-11-29 14:19:27
24	63	66	felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi	ft	2021-10-16 04:51:11
25	29	35	sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat.	t	t2022-04-10 12:32:36
26	100	21	sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis	f	f	2022-01-10 15:52:02
27	72	14	Ut sagittis	f	t	2022-08-09 17:55:19
28	75	65	ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam	f	t	2022-07-31 19:33:36
29	13	1	at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec	t	t	2021-12-22 07:48:57
30	70	26	leo. Cras vehicula aliquet	t	f	2022-02-27 12:51:49
31	14	60	mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin	f	f	2022-04-12 00:44:12
32	32	14	feugiat placerat velit. Quisque varius. Nam porttitor scelerisque	f	f	2022-01-24 20:19:09
33	8	98	fermentum convallis ligula. Donec luctus aliquet	tt	2021-11-20 11:36:35
34	10	23	consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut	t	f	2022-03-24 06:47:13
35	73	35	dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc	t	t	2021-12-11 03:34:21
36	35	6	euismod et, commodo at, libero. Morbi	f	t	2021-09-20 16:26:20
37	66	97	dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim	f	f	2022-03-03 01:03:19
38	51	32	semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy	f	f	2022-07-17 13:57:57
39	6	87	a sollicitudin orci	t	t	2022-05-12 17:57:35
40	60	48	interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy	f	f	2022-01-11 03:35:19
41	63	85	auctor odio a purus. Duis elementum, dui quis	t	t2021-11-24 01:56:04
42	13	53	elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae	t	t	2022-04-17 12:48:19
43	13	17	sagittis. Duis gravida. Praesent	f	t	2022-05-24 01:11:54
44	35	5	risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod	f	f	2022-02-09 09:52:19
45	3	4	feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque	t	t	2021-11-23 01:01:54
46	45	77	quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent	f	t	2022-03-23 18:52:51
47	39	66	sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel	f	t	2021-11-15 00:16:53
48	95	64	orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In	f	t	2022-01-23 04:44:03
49	69	2	penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus.	f	f	2022-02-08 15:31:29
50	17	96	diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat,	t	f	2022-01-26 21:37:27
51	79	45	est, congue	t	f	2021-10-24 00:01:19
52	39	71	nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat	t	t	2022-02-28 03:18:37
53	43	27	arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.	f	t	2021-09-22 03:25:34
54	57	43	gravida sit amet, dapibus	f	t	2022-05-03 21:54:04
55	90	75	facilisis vitae, orci. Phasellus dapibus quam quis diam.f	t	2022-02-15 16:48:05
56	96	38	euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc	f	f	2022-04-26 06:43:55
57	18	72	nulla magna, malesuada vel, convallis in, cursus et, eros.	f	t	2021-11-21 17:22:29
58	76	38	tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit	t	t	2022-08-03 07:42:21
59	50	60	massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc	f	f	2022-06-01 08:27:56
60	41	71	Integer vitae nibh. Donec est mauris, rhoncus	t	f2022-07-19 18:56:42
61	94	5	magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed	tt	2021-10-25 08:00:37
62	71	92	Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus.	t	f	2021-10-16 15:48:16
63	43	75	et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,	f	f	2022-03-10 04:49:37
64	70	10	egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin	f	t	2022-01-28 07:59:24
65	76	40	natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate	t	t	2022-02-21 10:55:46
66	93	42	Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis	t	f	2022-02-07 08:26:10
67	47	87	convallis in, cursus et, eros. Proin ultrices.	f	f2022-01-25 17:21:24
68	51	73	a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin	f	t2021-11-09 12:00:14
69	75	40	ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus.	f	t	2022-07-13 10:01:36
70	76	71	volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu	tf	2021-10-09 21:44:00
71	64	87	Quisque purus sapien, gravida non, sollicitudin a,	ff	2021-12-28 06:24:30
72	76	3	nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc	f	t	2022-05-23 11:08:28
73	79	85	Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien.	f	t	2021-11-29 00:28:01
74	14	57	Integer urna. Vivamus molestie dapibus ligula. Aliquam erat	f	t	2022-09-10 21:18:17
75	87	16	molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor	f	f	2021-10-25 07:07:49
76	38	34	egestas a, dui. Cras pellentesque. Sed	f	f	2021-10-14 07:31:13
77	46	31	turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada	t	t	2021-11-01 11:24:31
78	32	7	elit fermentum risus, at fringilla purus mauris a nunc. In at	f	t	2022-01-15 10:18:24
79	38	46	est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non	f	f	2022-09-06 03:16:48
80	86	37	neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum	t	f2022-06-13 00:01:41
81	78	60	pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu.	t	t2022-07-27 12:57:37
82	15	41	Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est	t	f	2021-11-14 09:56:32
83	16	43	amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor	f	f	2022-03-09 17:19:24
84	94	23	scelerisque neque sed sem egestas blandit. Nam nulla magna,	f	t	2022-02-12 06:23:27
85	96	18	tempor augue ac ipsum.	t	t	2022-05-05 20:03:32
86	82	92	Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus	f	f	2022-01-30 19:17:07
87	87	88	id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu	f	f	2021-10-11 20:20:52
88	58	75	orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan	t	t	2022-03-23 14:42:51
89	25	33	aliquet, metus urna convallis erat,	f	t	2022-07-09 23:43:12
90	77	52	est. Mauris eu turpis. Nulla aliquet. Proin	t	t2022-07-26 05:44:49
91	61	71	scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada	t	t	2022-06-01 20:04:16
92	49	4	arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus	t	t	2022-05-18 04:46:21
93	94	52	scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis	tf	2022-08-22 08:26:40
94	52	21	nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu	t	f	2021-09-20 23:31:30
95	37	84	Duis elementum, dui quis accumsan convallis, ante lectus convallis est,	t	f	2021-10-18 12:04:13
96	93	25	nunc. In at pede.	f	f	2022-06-10 01:02:50
97	35	57	dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis	t	t	2022-05-25 06:51:24
98	28	64	quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus.ff	2022-09-01 14:41:48
99	65	80	enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim.	f	f	2021-09-19 18:00:20
100	4	16	blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut	f	f	2022-05-05 19:46:09
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
89	http://youtube.com/webp?q=4	59	nulla. Integer urna. Vivamus molestie dapibus	2022-03-04 03:03:53	138
90	http://instagram.com/paint?str=se	14	placerat velit. Quisque varius. Nam porttitor scelerisque neque.	2022-07-13 01:02:26	1403
91	http://instagram.com/pic?search=1	32	vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu.	2021-10-27 18:27:16	2228
92	http://cnn.com/png?ad=115	67	hendrerit neque. In ornare sagittis felis.	2022-01-23 17:25:33	275
93	http://bbc.co.uk/img?gi=100	96	mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris	2021-12-23 07:05:02	1043
94	https://cnn.com/image?q=0	95	vitae, erat. Vivamus nisi. Mauris nulla. Integer urna.	2022-07-26 22:34:13	1337
95	https://bbc.co.uk/img?id=98796546	8	In nec orci.	2022-03-24 22:14:39	1815
96	http://guardian.co.uk/webp?gi=100	49	lacinia. Sed congue, elit sed consequat auctor, nunc nulla	2021-10-27 17:39:33	1400
97	http://whatsapp.com/p?client=g	74	eu, accumsan sed,	2022-01-29 11:49:13	62
98	http://baidu.com/picture?id=9746632	1	semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In	2021-09-25 19:20:06	1086
99	http://youtube.com/image?p=8	93	ultrices, mauris ipsum porta elit,	2022-04-15 21:12:07	1041
100	http://guardian.co.uk/img?k=0	39	dictum. Proin eget odio.	2022-06-06 15:21:30	30
101	http://google.com/image?id=123	26	vulputate, lacus. Cras interdum. Nunc	2022-08-26 01:03:52	617
102	https://wikipedia.org/imag?p=8	55	a, scelerisque sed, sapien. Nunc2022-08-31 00:14:31	1830
103	https://ebay.com/paint?client=g	34	diam lorem, auctor quis, tristique ac, eleifend vitae,	2022-05-03 02:31:38	88
104	https://youtube.com/p?gi=100	67	imperdiet ullamcorper. Duis at lacus.	2022-05-21 04:41:22	506
105	https://guardian.co.uk/gif?id=6463656	22	sem molestie sodales. Mauris	2022-05-09 05:30:58	2420
106	https://guardian.co.uk/jpeg?search=1&q=de	5	a, facilisis non, bibendum sed,	2022-08-30 23:45:54	806
107	http://naver.com/jpeg?q=test	31	Donec non justo. Proin	2022-06-07 14:31:08	1313
108	https://whatsapp.com/imag?q=test	94	Nulla facilisi. Sed neque. Sed	2022-01-29 13:53:33	2233
109	http://nytimes.com/gif?ad=115	18	tincidunt vehicula risus. Nulla eget metus eu erat semper	2022-03-13 09:02:25	652
110	http://walmart.com/img?q=0	58	tincidunt orci quis lectus. Nullam suscipit,	2022-05-29 04:40:21	2044
111	https://google.com/gif?q=0	8	semper tellus id nunc interdum feugiat.	2021-11-06 09:06:19	1675
112	http://bbc.co.uk/jpeg?gi=100	52	lacus vestibulum lorem, sit amet2022-08-25 05:25:32	1252
113	https://naver.com/pic?p=8	80	diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer	2022-02-18 15:29:43	717
114	https://pinterest.com/imag?id=123	62	Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem,	2022-01-17 18:25:57	1243
115	http://zoom.us/image?id=42125	29	eu tellus. Phasellus elit pede, malesuada vel, venenatis vel,	2021-10-30 02:08:30	108
116	http://baidu.com/png?id=6463656	22	quam quis diam. Pellentesque habitant morbi tristique senectus et	2021-11-17 09:06:08	155
117	https://naver.com/imag?q=0	62	aliquet odio. Etiam ligula tortor, dictum eu, placerat eget,	2022-03-17 21:41:22	2410
118	http://walmart.com/paint?id=42125	14	Etiam bibendum fermentum metus.	2022-01-09 05:39:41	25
119	http://bbc.co.uk/p?q=4	41	pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus	2022-02-09 23:51:32	1942
120	https://bbc.co.uk/pic?id=98796546	3	suscipit nonummy. Fusce2022-04-16 09:35:29	544
121	http://facebook.com/image?ab=441&aad=2	38	rhoncus. Proin nisl sem, consequat nec, mollis vitae,	2022-04-25 09:43:27	1423
122	http://cnn.com/pic?g=1	88	ultrices. Duis volutpat nunc sit amet metus. Aliquam	2022-03-06 11:19:02	2277
123	https://pinterest.com/image?p=8	45	pede, nonummy ut, molestie in, tempus eu, ligula. Aenean	2022-01-09 05:21:17	1473
124	http://guardian.co.uk/imag?ab=441&aad=2	12	a, aliquet vel, vulputate eu, odio. Phasellus at augue	2022-03-14 02:15:36	789
125	http://bbc.co.uk/jpg?k=0	55	Cras dolor dolor, tempus non, lacinia at, iaculis	2022-09-14 14:15:57	2036
126	http://ebay.com/imag?q=0	25	nascetur ridiculus mus. Aenean eget magna.	2021-11-11 17:06:47	2477
127	http://wikipedia.org/img?str=se	22	nulla vulputate dui, nec	2022-03-15 08:03:54	632
128	https://bbc.co.uk/webp?id=42125	63	morbi tristique senectus et netus et malesuada fames	2022-05-17 01:10:06	1691
129	https://baidu.com/pic?q=test	68	mauris, rhoncus id,	2022-09-02 16:05:22	1076
130	http://google.com/jpeg?id=6463656	8	facilisis eget, ipsum. Donec sollicitudin	2022-01-11 01:56:30	1974
131	http://wikipedia.org/paint?search=1	89	scelerisque sed, sapien. Nunc pulvinar arcu et	2022-03-19 05:40:11	637
132	https://facebook.com/gif?ad=115	79	eget lacus. Mauris non dui	2021-09-21 12:20:44	696
133	http://pinterest.com/picture?q=test	30	Donec consectetuer mauris id	2022-06-13 16:30:52	306
134	http://ebay.com/imag?gi=100	97	non magna. Nam ligula elit, pretium et, rutrum non,	2021-10-26 21:24:55	1492
135	https://zoom.us/gif?gi=100	23	arcu. Vestibulum ut eros non enim commodo hendrerit.	2022-02-02 11:02:55	2363
136	https://pinterest.com/image?page=1&offset=1	81	Etiam gravida molestie arcu. Sed	2022-05-30 15:05:09	1851
137	http://whatsapp.com/img?q=11	1	magna. Sed eu	2022-02-02 20:45:07	2473
138	https://netflix.com/jpg?str=se	81	ac turpis egestas. Fusce aliquet2022-08-21 14:29:34	1706
139	http://bbc.co.uk/gif?gi=100	54	imperdiet dictum magna. Ut tincidunt orci	2022-05-24 01:30:19	271
140	https://twitter.com/png?client=g	16	nec tempus mauris erat eget ipsum.	2021-10-05 06:46:10	2114
141	http://facebook.com/png?id=98796546	68	commodo hendrerit. Donec porttitor tellus non magna. Nam ligula	2021-11-03 17:17:11	675
142	https://bbc.co.uk/p?id=98796546	6	pede. Cum sociis natoque penatibus et magnis dis parturient montes,	2022-09-15 18:45:28	905
143	http://wikipedia.org/webp?search=1	9	arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec	2021-12-12 07:06:10	2322
144	http://twitter.com/image?str=se	52	cubilia Curae Donec tincidunt.	2021-10-20 17:32:28	1500
145	http://instagram.com/paint?p=8	91	vitae, orci. Phasellus	2021-12-08 03:46:41	197
146	http://wikipedia.org/webp?g=1	94	at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus	2021-10-23 00:21:16	1942
147	https://reddit.com/jpg?q=test	49	adipiscing lacus. Ut nec urna et arcu	2022-05-07 10:08:05	423
148	http://pinterest.com/png?q=test	35	aliquam adipiscing lacus. Ut nec urna et	2022-01-25 05:16:33	813
149	https://cnn.com/webp?id=42125	24	dui augue eu tellus. Phasellus elit pede, malesuada	2022-03-08 00:39:23	810
150	https://netflix.com/paint?str=se	81	ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt	2022-05-25 02:56:58	1701
151	https://wikipedia.org/jpeg?search=1	64	ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis	2022-06-09 13:45:41	2069
152	https://naver.com/pic?g=1	15	ut eros non enim commodo hendrerit. Donec porttitor tellus	2022-09-09 21:47:56	2499
153	https://facebook.com/jpeg?p=8	53	egestas a, scelerisque sed, sapien. Nunc pulvinar	2022-03-17 04:03:26	120
154	https://zoom.us/imag?page=1&offset=1	46	ante dictum cursus. Nunc mauris elit,	2021-12-08 06:18:33	1441
155	http://youtube.com/paint?id=42125	84	turpis non enim. Mauris quis turpis vitae	2022-07-27 07:45:01	681
156	https://pinterest.com/png?q=test	59	vehicula risus. Nulla eget metus eu	2022-04-24 03:18:47	82
157	http://wikipedia.org/webp?str=se	97	accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis	2022-01-25 07:24:38	1372
158	https://cnn.com/jpg?page=1&offset=1	38	gravida sit amet, dapibus id, blandit at, nisi.	2022-06-11 07:15:51	1923
159	http://naver.com/webp?q=4	2	sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget	2022-04-02 08:42:26	484
160	https://wikipedia.org/gif?ad=115	78	Mauris molestie pharetra nibh. Aliquam ornare, libero	2022-07-23 01:18:12	1705
161	https://zoom.us/jpeg?id=981262	78	varius ultrices, mauris ipsum porta	2022-01-30 11:41:49	823
162	http://naver.com/image?id=98796546	15	cursus. Integer mollis. Integer tincidunt	2022-06-22 12:40:18	710
163	http://ebay.com/webp?g=1	10	Sed pharetra, felis eget varius ultrices,	2021-12-12 07:18:41	2005
164	http://naver.com/image?q=4	49	Nulla tempor augue ac ipsum. Phasellus vitae mauris	2021-10-01 21:30:24	1273
165	http://twitter.com/png?id=9746632	76	ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed	2021-10-29 20:33:07	1659
166	https://netflix.com/picture?id=98796546	70	nibh sit amet orci.	2022-03-06 01:12:16	2009
167	http://wikipedia.org/jpg?q=11	84	nulla. In tincidunt congue turpis. In condimentum. Donec at	2021-11-15 02:52:49	461
168	https://walmart.com/gif?str=se	8	id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,	2022-07-12 01:34:10	1586
169	http://walmart.com/pic?ab=441&aad=2	98	porttitor eros nec tellus. Nunc lectus pede, ultrices a,	2022-06-27 13:38:21	1160
170	https://walmart.com/png?search=1	55	In lorem. Donec elementum, lorem ut aliquam	2022-09-11 14:05:35	1731
171	http://bbc.co.uk/picture?ab=441&aad=2	36	varius ultrices, mauris ipsum porta elit, a feugiat tellus	2021-11-23 09:36:23	1234
172	https://facebook.com/img?search=1&q=de	94	malesuada fames ac turpis egestas. Fusce aliquet magna	2022-08-08 20:34:37	2140
173	https://facebook.com/img?search=1&q=dec	76	neque. Nullam nisl. Maecenas	2021-12-10 01:18:45	239
174	https://netflix.com/png?k=0	30	vitae purus gravida sagittis. Duis gravida. Praesent eu	2022-05-31 13:25:13	928
175	http://whatsapp.com/img?q=4	97	ligula. Aenean euismod mauris eu elit.	2022-02-23 18:34:29	2348
176	http://ebay.com/paint?gi=100	13	in magna. Phasellus dolor elit, pellentesque a, facilisis non,	2021-10-27 19:23:36	212
177	http://netflix.com/picture?k=0	21	ac mattis ornare, lectus ante dictum mi, ac mattis	2021-11-30 10:00:37	2316
178	https://instagram.com/imag?search=1	34	a feugiat tellus lorem eu metus. In lorem.	2022-09-04 15:56:42	1604
179	https://guardian.co.uk/img?id=9746632	85	ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia	2022-05-03 09:20:31	1745
180	https://twitter.com/p?id=6463656	71	Cum sociis natoque penatibus	2021-09-25 19:23:25	1242
181	http://netflix.com/pic?client=g	58	semper egestas, urna justo faucibus lectus, a	2022-07-10 19:50:16	828
182	https://wikipedia.org/jpg?id=981262	87	rhoncus. Proin nisl sem, consequat nec, mollis vitae,	2021-12-22 05:28:06	1034
183	http://walmart.com/gif?id=9746632	2	Vivamus non lorem	2022-05-18 08:25:59	2025
184	https://twitter.com/gif?id=123	55	ante. Maecenas mi felis, adipiscing fringilla, porttitor	2021-09-25 11:57:43	1568
185	http://walmart.com/imag?q=11	52	sapien. Cras dolor dolor, tempus non, lacinia at, iaculis	2022-02-26 06:41:55	948
186	http://baidu.com/jpg?q=test	69	euismod est arcu ac orci. Ut	2021-09-22 15:54:34	2483
187	http://naver.com/pic?id=6463656	100	sem semper erat, in consectetuer ipsum nunc	2021-12-08 20:25:49	1661
188	http://ebay.com/pic?gi=100	10	tortor. Nunc commodo auctor	2022-09-14 22:21:21	1290
\.


--
-- Data for Name: subscriptions_communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.subscriptions_communities (id, subscriber_id, to_community_id, created_at) FROM stdin;
1	23	39	2021-10-06 16:24:57
2	7	86	2022-01-24 03:30:38
3	50	47	2022-07-21 08:30:49
4	39	88	2022-07-28 09:46:24
5	68	77	2021-11-27 00:38:45
6	52	23	2021-11-05 11:03:01
7	90	3	2022-04-30 13:16:05
8	90	66	2022-03-27 03:18:10
9	17	10	2022-01-20 16:20:31
10	14	37	2021-12-30 00:40:01
11	15	29	2022-02-28 05:23:19
12	54	64	2022-01-05 23:40:01
13	51	21	2021-09-24 11:13:24
14	31	49	2022-07-03 22:23:15
15	39	88	2022-02-09 16:02:12
16	88	30	2022-06-10 22:21:55
17	36	82	2021-10-03 15:40:50
18	37	11	2022-05-31 09:46:35
19	68	98	2022-03-12 09:38:07
20	34	19	2021-12-12 14:48:05
21	77	82	2021-09-19 07:27:37
22	44	8	2022-01-22 22:55:12
23	82	23	2021-12-18 11:23:24
24	96	78	2022-02-02 16:44:30
25	22	52	2022-02-04 12:48:43
26	74	80	2022-04-23 23:42:26
27	5	25	2022-01-01 01:15:14
28	85	5	2022-08-04 06:25:03
29	47	31	2022-03-09 04:24:56
30	11	14	2022-01-01 11:40:56
31	2	15	2022-02-11 19:54:49
32	68	27	2022-05-20 17:25:06
33	38	57	2021-10-02 14:16:24
34	80	69	2022-01-06 11:21:37
35	63	96	2022-07-07 12:22:08
36	20	79	2021-12-19 05:59:06
37	50	5	2022-08-14 05:39:20
38	45	37	2022-09-06 22:25:05
39	49	86	2022-02-24 12:21:52
40	23	25	2022-06-01 16:10:39
41	30	89	2021-11-20 10:07:10
42	16	91	2021-10-06 23:15:11
43	17	82	2022-05-07 16:48:13
44	77	4	2021-09-30 21:07:14
45	38	81	2022-02-02 01:41:05
46	99	84	2022-06-06 04:32:22
47	30	63	2022-03-30 12:49:46
48	42	63	2022-08-23 02:30:22
49	41	43	2021-12-30 22:30:19
50	40	84	2022-08-02 02:27:21
51	46	37	2021-10-15 13:39:50
52	99	70	2022-04-30 08:24:51
53	67	79	2022-07-27 18:29:52
54	6	28	2022-06-06 00:11:24
55	75	27	2022-09-09 07:44:07
56	34	17	2022-08-05 17:05:16
57	97	98	2021-12-17 16:16:21
58	18	75	2022-06-18 19:32:54
59	11	90	2021-10-07 02:40:19
60	93	40	2022-04-13 09:53:57
61	41	62	2022-05-09 20:55:38
62	84	56	2022-04-27 04:17:28
63	67	54	2022-06-22 13:26:35
64	22	44	2021-11-26 16:07:44
65	1	84	2021-11-23 07:03:37
66	67	60	2022-02-05 12:32:22
67	45	48	2022-05-30 19:24:56
68	78	52	2022-07-21 22:21:14
69	48	24	2022-02-27 05:07:59
70	78	16	2022-04-18 11:36:00
71	17	98	2022-04-09 13:18:59
72	91	45	2021-12-29 19:58:22
73	96	73	2022-01-05 17:42:00
74	89	16	2021-11-02 19:22:56
75	39	99	2022-01-10 07:22:06
76	37	62	2021-12-01 01:28:53
77	76	26	2021-10-10 05:33:12
78	81	32	2022-08-09 05:49:51
79	61	61	2021-12-01 03:26:16
80	28	49	2022-03-30 04:34:58
81	33	25	2022-08-21 23:49:20
82	54	59	2022-09-02 11:35:54
83	26	77	2022-08-13 16:22:23
84	22	74	2021-11-26 18:15:51
85	90	41	2022-07-10 09:40:33
86	23	96	2021-10-11 06:18:23
87	94	88	2022-07-06 12:51:24
88	10	69	2022-02-18 07:49:46
89	57	19	2021-12-13 03:56:13
90	39	43	2022-05-01 14:29:27
91	49	69	2022-03-28 11:49:40
92	15	21	2022-07-08 18:59:48
93	23	29	2022-03-31 07:02:43
94	23	9	2022-04-02 09:56:05
95	53	24	2022-09-17 17:59:15
96	77	59	2022-01-30 18:48:12
97	38	4	2022-06-21 04:34:11
98	67	92	2022-03-03 04:14:28
99	10	62	2022-08-11 06:12:45
100	75	99	2022-05-10 08:41:08
\.


--
-- Data for Name: subscriptions_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.subscriptions_users (id, subscriber_id, to_user_id, created_at) FROM stdin;
1	76	4	2022-09-01 08:09:00
2	77	66	2021-11-29 20:21:10
3	49	37	2021-11-02 23:48:54
4	10	87	2022-09-02 17:20:06
5	34	39	2022-02-08 19:00:18
6	65	11	2022-05-27 07:16:20
7	95	57	2021-11-23 08:51:31
8	45	64	2021-10-24 03:27:55
9	5	21	2022-08-16 16:30:56
10	42	11	2022-06-21 11:16:18
11	51	26	2022-06-22 20:50:45
12	49	32	2022-03-02 22:03:16
13	27	53	2021-12-11 13:54:38
14	30	34	2022-01-21 22:39:44
15	50	68	2022-04-17 23:41:00
16	48	14	2021-12-17 22:51:04
17	22	8	2021-11-24 20:51:08
18	69	96	2022-01-20 02:01:52
19	63	82	2022-04-12 16:50:27
20	68	56	2022-08-31 22:45:14
21	67	85	2021-09-23 23:23:12
22	67	4	2021-10-02 02:02:35
23	56	97	2022-05-18 07:33:49
24	6	80	2021-12-06 11:47:10
25	53	71	2022-06-06 14:43:24
26	97	44	2022-06-03 04:41:56
27	68	64	2022-07-31 10:42:10
28	72	37	2021-11-16 05:20:02
29	27	21	2021-11-07 12:53:59
30	87	34	2022-07-01 12:27:50
31	24	85	2021-10-17 12:44:29
32	4	41	2022-09-06 09:12:35
33	68	47	2022-02-28 14:14:28
34	74	29	2022-02-21 05:32:47
35	42	61	2022-04-29 06:05:48
36	44	51	2021-10-20 00:35:11
37	71	66	2022-03-28 04:52:33
38	88	3	2022-09-15 22:41:21
39	85	66	2022-06-29 01:18:18
40	47	83	2021-12-29 02:04:45
41	92	15	2021-10-14 17:00:15
42	17	56	2022-09-13 19:23:30
43	11	78	2022-01-01 09:30:02
44	52	80	2021-09-19 05:34:11
45	24	36	2022-04-16 03:49:33
46	7	38	2022-02-03 16:03:43
47	70	50	2021-12-20 17:45:27
48	25	99	2022-05-10 03:07:35
49	67	32	2022-05-11 23:31:54
50	39	48	2022-03-10 08:59:56
51	29	18	2022-01-19 17:18:28
52	71	46	2021-10-13 16:55:52
53	51	36	2022-04-19 07:32:58
54	64	50	2021-12-06 13:06:37
55	20	86	2022-01-06 05:37:38
56	68	75	2022-02-25 18:20:27
57	38	59	2022-01-30 22:16:25
58	69	92	2021-12-02 09:18:31
59	61	51	2022-06-12 01:58:47
60	79	52	2021-10-20 13:18:31
61	53	39	2022-07-22 01:52:13
62	16	28	2021-11-25 21:02:51
63	99	87	2022-07-28 02:28:07
64	58	18	2022-01-08 04:02:41
65	61	4	2021-11-02 18:21:59
66	56	93	2022-09-10 19:57:43
67	52	17	2022-01-23 17:25:21
68	71	57	2021-10-20 08:35:22
69	8	3	2022-01-29 09:38:32
70	37	29	2022-07-17 07:40:34
71	15	51	2022-01-31 04:34:31
72	75	77	2022-03-16 04:20:20
73	12	56	2022-05-09 22:56:12
74	10	45	2022-06-26 12:03:42
75	72	89	2022-07-11 08:13:58
76	18	19	2022-02-05 15:59:55
77	19	3	2022-06-07 10:46:50
78	43	75	2022-01-07 08:11:09
79	84	41	2022-03-28 01:56:54
80	48	6	2022-03-25 08:15:44
81	51	12	2021-10-30 05:55:08
82	84	8	2021-10-07 12:56:21
83	22	6	2021-09-28 21:49:18
84	71	98	2021-09-25 18:38:55
85	8	65	2022-03-31 03:43:19
86	18	5	2022-06-08 09:16:36
87	85	43	2022-07-11 22:17:38
88	43	48	2022-01-26 20:29:46
89	51	50	2022-05-24 08:54:14
90	40	51	2022-07-24 17:32:52
91	63	6	2022-05-21 09:47:46
92	44	77	2022-09-15 02:40:55
93	98	94	2022-03-28 14:12:49
94	17	47	2022-06-17 18:25:36
95	46	98	2022-03-14 11:23:51
96	95	30	2022-08-10 06:03:22
97	62	5	2022-03-12 13:36:28
98	17	23	2022-09-09 18:40:07
99	23	21	2022-04-25 20:43:50
100	23	57	2021-11-02 19:23:38
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Dante	Wiggins	pede.ac@yahoo.net	+7-960-394-0036	93	2022-01-07 02:32:04
2	Vielka	Gonzalez	erat.volutpat.nulla@outlook.com	+7-970-772-340182022-06-22 09:18:04
3	Bo	Roberson	feugiat@hotmail.com	+7-911-382-4592	85	2022-03-24 09:06:32
4	Mannix	Prince	eu.arcu.morbi@outlook.edu	+7-931-646-4739	31	2021-12-06 16:55:06
5	Ralph	Pitts	auctor@protonmail.edu	+7-927-598-1866	60	2022-08-19 17:11:58
6	Tanisha	Dunn	eu.tellus@yahoo.edu	+7-966-146-3634	18	2022-01-08 17:12:40
7	Jescie	Conrad	sit@google.ca	+7-964-623-6579	4	2022-06-09 18:28:03
8	Robin	Sears	libero.proin.mi@protonmail.net	+7-944-196-2663	54	2022-07-08 16:12:28
9	Hermione	Bray	vel.turpis@hotmail.net	+7-953-645-6423	42	2022-01-14 22:50:48
10	Harriet	Cooke	nullam.feugiat.placerat@hotmail.com	+7-944-664-547138	2021-09-21 23:48:46
11	Thane	Sandoval	mi.ac.mattis@hotmail.com	+7-901-334-447651	2021-12-11 01:56:02
12	Gary	Hubbard	aliquam.erat@hotmail.net	+7-963-262-9578	90	2022-01-10 00:48:37
13	Sydnee	Nicholson	eu.dolor@aol.edu	+7-976-389-7568	82	2021-12-29 08:31:05
14	Veda	Hess	tristique.ac@protonmail.ca	+7-982-970-8068	85	2021-11-07 21:01:03
15	Riley	Vincent	placerat.cras@icloud.ca	+7-935-259-8811	6	2022-03-11 09:39:18
16	Hyacinth	Hobbs	faucibus.morbi.vehicula@hotmail.ca	+7-922-674-2278	33	2022-04-29 06:26:19
17	Erasmus	Maynard	tincidunt.nibh.phasellus@hotmail.couk	+7-943-332-142351	2021-12-22 13:14:35
18	Jerry	Mathis	sapien.molestie.orci@google.ca	+7-936-465-5313	90	2021-10-06 02:33:54
19	Eliana	Mckee	non.lacinia.at@icloud.couk	+7-923-264-4889	4	2022-07-21 18:40:00
20	Eve	Morrison	aliquet.libero@hotmail.net	+7-944-893-212521	2022-03-08 18:42:35
21	Meghan	Zamora	est.tempor.bibendum@yahoo.edu	+7-962-744-5621	36	2022-05-25 07:22:55
22	Randall	Bates	nec@aol.couk	+7-941-886-8517	75	2022-01-04 10:50:06
23	Darius	Kemp	ornare.libero@outlook.net	+7-952-474-2130	75	2022-07-27 01:52:14
24	Chava	Hammond	sem@outlook.ca	+7-929-655-0425	14	2021-11-03 06:32:35
25	Hu	Ellison	posuere@outlook.ca	+7-916-236-2755	12	2022-06-17 17:37:12
26	Madonna	Benjamin	eros.nam@outlook.couk	+7-965-884-0962	10	2022-03-12 04:54:44
27	Lyle	Howard	sit@protonmail.edu	+7-948-757-5623	97	2021-10-08 10:42:30
28	Robert	Moody	mauris.erat.eget@icloud.org	+7-986-357-1048	1	2021-11-09 01:10:39
29	Caryn	Romero	fringilla.est@aol.org	+7-943-951-6564	79	2022-04-15 23:06:26
30	Nehru	George	aliquam.fringilla@yahoo.net	+7-947-577-3596	20	2022-07-26 11:54:50
31	Tanisha	Bradley	proin.vel@yahoo.com	+7-954-245-3592	44	2022-02-22 03:13:23
32	Kaye	Dominguez	eu.tempor.erat@protonmail.ca	+7-969-350-369816	2022-01-27 12:25:20
33	Scott	Berger	scelerisque.lorem@protonmail.com	+7-939-125-452512	2022-05-25 07:18:03
34	Alea	Heath	gravida.aliquam@icloud.com	+7-978-339-6647	72	2022-07-22 03:02:01
35	Chiquita	Odom	donec.nibh@protonmail.couk	+7-926-647-546766	2022-06-15 03:28:59
36	Hashim	Rogers	quisque.ac@hotmail.org	+7-980-326-8588	19	2022-02-25 07:45:00
37	Natalie	Church	morbi@yahoo.couk	+7-911-334-1625	94	2022-05-10 19:54:59
38	Marshall	Levine	cursus@icloud.net	+7-943-642-9422	52	2022-08-02 02:54:42
39	Kareem	Wagner	duis@protonmail.com	+7-941-558-7892	24	2021-11-02 10:48:38
40	Rogan	Day	turpis.non@google.net	+7-953-380-9197	32	2021-11-10 01:54:48
41	Keiko	Bailey	dictum.sapien@yahoo.com	+7-972-746-0686	99	2022-07-08 16:28:49
42	Christian	Meadows	est.mauris@outlook.ca	+7-933-706-6831	7	2021-11-17 06:22:52
43	Erica	Gallagher	egestas@icloud.ca	+7-935-811-9915	47	2021-10-07 22:08:24
44	Callum	Dawson	aliquet.magna@outlook.org	+7-911-787-4592	68	2022-07-19 11:40:45
45	Teagan	Hull	fringilla.cursus.purus@hotmail.org	+7-963-927-761644	2021-11-22 13:50:29
46	Ali	Foster	non@google.edu	+7-944-654-5946	62	2022-08-01 09:04:36
47	Justina	Garrison	quis@protonmail.edu	+7-905-548-7478	67	2022-04-30 00:40:16
48	Roary	Houston	lobortis.nisi@aol.com	+7-965-177-1837	56	2021-11-23 10:05:21
49	Blossom	Stout	euismod.urna@yahoo.net	+7-910-824-3653	97	2022-05-29 19:15:36
50	Logan	Hendrix	eu.nibh@hotmail.com	+7-907-466-6725	7	2021-09-28 12:49:35
51	Renee	Turner	turpis.vitae.purus@outlook.ca	+7-974-588-9318	1	2022-03-03 00:19:21
52	Madonna	Rowland	morbi.quis@google.net	+7-998-856-3157	83	2022-04-18 12:43:46
53	Eugenia	Duffy	ac.ipsum.phasellus@icloud.net	+7-931-559-0642	47	2021-10-08 15:39:19
54	Ulysses	Ewing	dictum@aol.org	+7-915-537-2733	21	2022-08-26 17:36:16
55	Sierra	Boyd	eu.sem@hotmail.com	+7-966-282-3660	14	2021-10-02 08:46:58
56	Brenna	Baker	luctus.lobortis@hotmail.org	+7-935-315-0389	57	2022-04-14 05:03:16
57	Zelenia	Weaver	cursus.non.egestas@aol.couk	+7-958-563-1898	93	2022-04-17 15:49:34
58	Kibo	Heath	fermentum.fermentum@yahoo.couk	+7-983-386-0649	60	2022-01-14 09:32:07
59	Darius	Hutchinson	scelerisque.neque.sed@icloud.ca	+7-959-675-697265	2021-10-15 12:15:20
60	Raymond	Green	nec.tempus@google.ca	+7-948-365-3848	20	2022-07-11 22:10:32
61	Garrett	Oneal	nunc@outlook.net	+7-957-825-2516	94	2022-07-24 05:54:52
62	Hillary	Michael	rutrum.lorem@aol.com	+7-975-303-3554	31	2022-01-10 11:15:20
63	Xyla	Travis	sed.neque@aol.com	+7-961-983-7375	71	2022-08-10 12:18:32
64	Finn	Merrill	dui.lectus@aol.edu	+7-976-759-8171	48	2021-10-28 20:01:50
65	Imogene	Delgado	auctor.vitae@protonmail.org	+7-967-471-7012	19	2021-11-06 08:33:20
66	Shannon	Pennington	etiam@google.net	+7-941-601-7353	55	2022-05-15 00:59:04
67	Francesca	Simon	mauris.vel.turpis@icloud.ca	+7-912-683-776587	2022-08-21 02:01:08
68	Fallon	Nelson	et.magnis.dis@outlook.com	+7-984-874-2082	2	2022-08-19 11:04:11
69	Iris	Carr	cum.sociis@aol.edu	+7-957-225-7146	3	2022-02-17 16:24:17
70	Shaeleigh	Pena	augue.eu@hotmail.net	+7-988-288-1468	11	2022-07-26 03:06:27
71	Kyla	Lucas	odio.tristique@aol.edu	+7-966-146-6179	35	2021-12-27 00:52:36
72	Harper	Pate	et@hotmail.edu	+7-984-228-7197	79	2022-08-11 19:01:20
73	Callie	Flynn	suspendisse.non@hotmail.ca	+7-983-418-5861	43	2022-01-28 22:03:42
74	Sylvia	Wolf	pretium.aliquet@outlook.org	+7-937-885-1915	68	2022-05-25 11:57:50
75	Wang	Parker	in.dolor@hotmail.org	+7-945-873-8216	88	2021-10-19 16:45:14
76	Anne	Shepard	eget.volutpat.ornare@outlook.net	+7-947-715-873014	2022-07-12 07:42:02
77	Benedict	Middleton	ultricies.sem.magna@google.couk	+7-934-856-9219	99	2022-08-21 15:01:50
78	Jasmine	Flores	vitae.sodales@icloud.ca	+7-947-756-1141	18	2022-02-20 10:49:50
79	Wanda	Dunn	porta.elit@hotmail.org	+7-947-170-4345	51	2022-02-18 20:13:53
80	Moses	Mcdaniel	velit.quisque@hotmail.couk	+7-966-712-340666	2022-08-20 16:47:27
81	Trevor	Walters	a.mi@icloud.ca	+7-915-230-3631	7	2021-10-18 11:06:17
82	Chastity	Odom	fusce.aliquet.magna@aol.com	+7-982-812-378460	2022-06-11 00:44:00
83	Jamalia	Key	nam.tempor@hotmail.ca	+7-941-551-7394	30	2022-05-15 05:28:33
84	Shana	West	at.pretium@protonmail.org	+7-938-294-4504	52	2022-06-04 08:29:12
85	Clinton	Valencia	mauris.eu.turpis@icloud.ca	+7-936-534-514486	2022-06-27 13:40:44
86	Silas	Perry	eu.placerat.eget@yahoo.net	+7-942-608-3294	100	2022-03-02 03:14:39
87	Jacob	Nelson	tempus.mauris@outlook.org	+7-945-145-6536	9	2022-04-11 15:43:16
88	Julie	Bolton	mollis.dui.in@google.ca	+7-928-796-1357	1	2022-04-20 09:18:23
89	Alea	Vance	consectetuer.mauris.id@google.net	+7-950-635-378256	2021-12-16 02:56:18
90	David	Sargent	iaculis.nec@aol.org	+7-952-297-2655	32	2022-04-04 03:50:55
91	Kevin	Carney	vel@google.ca	+7-975-375-2426	81	2022-08-06 09:22:00
92	Hilary	Thornton	hendrerit.donec@protonmail.net	+7-905-300-794699	2022-03-07 21:34:44
93	Alfreda	James	fringilla.est@protonmail.couk	+7-965-344-3237	91	2022-01-23 01:35:58
94	Carlos	Underwood	nisi.a@outlook.ca	+7-960-516-4809	52	2022-07-08 21:13:47
95	Petra	Saunders	donec.est@yahoo.org	+7-922-645-0120	89	2022-07-10 14:49:57
96	Lucy	Holland	leo.in@google.com	+7-984-227-3882	67	2022-08-25 12:04:28
97	Hanae	Nichols	ante@aol.org	+7-955-998-5547	99	2022-06-02 00:45:17
98	Noah	Hardin	sed.dolor@google.org	+7-994-871-7675	36	2022-03-28 01:41:46
99	Latifah	Humphrey	lorem.donec@outlook.com	+7-929-488-6087	49	2022-06-17 17:22:48
100	Ingrid	Mooney	et@outlook.edu	+7-963-451-2764	41	2021-12-14 03:29:46
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	https://walmart.com/mov?id=981262	27	Fusce diam nunc, ullamcorper eu,	2022-01-19 19:52:24	334
2	https://bbc.co.uk/mpg?q=test	52	Nullam lobortis quam a felis ullamcorper viverra. Maecenas	2022-06-14 10:39:15	927
3	https://twitter.com/wmv?search=1&q=de	37	lectus pede et risus. Quisque libero	2021-11-07 19:44:41	780
4	http://wikipedia.org/mp4?q=test	51	blandit viverra. Donec tempus, lorem fringilla ornare	2022-06-24 04:02:54	2005
5	https://bbc.co.uk/webm?client=g	75	pretium et, rutrum non, hendrerit id,	2022-04-23 21:26:35	767
6	https://netflix.com/mov?ad=115	76	elit fermentum risus, at fringilla	2022-04-22 04:18:30	406
7	https://pinterest.com/vid?q=4	36	Duis cursus, diam at pretium aliquet, metus urna convallis	2021-12-16 09:35:30	637
8	https://guardian.co.uk/wmv?ad=115	38	erat volutpat. Nulla dignissim.	2022-02-03 05:52:52	1284
9	http://facebook.com/m4v?p=8	86	adipiscing non, luctus sit amet, faucibus ut, nulla.	2022-04-19 23:53:54	2417
10	http://ebay.com/rec?page=1&offset=1	63	dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse	2022-04-22 13:28:25	2171
11	https://baidu.com/mpg?str=se	6	Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula	2021-10-13 06:43:35	903
12	http://instagram.com/mp4?page=1&offset=1	42	Lorem ipsum dolor sit amet, consectetuer adipiscing	2021-11-27 08:15:02	2179
13	http://reddit.com/mpeg?str=se	55	montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod	2022-07-30 19:28:31	1379
14	https://ebay.com/asf?id=123	93	sed orci lobortis augue scelerisque mollis.	2021-10-21 03:02:43	267
15	https://twitter.com/m4v?id=981262	58	sit amet lorem semper	2022-08-09 18:08:09	1574
16	https://ebay.com/webm?id=42125	80	tellus. Suspendisse sed dolor.	2022-06-17 20:20:06	248
17	http://youtube.com/rec?q=0	35	In lorem. Donec elementum, lorem ut aliquam	2022-09-01 17:15:25	2268
18	http://instagram.com/avi?ab=441&aad=2	48	Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	2022-05-26 23:00:47	1548
19	http://ebay.com/mov?client=g	45	tempus eu, ligula. Aenean euismod mauris eu elit.	2022-06-01 20:42:45	1839
20	https://facebook.com/mpg?id=98796546	94	elit, pharetra ut, pharetra	2022-06-03 14:01:52	122
21	https://reddit.com/mov?id=981262	95	dictum placerat, augue. Sed	2021-10-24 01:12:14	2169
22	https://yahoo.com/mpeg?q=0	70	Mauris quis turpis vitae	2021-10-09 06:00:12	141
23	https://pinterest.com/avi?q=11	14	euismod ac, fermentum vel, mauris.	2022-07-02 00:46:57	386
24	https://facebook.com/mov?k=0	91	a, aliquet vel, vulputate	2022-04-24 17:00:19	219
25	http://yahoo.com/wmv?g=1	28	id, blandit at, nisi. Cum sociis natoque penatibus et	2022-02-08 11:58:47	2173
26	https://nytimes.com/record?id=98796546	99	Phasellus nulla. Integer vulputate, risus a ultricies	2022-05-05 11:14:41	870
27	http://baidu.com/video?ad=115	25	massa. Suspendisse eleifend. Cras sed	2022-05-23 11:37:49	2438
28	http://walmart.com/vid?search=1&q=de	99	commodo ipsum. Suspendisse non	2022-01-06 15:47:29	1822
29	https://pinterest.com/mpg?str=se	32	hendrerit a, arcu. Sed et libero. Proin mi.	2022-05-06 23:27:51	1225
30	https://baidu.com/m4v?id=6463656	7	Nulla interdum. Curabitur dictum.	2022-02-25 17:35:04	455
31	https://twitter.com/asf?q=test	25	tempus, lorem fringilla ornare placerat, orci	2022-08-06 18:32:56	914
32	http://wikipedia.org/asf?id=98796546	19	nascetur ridiculus mus. Proin vel nisl. Quisque	2022-09-17 21:16:42	904
33	https://yahoo.com/mov?gi=100	11	dignissim pharetra. Nam ac nulla. In	2022-09-09 03:10:46	1519
34	http://reddit.com/rec?q=11	74	non quam. Pellentesque habitant morbi tristique senectus	2022-06-06 15:29:59	563
35	http://ebay.com/rec?id=6463656	84	lorem. Donec elementum, lorem ut aliquam iaculis,	2022-02-28 05:44:56	515
36	http://nytimes.com/mpeg?id=981262	76	mauris ipsum porta elit, a feugiat tellus lorem eu	2021-10-30 19:42:11	801
37	https://ebay.com/mpg?id=123	77	nec tellus. Nunc	2022-03-25 21:12:39	1087
38	http://youtube.com/webm?id=42125	23	metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse	2021-10-12 13:52:09	1849
39	http://naver.com/webm?id=98796546	45	turpis. Aliquam adipiscing lobortis risus. In mi	2021-09-22 06:33:36	1732
40	http://nytimes.com/mpg?q=test	84	eget, venenatis a, magna. Lorem ipsum dolor sit amet,	2022-02-18 16:15:04	1064
41	http://baidu.com/vid?q=test	91	adipiscing non, luctus sit amet, faucibus	2022-01-14 22:33:23	412
42	https://google.com/mov?id=42125	37	vitae mauris sit amet lorem	2021-11-03 15:29:34	856
43	http://yahoo.com/mpeg?k=0	80	Cum sociis natoque penatibus	2022-08-27 04:08:05	647
44	http://google.com/vid?search=1	51	dui quis accumsan convallis, ante lectus convallis est,	2022-02-13 20:01:18	2438
45	http://yahoo.com/asf?client=g	100	nisi. Aenean eget metus. In nec orci. Donec nibh.	2022-03-18 15:14:13	2409
46	http://wikipedia.org/vid?ab=441&aad=2	77	facilisis facilisis, magna tellus	2022-04-21 23:03:35	853
47	http://nytimes.com/avi?ad=115	81	Aliquam fringilla cursus purus. Nullam scelerisque neque sed	2021-11-09 11:44:52	901
48	http://baidu.com/mov?q=test	85	vitae, aliquet nec,	2022-05-29 18:54:20	560
49	http://cnn.com/wmv?str=se	48	risus. Nunc ac sem ut dolor dapibus gravida.	2022-04-02 01:32:02	621
50	http://guardian.co.uk/webm?k=0	65	mi. Aliquam gravida mauris ut mi. Duis risus odio,	2022-04-30 02:48:17	1464
51	https://bbc.co.uk/video?p=8	69	non nisi. Aenean eget metus. In nec orci. Donec	2022-09-11 22:10:14	1924
52	https://baidu.com/record?gi=100	39	ut lacus. Nulla	2022-08-27 03:02:15	2169
53	http://ebay.com/record?id=9746632	92	molestie pharetra nibh. Aliquam ornare, libero	2022-09-05 00:24:29	2418
54	https://youtube.com/webm?gi=100	67	lectus, a sollicitudin orci sem eget massa. Suspendisse	2021-10-10 06:49:37	129
55	http://google.com/avi?q=0	26	a ultricies adipiscing, enim mi tempor lorem,	2022-08-19 15:03:04	1255
56	http://google.com/webm?search=1&q=de	91	risus. Donec egestas. Duis	2021-09-30 08:50:21	853
57	http://guardian.co.uk/vid?g=1	45	sit amet, consectetuer adipiscing elit.	2022-04-25 02:44:47	814
58	http://bbc.co.uk/mov?q=0	27	Fusce aliquet magna a neque. Nullam ut nisi	2022-01-03 20:33:12	1786
59	http://youtube.com/rec?id=123	60	urna justo faucibus lectus,	2022-08-13 19:31:48	1657
60	http://instagram.com/rec?ad=115	48	vehicula et, rutrum eu, ultrices2022-03-19 08:11:04	1306
61	http://google.com/video?q=11	69	quis, tristique ac, eleifend vitae, erat.	2022-09-11 03:45:38	781
62	http://netflix.com/mp4?ab=441&aad=2	15	Integer aliquam adipiscing lacus.	2022-01-19 17:33:31	1730
63	https://facebook.com/webm?str=se	2	Ut semper pretium neque. Morbi	2022-03-29 09:33:07	1325
64	http://netflix.com/mpg?q=0	89	lorem. Donec elementum, lorem ut2022-05-25 16:05:37	2487
65	https://zoom.us/avi?id=98796546	14	euismod et, commodo at, libero.2022-05-23 07:43:13	1831
66	https://facebook.com/mpeg?q=0	34	lobortis. Class aptent taciti sociosqu ad	2022-04-29 07:25:27	78
67	http://guardian.co.uk/record?id=9746632	49	ac, eleifend vitae, erat. Vivamus nisi.	2022-06-15 16:56:29	85
68	https://google.com/asf?id=42125	91	arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.	2021-11-20 19:55:01	838
69	https://pinterest.com/mp4?ad=115	36	Nam interdum enim non nisi. Aenean eget	2021-11-06 00:56:16	1463
70	https://baidu.com/webm?id=6463656	45	ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum	2021-12-26 18:45:39	98
71	http://youtube.com/record?id=981262	61	malesuada malesuada. Integer id magna et ipsum cursus vestibulum.	2022-03-23 19:47:37	2186
72	http://guardian.co.uk/mpeg?search=1&q=de	85	tellus sem mollis dui,	2021-10-08 03:20:16	1000
73	http://netflix.com/mov?str=se	16	pretium aliquet, metus urna	2021-10-20 06:48:25	1462
74	http://baidu.com/avi?ad=115	99	venenatis vel, faucibus id, libero.	2022-07-19 12:43:24	2033
75	https://yahoo.com/avi?id=98796546	28	ad litora torquent per conubia nostra,	2021-12-05 18:37:22	1588
76	http://ebay.com/webm?q=4	11	ipsum. Curabitur consequat, lectus sit amet luctus	2022-01-31 10:25:38	463
77	https://pinterest.com/record?id=9746632	29	erat semper rutrum. Fusce dolor quam,	2022-03-21 19:54:38	1239
78	http://walmart.com/mpeg?id=981262	21	quam quis diam. Pellentesque habitant morbi tristique senectus et	2022-07-19 05:01:46	1561
79	https://baidu.com/mov?k=0	83	arcu eu odio tristique pharetra.2022-05-22 05:36:03	2240
80	https://youtube.com/vid?q=0	49	eu dolor egestas rhoncus. Proin nisl sem, consequat	2022-06-01 22:40:55	983
81	https://google.com/video?search=1&q=de	1	sagittis felis. Donec	2022-01-13 13:30:41	141
82	http://instagram.com/wmv?q=0	74	interdum enim non nisi. Aenean eget metus. In	2022-01-21 20:04:46	1399
83	https://ebay.com/webm?q=test	59	mauris sit amet lorem semper auctor. Mauris vel turpis.	2022-06-22 12:45:36	1878
84	http://naver.com/mov?ad=115	65	egestas. Aliquam fringilla cursus purus.	2022-04-04 05:00:52	1414
85	http://walmart.com/video?id=123	70	aliquet, metus urna convallis erat,	2022-07-17 14:25:20	998
86	http://zoom.us/avi?gi=100	65	arcu iaculis enim, sit	2021-10-18 05:26:30	192
87	https://pinterest.com/wmv?id=42125	70	aliquet, metus urna convallis erat, eget tincidunt dui augue eu	2021-10-04 00:27:28	1240
88	https://whatsapp.com/rec?id=123	51	vehicula. Pellentesque tincidunt tempus risus. Donec	2021-11-20 22:36:37	2449
89	http://facebook.com/rec?search=1	81	arcu. Sed et libero.	2022-09-13 07:15:56	1220
90	https://bbc.co.uk/asf?search=1	100	orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam	2021-11-12 01:44:32	157
91	http://google.com/record?str=se	44	id risus quis diam luctus lobortis. Class aptent	2022-04-29 09:19:23	980
92	http://google.com/mp4?id=123	87	massa lobortis ultrices. Vivamus rhoncus. Donec est.	2022-05-18 11:50:40	747
93	http://instagram.com/mpeg?id=6463656	8	odio. Aliquam vulputate ullamcorper	2021-12-05 17:10:02	1225
94	https://twitter.com/video?q=11	69	imperdiet dictum magna. Ut tincidunt orci quis	2022-08-23 17:50:57	1031
95	http://bbc.co.uk/mov?p=8	88	sit amet risus. Donec egestas. Aliquam nec enim. Nunc	2022-05-21 05:07:17	78
96	https://walmart.com/mov?gi=100	19	nibh enim, gravida sit amet,	2022-08-19 04:10:51	374
97	https://bbc.co.uk/vid?ad=115	49	ante dictum cursus. Nunc mauris elit, dictum eu,	2021-12-19 22:08:32	1541
98	http://yahoo.com/vid?gi=100	76	tincidunt dui augue eu tellus.	2022-01-11 02:31:27	1580
99	https://naver.com/mp4?id=123	96	mauris blandit mattis. Cras eget2022-09-02 12:57:00	2322
100	https://baidu.com/asf?client=g	79	Sed dictum. Proin eget	2022-05-30 07:19:49	992
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 515, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 3, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 188, true);


--
-- Name: subscriptions_communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.subscriptions_communities_id_seq', 100, true);


--
-- Name: subscriptions_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.subscriptions_users_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: subscriptions_communities subscriptions_communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_communities
    ADD CONSTRAINT subscriptions_communities_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_users subscriptions_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_users
    ADD CONSTRAINT subscriptions_users_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--
