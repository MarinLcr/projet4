--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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
-- Name: state; Type: TYPE; Schema: public; Owner: marinleclerc
--

CREATE TYPE public.state AS ENUM (
    'unassigned',
    'assigned'
);


ALTER TYPE public.state OWNER TO marinleclerc;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adress; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.adress (
    adressid integer NOT NULL,
    country character varying(20) NOT NULL,
    city character varying(30) NOT NULL,
    street character varying(60) NOT NULL,
    streetnumber integer NOT NULL,
    postalnumber integer NOT NULL,
    userid integer
);


ALTER TABLE public.adress OWNER TO marinleclerc;

--
-- Name: adress_adressid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.adress_adressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adress_adressid_seq OWNER TO marinleclerc;

--
-- Name: adress_adressid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.adress_adressid_seq OWNED BY public.adress.adressid;


--
-- Name: creditcard; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.creditcard (
    creditcardid integer NOT NULL,
    numero bigint NOT NULL,
    experydate date NOT NULL,
    cryptogram integer NOT NULL,
    cardholdername character varying(30) NOT NULL,
    userid integer
);


ALTER TABLE public.creditcard OWNER TO marinleclerc;

--
-- Name: creditcard_creditcardid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.creditcard_creditcardid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creditcard_creditcardid_seq OWNER TO marinleclerc;

--
-- Name: creditcard_creditcardid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.creditcard_creditcardid_seq OWNED BY public.creditcard.creditcardid;


--
-- Name: deliverer; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.deliverer (
    delivererid integer NOT NULL,
    name character varying(20) NOT NULL,
    available character(1),
    latitude numeric,
    longitude numeric
);


ALTER TABLE public.deliverer OWNER TO marinleclerc;

--
-- Name: deliverer_delivererid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.deliverer_delivererid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliverer_delivererid_seq OWNER TO marinleclerc;

--
-- Name: deliverer_delivererid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.deliverer_delivererid_seq OWNED BY public.deliverer.delivererid;


--
-- Name: delivery; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.delivery (
    deliveryid integer NOT NULL,
    date date NOT NULL,
    delivererid integer,
    adressid integer
);


ALTER TABLE public.delivery OWNER TO marinleclerc;

--
-- Name: delivery_deliveryid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.delivery_deliveryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_deliveryid_seq OWNER TO marinleclerc;

--
-- Name: delivery_deliveryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.delivery_deliveryid_seq OWNED BY public.delivery.deliveryid;


--
-- Name: dish; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.dish (
    dishid integer NOT NULL,
    name character varying(25) NOT NULL,
    description text NOT NULL,
    price smallint NOT NULL
);


ALTER TABLE public.dish OWNER TO marinleclerc;

--
-- Name: dish_dishid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.dish_dishid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dish_dishid_seq OWNER TO marinleclerc;

--
-- Name: dish_dishid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.dish_dishid_seq OWNED BY public.dish.dishid;


--
-- Name: dishday; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.dishday (
    dishdayid integer NOT NULL,
    dishid integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.dishday OWNER TO marinleclerc;

--
-- Name: dishday_dishdayid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.dishday_dishdayid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishday_dishdayid_seq OWNER TO marinleclerc;

--
-- Name: dishday_dishdayid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.dishday_dishdayid_seq OWNED BY public.dishday.dishdayid;


--
-- Name: orderdish; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.orderdish (
    orderdishid integer NOT NULL,
    orderid integer,
    dishdayid integer,
    quantity integer NOT NULL
);


ALTER TABLE public.orderdish OWNER TO marinleclerc;

--
-- Name: orderdish_orderdishid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.orderdish_orderdishid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderdish_orderdishid_seq OWNER TO marinleclerc;

--
-- Name: orderdish_orderdishid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.orderdish_orderdishid_seq OWNED BY public.orderdish.orderdishid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    dateorder date NOT NULL,
    houre time without time zone NOT NULL,
    userid integer,
    deliveryid integer,
    billnumber bigint NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.orders OWNER TO marinleclerc;

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderid_seq OWNER TO marinleclerc;

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- Name: role; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.role (
    roleid integer NOT NULL,
    rolename character varying(20) NOT NULL
);


ALTER TABLE public.role OWNER TO marinleclerc;

--
-- Name: users; Type: TABLE; Schema: public; Owner: marinleclerc
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(30) NOT NULL,
    mail character varying(50) NOT NULL,
    phonenumber bigint NOT NULL,
    roleid integer
);


ALTER TABLE public.users OWNER TO marinleclerc;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: marinleclerc
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO marinleclerc;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marinleclerc
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: adress adressid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.adress ALTER COLUMN adressid SET DEFAULT nextval('public.adress_adressid_seq'::regclass);


--
-- Name: creditcard creditcardid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.creditcard ALTER COLUMN creditcardid SET DEFAULT nextval('public.creditcard_creditcardid_seq'::regclass);


--
-- Name: deliverer delivererid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.deliverer ALTER COLUMN delivererid SET DEFAULT nextval('public.deliverer_delivererid_seq'::regclass);


--
-- Name: delivery deliveryid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.delivery ALTER COLUMN deliveryid SET DEFAULT nextval('public.delivery_deliveryid_seq'::regclass);


--
-- Name: dish dishid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.dish ALTER COLUMN dishid SET DEFAULT nextval('public.dish_dishid_seq'::regclass);


--
-- Name: dishday dishdayid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.dishday ALTER COLUMN dishdayid SET DEFAULT nextval('public.dishday_dishdayid_seq'::regclass);


--
-- Name: orderdish orderdishid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.orderdish ALTER COLUMN orderdishid SET DEFAULT nextval('public.orderdish_orderdishid_seq'::regclass);


--
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: adress; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.adress (adressid, country, city, street, streetnumber, postalnumber, userid) FROM stdin;
1	France	Paris	rue Echange	42	75000	1
2	France	Paris	rue Paradis	12	75000	2
3	France	Paris	rue Pommier	30	75003	3
4	France	Paris	rue Pompidou	10	75116	4
5	France	Paris	rue Georges	8	75013	5
6	France	Paris	rue Tronsseau	1	75020	6
7	France	Paris	rue du Grimoir	42	75014	7
8	France	Paris	rue du Set	15	75010	8
9	France	Paris	rue de Republique	23	75007	9
\.


--
-- Data for Name: creditcard; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.creditcard (creditcardid, numero, experydate, cryptogram, cardholdername, userid) FROM stdin;
1	1897864164270971	2019-11-08	851	Blin	2
2	9061754189754051	2019-10-30	761	Beasse	3
3	2349097568413290	2019-12-12	896	Lohier	1
4	7897906154717891	2019-10-14	327	Breteau	4
\.


--
-- Data for Name: deliverer; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.deliverer (delivererid, name, available, latitude, longitude) FROM stdin;
1	Landeau	y	47.216842	-1.556744
2	Beunard	n	47.195691	-1.656197
3	Besnard	n	47.825231	-1.489162
4	Olivier	y	47.742961	-1.862081
5	Bourdon	y	47.964918	-1.652973
\.


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.delivery (deliveryid, date, delivererid, adressid) FROM stdin;
1	2019-07-24	1	3
2	2019-07-24	3	1
3	2019-07-25	4	2
4	2019-07-25	2	4
5	2019-07-25	4	1
\.


--
-- Data for Name: dish; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.dish (dishid, name, description, price) FROM stdin;
1	pizza trois fromages	Pizza avec trois fromages	12
3	Cheese burger	Cheese burger avec des frites	10
4	paella	paella au fruits de mer	14
5	Galette	galette bretonne	9
6	boeuf bourguignon	galette bretonne traditionnelle	13
7	tartiflette	tartiflette	11
8	pizza de la mer	pizza aux fruits de mer	15
9	entrecote	entrecote avec des frites	14
\.


--
-- Data for Name: dishday; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.dishday (dishdayid, dishid, date) FROM stdin;
1	1	2019-07-24
2	3	2019-07-24
3	6	2019-07-25
4	9	2019-07-25
5	8	2019-07-26
6	4	2019-07-26
7	5	2019-07-27
8	7	2019-07-27
9	3	2019-07-28
10	9	2019-07-28
11	1	2019-07-29
12	6	2019-07-29
13	5	2019-07-30
14	8	2019-07-30
15	4	2019-07-31
16	7	2019-07-31
\.


--
-- Data for Name: orderdish; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.orderdish (orderdishid, orderid, dishdayid, quantity) FROM stdin;
1	1	3	2
2	2	1	1
3	3	9	1
4	4	6	1
5	5	8	3
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.orders (orderid, dateorder, houre, userid, deliveryid, billnumber, price) FROM stdin;
1	2019-07-24	19:45:00	3	1	201900001	20
2	2019-07-24	20:12:00	1	2	201900002	12
3	2019-07-25	21:07:00	2	3	201900003	14
4	2019-07-25	19:47:00	4	4	201900004	13
5	2019-07-26	19:31:00	1	5	201900005	45
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.role (roleid, rolename) FROM stdin;
1	client
2	chef
3	livreur
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: marinleclerc
--

COPY public.users (userid, name, surname, mail, phonenumber, roleid) FROM stdin;
1	Lohier	Johan	johan.lohier@gmail.com	762547283	1
2	Blin	Aurélie	aurelie.blin@gmail.com	687519871	1
3	Beasse	Mathis	mathis.beasse@gmail.com	790876163	1
4	Breteau	Alan	alan.breteau@gmail.com	723618906	1
5	Landeau	Gabriel	gabriel.landeau@gmail.com	780754442	3
6	Beunard	Marin	marin.beunard@gmail.com	790875131	3
7	Besnard	Thomas	thomas.besnard@gmail.com	765908712	3
8	Olivier	Alia	alia.olivier@gmail.com	654789132	3
9	Bourdon	Marie	marie.bourdon@gmail.com	790754261	3
\.


--
-- Name: adress_adressid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.adress_adressid_seq', 9, true);


--
-- Name: creditcard_creditcardid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.creditcard_creditcardid_seq', 4, true);


--
-- Name: deliverer_delivererid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.deliverer_delivererid_seq', 5, true);


--
-- Name: delivery_deliveryid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.delivery_deliveryid_seq', 5, true);


--
-- Name: dish_dishid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.dish_dishid_seq', 9, true);


--
-- Name: dishday_dishdayid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.dishday_dishdayid_seq', 16, true);


--
-- Name: orderdish_orderdishid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.orderdish_orderdishid_seq', 5, true);


--
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 5, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: marinleclerc
--

SELECT pg_catalog.setval('public.users_userid_seq', 9, true);


--
-- Name: adress adress_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.adress
    ADD CONSTRAINT adress_pkey PRIMARY KEY (adressid);


--
-- Name: creditcard creditcard_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.creditcard
    ADD CONSTRAINT creditcard_pkey PRIMARY KEY (creditcardid);


--
-- Name: deliverer deliverer_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.deliverer
    ADD CONSTRAINT deliverer_pkey PRIMARY KEY (delivererid);


--
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (deliveryid);


--
-- Name: dish dish_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (dishid);


--
-- Name: dishday dishday_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.dishday
    ADD CONSTRAINT dishday_pkey PRIMARY KEY (dishdayid);


--
-- Name: orderdish orderdish_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.orderdish
    ADD CONSTRAINT orderdish_pkey PRIMARY KEY (orderdishid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: adress adress_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.adress
    ADD CONSTRAINT adress_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: creditcard creditcard_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.creditcard
    ADD CONSTRAINT creditcard_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: delivery delivery_adressid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_adressid_fkey FOREIGN KEY (adressid) REFERENCES public.adress(adressid);


--
-- Name: delivery delivery_delivererid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_delivererid_fkey FOREIGN KEY (delivererid) REFERENCES public.deliverer(delivererid);


--
-- Name: dishday dishday_dishid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.dishday
    ADD CONSTRAINT dishday_dishid_fkey FOREIGN KEY (dishid) REFERENCES public.dish(dishid);


--
-- Name: orderdish orderdish_dishdayid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.orderdish
    ADD CONSTRAINT orderdish_dishdayid_fkey FOREIGN KEY (dishdayid) REFERENCES public.dishday(dishdayid);


--
-- Name: orderdish orderdish_ordererid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.orderdish
    ADD CONSTRAINT orderdish_ordererid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- Name: orders orders_deliveryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_deliveryid_fkey FOREIGN KEY (deliveryid) REFERENCES public.delivery(deliveryid);


--
-- Name: orders orders_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: users users_roleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marinleclerc
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.role(roleid);


--
-- PostgreSQL database dump complete
--

