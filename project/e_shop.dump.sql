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
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    city character varying(50) NOT NULL,
    street character varying(50) NOT NULL,
    building integer NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: catalogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogs (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.catalogs OWNER TO postgres;

--
-- Name: catalogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogs_id_seq OWNER TO postgres;

--
-- Name: catalogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalogs_id_seq OWNED BY public.catalogs.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100),
    phone character varying(16) NOT NULL,
    email character varying(120),
    discount_card_number bigint,
    discount_points integer DEFAULT 300
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    id integer NOT NULL,
    customer_id integer,
    product_id integer,
    category_id integer,
    value real,
    started_at timestamp without time zone,
    finished_at timestamp without time zone
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discounts_id_seq OWNER TO postgres;

--
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discounts_id_seq OWNED BY public.discounts.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_products (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer DEFAULT 1,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orders_products OWNER TO postgres;

--
-- Name: orders_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_products_id_seq OWNER TO postgres;

--
-- Name: orders_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_products_id_seq OWNED BY public.orders_products.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price numeric(11,2),
    catalog_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone character varying(16) NOT NULL,
    password character varying(100) NOT NULL,
    position_id integer NOT NULL,
    address_id integer,
    birthday date,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- Name: staff_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_positions (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.staff_positions OWNER TO postgres;

--
-- Name: staff_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_positions_id_seq OWNER TO postgres;

--
-- Name: staff_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_positions_id_seq OWNED BY public.staff_positions.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id integer NOT NULL,
    manager_id integer,
    address_id integer
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: stores_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores_products (
    id integer NOT NULL,
    store_id integer,
    product_id integer,
    remainder integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.stores_products OWNER TO postgres;

--
-- Name: stores_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_products_id_seq OWNER TO postgres;

--
-- Name: stores_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_products_id_seq OWNED BY public.stores_products.id;


--
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: catalogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogs ALTER COLUMN id SET DEFAULT nextval('public.catalogs_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: discounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts ALTER COLUMN id SET DEFAULT nextval('public.discounts_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products ALTER COLUMN id SET DEFAULT nextval('public.orders_products_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- Name: staff_positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_positions ALTER COLUMN id SET DEFAULT nextval('public.staff_positions_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: stores_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores_products ALTER COLUMN id SET DEFAULT nextval('public.stores_products_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, city, street, building) FROM stdin;
1	Tambov	P.O. Box 436, 5681 Inceptos St.	65
2	Bakal	116-3704 Ut Rd.	77
3	Novosibirsk	Ap #359-8368 Ut St.	197
4	Zvenigorod	Ap #770-7432 Sagittis Avenue	72
5	Sevastopol	Ap #590-5939 Senectus St.	144
6	Pskov	242-5664 Vel, Road	110
7	Novgorod	395-1992 Pede Rd.	182
8	Tula	3248 Est. Road	178
9	Orenburg	881-3045 Risus. Rd.	44
10	Tomsk	P.O. Box 435, 4010 Nunc Road	184
11	Novgorod	Ap #551-4211 Ullamcorper. Road	98
12	Ozherelye	5479 Erat Road	44
13	Lipetsk	926-9720 Nunc Rd.	3
14	Shebekino	4468 Ac Avenue	148
15	Tomsk	Ap #461-6409 Rutrum St.	127
16	Vialky	P.O. Box 647, 9843 Tortor Avenue	169
17	Ulyanovsk	322-2652 Dis Street	62
18	Kaluga	Ap #507-5128 Tincidunt St.	111
19	Saint Petersburg	Ap #134-8786 Nisi Avenue	8
20	Saratov	586-8943 Est Street	189
21	Tula	Ap #232-4869 Vestibulum, Street	161
22	Tomsk	1250 Magnis Rd.	162
23	Kurgan	Ap #719-4383 Odio, St.	13
24	Moscow	Ap #587-5589 Ridiculus Road	19
25	Kursk	7349 Quisque Avenue	183
26	Moscow	Ap #380-5349 Vivamus St.	162
27	Irkutsk	Ap #268-2141 Purus Road	108
28	Yekaterinburg	Ap #207-6270 Eu, St.	136
29	Vologda	Ap #345-3591 Dapibus Ave	59
30	Lipetsk	Ap #178-7671 Nunc Ave	91
31	Irkutsk	521-2946 Duis Rd.	187
32	Vereya	702-7911 Ut St.	109
33	Voronezh	Ap #920-8858 Pede. St.	25
34	Tver	Ap #165-5817 Dictum Av.	189
35	Rostov	4498 Duis St.	136
36	Ivangorod	1333 Ac Street	155
37	Yaroslavl	Ap #836-7458 Egestas Rd.	27
38	Tyumen	8115 Eu St.	152
39	Irkutsk	3500 Massa. St.	17
40	Irkutsk	Ap #377-6856 Nullam St.	116
41	Kaliningrad	455-6071 Duis Rd.	195
42	Irkutsk	Ap #373-2683 Tincidunt St.	164
43	Irkutsk	372-8630 Fermentum St.	168
44	Sakhalin	647-6565 Mauris Rd.	138
45	Lipetsk	Ap #956-627 Non Av.	47
46	Kirov	Ap #688-8090 Non, Rd.	50
47	Rostov	P.O. Box 764, 8381 Molestie Av.	147
48	Magadan	398-4803 Tellus. Avenue	91
49	Sakhalin	354-1585 Montes, Rd.	45
50	Novosibirsk	497-3480 Eu Rd.	97
51	Kostroma	499-8519 Et St.	169
52	Yaroslavl	P.O. Box 569, 2645 Leo. Road	125
53	Lipetsk	959-6871 Vulputate, St.	38
54	Sevastopol	819-1795 Volutpat. Ave	16
55	Saint Petersburg	367-483 Nec Ave	148
56	Biryuch	Ap #325-6427 Montes, St.	158
57	Sakhalin	Ap #521-175 Magnis Road	102
58	Kostroma	P.O. Box 210, 2796 Dictum. Avenue	18
59	Moscow	Ap #972-2945 Vitae St.	5
60	Nizhny	415-6886 Egestas Street	25
61	Tyumen	327-4451 Ut Avenue	10
62	Murmansk	Ap #902-6244 Sit Rd.	140
63	Tambov	548-7704 Magna. Av.	69
64	Tyumen	7532 Egestas Road	195
65	Kaluga	6163 Ut, Road	121
66	Elektrostal	627-4051 Parturient St.	62
67	Biryuch	Ap #217-5887 Convallis Road	115
68	Tula	1283 Nunc Street	167
69	Vologda	Ap #298-7898 Tortor. Rd.	137
70	Tolyatti	264-4803 Sit Street	161
71	Tomsk	P.O. Box 573, 6158 Sed, St.	58
72	Rostov	Ap #577-7346 Non, Road	151
73	Akhtubinsk	1208 Quis Avenue	35
74	Murmansk	Ap #507-6258 Mollis Rd.	9
75	Lipetsk	2036 Amet St.	102
76	Saratov	P.O. Box 596, 3199 Fermentum Rd.	39
77	Gatchina	2258 Interdum St.	109
78	Znamensk	6990 Penatibus Street	188
79	Magadan	198-3027 Semper Avenue	34
80	Astrakhan	Ap #280-4922 Magna Road	33
81	Kaliningrad	843-6389 Dis Ave	18
82	Moscow	899-2878 A St.	36
83	Kirov	Ap #627-5232 Neque Rd.	34
84	Lipetsk	Ap #531-9847 Id Street	82
85	Moscow	P.O. Box 775, 4786 Euismod St.	138
86	Vologda	Ap #888-7778 Sociis Rd.	119
87	Rostov	P.O. Box 160, 4038 Nullam Street	81
88	Saratov	700-5689 Tortor, Rd.	44
89	Voronezh	494 Integer Av.	122
90	Kyshtym	398-8039 Proin Av.	67
91	Sakhalin	Ap #763-7219 Tempus St.	78
92	Novosibirsk	Ap #587-5947 Sed St.	104
93	Tyumen	Ap #169-2091 Ullamcorper. Ave	62
94	Cherepovets	Ap #551-3436 Felis. St.	54
95	Murmansk	647-7865 Turpis. Av.	164
96	Korkino	Ap #180-7691 Ut St.	129
97	Magadan	112-2191 Risus. Ave	95
98	Novosibirsk	540-678 Dolor. Av.	152
99	Vladimir	166-6038 Vehicula. Rd.	19
100	Smolensk	Ap #641-8428 Integer Rd.	154
101	Zavitinsk	Ap #558-5491 Curae Rd.	25
102	Ulyanovsk	Ap #398-1717 Odio Rd.	115
103	Saratov	293-632 Nibh Road	190
104	Tver	Ap #991-320 Dolor Street	148
105	Tomsk	Ap #104-5413 Euismod St.	53
106	Murmansk	693-4048 Libero. Avenue	106
107	Brin-Navolok	8725 Blandit. Avenue	190
108	Rostov	Ap #324-1821 Vivamus St.	75
109	Tambov	575-1241 Odio. Rd.	191
110	Rostov	2977 Tristique Av.	7
111	Saint Petersburg	306-1744 Nullam Street	32
112	Kostroma	Ap #522-6205 Sit Rd.	162
113	Tambov	749-3312 Vitae, Street	32
114	Ryazan	758-2464 Sit Road	198
115	Vologda	P.O. Box 982, 3009 Justo. Ave	146
116	Kirov	695-2032 Velit. St.	185
117	Tula	Ap #816-8942 Sit Ave	76
118	Valuyki	711-373 Ut, Rd.	6
119	Oryol	Ap #293-8588 Ante Avenue	36
120	Omsk	Ap #990-769 Sed Street	143
121	Ivanovo	720-7086 Ut Av.	28
122	Kaluga	492-6785 Tincidunt, Av.	199
123	Novgorod	Ap #360-5987 Nibh Avenue	118
124	Saint Petersburg	Ap #281-6946 Mauris Rd.	119
125	Lipetsk	452-8360 Quis Ave	79
126	Ivangorod	Ap #332-2609 Nisi. Av.	28
127	Tambov	Ap #421-5839 Lectus Av.	36
128	Kurgan	672-4800 Ut Rd.	130
129	Samara	192-8352 Odio, Rd.	72
130	Kirov	P.O. Box 179, 9546 Et Street	199
131	Pskov	Ap #523-9963 Sapien. St.	168
132	Rostov	533-858 Aenean St.	120
133	Kirov	Ap #698-8302 Felis Ave	3
134	Tula	739-738 Tincidunt Street	78
135	Ruza	Ap #691-2891 Bibendum Av.	64
136	Ulyanovsk	P.O. Box 217, 265 Molestie Street	69
137	Rostov	Ap #373-8792 Vivamus Av.	189
138	Magadan	2713 Non, St.	161
139	Vologda	9079 Augue Rd.	194
140	Yekaterinburg	Ap #396-9147 Odio Street	154
141	Dyatkovo	706-1501 Nisl. St.	33
142	Novgorod	Ap #935-9258 Cursus Street	110
143	Solvychegodsk	Ap #813-8599 Donec Rd.	64
144	Karachev	650-9759 Nunc, St.	151
145	Tambov	336-6133 At, Rd.	60
146	Kaluga	6635 Eget Av.	95
147	Nizhny	Ap #830-4396 Mi St.	126
148	Magadan	Ap #167-9547 Adipiscing St.	48
149	Irkutsk	3451 Nunc Ave	195
150	Tomsk	P.O. Box 951, 473 Enim Rd.	147
151	Ivanovo	Ap #963-9050 Rhoncus. Rd.	31
152	Tambov	P.O. Box 569, 422 Nec, Av.	155
153	Kaliningrad	Ap #903-8757 Sem. St.	11
154	Novosibirsk	850-9160 Etiam Rd.	133
155	Tolyatti	Ap #417-4775 Turpis. St.	94
156	Rostov	831-953 Metus. Rd.	181
157	Kostroma	1042 Mi Rd.	38
158	Yekaterinburg	Ap #290-2998 Feugiat St.	6
159	Yaroslavl	487-7231 Diam St.	93
160	Akhtubinsk	Ap #571-6162 Cum Rd.	27
161	Gubkin	Ap #126-711 Purus Street	116
162	Oryol	230-8586 Rhoncus. Ave	67
163	Novosibirsk	Ap #420-1062 Donec Street	111
164	Korocha	231-7563 Odio St.	150
165	Kirov	Ap #423-8765 Eu Av.	190
166	Tula	833-7451 Accumsan Road	91
167	Skovorodino	130-6398 Ut St.	23
168	Vladimir	Ap #175-7741 Donec Rd.	164
169	Kemerovo	601-9407 Porttitor Avenue	102
170	Tula	P.O. Box 602, 7651 Eu St.	93
171	Tambov	777-6500 Non, Av.	160
172	Magadan	2382 Non, Street	7
173	Kartaly	Ap #665-744 Cursus Rd.	186
174	Tver	371-3151 Urna. Ave	131
175	Sevastopol	Ap #664-1483 Vel Avenue	78
176	Tula	649-9720 Convallis Road	102
177	Sakhalin	Ap #502-1316 Suspendisse Rd.	69
178	Orenburg	Ap #379-285 Dui, St.	126
179	Orenburg	346-6584 Vulputate Rd.	154
180	Lipetsk	P.O. Box 659, 4722 Vel Rd.	170
181	Stary Oskol	Ap #705-4595 At, Street	174
182	Samara	289-7691 Quisque St.	164
183	Novgorod	Ap #226-3446 Nisi. Rd.	32
184	Novgorod	Ap #814-520 Neque Rd.	67
185	Orenburg	717-8313 Sagittis. Avenue	50
186	Samara	2681 Diam Rd.	99
187	Tver	1580 Lacinia. Rd.	52
188	Sakhalin	Ap #923-2941 At, Street	51
189	Orenburg	5003 Vel Rd.	1
190	Tomsk	3165 Quis Rd.	62
191	Kursk	Ap #379-9397 Eu Rd.	104
192	Kaluga	Ap #519-7810 Malesuada Avenue	88
193	Kaliningrad	Ap #140-534 Dolor Ave	11
194	Kursk	P.O. Box 118, 2902 Nec Rd.	111
195	Sakhalin	181 Integer Rd.	113
196	Kaliningrad	Ap #707-6677 Dictum Rd.	10
197	Kemerovo	3440 Eu, St.	126
198	Kursk	Ap #919-5777 Aliquet Avenue	190
199	Kemerovo	2562 Sagittis Rd.	176
200	Kasli	716-8811 Maecenas Road	79
201	Tyumen	P.O. Box 700, 361 Augue St.	154
202	Omsk	Ap #146-7567 Cursus. Road	147
203	Ryazan	P.O. Box 300, 2281 Tincidunt Avenue	162
204	Penza	Ap #279-7468 Dapibus St.	197
205	Cherepovets	Ap #954-2145 At Rd.	170
206	Ryazan	447-7724 At, St.	123
207	Ryazan	892-9377 Pellentesque Rd.	19
208	Nizhny	Ap #661-1191 Gravida Rd.	30
\.


--
-- Data for Name: catalogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalogs (id, name) FROM stdin;
1	Системные блоки
2	Процессоры
3	Материнские платы
4	Видеокарты
5	Жесткие диски
6	Оперативная память
7	Корпуса
8	Блоки питания
9	Охлаждение компьютера
10	SSD накопители
11	Мониторы
12	Клавиатуры
13	Мыши
14	Коврики для мыши
15	Веб-камеры
16	Наушники
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name, phone, email, discount_card_number, discount_points) FROM stdin;
1	Kyle	Church	+79414251852	ipsum.non.arcu@protonmail.ca	1600100013816846	300
2	Alma	Vinson	+79534557192	ante.dictum@hotmail.org	1600100057340868	300
3	Ingrid	Harvey	+79476832829	et.eros.proin@aol.net	1600100001177462	300
4	Cairo	Jarvis	+79722036397	nisl@aol.ca	1600100029979084	300
5	Ashely	Lang	+79489864473	vel.convallis@icloud.net	1600100022326630	300
6	Alexis	Baxter	+79448074715	morbi.non@yahoo.net	1600100097634798	300
7	John	Harrington	+79436762812	dolor.egestas.rhoncus@google.com	1600100067954592	300
8	Aileen	Peters	+79944452134	imperdiet.ornare@aol.net	1600100061172077	300
9	Irma	Cunningham	+79325743147	enim.etiam@aol.ca	1600100062357815	300
10	Beau	Cash	+79076445636	pede.nonummy@outlook.net	1600100004854191	300
11	Erin	Waters	+79355044448	aliquet.phasellus.fermentum@google.org	1600100016094157	300
12	McKenzie	Andrews	+79047728625	auctor.ullamcorper.nisl@aol.edu	1600100018244946	300
13	Indira	Wong	+79991762364	sollicitudin.adipiscing@yahoo.org	1600100013069464	300
14	Bruno	Albert	+79225751445	blandit.nam@google.org	1600100026486782	300
15	Noah	Gentry	+79926838357	nulla.at.sem@aol.com	1600100033816697	300
16	Benedict	Whitehead	+79575562338	mauris@google.couk	1600100088012026	300
17	Kiara	Livingston	+79933436417	ultricies.ornare.elit@yahoo.net	1600100057776142	300
18	Hunter	Cannon	+79462714296	nec.ligula@yahoo.org	1600100092322487	300
19	Lani	Mccoy	+79439799826	hendrerit.id@hotmail.couk	1600100041860617	300
20	Vincent	Randall	+79698442211	pede.blandit@yahoo.ca	1600100079651502	300
21	Kato	Martinez	+79718212651	in@yahoo.ca	1600100031574940	300
22	Brandon	Sloan	+79978975216	sit.amet@google.com	1600100013478681	300
23	Regan	Hancock	+79524835472	sed@hotmail.couk	1600100096983820	300
24	Natalie	Benton	+79923328991	dictum.eleifend.nunc@icloud.ca	1600100053198567	300
25	Denise	Allen	+79487333535	sit.amet@yahoo.org	1600100036727347	300
26	Branden	Pennington	+79375125242	ante@icloud.ca	1600100069809930	300
27	Scott	Fisher	+79413415135	iaculis.aliquet.diam@icloud.edu	1600100078939785	300
28	Bertha	Pearson	+79954097823	elementum@protonmail.net	1600100053211902	300
29	Ebony	Booker	+79299547326	cubilia@outlook.edu	1600100097557135	300
30	Patrick	Fuentes	+79537896684	dui@google.couk	1600100095483106	300
31	Myles	Britt	+79699884241	aliquam@hotmail.org	1600100087379822	300
32	Tyler	Christensen	+79884686757	neque.venenatis@icloud.edu	1600100055210383	300
33	Ora	Lynn	+79244712846	nulla.tempor.augue@icloud.org	1600100091480966	300
34	Richard	Richards	+79373134735	vivamus.nisi@hotmail.com	1600100007455628	300
35	Andrew	Cooke	+79781464677	mauris.molestie@google.edu	1600100050950890	300
36	Lacy	Mcconnell	+79873463485	pede.malesuada@hotmail.ca	1600100002835376	300
37	Nayda	Rojas	+79689636526	lobortis@aol.net	1600100066123153	300
38	Craig	Finley	+79535465986	et.risus@aol.couk	1600100077949397	300
39	Solomon	Petersen	+79336963372	proin.dolor@aol.couk	1600100006200199	300
40	Ayanna	Collins	+79146339533	posuere.at.velit@aol.ca	1600100070361679	300
41	Kirsten	Ware	+79589915480	aliquet@yahoo.ca	1600100001626345	300
42	Courtney	Goff	+79335747396	ornare.in@yahoo.net	1600100049978897	300
43	Kylie	Graham	+79814524355	eu@outlook.net	1600100027575603	300
44	Fiona	Conley	+79733764051	metus@hotmail.edu	1600100075783204	300
45	Declan	Chaney	+79847137624	auctor.mauris.vel@hotmail.ca	1600100009927101	300
46	Libby	Kerr	+79211319274	massa.vestibulum@icloud.ca	1600100054379240	300
47	Darryl	Nielsen	+79427232279	mattis.integer@icloud.ca	1600100005217917	300
48	Lisandra	Pittman	+79813239846	est@yahoo.ca	1600100039772056	300
49	Evan	Rasmussen	+79484877492	laoreet.posuere@icloud.net	1600100080610997	300
50	Illiana	Oneal	+79525818385	gravida.sagittis@protonmail.com	1600100017341823	300
51	Michael	Kennedy	+79193621825	non@outlook.couk	1600100011877477	300
52	Cade	Bradley	+79324447527	luctus.curabitur@hotmail.com	1600100021439171	300
53	Nicholas	Cannon	+79303278467	vel.convallis@icloud.org	1600100038281456	300
54	Leslie	Valenzuela	+79624886025	aliquam.eu@aol.ca	1600100075538045	300
55	Jaquelyn	Preston	+79695187069	nec.tellus@yahoo.net	1600100081362276	300
56	Ignatius	Kirk	+79287885140	turpis@outlook.org	1600100082075354	300
57	Aline	Hurley	+79173588775	aptent.taciti.sociosqu@icloud.edu	1600100061021311	300
58	Joseph	Gould	+79703138746	nulla.integer.urna@protonmail.ca	1600100060930130	300
59	Nayda	Turner	+79333504077	et@hotmail.org	1600100028533820	300
60	Dai	Gallegos	+79141221289	pede@outlook.couk	1600100027619428	300
61	Griffith	Howell	+79567864958	vehicula.risus@outlook.com	1600100074502416	300
62	Scarlett	Mckee	+79447006781	egestas@aol.ca	1600100099728715	300
63	Colette	Hendricks	+79107287368	ligula.nullam@protonmail.ca	1600100035675789	300
64	Cailin	Sanchez	+79024145156	quis@hotmail.org	1600100054749037	300
65	Shad	Trujillo	+79682135074	dapibus.quam@google.org	1600100059205906	300
66	Caesar	Maxwell	+79637848617	metus.aliquam.erat@hotmail.com	1600100044298981	300
67	Emery	Lang	+79636676186	erat@hotmail.org	1600100091857195	300
68	Nomlanga	Neal	+79847438795	ipsum.phasellus.vitae@icloud.org	1600100006016178	300
69	Fuller	Wilkerson	+79417485440	ultrices.posuere@outlook.org	1600100081114901	300
70	Tanner	Bright	+79362049132	nunc.mauris.morbi@hotmail.net	1600100073239510	300
71	Jelani	Torres	+79866825444	ullamcorper.velit@protonmail.com	1600100099315506	300
72	Brendan	Rutledge	+79596208496	enim@google.couk	1600100080268043	300
73	Kuame	Macdonald	+79546827472	at.velit.pellentesque@outlook.ca	1600100066357357	300
74	Thor	Mathews	+79784452870	metus@protonmail.com	1600100063610324	300
75	Judith	King	+79527212678	vel@hotmail.couk	1600100003271115	300
76	Ingrid	Conway	+79484793423	vitae.odio@hotmail.com	1600100002256342	300
77	Cally	Mejia	+79477155621	ipsum.dolor.sit@google.net	1600100030223575	300
78	Jameson	Logan	+79335123085	sed@protonmail.com	1600100096595593	300
79	Cally	Jones	+79855124982	convallis.convallis.dolor@hotmail.ca	1600100011368568	300
80	Hiram	Hammond	+79162565126	diam.vel@icloud.net	1600100020100496	300
81	Travis	Wooten	+79673842376	maecenas.mi@outlook.org	1600100029524593	300
82	Isaac	Harvey	+79468577357	et.magna.praesent@google.com	1600100050880932	300
83	Buffy	Parks	+79926883250	at.iaculis@icloud.edu	1600100047484048	300
84	Phelan	Mclean	+79182284178	ante.maecenas.mi@yahoo.net	1600100070545617	300
85	Rebekah	Hoover	+79929299162	nibh.phasellus.nulla@aol.net	1600100064154295	300
86	Buckminster	Salinas	+79458305646	id.ante@icloud.com	1600100029228679	300
87	Rowan	Prince	+79619832373	libero.et@aol.com	1600100043762572	300
88	Hiram	Burris	+79467767838	mauris.elit.dictum@hotmail.net	1600100084892390	300
89	Ignatius	Klein	+79268222438	vel.venenatis.vel@icloud.net	1600100001459225	300
90	Thane	Browning	+79677352774	lorem.ac@google.couk	1600100054723040	300
91	Shafira	Garrett	+79761688977	placerat.orci@outlook.edu	1600100080762055	300
92	Nora	Mullen	+79674965582	magna.sed@outlook.ca	1600100045546772	300
93	Lillith	O'brien	+79352862248	risus.odio@icloud.net	1600100092119339	300
94	Burke	Livingston	+79942075046	fames@hotmail.org	1600100028223131	300
95	Audrey	Reed	+79217807750	quisque.tincidunt.pede@icloud.ca	1600100014761084	300
96	Breanna	Gilmore	+79174856911	lobortis.risus@aol.com	1600100009436505	300
97	Lamar	Snider	+79755935567	aenean.massa.integer@outlook.com	1600100082527850	300
98	Minerva	Brennan	+79573387787	nec@icloud.org	1600100002538774	300
99	Josephine	Smith	+79143365488	et@outlook.com	1600100076290882	300
100	Melissa	Humphrey	+79903969122	a.tortor.nunc@protonmail.ca	1600100063585786	300
\.


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discounts (id, customer_id, product_id, category_id, value, started_at, finished_at) FROM stdin;
1	47	\N	\N	0.46	2022-03-02 00:00:00	2023-04-10 00:00:00
2	44	\N	\N	0.35	2022-09-30 00:00:00	2022-11-30 00:00:00
3	46	\N	\N	0.01	2022-07-07 00:00:00	2022-03-29 00:00:00
4	98	\N	\N	0.52	2022-09-24 00:00:00	2022-09-03 00:00:00
5	25	\N	\N	0.65	2022-05-04 00:00:00	2022-02-15 00:00:00
6	71	\N	\N	0.33	2022-04-29 00:00:00	2022-01-24 00:00:00
7	32	\N	\N	0.69	2022-07-22 00:00:00	2022-12-11 00:00:00
8	40	\N	\N	0.22	2022-08-05 00:00:00	2023-06-25 00:00:00
9	51	\N	\N	0.09	2022-04-06 00:00:00	2022-08-30 00:00:00
10	66	\N	\N	0.64	2022-07-08 00:00:00	2023-04-23 00:00:00
11	\N	9	\N	0.36	2022-07-27 00:00:00	2023-02-23 00:00:00
12	\N	16	\N	0.35	2022-05-21 00:00:00	2022-09-21 00:00:00
13	\N	18	\N	0.39	2022-03-20 00:00:00	2023-03-30 00:00:00
14	\N	6	\N	0.65	2022-02-01 00:00:00	2022-10-29 00:00:00
15	\N	2	\N	0.63	2022-02-04 00:00:00	2022-09-19 00:00:00
16	\N	14	\N	0.69	2022-06-26 00:00:00	2022-12-04 00:00:00
17	\N	17	\N	0.05	2022-04-08 00:00:00	2022-02-15 00:00:00
18	\N	5	\N	0.59	2022-05-29 00:00:00	2022-01-04 00:00:00
19	\N	3	\N	0.56	2022-09-25 00:00:00	2022-07-01 00:00:00
20	\N	10	\N	0.25	2022-03-25 00:00:00	2023-02-25 00:00:00
21	\N	\N	10	0.06	2022-05-21 00:00:00	2022-03-16 00:00:00
22	\N	\N	5	0.32	2022-10-05 00:00:00	2022-06-06 00:00:00
23	\N	\N	4	0.63	2022-03-01 00:00:00	2023-03-26 00:00:00
24	\N	\N	1	0.02	2022-03-05 00:00:00	2023-09-02 00:00:00
25	\N	\N	14	0.42	2022-04-04 00:00:00	2023-03-05 00:00:00
26	\N	\N	2	0.48	2022-07-13 00:00:00	2022-08-06 00:00:00
27	\N	\N	7	0.65	2022-03-05 00:00:00	2022-06-28 00:00:00
28	\N	\N	8	0.24	2022-01-02 00:00:00	2023-10-10 00:00:00
29	\N	\N	3	0.12	2022-02-21 00:00:00	2022-10-31 00:00:00
30	\N	\N	13	0.13	2022-02-25 00:00:00	2022-10-23 00:00:00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_id, created_at) FROM stdin;
1	47	2022-10-13 20:08:21.972049
2	9	2022-10-13 20:08:21.972049
3	76	2022-10-13 20:08:21.972049
4	24	2022-10-13 20:08:21.972049
5	19	2022-10-13 20:08:21.972049
6	79	2022-10-13 20:08:21.972049
7	76	2022-10-13 20:08:21.972049
8	7	2022-10-13 20:08:21.972049
9	96	2022-10-13 20:08:21.972049
10	97	2022-10-13 20:08:21.972049
11	53	2022-10-13 20:08:22.054979
12	57	2022-10-13 20:08:22.054979
13	83	2022-10-13 20:08:22.054979
14	45	2022-10-13 20:08:22.054979
15	50	2022-10-13 20:08:22.054979
16	49	2022-10-13 20:08:22.054979
17	62	2022-10-13 20:08:22.054979
18	58	2022-10-13 20:08:22.054979
19	66	2022-10-13 20:08:22.054979
20	24	2022-10-13 20:08:22.054979
21	28	2022-10-13 20:08:22.099914
22	32	2022-10-13 20:08:22.099914
23	4	2022-10-13 20:08:22.099914
24	88	2022-10-13 20:08:22.099914
25	48	2022-10-13 20:08:22.099914
26	71	2022-10-13 20:08:22.099914
27	49	2022-10-13 20:08:22.099914
28	90	2022-10-13 20:08:22.099914
29	70	2022-10-13 20:08:22.099914
30	33	2022-10-13 20:08:22.099914
31	10	2022-10-13 20:08:22.117533
32	59	2022-10-13 20:08:22.117533
33	49	2022-10-13 20:08:22.117533
34	19	2022-10-13 20:08:22.117533
35	89	2022-10-13 20:08:22.117533
36	93	2022-10-13 20:08:22.117533
37	39	2022-10-13 20:08:22.117533
38	87	2022-10-13 20:08:22.117533
39	94	2022-10-13 20:08:22.117533
40	99	2022-10-13 20:08:22.117533
41	35	2022-10-13 20:08:22.157878
42	34	2022-10-13 20:08:22.157878
43	66	2022-10-13 20:08:22.157878
44	72	2022-10-13 20:08:22.157878
45	1	2022-10-13 20:08:22.157878
46	98	2022-10-13 20:08:22.157878
47	29	2022-10-13 20:08:22.157878
48	8	2022-10-13 20:08:22.157878
49	16	2022-10-13 20:08:22.157878
50	46	2022-10-13 20:08:22.157878
51	67	2022-10-13 20:08:22.189436
52	50	2022-10-13 20:08:22.189436
53	5	2022-10-13 20:08:22.189436
54	26	2022-10-13 20:08:22.189436
55	35	2022-10-13 20:08:22.189436
56	69	2022-10-13 20:08:22.189436
57	65	2022-10-13 20:08:22.189436
58	76	2022-10-13 20:08:22.189436
59	34	2022-10-13 20:08:22.189436
60	9	2022-10-13 20:08:22.189436
61	63	2022-10-13 20:08:22.232573
62	63	2022-10-13 20:08:22.232573
63	71	2022-10-13 20:08:22.232573
64	96	2022-10-13 20:08:22.232573
65	13	2022-10-13 20:08:22.232573
66	86	2022-10-13 20:08:22.232573
67	62	2022-10-13 20:08:22.232573
68	2	2022-10-13 20:08:22.232573
69	58	2022-10-13 20:08:22.232573
70	96	2022-10-13 20:08:22.232573
71	76	2022-10-13 20:08:22.257135
72	88	2022-10-13 20:08:22.257135
73	40	2022-10-13 20:08:22.257135
74	49	2022-10-13 20:08:22.257135
75	61	2022-10-13 20:08:22.257135
76	87	2022-10-13 20:08:22.257135
77	4	2022-10-13 20:08:22.257135
78	54	2022-10-13 20:08:22.257135
79	100	2022-10-13 20:08:22.257135
80	4	2022-10-13 20:08:22.257135
81	61	2022-10-13 20:08:22.276337
82	32	2022-10-13 20:08:22.276337
83	21	2022-10-13 20:08:22.276337
84	49	2022-10-13 20:08:22.276337
85	26	2022-10-13 20:08:22.276337
86	13	2022-10-13 20:08:22.276337
87	12	2022-10-13 20:08:22.276337
88	62	2022-10-13 20:08:22.276337
89	98	2022-10-13 20:08:22.276337
90	89	2022-10-13 20:08:22.276337
91	80	2022-10-13 20:08:23.661744
92	33	2022-10-13 20:08:23.661744
93	7	2022-10-13 20:08:23.661744
94	39	2022-10-13 20:08:23.661744
95	48	2022-10-13 20:08:23.661744
96	57	2022-10-13 20:08:23.661744
97	58	2022-10-13 20:08:23.661744
98	28	2022-10-13 20:08:23.661744
99	48	2022-10-13 20:08:23.661744
100	68	2022-10-13 20:08:23.661744
\.


--
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_products (id, order_id, product_id, quantity, created_at, updated_at) FROM stdin;
1	61	14	4	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
2	9	13	4	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
3	68	15	1	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
4	56	13	2	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
5	35	3	3	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
6	58	11	4	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
7	89	5	4	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
8	98	17	1	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
9	50	18	2	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
10	22	4	2	2022-10-14 18:51:25.303969	2022-10-14 18:51:25.303969
11	17	3	4	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
12	63	3	1	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
13	71	19	2	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
14	97	5	3	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
15	48	15	2	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
16	88	5	3	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
17	2	14	3	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
18	43	9	4	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
19	39	17	3	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
20	20	12	5	2022-10-14 18:51:25.376713	2022-10-14 18:51:25.376713
21	46	5	5	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
22	7	5	2	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
23	43	8	4	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
24	74	6	3	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
25	11	3	3	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
26	1	17	4	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
27	20	9	5	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
28	69	16	2	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
29	48	5	2	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
30	46	21	2	2022-10-14 18:51:25.406825	2022-10-14 18:51:25.406825
31	11	8	2	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
32	21	21	4	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
33	79	3	3	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
34	27	5	2	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
35	78	10	2	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
36	88	2	3	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
37	85	3	2	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
38	95	3	5	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
39	31	8	5	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
40	58	6	3	2022-10-14 18:51:25.428107	2022-10-14 18:51:25.428107
41	36	14	5	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
42	44	14	4	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
43	70	17	2	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
44	79	11	4	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
45	48	2	2	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
46	38	8	2	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
47	49	20	1	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
48	40	17	3	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
49	23	13	2	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
50	73	20	2	2022-10-14 18:51:25.467289	2022-10-14 18:51:25.467289
51	52	11	5	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
52	81	22	3	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
53	62	13	4	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
54	75	3	4	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
55	58	9	2	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
56	19	6	1	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
57	77	6	4	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
58	38	19	3	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
59	80	7	4	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
60	50	5	3	2022-10-14 18:51:25.514796	2022-10-14 18:51:25.514796
61	4	20	5	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
62	89	16	4	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
63	94	12	5	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
64	54	3	4	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
65	32	1	3	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
66	50	7	4	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
67	96	15	5	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
68	94	20	3	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
69	96	5	1	2022-10-14 18:51:25.529584	2022-10-14 18:51:25.529584
70	24	6	3	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
71	19	16	2	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
72	39	9	5	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
73	51	5	2	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
74	48	16	2	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
75	72	19	2	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
76	27	6	3	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
77	33	3	5	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
78	33	7	3	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
79	62	18	1	2022-10-14 18:51:25.576457	2022-10-14 18:51:25.576457
80	91	2	4	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
81	76	19	3	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
82	27	3	4	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
83	42	21	1	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
84	87	10	3	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
85	76	7	1	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
86	66	18	4	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
87	9	11	4	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
88	12	9	2	2022-10-14 18:51:25.626085	2022-10-14 18:51:25.626085
89	60	4	3	2022-10-14 18:51:26.804542	2022-10-14 18:51:26.804542
90	81	11	5	2022-10-14 18:51:26.804542	2022-10-14 18:51:26.804542
91	23	5	3	2022-10-14 18:51:26.804542	2022-10-14 18:51:26.804542
92	14	1	3	2022-10-14 18:51:26.804542	2022-10-14 18:51:26.804542
93	90	20	5	2022-10-14 18:51:26.804542	2022-10-14 18:51:26.804542
94	93	17	2	2022-10-14 18:51:26.804542	2022-10-14 18:51:26.804542
95	44	8	3	2022-10-14 18:51:26.804542	2022-10-14 18:51:26.804542
96	72	4	4	2022-10-14 18:51:26.804542	2022-10-14 18:51:26.804542
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, price, catalog_id, created_at) FROM stdin;
1	AMD Sempron 2650	AM1, 2 x 1450 МГц, L2 - 1 МБ, 1хDDR3-1333 МГц, Radeon HD 8240, TDP 25 Вт	499.00	2	2022-10-13 20:01:18.301868
2	AMD FX-4350	4 x 4200 МГц, L2 - 4 МБ, L3 - 8 МБ, 2хDDR3-1866 МГц, TDP 125 Вт	4699.00	2	2022-10-13 20:01:54.73339
3	ASRock A320M-DVS R4.0	AM4, AMD A320, 2xDDR4-3200 МГц, 1xPCI-Ex16, аудио 7.1, Micro-ATX	3799.00	3	2022-10-13 20:01:54.73339
4	Biostar A68MHE	FM2+, AMD A68H, 2xDDR3-2600 МГц, 1xPCI-Ex16, аудио 5.1, Micro-ATX	3799.00	3	2022-10-13 20:01:54.73339
5	GIGABYTE H310M S2H 2.0	LGA 1151-v2, Intel H310, 2xDDR4-2666 МГц, 1xPCI-Ex16, аудио 7.1, Micro-ATX	4399.00	3	2022-10-13 20:01:54.73339
6	KFA2 GeForce GTX 1050 Ti 1-Click OC	PCI-E 3.0, 4 ГБ GDDR5, 128 бит, 1290 МГц - 1392 МГц, HDMI, DisplayPort, DVI-D	21499.00	4	2022-10-13 20:01:54.73339
7	MSI GeForce GTX 1650 D6 VENTUS XS OC	PCI-E 3.0, 4 ГБ GDDR6, 128 бит, 1485 МГц - 1620 МГц, HDMI, DisplayPort, DVI-D	26999.00	4	2022-10-13 20:01:54.73339
8	Palit GeForce RTX 3090 GameRock	PCI-E 4.0, 24 ГБ GDDR6X, 384 бит, 1395 МГц - 1740 МГц, HDMI, DisplayPort 3 шт	299999.00	4	2022-10-13 20:01:54.73339
9	Samsung 8 ГБ	DDR4, 8 ГБx1 шт, 3200 МГц, PC25600	4050.00	6	2022-10-13 20:01:54.73339
10	Patriot Viper 3	DDR3, 4 ГБx2 шт, 1600 МГц, PC12800, 9-9-9-24	4099.00	6	2022-10-13 20:01:54.73339
11	ZET GAMING Rare Minicase MS2 черный	Mini-Tower, Micro-ATX, Mini-ITX, 2x USB 2.0 Type-A, 1x USB 3.2 Gen1 Type-A	3099.00	7	2022-10-13 20:01:54.73339
12	AeroCool Bolt Mini черный	Mini-Tower, Micro-ATX, Mini-ITX, 2x USB 2.0 Type-A, 1x USB 3.2 Gen1 Type-A	3199.00	7	2022-10-13 20:01:54.73339
13	Chieftec TPS-500S	500 Вт, 80+ Bronze, EPS12V, APFC, 20+4 pin, 1x 4+4 pin CPU, 5 шт SATA, 1x 6+2 pin PCI-E	4199.00	8	2022-10-13 20:01:54.73339
14	Cougar STX 550W	550 Вт, EPS12V, APFC, 20+4 pin, 1x 4+4 pin CPU, 6 шт SATA, 2x 6+2 pin PCI-E	4199.00	8	2022-10-13 20:01:54.73339
15	Кулер для процессора ID-Cooling DK-01S	основание - алюминий, 2200 об/мин, 23.8 дБ, 3-pin, 65 Вт	399.00	9	2022-10-13 20:01:54.73339
16	Кулер для процессора AeroCool Verkho 2 Plus	основание - алюминий\\медь, 2000 об/мин, 26.7 дБ, 4-pin, 115 Вт	1150.00	9	2022-10-13 20:01:54.73339
17	Кулер для процессора ID-Cooling SE-913-B PWM	основание - алюминий\\медь, 2200 об/мин, 23.8 дБ, 4-pin, подсветка, 130 Вт	1190.00	9	2022-10-13 20:01:54.73339
18	Seagate BarraCuda	SATA III, 6 Гбит/с, 7200 об/мин, кэш память - 32 МБ	2950.00	5	2022-10-13 20:01:54.73339
19	WD Blue	SATA III, 6 Гбит/с, 7200 об/мин, кэш память - 32 МБ	2999.00	5	2022-10-13 20:01:54.73339
20	DEXP Mars E299	Intel Core i5 9400F, 6x2900 МГц, 8 ГБ DDR4, GeForce GTX 1650, SSD 512 ГБ, без ОС	52999.00	1	2022-10-13 20:01:54.73339
21	HP Pavilion Gaming TG01-1017ur	AMD Ryzen 5 4600G, 6x3700 МГц, 16 ГБ DDR4, GeForce GTX 1650, SSD 512 ГБ, Wi-Fi, без ОС	64999.00	1	2022-10-13 20:01:54.73339
22	Lenovo IdeaCentre G5 14IMB05	Intel Core i5 10400, 6x2900 МГц, 16 ГБ DDR4, GeForce GTX 1660 SUPER, SSD 512 ГБ, Wi-Fi, без ОС	79999.00	1	2022-10-13 20:01:54.73339
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, first_name, last_name, phone, password, position_id, address_id, birthday, created_at) FROM stdin;
1	Benedict	Frost	+79472658122	%B2723243071158415^FwflvvtKawdkh^6110158224?8	5	13	1994-05-12	2022-10-13 19:50:47.267619
2	Tyrone	Trujillo	+79142471441	%B9287075781279672^QbwoowaBueksl^99027223?2	5	38	1982-05-06	2022-10-13 19:50:47.267619
3	Octavius	Riddle	+79484756184	%B3415858872455870^XndpcjaPixvfm^35094946?2	5	72	1980-06-03	2022-10-13 19:50:47.267619
4	Kaseem	Justice	+79246666667	%B8746643511772361^PvgaxhgDjyifx^54116802191?8	5	101	1981-05-26	2022-10-13 19:50:47.267619
5	Eve	Cochran	+79676787672	%B8212335314599186^XtokomqFxssza^31075652?7	5	26	1976-01-20	2022-10-13 19:50:47.267619
6	Robert	Melendez	+79562737459	%B3323817927774468^QijifnjFxwpui^10062201535?1	2	72	1982-04-16	2022-10-13 19:50:47.267619
7	Olivia	Wheeler	+79676365674	%B1807335045368345^IopvosbCuoxbv^84112488?1	4	66	1974-07-14	2022-10-13 19:50:47.267619
8	Noelle	Doyle	+79614794879	%B8181431085482889^DyilbvlNurfiw^2507931946?8	1	45	1981-06-25	2022-10-13 19:50:47.267619
9	Chester	Reeves	+79874926459	%B1773995034978901^ZrfbnqgHprwii^7807810439?6	2	39	1971-12-19	2022-10-13 19:50:47.267619
10	Jacqueline	Chandler	+79624353381	%B1308608445542152^FvckbbxMecrwu^41116304?3	1	77	2000-10-11	2022-10-13 19:50:47.267619
11	Heidi	Johnston	+79155694231	%B7154721187598687^OqgbbggKgtmrk^53056328?3	2	21	1976-01-15	2022-10-13 19:50:55.951508
12	Elizabeth	Schneider	+79543617452	%B2525699185785626^GkqrslwSdxose^53089555163?7	1	101	1994-02-26	2022-10-13 19:50:55.951508
13	Dennis	Elliott	+79145216297	%B5758628285987265^JwzjbssIcrwjq^48047659168?2	4	31	1993-03-11	2022-10-13 19:50:55.951508
14	Guinevere	Bond	+79145457532	%B5626125586715328^YvopbozRngjtq^78041371297?8	2	37	1989-05-29	2022-10-13 19:50:55.951508
15	Raya	Rosario	+79223183271	%B8546234160434583^QjmgbbbCccmxu^22027808?1	2	45	1971-02-28	2022-10-13 19:50:55.951508
16	Luke	Buckner	+79536069628	%B1505340810217575^DyoyoftJyfqzg^1811483751?3	1	104	1987-03-04	2022-10-13 19:50:55.951508
17	Quamar	Kerr	+79832444958	%B2558143137325498^LqcheghTvocwk^5304908341?4	2	79	1981-07-06	2022-10-13 19:50:55.951508
18	Nerea	Ball	+79177162156	%B2883713184374418^PnnspseMuamxc^1602943687?1	1	58	1975-02-22	2022-10-13 19:50:55.951508
19	Scott	Myers	+79638773146	%B9181473333682969^DrfushjThwuac^12042085354?6	2	76	2002-03-09	2022-10-13 19:50:55.951508
20	Alexis	Luna	+79666956462	%B1399234417187883^HrzckgcQhiiqr^28052227? 	5	75	1977-03-16	2022-10-13 19:50:55.951508
21	Mollie	Rocha	+79452027813	%B9463517626561188^GsfhwycOycayy^50082941575?1	1	89	1975-09-18	2022-10-13 19:51:12.880336
22	Geoffrey	Hobbs	+79222295439	%B8314928124530295^HkfouenCnlxyo^71029802?5	1	59	1979-07-28	2022-10-13 19:51:12.880336
23	Lysandra	Paul	+79879324120	%B2554441137817122^NdmzwdnSwpggh^0707542180?2	4	34	1971-10-03	2022-10-13 19:51:12.880336
24	Sebastian	Trevino	+79458256245	%B8220825627325104^RhgcftcYpeltd^44055095?9	2	28	1988-12-08	2022-10-13 19:51:12.880336
25	Larissa	Boyle	+79351747476	%B4399354784176358^VbzmbetKwmkxv^54128815?8	1	74	2001-12-19	2022-10-13 19:51:12.880336
26	Kessie	Waters	+79678332557	%B7107478370385137^MtsubjgOyecrc^8903150626?4	4	39	1985-07-16	2022-10-13 19:51:12.880336
27	Fiona	Freeman	+79686882245	%B6849153452056254^GzdqicrYzaore^8604255350?1	5	55	2001-04-24	2022-10-13 19:51:12.880336
28	Joy	Hensley	+79848737040	%B3474885527161734^MeonhphGmahll^67053344? 	1	61	1982-05-24	2022-10-13 19:51:12.880336
29	Francis	Stout	+79758244937	%B8061473521415248^CqrytaoLwfvki^3911336848?5	4	71	2000-10-18	2022-10-13 19:51:12.880336
30	Eugenia	Copeland	+79548715955	%B3675693164346151^XqbohgeCvccjm^6511323781?2	5	45	1987-04-16	2022-10-13 19:51:12.880336
31	Noelle	Richard	+79847617888	%B3422217509311368^SrbyuosKalmqs^11043077413?5	2	55	1983-08-24	2022-10-13 19:51:20.674966
32	Alexandra	Tanner	+79609663198	%B2273520033881387^GgsfomtSgirnu^3906609790? 	4	91	1972-12-25	2022-10-13 19:51:20.674966
33	Ivory	Poole	+79064893995	%B5617132558486835^VutixfeMoogfd^08074169705?1	1	20	1974-06-03	2022-10-13 19:51:20.674966
34	Aimee	Terrell	+79069883276	%B3353689582681067^BuzmqcxSmptpm^42031976796?1	4	27	1981-05-20	2022-10-13 19:51:20.674966
35	Audrey	Chambers	+79132225973	%B2841417475656786^WiluibmEfisur^4610364259?2	2	89	1982-12-20	2022-10-13 19:51:20.674966
36	Donovan	Peck	+79388925880	%B6738957358854338^CfqjdjsHabpiv^36099633?8	1	67	1978-10-04	2022-10-13 19:51:20.674966
37	Edan	Soto	+79076358226	%B2447760134928050^AjmhzceBvguax^14077777?5	2	48	1983-10-02	2022-10-13 19:51:20.674966
38	Burton	Burch	+79563867664	%B3748276818258251^PssgixgPspeje^98047667697?2	1	74	1989-07-05	2022-10-13 19:51:20.674966
39	Whitney	Hurley	+79316728649	%B1786277316272284^WyqaqnmAnhovw^21091318533?2	4	92	1998-11-15	2022-10-13 19:51:20.674966
40	Hamilton	Burt	+79296713131	%B4933642003362995^ZfpnltmUwdydw^6501503433?7	5	69	1972-01-13	2022-10-13 19:51:20.674966
41	Zeph	Donovan	+79384076451	%B5741887938558952^VmhvqrhYtgyni^52123183?1	1	42	1990-03-16	2022-10-13 19:51:28.817851
42	Jael	Sampson	+79411583769	%B2447034661085783^QekxnbsJdwjcv^0501721410?1	1	83	1979-02-25	2022-10-13 19:51:28.817851
43	Anastasia	Gilliam	+79355024758	%B9731118485760842^NhgdmqfXgbudy^4501386678?5	5	19	1988-05-03	2022-10-13 19:51:28.817851
44	Jordan	Tucker	+79018846285	%B7348428702535648^KrirjmwQpabfu^2701200683?6	1	13	1980-12-02	2022-10-13 19:51:28.817851
45	Lynn	Wells	+79725198647	%B6684824967581516^NovinsyPingow^17026399396?2	1	43	1995-10-29	2022-10-13 19:51:28.817851
46	Brielle	Velez	+79763815272	%B6197874111372117^SlsirhxHpsxdx^8807497138?1	1	81	1981-09-17	2022-10-13 19:51:28.817851
47	Raya	Burke	+79524621238	%B6860162802005381^CpfvsvbMlvchk^38088878409?4	1	69	1977-12-20	2022-10-13 19:51:28.817851
48	Felicia	Kane	+79724719563	%B3831353247815221^UjoiqnmYndbkl^47029264?3	4	28	1987-07-14	2022-10-13 19:51:28.817851
49	Conan	Walton	+79465235377	%B3265394125957138^CwrbbhbLowhfy^32064758?1	2	55	1992-07-17	2022-10-13 19:51:28.817851
50	Mara	Burton	+79495467680	%B7329698452686430^FvibfyyWgpmzc^0905832947?7	2	23	1980-09-02	2022-10-13 19:51:28.817851
51	Hyacinth	Durham	+79842412395	%B3055846733955274^NjfbfxnCivivq^95089524795?2	4	38	1992-05-22	2022-10-13 19:52:05.117481
52	Elton	Duran	+79431397780	%B3800828438652347^WqkpdodGqoggd^94068229?4	4	9	1977-01-13	2022-10-13 19:52:05.117481
53	Macon	Gill	+79135488433	%B9119636829411450^VoexcuvNestml^05025189645?4	1	81	1989-01-10	2022-10-13 19:52:05.117481
54	Garrison	Howard	+79284176862	%B8377952202481533^IbhwqupHudmmh^6705377597?9	1	59	1986-11-26	2022-10-13 19:52:05.117481
55	Nasim	Coleman	+79295461938	%B7773256893748579^VtmfepjPpsboy^2008657586?2	5	101	1990-12-28	2022-10-13 19:52:05.117481
56	Shelley	Padilla	+79032733733	%B6307166607283365^PidkrapQislly^46101775?1	1	107	1975-05-22	2022-10-13 19:52:05.117481
57	Alisa	Estes	+79631146328	%B6222527615742528^HwzkwptOgpedu^57066701877?1	1	50	1977-06-08	2022-10-13 19:52:05.117481
58	Duncan	Mcknight	+79697246310	%B8737617886062773^QhidpmpXtokoh^8502201236?8	2	28	1993-02-04	2022-10-13 19:52:05.117481
59	Chantale	Joyce	+79069117458	%B8687396584941682^RyxupcpPgcghj^87022113196?6	1	83	1989-09-19	2022-10-13 19:52:05.117481
60	Raphael	Tyson	+79828123231	%B8245092776516470^SolqfspEpiisy^46041625048?7	1	32	1982-02-24	2022-10-13 19:52:05.117481
61	Miranda	Morrow	+79927678513	%B6134407686846896^TjmgxxlImshlc^78016994?3	5	82	1971-10-08	2022-10-13 19:52:17.236941
62	Howard	Parks	+79475202242	%B8414741674268296^GfsgnukEsjtnt^13127076021?6	2	56	1987-06-21	2022-10-13 19:52:17.236941
63	Ryan	Green	+79852524495	%B2131153165674953^XrxacoeFjfhmm^5205155489?3	1	91	1977-09-06	2022-10-13 19:52:17.236941
64	Elton	Frank	+79453517245	%B5493124337623234^TsufxmaFslewg^1206795298?8	2	75	1995-11-14	2022-10-13 19:52:17.236941
65	Alfreda	Malone	+79752472315	%B9537465873937257^EkfwwfuXqopmm^7403803414?7	2	53	1970-04-23	2022-10-13 19:52:17.236941
66	Daphne	Lane	+79662552735	%B1117205153916984^TfmbqgmQscxsf^80126088?7	5	21	1972-12-17	2022-10-13 19:52:17.236941
67	Ulric	Rogers	+79877025167	%B4565468064973367^YnrmvezBatlym^83033734?8	1	68	1985-04-03	2022-10-13 19:52:17.236941
68	Miranda	Foreman	+79847737136	%B4943158269327730^VtobsiwXqbgxw^2201533846?6	5	14	1981-06-04	2022-10-13 19:52:17.236941
69	Allistair	Cochran	+79029925571	%B2215861621490033^TesvchuUyxmbo^15094413249?3	3	88	1979-08-17	2022-10-13 19:52:17.236941
70	Cyrus	Carver	+79886902929	%B5657318251549795^MpmfymtVxerrn^6610399828?2	2	105	2002-11-13	2022-10-13 19:52:17.236941
71	Fitzgerald	Preston	+79607673476	%B2514654638085481^GnmdxkbGcbtya^7508646299?6	2	24	1976-04-19	2022-10-13 19:52:24.036908
72	Emerson	Simpson	+79412281355	%B2712882768263226^EkjiduhFpfmmn^22071483859?5	1	93	1975-06-10	2022-10-13 19:52:24.036908
73	Quinlan	Glass	+79326773677	%B2533059134145494^PfkuepfFtxrna^3503793234?4	1	89	1983-05-09	2022-10-13 19:52:24.036908
74	Gary	Rodriguez	+79132693291	%B2275736141060510^GwjakfxBejmyl^5111617952?7	2	63	1983-12-12	2022-10-13 19:52:24.036908
75	Moses	Waller	+79122568722	%B7587582682729182^PiubthzPjmfnt^3911359563?2	1	101	1996-03-03	2022-10-13 19:52:24.036908
76	Matthew	Long	+79531778918	%B8968522638662421^MybbmdiMehbcv^23064997?4	1	55	1992-07-29	2022-10-13 19:52:24.036908
77	Sigourney	Turner	+79642714731	%B3012187775102263^RgowavhOsvyop^65035267814?8	2	17	1974-08-25	2022-10-13 19:52:24.036908
78	Mark	Abbott	+79274622288	%B9823226123973897^WcanvydEexipv^29059066408?2	1	102	1980-09-13	2022-10-13 19:52:24.036908
79	Zeph	Duffy	+79839458347	%B1846373725927856^PerxmpdRhfcir^4307320448?6	3	43	1970-12-29	2022-10-13 19:52:24.036908
80	Cora	Aguirre	+79373336955	%B2824204803766549^QpksdihGxrpdv^11099029336?8	2	66	1997-03-24	2022-10-13 19:52:24.036908
81	Zorita	Bates	+79882566867	%B7931978641935332^IkilmjvLqtyey^71025608741?1	2	83	1971-09-19	2022-10-13 19:52:32.358118
82	Maisie	Duffy	+79146923243	%B5082318163743362^VugqaskKjctqi^7905813561?6	1	47	1978-08-13	2022-10-13 19:52:32.358118
83	Lynn	Ferrell	+79189776621	%B6354627188756734^XagevasRjzyws^2607668828?1	2	42	1974-01-11	2022-10-13 19:52:32.358118
84	Indira	Crawford	+79671022357	%B6622275036513319^KktbfpqBkkdtw^87089225?5	3	19	1990-08-21	2022-10-13 19:52:32.358118
85	Nomlanga	Rollins	+79338787177	%B4853247562063938^RjvhyvjKzqese^52112053241?2	5	9	1973-01-06	2022-10-13 19:52:32.358118
86	Leigh	Kidd	+79914228370	%B1621055642515274^AmwmcfhFdvpep^05123288?9	2	29	1976-08-21	2022-10-13 19:52:32.358118
87	Demetrius	Wood	+79788486435	%B8968485292526557^NidcpxnAyvwuo^03087614741?6	1	63	1995-04-16	2022-10-13 19:52:32.358118
88	Melyssa	Andrews	+79109454665	%B9286272964323289^GkgktxrFdklgo^73113458?5	2	88	1984-07-17	2022-10-13 19:52:32.358118
89	Jack	Watkins	+79349063656	%B4315627874201096^AfvabjqCdkugb^1408881498?7	1	15	1986-07-19	2022-10-13 19:52:32.358118
90	Cedric	Armstrong	+79656718735	%B4356218468355273^LtmjmdiUzmeuq^4007928188?9	3	35	1977-11-18	2022-10-13 19:52:32.358118
91	Alec	Long	+79861815720	%B4698561736581234^SxsdpvmRexfgp^41059015392?2	3	21	1992-11-13	2022-10-13 19:52:52.329784
92	Jaden	Lewis	+79834872937	%B3220239171429254^VjwbgkgKwqdbv^25039255?4	3	99	1992-01-20	2022-10-13 19:52:52.329784
93	Josephine	Short	+79306743255	%B4714468273684564^JieplvjPbetxh^8412493829?8	1	70	1972-06-27	2022-10-13 19:52:52.329784
94	Eve	Blankenship	+79323854452	%B8931218574681722^KhtjhncOgshuw^69016299?1	5	76	1993-11-22	2022-10-13 19:52:52.329784
95	Joshua	Petty	+79731366828	%B3968964104173527^JqnmnlvCwuxrm^4612215161?4	4	80	1977-02-18	2022-10-13 19:52:52.329784
96	Autumn	Myers	+79227276785	%B6455078812415275^KqyirxrQljrhh^14073027417?2	5	32	1996-01-30	2022-10-13 19:52:52.329784
97	Aladdin	Bean	+79615422113	%B7377221592535349^VzolgnpWlbrqu^79044602?7	1	101	1991-11-25	2022-10-13 19:52:52.329784
98	Hedwig	Barron	+79544286827	%B7689621674611542^OyelcozFxmymr^7104178213?1	5	98	1989-07-23	2022-10-13 19:52:52.329784
99	Kyla	Lynch	+79821363721	%B4428257829233568^VmvnwqgHxobhy^5709232830?6	3	17	1970-06-20	2022-10-13 19:52:52.329784
100	Karleigh	Kerr	+79879656369	%B4745353644857487^MkqkweoNqghos^2702428485?6	4	95	1987-11-12	2022-10-13 19:52:52.329784
\.


--
-- Data for Name: staff_positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_positions (id, name) FROM stdin;
1	seller
2	consultant
3	tech-enginer
4	merchandiser
5	manager
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, manager_id, address_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	\N	6
7	\N	7
\.


--
-- Data for Name: stores_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores_products (id, store_id, product_id, remainder, created_at, updated_at) FROM stdin;
1	2	17	11	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
2	4	2	9	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
3	1	19	11	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
4	2	9	22	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
5	7	19	5	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
6	6	12	24	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
7	2	8	10	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
8	2	11	7	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
9	3	18	14	2022-10-13 20:05:58.121918	2022-10-13 20:05:58.121918
10	6	3	13	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
11	6	14	23	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
12	6	19	9	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
13	1	17	21	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
14	1	5	20	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
15	3	6	14	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
16	6	16	17	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
17	6	4	21	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
18	6	6	8	2022-10-13 20:05:58.202472	2022-10-13 20:05:58.202472
19	6	20	17	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
20	5	9	1	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
21	6	1	6	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
22	4	21	2	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
23	6	5	23	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
24	6	13	4	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
25	5	10	1	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
26	3	12	14	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
27	1	16	9	2022-10-13 20:05:58.233083	2022-10-13 20:05:58.233083
28	6	21	7	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
29	2	19	14	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
30	2	15	21	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
31	1	3	22	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
32	5	3	9	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
33	2	6	3	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
34	2	18	14	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
35	5	19	13	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
36	2	2	11	2022-10-13 20:05:58.246358	2022-10-13 20:05:58.246358
37	6	7	11	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
38	5	20	11	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
39	3	20	1	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
40	5	6	19	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
41	3	13	16	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
42	2	14	7	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
43	2	4	15	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
44	5	8	6	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
45	7	18	23	2022-10-13 20:05:58.26123	2022-10-13 20:05:58.26123
46	4	17	24	2022-10-13 20:05:58.273775	2022-10-13 20:05:58.273775
47	7	20	22	2022-10-13 20:05:58.273775	2022-10-13 20:05:58.273775
48	3	15	21	2022-10-13 20:05:58.273775	2022-10-13 20:05:58.273775
49	4	13	19	2022-10-13 20:05:58.273775	2022-10-13 20:05:58.273775
50	3	8	10	2022-10-13 20:05:58.273775	2022-10-13 20:05:58.273775
51	4	10	4	2022-10-13 20:05:58.273775	2022-10-13 20:05:58.273775
52	7	3	8	2022-10-13 20:05:58.273775	2022-10-13 20:05:58.273775
53	6	2	24	2022-10-13 20:05:58.273775	2022-10-13 20:05:58.273775
54	1	1	21	2022-10-13 20:05:58.323901	2022-10-13 20:05:58.323901
55	7	16	10	2022-10-13 20:05:58.323901	2022-10-13 20:05:58.323901
56	4	20	10	2022-10-13 20:05:58.323901	2022-10-13 20:05:58.323901
57	7	8	10	2022-10-13 20:05:58.323901	2022-10-13 20:05:58.323901
58	5	2	1	2022-10-13 20:05:58.323901	2022-10-13 20:05:58.323901
59	1	8	9	2022-10-13 20:05:58.323901	2022-10-13 20:05:58.323901
60	3	21	17	2022-10-13 20:05:58.323901	2022-10-13 20:05:58.323901
61	4	5	15	2022-10-13 20:05:58.336736	2022-10-13 20:05:58.336736
62	5	12	22	2022-10-13 20:05:58.336736	2022-10-13 20:05:58.336736
63	4	12	19	2022-10-13 20:05:58.336736	2022-10-13 20:05:58.336736
64	6	8	18	2022-10-13 20:05:58.336736	2022-10-13 20:05:58.336736
65	3	5	9	2022-10-13 20:05:58.336736	2022-10-13 20:05:58.336736
66	4	9	17	2022-10-13 20:05:58.350825	2022-10-13 20:05:58.350825
67	6	17	10	2022-10-13 20:05:58.350825	2022-10-13 20:05:58.350825
68	2	10	23	2022-10-13 20:05:58.350825	2022-10-13 20:05:58.350825
69	7	7	10	2022-10-13 20:05:58.350825	2022-10-13 20:05:58.350825
70	3	10	7	2022-10-13 20:05:58.350825	2022-10-13 20:05:58.350825
71	5	5	3	2022-10-13 20:06:01.363544	2022-10-13 20:06:01.363544
72	7	2	22	2022-10-13 20:06:01.363544	2022-10-13 20:06:01.363544
73	5	18	7	2022-10-13 20:06:01.363544	2022-10-13 20:06:01.363544
74	7	17	16	2022-10-13 20:06:01.363544	2022-10-13 20:06:01.363544
75	5	16	13	2022-10-13 20:06:01.363544	2022-10-13 20:06:01.363544
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 208, true);


--
-- Name: catalogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalogs_id_seq', 16, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 100, true);


--
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discounts_id_seq', 30, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 100, true);


--
-- Name: orders_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_products_id_seq', 96, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 22, true);


--
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 100, true);


--
-- Name: staff_positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_positions_id_seq', 5, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 7, true);


--
-- Name: stores_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_products_id_seq', 75, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: catalogs catalogs_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogs
    ADD CONSTRAINT catalogs_name_key UNIQUE (name);


--
-- Name: catalogs catalogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogs
    ADD CONSTRAINT catalogs_pkey PRIMARY KEY (id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders_products orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: staff staff_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_phone_key UNIQUE (phone);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- Name: staff_positions staff_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_positions
    ADD CONSTRAINT staff_positions_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: stores_products stores_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores_products
    ADD CONSTRAINT stores_products_pkey PRIMARY KEY (id);


--
-- Name: discounts discounts_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.catalogs(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: discounts discounts_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: discounts discounts_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders_products orders_products_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders_products orders_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: products products_catalog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_catalog_id_fkey FOREIGN KEY (catalog_id) REFERENCES public.catalogs(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: staff staff_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: staff staff_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.staff_positions(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: stores stores_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: stores stores_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.staff(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: stores_products stores_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores_products
    ADD CONSTRAINT stores_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: stores_products stores_products_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores_products
    ADD CONSTRAINT stores_products_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.stores(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
