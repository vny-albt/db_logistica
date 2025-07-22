--
-- PostgreSQL database cluster dump
--

-- Started on 2025-07-22 15:50:27

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-22 15:50:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-07-22 15:50:28

--
-- PostgreSQL database dump complete
--

--
-- Database "db_logistica" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-22 15:50:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4952 (class 1262 OID 16757)
-- Name: db_logistica; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_logistica WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE db_logistica OWNER TO postgres;

\connect db_logistica

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 224 (class 1259 OID 16782)
-- Name: armazens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armazens (
    armazem_id integer NOT NULL,
    nome character varying(100),
    cidade character varying(50),
    estado character varying(2),
    capacidade_armazenagem_m3 numeric(12,2)
);


ALTER TABLE public.armazens OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16781)
-- Name: armazens_armazem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.armazens_armazem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.armazens_armazem_id_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 223
-- Name: armazens_armazem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.armazens_armazem_id_seq OWNED BY public.armazens.armazem_id;


--
-- TOC entry 218 (class 1259 OID 16759)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    cliente_id integer NOT NULL,
    nome character varying(100),
    cnpj_cpf character varying(20),
    endereco text,
    cidade character varying(50),
    estado character varying(2),
    pais character varying(50),
    tipo_cliente character varying(20)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16758)
-- Name: clientes_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_cliente_id_seq OWNED BY public.clientes.cliente_id;


--
-- TOC entry 226 (class 1259 OID 16789)
-- Name: entregas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entregas (
    entrega_id integer NOT NULL,
    cliente_id integer,
    armazem_id integer,
    transportadora_id integer,
    data_saida date,
    data_entrega date,
    status_entrega character varying(20),
    distancia_km numeric(10,2),
    tempo_estimado_horas numeric(6,2),
    tempo_real_horas numeric(6,2)
);


ALTER TABLE public.entregas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16788)
-- Name: entregas_entrega_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entregas_entrega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entregas_entrega_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 225
-- Name: entregas_entrega_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entregas_entrega_id_seq OWNED BY public.entregas.entrega_id;


--
-- TOC entry 228 (class 1259 OID 16811)
-- Name: itens_entrega; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itens_entrega (
    item_id integer NOT NULL,
    entrega_id integer,
    produto_id integer,
    quantidade integer,
    valor_total numeric(12,2)
);


ALTER TABLE public.itens_entrega OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16810)
-- Name: itens_entrega_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.itens_entrega_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.itens_entrega_item_id_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 227
-- Name: itens_entrega_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itens_entrega_item_id_seq OWNED BY public.itens_entrega.item_id;


--
-- TOC entry 220 (class 1259 OID 16768)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    produto_id integer NOT NULL,
    nome character varying(100),
    categoria character varying(50),
    unidade_medida character varying(10),
    peso_kg numeric(10,2),
    volume_m3 numeric(10,3),
    preco_unitario numeric(10,2)
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16767)
-- Name: produtos_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_produto_id_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 219
-- Name: produtos_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_produto_id_seq OWNED BY public.produtos.produto_id;


--
-- TOC entry 222 (class 1259 OID 16775)
-- Name: transportadoras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transportadoras (
    transportadora_id integer NOT NULL,
    nome character varying(100),
    tipo_veiculo character varying(50),
    placa_veiculo character varying(10),
    capacidade_kg numeric(10,2),
    capacidade_m3 numeric(10,3)
);


ALTER TABLE public.transportadoras OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16774)
-- Name: transportadoras_transportadora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transportadoras_transportadora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transportadoras_transportadora_id_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 221
-- Name: transportadoras_transportadora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transportadoras_transportadora_id_seq OWNED BY public.transportadoras.transportadora_id;


--
-- TOC entry 4770 (class 2604 OID 16785)
-- Name: armazens armazem_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazens ALTER COLUMN armazem_id SET DEFAULT nextval('public.armazens_armazem_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 16762)
-- Name: clientes cliente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN cliente_id SET DEFAULT nextval('public.clientes_cliente_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 16792)
-- Name: entregas entrega_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregas ALTER COLUMN entrega_id SET DEFAULT nextval('public.entregas_entrega_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 16814)
-- Name: itens_entrega item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_entrega ALTER COLUMN item_id SET DEFAULT nextval('public.itens_entrega_item_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 16771)
-- Name: produtos produto_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN produto_id SET DEFAULT nextval('public.produtos_produto_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 16778)
-- Name: transportadoras transportadora_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadoras ALTER COLUMN transportadora_id SET DEFAULT nextval('public.transportadoras_transportadora_id_seq'::regclass);


--
-- TOC entry 4942 (class 0 OID 16782)
-- Dependencies: 224
-- Data for Name: armazens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armazens (armazem_id, nome, cidade, estado, capacidade_armazenagem_m3) FROM stdin;
1	Armazém 1	Cidade 1	PE	5058.05
2	Armazém 2	Cidade 2	MG	3892.78
3	Armazém 3	Cidade 3	PE	1210.84
4	Armazém 4	Cidade 4	MG	5626.83
5	Armazém 5	Cidade 5	PE	4066.37
\.


--
-- TOC entry 4936 (class 0 OID 16759)
-- Dependencies: 218
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (cliente_id, nome, cnpj_cpf, endereco, cidade, estado, pais, tipo_cliente) FROM stdin;
1	Cliente 1	10000000001	Rua 1, nº 10	Cidade 2	RJ	Brasil	Varejo
2	Cliente 2	10000000002	Rua 2, nº 20	Cidade 3	SP	Brasil	E-commerce
3	Cliente 3	10000000003	Rua 3, nº 30	Cidade 4	RJ	Brasil	Distribuidor
4	Cliente 4	10000000004	Rua 4, nº 40	Cidade 5	SP	Brasil	Varejo
5	Cliente 5	10000000005	Rua 5, nº 50	Cidade 6	RJ	Brasil	E-commerce
6	Cliente 6	10000000006	Rua 6, nº 60	Cidade 7	SP	Brasil	Distribuidor
7	Cliente 7	10000000007	Rua 7, nº 70	Cidade 8	RJ	Brasil	Varejo
8	Cliente 8	10000000008	Rua 8, nº 80	Cidade 9	SP	Brasil	E-commerce
9	Cliente 9	10000000009	Rua 9, nº 90	Cidade 10	RJ	Brasil	Distribuidor
10	Cliente 10	10000000010	Rua 10, nº 100	Cidade 1	SP	Brasil	Varejo
11	Cliente 11	10000000011	Rua 11, nº 110	Cidade 2	RJ	Brasil	E-commerce
12	Cliente 12	10000000012	Rua 12, nº 120	Cidade 3	SP	Brasil	Distribuidor
13	Cliente 13	10000000013	Rua 13, nº 130	Cidade 4	RJ	Brasil	Varejo
14	Cliente 14	10000000014	Rua 14, nº 140	Cidade 5	SP	Brasil	E-commerce
15	Cliente 15	10000000015	Rua 15, nº 150	Cidade 6	RJ	Brasil	Distribuidor
16	Cliente 16	10000000016	Rua 16, nº 160	Cidade 7	SP	Brasil	Varejo
17	Cliente 17	10000000017	Rua 17, nº 170	Cidade 8	RJ	Brasil	E-commerce
18	Cliente 18	10000000018	Rua 18, nº 180	Cidade 9	SP	Brasil	Distribuidor
19	Cliente 19	10000000019	Rua 19, nº 190	Cidade 10	RJ	Brasil	Varejo
20	Cliente 20	10000000020	Rua 20, nº 200	Cidade 1	SP	Brasil	E-commerce
21	Cliente 21	10000000021	Rua 21, nº 210	Cidade 2	RJ	Brasil	Distribuidor
22	Cliente 22	10000000022	Rua 22, nº 220	Cidade 3	SP	Brasil	Varejo
23	Cliente 23	10000000023	Rua 23, nº 230	Cidade 4	RJ	Brasil	E-commerce
24	Cliente 24	10000000024	Rua 24, nº 240	Cidade 5	SP	Brasil	Distribuidor
25	Cliente 25	10000000025	Rua 25, nº 250	Cidade 6	RJ	Brasil	Varejo
26	Cliente 26	10000000026	Rua 26, nº 260	Cidade 7	SP	Brasil	E-commerce
27	Cliente 27	10000000027	Rua 27, nº 270	Cidade 8	RJ	Brasil	Distribuidor
28	Cliente 28	10000000028	Rua 28, nº 280	Cidade 9	SP	Brasil	Varejo
29	Cliente 29	10000000029	Rua 29, nº 290	Cidade 10	RJ	Brasil	E-commerce
30	Cliente 30	10000000030	Rua 30, nº 300	Cidade 1	SP	Brasil	Distribuidor
31	Cliente 31	10000000031	Rua 31, nº 310	Cidade 2	RJ	Brasil	Varejo
32	Cliente 32	10000000032	Rua 32, nº 320	Cidade 3	SP	Brasil	E-commerce
33	Cliente 33	10000000033	Rua 33, nº 330	Cidade 4	RJ	Brasil	Distribuidor
34	Cliente 34	10000000034	Rua 34, nº 340	Cidade 5	SP	Brasil	Varejo
35	Cliente 35	10000000035	Rua 35, nº 350	Cidade 6	RJ	Brasil	E-commerce
36	Cliente 36	10000000036	Rua 36, nº 360	Cidade 7	SP	Brasil	Distribuidor
37	Cliente 37	10000000037	Rua 37, nº 370	Cidade 8	RJ	Brasil	Varejo
38	Cliente 38	10000000038	Rua 38, nº 380	Cidade 9	SP	Brasil	E-commerce
39	Cliente 39	10000000039	Rua 39, nº 390	Cidade 10	RJ	Brasil	Distribuidor
40	Cliente 40	10000000040	Rua 40, nº 400	Cidade 1	SP	Brasil	Varejo
41	Cliente 41	10000000041	Rua 41, nº 410	Cidade 2	RJ	Brasil	E-commerce
42	Cliente 42	10000000042	Rua 42, nº 420	Cidade 3	SP	Brasil	Distribuidor
43	Cliente 43	10000000043	Rua 43, nº 430	Cidade 4	RJ	Brasil	Varejo
44	Cliente 44	10000000044	Rua 44, nº 440	Cidade 5	SP	Brasil	E-commerce
45	Cliente 45	10000000045	Rua 45, nº 450	Cidade 6	RJ	Brasil	Distribuidor
46	Cliente 46	10000000046	Rua 46, nº 460	Cidade 7	SP	Brasil	Varejo
47	Cliente 47	10000000047	Rua 47, nº 470	Cidade 8	RJ	Brasil	E-commerce
48	Cliente 48	10000000048	Rua 48, nº 480	Cidade 9	SP	Brasil	Distribuidor
49	Cliente 49	10000000049	Rua 49, nº 490	Cidade 10	RJ	Brasil	Varejo
50	Cliente 50	10000000050	Rua 50, nº 500	Cidade 1	SP	Brasil	E-commerce
\.


--
-- TOC entry 4944 (class 0 OID 16789)
-- Dependencies: 226
-- Data for Name: entregas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entregas (entrega_id, cliente_id, armazem_id, transportadora_id, data_saida, data_entrega, status_entrega, distancia_km, tempo_estimado_horas, tempo_real_horas) FROM stdin;
1	32	3	8	2025-07-06	2025-07-16	Em trânsito	1397.54	24.59	10.72
2	46	4	7	2025-07-01	2025-06-25	Entregue	194.52	63.28	10.66
3	42	2	8	2025-07-18	2025-07-17	Entregue	942.14	59.36	46.56
4	34	4	6	2025-06-30	2025-07-03	Entregue	667.96	49.61	22.33
5	47	2	8	2025-07-15	2025-07-03	Entregue	492.02	17.44	35.72
6	46	3	7	2025-07-10	2025-06-28	Entregue	734.41	7.71	72.95
7	46	1	8	2025-06-27	2025-07-01	Entregue	1298.38	10.77	58.72
8	34	4	2	2025-07-07	2025-07-15	Entregue	860.69	8.30	20.34
9	29	4	8	2025-07-09	2025-07-14	Entregue	1507.87	25.40	63.58
10	32	4	5	2025-06-28	2025-06-30	Entregue	1480.95	28.46	24.89
11	5	4	7	2025-06-23	2025-06-27	Entregue	1069.25	10.77	68.87
12	47	4	5	2025-07-07	2025-07-06	Entregue	1285.58	16.86	59.81
13	7	2	2	2025-07-10	2025-06-30	Em trânsito	77.34	27.18	21.23
14	23	3	8	2025-07-12	2025-07-03	Em trânsito	225.98	50.88	19.54
15	15	2	10	2025-07-14	2025-07-13	Em trânsito	1302.93	46.87	30.46
16	29	2	5	2025-07-08	2025-07-04	Entregue	465.61	57.81	18.55
17	21	3	2	2025-07-15	2025-07-09	Entregue	1345.73	44.69	49.33
18	22	2	8	2025-07-09	2025-06-30	Entregue	1227.99	26.28	31.99
19	15	5	5	2025-07-03	2025-07-11	Entregue	1080.33	11.43	20.74
20	8	1	4	2025-07-12	2025-07-15	Em trânsito	360.32	13.84	51.48
21	1	4	1	2025-07-17	2025-06-29	Entregue	1204.51	16.69	41.51
22	33	3	4	2025-06-27	2025-06-24	Em trânsito	927.39	52.79	29.53
23	4	4	8	2025-06-27	2025-07-01	Entregue	424.91	26.48	65.35
24	42	3	8	2025-06-27	2025-07-12	Entregue	1150.31	18.31	37.84
25	3	5	3	2025-07-01	2025-07-05	Em trânsito	1496.96	70.34	22.46
26	28	2	7	2025-06-27	2025-07-17	Entregue	1074.28	41.11	13.35
27	46	4	3	2025-07-01	2025-07-23	Entregue	454.79	23.96	67.93
28	43	4	3	2025-06-27	2025-06-24	Em trânsito	729.90	9.18	71.50
29	48	2	4	2025-07-21	2025-07-04	Em trânsito	1252.14	63.79	17.69
30	7	2	2	2025-06-29	2025-07-02	Em trânsito	326.94	7.95	71.56
31	21	1	6	2025-06-29	2025-07-15	Em trânsito	1278.45	38.97	13.88
32	33	3	7	2025-07-19	2025-07-03	Entregue	1521.62	73.16	61.36
33	29	3	2	2025-06-27	2025-07-05	Entregue	967.00	44.38	37.86
34	13	3	5	2025-07-15	2025-07-07	Entregue	1007.78	61.32	27.27
35	29	3	5	2025-06-23	2025-07-17	Entregue	177.92	15.71	21.31
36	36	4	9	2025-06-26	2025-07-07	Entregue	1300.64	59.72	64.05
37	19	2	6	2025-07-05	2025-07-04	Entregue	300.52	41.13	7.04
38	19	3	8	2025-07-06	2025-06-30	Entregue	942.09	24.80	32.36
39	26	4	7	2025-07-18	2025-07-10	Entregue	869.55	56.18	12.67
40	46	2	3	2025-07-03	2025-06-30	Entregue	269.45	9.62	58.51
41	41	2	5	2025-07-04	2025-07-04	Entregue	130.35	14.71	62.73
42	19	5	10	2025-07-10	2025-07-09	Entregue	1410.59	38.36	11.19
43	50	3	9	2025-07-04	2025-07-17	Em trânsito	976.50	26.26	69.40
44	8	4	5	2025-07-16	2025-07-12	Entregue	1374.45	21.69	69.79
45	3	5	4	2025-07-13	2025-07-14	Entregue	618.02	50.70	19.74
46	14	2	4	2025-06-24	2025-07-11	Entregue	88.82	26.20	35.84
47	31	4	3	2025-07-08	2025-06-26	Em trânsito	674.00	56.24	15.69
48	34	5	3	2025-07-03	2025-07-14	Em trânsito	161.24	15.39	34.28
49	34	3	9	2025-07-14	2025-06-25	Entregue	304.66	23.25	18.60
50	7	3	7	2025-07-16	2025-07-20	Entregue	1107.21	54.68	18.98
51	39	2	5	2025-07-03	2025-07-15	Em trânsito	785.21	32.18	66.05
52	41	4	4	2025-07-03	2025-07-15	Entregue	493.60	2.30	40.92
53	40	2	5	2025-07-01	2025-06-30	Entregue	1270.78	65.37	63.51
54	15	2	7	2025-07-08	2025-06-27	Entregue	795.00	3.94	18.48
55	3	2	8	2025-06-24	2025-07-12	Entregue	382.03	67.21	26.75
56	6	4	3	2025-07-22	2025-07-12	Entregue	1160.36	27.96	8.55
57	43	2	6	2025-07-17	2025-07-17	Entregue	840.02	21.62	11.20
58	20	4	8	2025-07-06	2025-07-01	Entregue	565.82	33.49	58.56
59	39	2	9	2025-06-26	2025-07-12	Entregue	1031.34	69.34	22.61
60	18	4	6	2025-07-07	2025-07-19	Entregue	744.41	67.10	22.67
61	40	4	7	2025-07-09	2025-06-24	Entregue	64.50	68.16	8.20
62	3	5	9	2025-06-26	2025-07-13	Entregue	559.27	42.38	70.14
63	21	4	10	2025-06-29	2025-07-15	Em trânsito	360.03	66.47	3.30
64	15	3	10	2025-07-17	2025-07-21	Entregue	310.44	28.78	62.26
65	48	4	3	2025-07-13	2025-07-01	Entregue	443.27	28.74	18.28
66	11	3	8	2025-07-02	2025-07-09	Entregue	878.47	44.43	29.23
67	36	2	3	2025-07-07	2025-07-22	Entregue	997.83	37.59	45.45
68	24	4	8	2025-07-21	2025-06-28	Em trânsito	1258.24	43.63	3.22
69	25	2	4	2025-07-13	2025-07-23	Entregue	155.70	39.00	9.81
70	47	4	3	2025-07-14	2025-07-15	Entregue	656.45	59.10	18.27
71	32	1	6	2025-07-16	2025-07-17	Em trânsito	921.13	33.27	20.82
72	45	1	4	2025-07-15	2025-07-19	Em trânsito	330.71	62.56	42.55
73	25	1	4	2025-07-18	2025-07-13	Entregue	553.63	16.82	47.70
74	15	4	3	2025-06-23	2025-06-28	Entregue	936.02	33.11	25.49
75	5	3	3	2025-06-26	2025-06-28	Entregue	746.70	43.71	69.80
76	13	4	5	2025-07-14	2025-07-12	Em trânsito	1502.88	15.00	26.85
77	33	2	7	2025-06-28	2025-07-09	Entregue	128.76	39.71	26.17
78	19	2	8	2025-07-06	2025-07-03	Entregue	997.98	51.76	69.92
79	1	4	6	2025-07-19	2025-07-15	Entregue	264.55	4.66	66.05
80	7	2	7	2025-07-13	2025-06-27	Entregue	1260.86	24.33	23.02
81	31	2	2	2025-06-29	2025-07-01	Entregue	443.11	39.48	60.79
82	22	1	5	2025-06-23	2025-07-16	Em trânsito	264.40	58.37	36.65
83	23	1	10	2025-06-25	2025-07-05	Entregue	971.88	44.97	63.52
84	17	3	9	2025-07-21	2025-07-14	Entregue	644.82	31.16	60.05
85	14	3	8	2025-07-17	2025-07-06	Entregue	1275.71	42.41	66.06
86	3	3	6	2025-07-06	2025-07-18	Entregue	939.95	63.28	9.00
87	6	2	10	2025-07-12	2025-07-03	Entregue	1004.55	61.16	22.63
88	48	4	4	2025-07-21	2025-07-21	Entregue	128.43	48.67	60.57
89	42	3	7	2025-07-19	2025-07-05	Entregue	1374.99	58.23	19.53
90	21	3	5	2025-06-29	2025-07-18	Em trânsito	966.19	45.75	53.22
91	34	1	4	2025-06-23	2025-07-17	Entregue	620.03	59.88	41.49
92	36	3	10	2025-07-14	2025-07-20	Entregue	697.04	55.51	35.70
93	28	3	7	2025-06-26	2025-07-22	Entregue	334.51	11.28	31.04
94	11	3	8	2025-07-16	2025-07-10	Entregue	551.89	4.17	73.57
95	35	4	6	2025-07-15	2025-07-14	Entregue	376.37	58.04	45.46
96	44	3	4	2025-07-13	2025-07-15	Entregue	498.00	42.69	17.65
97	19	1	7	2025-07-02	2025-07-19	Entregue	150.20	68.81	6.39
98	23	1	7	2025-07-20	2025-07-01	Entregue	1346.97	68.24	57.95
99	20	3	3	2025-07-15	2025-07-21	Entregue	266.21	68.24	73.00
100	43	2	5	2025-07-07	2025-07-16	Entregue	977.63	52.10	46.73
101	10	5	9	2025-07-06	2025-07-17	Entregue	473.42	72.09	71.39
102	44	1	2	2025-07-05	2025-07-11	Entregue	229.83	50.29	68.39
103	48	3	10	2025-07-14	2025-07-04	Entregue	898.24	49.72	47.64
104	28	5	5	2025-07-06	2025-07-21	Entregue	988.19	11.69	22.65
105	25	2	3	2025-07-13	2025-06-29	Entregue	901.90	32.32	2.06
106	16	3	6	2025-07-01	2025-07-11	Entregue	599.62	67.32	67.56
107	18	2	6	2025-07-19	2025-07-22	Em trânsito	179.72	30.85	8.86
108	4	2	8	2025-06-30	2025-07-05	Entregue	578.52	72.54	63.71
109	21	4	5	2025-07-17	2025-07-04	Em trânsito	219.62	11.77	29.14
110	31	2	3	2025-07-16	2025-07-08	Entregue	1269.74	48.26	8.74
111	43	3	5	2025-07-12	2025-07-04	Entregue	869.23	52.74	54.10
112	46	2	6	2025-06-26	2025-07-15	Entregue	1044.30	30.83	34.29
113	23	4	10	2025-07-06	2025-07-15	Entregue	813.55	70.47	29.27
114	47	2	3	2025-07-16	2025-06-29	Em trânsito	1270.62	35.60	37.81
115	14	3	4	2025-06-27	2025-07-04	Em trânsito	160.42	9.36	26.83
116	10	3	5	2025-07-09	2025-07-20	Em trânsito	112.92	30.74	73.49
117	17	2	1	2025-07-20	2025-06-27	Entregue	1544.07	34.73	28.66
118	40	1	2	2025-06-30	2025-07-18	Entregue	632.05	29.80	18.21
119	12	4	2	2025-07-10	2025-07-09	Em trânsito	419.92	67.91	53.61
120	20	3	1	2025-07-06	2025-07-12	Entregue	1085.20	47.74	44.33
121	19	5	3	2025-07-04	2025-07-03	Entregue	1314.22	19.04	13.22
122	39	2	4	2025-07-09	2025-07-19	Entregue	294.48	42.22	11.58
123	12	4	4	2025-07-13	2025-07-07	Entregue	113.22	43.63	46.43
124	2	2	7	2025-07-17	2025-06-26	Entregue	1351.72	17.90	25.87
125	18	2	3	2025-07-02	2025-07-19	Entregue	447.81	61.24	40.36
126	11	3	6	2025-06-28	2025-07-05	Entregue	1160.49	15.06	71.36
127	15	4	8	2025-07-04	2025-07-14	Em trânsito	1067.45	40.11	52.38
128	14	2	5	2025-07-14	2025-06-26	Entregue	1154.15	65.65	5.36
129	45	5	7	2025-07-01	2025-07-15	Entregue	1535.39	72.33	50.96
130	49	1	10	2025-07-07	2025-07-04	Entregue	1339.17	65.34	17.94
131	3	2	1	2025-07-17	2025-07-06	Entregue	691.63	45.53	24.63
132	40	5	9	2025-07-03	2025-07-13	Em trânsito	95.35	49.99	68.51
133	10	3	5	2025-07-21	2025-07-18	Entregue	1506.58	48.13	61.26
134	7	3	3	2025-07-12	2025-07-12	Entregue	212.31	43.10	23.38
135	18	1	7	2025-07-01	2025-07-03	Entregue	91.55	65.11	73.79
136	7	5	4	2025-07-15	2025-06-24	Entregue	321.01	63.36	26.03
137	45	3	1	2025-07-04	2025-07-20	Entregue	1488.03	52.06	2.16
138	4	1	2	2025-07-12	2025-07-19	Em trânsito	135.42	55.98	29.27
139	30	2	2	2025-07-03	2025-07-20	Entregue	1494.10	6.82	9.74
140	23	5	10	2025-07-03	2025-07-19	Entregue	487.13	30.92	32.99
141	17	3	6	2025-06-29	2025-07-06	Entregue	948.12	25.38	16.47
142	49	1	1	2025-07-05	2025-07-07	Entregue	1073.51	5.77	39.84
143	8	5	9	2025-07-07	2025-07-13	Em trânsito	901.86	7.47	6.86
144	29	3	9	2025-07-03	2025-07-01	Entregue	1512.97	59.22	10.20
145	30	3	7	2025-07-07	2025-07-21	Entregue	1107.10	55.75	26.57
146	12	5	9	2025-07-13	2025-07-12	Em trânsito	428.98	36.15	3.97
147	41	2	6	2025-07-15	2025-07-07	Em trânsito	1313.70	59.33	6.30
148	45	2	2	2025-07-15	2025-06-30	Entregue	118.42	50.17	47.55
149	9	4	4	2025-06-24	2025-07-17	Entregue	908.29	63.32	68.19
150	2	4	4	2025-06-24	2025-07-07	Entregue	1061.42	73.58	32.24
151	40	2	5	2025-07-22	2025-06-25	Entregue	1416.66	34.97	72.04
152	50	5	9	2025-07-12	2025-06-23	Entregue	728.09	49.62	44.08
153	45	4	8	2025-07-06	2025-06-27	Em trânsito	116.93	63.90	26.66
154	24	3	1	2025-06-26	2025-07-21	Entregue	273.93	2.23	41.66
155	20	5	4	2025-06-28	2025-07-21	Entregue	1324.38	66.40	22.25
156	37	4	10	2025-07-02	2025-06-23	Entregue	817.54	23.99	47.35
157	10	3	7	2025-07-14	2025-07-23	Entregue	1363.62	43.83	33.53
158	12	2	9	2025-06-23	2025-07-04	Entregue	504.48	10.80	17.74
159	3	4	7	2025-06-23	2025-07-08	Entregue	211.08	10.09	5.19
160	40	2	7	2025-07-11	2025-06-28	Em trânsito	590.51	62.89	30.58
161	21	1	4	2025-07-11	2025-07-16	Em trânsito	1278.43	25.26	25.59
162	19	4	1	2025-07-11	2025-07-21	Atrasada	379.09	15.83	34.22
163	41	2	6	2025-07-15	2025-07-04	Entregue	657.76	43.10	28.78
164	49	1	9	2025-07-04	2025-07-15	Atrasada	1540.23	38.97	59.80
165	15	2	6	2025-06-28	2025-07-16	Em trânsito	376.60	33.70	34.29
166	26	2	5	2025-07-11	2025-07-19	Em trânsito	1505.85	2.29	45.25
167	37	1	8	2025-06-23	2025-07-22	Entregue	807.72	19.66	9.59
168	21	3	7	2025-07-04	2025-07-22	Entregue	109.87	2.69	34.44
169	25	2	5	2025-06-24	2025-07-16	Entregue	896.07	49.81	6.60
170	49	3	6	2025-07-17	2025-07-14	Entregue	1455.92	2.31	54.35
171	32	3	10	2025-07-02	2025-07-06	Entregue	945.84	18.72	31.48
172	27	4	9	2025-07-17	2025-06-25	Em trânsito	514.86	39.37	19.70
173	23	1	10	2025-07-17	2025-07-03	Em trânsito	90.71	52.06	57.65
174	4	3	7	2025-07-17	2025-07-22	Entregue	694.05	54.39	42.03
175	21	5	9	2025-07-12	2025-07-09	Entregue	1230.31	21.28	5.16
176	30	1	1	2025-07-07	2025-07-11	Em trânsito	1332.68	31.22	20.38
177	3	3	4	2025-07-12	2025-06-30	Entregue	119.70	55.06	35.85
178	23	1	6	2025-07-10	2025-07-08	Entregue	501.27	41.70	64.64
179	50	4	3	2025-07-08	2025-06-30	Entregue	1407.96	17.19	72.73
180	36	3	9	2025-06-27	2025-07-16	Entregue	1262.22	32.98	36.02
181	21	3	6	2025-07-10	2025-07-22	Em trânsito	1434.01	43.47	34.47
182	25	4	6	2025-06-26	2025-06-29	Entregue	781.20	53.98	44.93
183	4	2	8	2025-06-27	2025-07-11	Entregue	473.42	4.32	29.36
184	15	3	4	2025-07-19	2025-06-30	Em trânsito	1056.83	13.65	67.62
185	16	3	2	2025-07-09	2025-07-21	Entregue	707.73	45.15	71.74
186	22	3	9	2025-07-08	2025-06-27	Entregue	359.93	6.34	28.42
187	5	3	8	2025-06-23	2025-07-07	Entregue	355.68	6.43	8.99
188	50	5	8	2025-07-02	2025-07-15	Em trânsito	1073.78	27.46	72.60
189	24	5	5	2025-06-24	2025-07-10	Entregue	1323.87	13.24	19.76
190	2	2	3	2025-07-19	2025-06-28	Em trânsito	483.81	57.39	3.85
191	45	4	2	2025-07-02	2025-06-29	Entregue	1163.04	50.42	56.22
192	3	4	7	2025-07-18	2025-06-28	Entregue	861.65	55.04	61.43
193	25	4	8	2025-07-01	2025-07-18	Em trânsito	346.84	35.81	57.27
194	45	4	6	2025-07-15	2025-07-07	Atrasada	187.59	12.20	33.65
195	44	3	5	2025-07-10	2025-07-01	Entregue	779.96	56.40	53.34
196	12	5	2	2025-07-12	2025-07-04	Em trânsito	1100.91	36.76	16.58
197	35	3	8	2025-07-15	2025-06-28	Entregue	820.67	53.14	51.30
198	37	2	8	2025-07-10	2025-07-06	Em trânsito	161.49	47.71	51.53
199	45	5	1	2025-07-03	2025-07-09	Entregue	837.03	30.09	72.16
200	3	4	6	2025-07-11	2025-07-16	Entregue	1387.32	12.26	31.11
201	28	2	4	2025-06-24	2025-06-27	Entregue	358.18	73.80	64.69
202	22	3	5	2025-07-20	2025-07-13	Em trânsito	710.59	55.16	53.99
203	30	5	2	2025-06-28	2025-06-28	Entregue	773.23	22.01	33.79
204	3	4	6	2025-06-23	2025-07-13	Entregue	1322.81	45.75	28.39
205	18	2	4	2025-07-21	2025-07-03	Em trânsito	491.56	43.00	39.74
206	27	1	7	2025-07-10	2025-06-26	Entregue	147.74	5.61	37.90
207	19	1	8	2025-07-04	2025-07-18	Em trânsito	1077.87	53.94	13.18
208	9	4	6	2025-07-21	2025-07-07	Entregue	456.30	6.30	16.52
209	43	3	9	2025-07-12	2025-07-21	Atrasada	1090.53	36.26	49.60
210	26	5	7	2025-07-11	2025-07-21	Em trânsito	828.18	9.47	13.17
211	1	1	5	2025-06-23	2025-07-12	Entregue	1399.80	60.00	63.95
212	16	1	6	2025-07-10	2025-07-16	Entregue	278.58	65.77	49.17
213	16	5	2	2025-07-15	2025-07-04	Entregue	1061.05	26.66	25.18
214	14	3	10	2025-06-26	2025-07-19	Em trânsito	1137.83	35.49	42.55
215	19	3	10	2025-07-10	2025-07-12	Entregue	1351.32	11.60	15.68
216	12	3	2	2025-07-20	2025-06-23	Entregue	1234.02	45.54	42.47
217	40	2	2	2025-07-14	2025-07-15	Em trânsito	395.21	16.60	46.50
218	2	1	7	2025-06-28	2025-06-25	Entregue	821.42	67.67	19.74
219	8	2	1	2025-07-10	2025-06-27	Entregue	1114.13	44.34	55.55
220	33	3	9	2025-07-13	2025-07-21	Entregue	656.52	6.31	63.98
221	26	5	10	2025-07-14	2025-07-11	Entregue	1473.75	21.47	45.36
222	42	2	5	2025-07-19	2025-07-01	Entregue	323.23	31.36	72.55
223	6	3	9	2025-07-13	2025-07-15	Entregue	1121.84	73.95	11.72
224	43	4	6	2025-06-30	2025-07-11	Entregue	1064.15	22.74	52.82
225	42	4	10	2025-06-30	2025-07-10	Entregue	535.24	69.50	8.48
226	39	5	4	2025-07-12	2025-06-24	Em trânsito	401.02	24.69	68.16
227	29	4	7	2025-07-11	2025-06-30	Entregue	701.52	7.41	72.66
228	31	3	10	2025-06-22	2025-06-26	Entregue	777.81	36.05	29.43
229	8	3	8	2025-07-02	2025-07-13	Em trânsito	1138.91	25.36	61.53
230	29	2	7	2025-07-18	2025-07-22	Entregue	702.32	26.80	28.48
231	16	5	7	2025-06-26	2025-07-19	Em trânsito	460.39	56.66	40.66
232	2	2	8	2025-07-04	2025-07-05	Entregue	1053.73	48.42	71.60
233	33	4	7	2025-06-26	2025-07-03	Entregue	206.29	18.88	23.73
234	32	2	6	2025-07-03	2025-07-15	Entregue	742.28	32.50	34.28
235	47	2	3	2025-07-15	2025-07-10	Em trânsito	599.08	49.12	3.19
236	2	2	10	2025-07-12	2025-06-30	Entregue	97.20	69.85	40.65
237	23	2	6	2025-06-27	2025-07-03	Entregue	843.28	9.35	28.28
238	46	5	8	2025-07-21	2025-07-09	Entregue	1259.41	47.20	6.43
239	21	2	3	2025-07-21	2025-07-11	Em trânsito	769.47	51.93	57.76
240	11	4	6	2025-06-29	2025-07-11	Atrasada	513.23	70.71	21.57
241	11	4	3	2025-07-12	2025-07-11	Em trânsito	1537.21	17.22	52.00
242	18	4	7	2025-06-23	2025-07-02	Entregue	488.70	14.03	22.62
243	20	4	6	2025-06-25	2025-07-04	Entregue	466.52	22.80	51.46
244	48	3	1	2025-06-24	2025-07-05	Entregue	1286.21	61.95	23.31
245	33	2	5	2025-07-04	2025-06-26	Entregue	878.83	67.55	20.51
246	36	2	8	2025-07-17	2025-07-21	Em trânsito	1099.98	66.16	70.80
247	16	3	8	2025-07-12	2025-07-21	Entregue	751.06	4.95	36.52
248	34	2	8	2025-07-04	2025-07-14	Entregue	1299.03	46.59	63.29
249	8	4	3	2025-06-26	2025-06-30	Entregue	861.94	21.52	50.06
250	43	5	3	2025-07-16	2025-06-24	Entregue	505.44	9.70	31.47
251	18	3	1	2025-07-07	2025-07-12	Em trânsito	538.51	5.79	65.30
252	47	3	3	2025-07-20	2025-07-19	Em trânsito	534.77	16.47	61.45
253	43	3	2	2025-07-05	2025-07-05	Entregue	135.58	67.68	62.02
254	38	4	2	2025-07-14	2025-06-24	Entregue	172.08	14.52	31.80
255	17	2	4	2025-06-29	2025-07-16	Entregue	993.72	66.01	49.55
256	10	3	9	2025-07-19	2025-07-18	Entregue	1424.22	19.61	38.32
257	45	5	4	2025-06-22	2025-07-11	Entregue	1393.97	69.43	29.17
258	37	3	6	2025-06-23	2025-07-10	Entregue	1240.31	63.02	59.53
259	13	4	7	2025-07-21	2025-07-15	Entregue	730.91	10.98	2.29
260	20	1	9	2025-06-27	2025-06-30	Entregue	898.40	23.74	22.12
261	41	4	3	2025-07-06	2025-07-12	Entregue	1060.02	8.22	71.04
262	13	2	8	2025-07-14	2025-07-22	Entregue	206.33	60.22	28.93
263	40	4	1	2025-07-15	2025-06-25	Entregue	1329.03	15.14	36.70
264	31	3	8	2025-07-15	2025-07-06	Entregue	288.31	30.30	27.26
265	15	4	4	2025-07-08	2025-07-05	Entregue	1228.94	18.48	22.93
266	5	4	7	2025-07-07	2025-06-28	Atrasada	1361.68	64.66	67.13
267	37	5	2	2025-07-05	2025-07-18	Em trânsito	980.70	51.77	41.03
268	15	3	7	2025-07-16	2025-07-19	Atrasada	1361.07	59.86	19.83
269	11	1	7	2025-07-07	2025-07-19	Entregue	1240.00	28.59	21.45
270	2	2	3	2025-06-24	2025-07-14	Em trânsito	258.66	71.44	41.15
271	24	4	8	2025-07-19	2025-07-14	Entregue	404.12	71.96	25.61
272	31	2	5	2025-07-22	2025-07-16	Entregue	1262.10	28.37	57.30
273	39	5	3	2025-06-23	2025-06-27	Em trânsito	677.92	55.17	66.83
274	26	4	5	2025-07-13	2025-07-18	Entregue	780.37	62.48	44.26
275	45	4	5	2025-07-16	2025-07-21	Em trânsito	626.71	7.41	61.36
276	8	2	6	2025-06-30	2025-06-25	Entregue	613.03	70.39	37.31
277	26	3	6	2025-06-26	2025-07-20	Entregue	993.61	48.61	7.94
278	7	3	3	2025-07-04	2025-07-19	Entregue	1243.77	66.24	25.90
279	12	4	1	2025-07-11	2025-07-08	Entregue	965.44	36.87	32.37
280	45	4	1	2025-07-20	2025-07-02	Entregue	1543.87	46.19	13.29
281	23	2	5	2025-07-02	2025-07-02	Em trânsito	1247.69	68.30	64.49
282	26	1	1	2025-06-23	2025-07-09	Entregue	1048.26	39.81	37.26
283	29	4	9	2025-07-08	2025-07-14	Entregue	1122.52	57.57	33.95
284	5	4	4	2025-06-30	2025-07-10	Entregue	1422.11	17.43	40.36
285	12	4	4	2025-07-19	2025-07-20	Em trânsito	1528.28	68.50	59.16
286	30	2	7	2025-07-22	2025-07-06	Entregue	307.49	33.62	59.54
287	24	3	1	2025-07-19	2025-07-14	Em trânsito	105.58	27.25	12.50
288	7	4	2	2025-07-14	2025-07-11	Entregue	1505.47	6.69	25.25
289	35	5	3	2025-06-24	2025-07-12	Entregue	121.00	65.86	63.47
290	4	3	9	2025-07-07	2025-07-09	Entregue	886.69	27.80	40.54
291	3	3	1	2025-06-28	2025-06-26	Entregue	1394.24	33.05	19.91
292	7	5	9	2025-07-17	2025-06-24	Em trânsito	144.35	49.81	37.91
293	36	4	7	2025-06-25	2025-07-07	Entregue	88.62	41.62	2.76
294	34	3	5	2025-07-12	2025-07-14	Em trânsito	581.71	32.52	40.67
295	14	4	4	2025-07-03	2025-06-25	Entregue	1072.44	13.35	34.44
296	37	2	7	2025-06-23	2025-06-26	Entregue	441.29	12.07	55.33
297	14	3	3	2025-07-14	2025-07-23	Entregue	227.28	8.01	21.02
298	15	3	4	2025-07-21	2025-07-19	Entregue	1075.96	69.02	72.96
299	47	4	7	2025-07-07	2025-07-01	Entregue	1302.94	53.39	40.70
300	38	4	3	2025-07-04	2025-07-12	Em trânsito	599.15	18.68	29.02
301	32	4	2	2025-07-08	2025-07-04	Em trânsito	728.45	37.76	20.53
302	29	3	9	2025-06-24	2025-07-11	Entregue	225.01	54.37	19.07
303	44	1	5	2025-06-22	2025-06-26	Entregue	74.32	8.44	53.47
304	36	5	7	2025-07-10	2025-06-26	Em trânsito	428.96	31.30	43.75
305	26	4	1	2025-07-10	2025-06-30	Entregue	619.26	24.55	58.87
306	19	3	3	2025-07-07	2025-06-28	Entregue	907.20	26.29	55.19
307	16	3	10	2025-07-13	2025-07-11	Entregue	716.37	36.27	72.81
308	14	3	7	2025-07-13	2025-07-04	Em trânsito	981.05	5.11	39.09
309	35	4	6	2025-06-24	2025-07-17	Entregue	179.19	73.79	51.83
310	33	2	2	2025-07-17	2025-07-18	Entregue	1351.69	61.44	44.21
311	25	1	5	2025-07-03	2025-07-12	Em trânsito	1204.96	11.84	7.00
312	25	4	7	2025-06-23	2025-06-26	Entregue	178.43	60.08	12.12
313	45	2	9	2025-07-15	2025-07-21	Entregue	1290.59	45.05	57.27
314	42	2	4	2025-06-29	2025-07-05	Entregue	710.40	49.92	21.07
315	45	4	9	2025-06-29	2025-07-08	Em trânsito	640.99	55.75	18.89
316	7	3	9	2025-06-26	2025-06-25	Em trânsito	116.30	6.87	70.50
317	24	4	7	2025-07-21	2025-07-09	Entregue	304.66	16.54	38.08
318	16	5	5	2025-07-16	2025-07-08	Em trânsito	294.05	13.42	57.11
319	30	3	3	2025-06-25	2025-06-24	Entregue	657.88	69.09	39.05
320	22	4	5	2025-07-02	2025-07-21	Entregue	408.85	4.10	52.61
321	15	2	9	2025-07-04	2025-07-04	Em trânsito	1137.11	41.19	3.34
322	33	1	10	2025-07-21	2025-06-29	Entregue	1120.64	63.09	11.38
323	45	4	10	2025-06-23	2025-06-26	Atrasada	231.80	12.66	55.09
324	37	4	3	2025-06-25	2025-06-29	Entregue	1414.76	64.22	23.83
325	43	2	8	2025-06-23	2025-07-23	Entregue	124.25	43.67	5.32
326	44	4	4	2025-07-18	2025-07-02	Em trânsito	693.05	25.07	41.01
327	47	5	3	2025-07-05	2025-06-30	Atrasada	765.90	20.41	62.78
328	40	3	4	2025-07-21	2025-07-05	Entregue	1105.01	12.84	34.95
329	29	2	5	2025-07-01	2025-07-18	Entregue	1467.38	50.22	53.44
330	14	1	9	2025-07-13	2025-07-06	Entregue	760.01	26.67	63.46
331	44	3	8	2025-07-18	2025-07-07	Entregue	105.95	51.89	34.64
332	32	2	5	2025-06-30	2025-06-27	Entregue	861.42	25.35	31.95
333	40	5	8	2025-07-05	2025-07-13	Entregue	230.14	51.23	16.05
334	34	4	1	2025-07-09	2025-07-14	Entregue	409.20	65.77	23.14
335	2	3	2	2025-07-03	2025-06-28	Em trânsito	1378.60	14.54	58.93
336	4	5	6	2025-07-01	2025-06-26	Em trânsito	147.95	2.52	64.68
337	14	3	1	2025-06-26	2025-07-05	Em trânsito	648.97	65.47	37.05
338	21	1	4	2025-07-19	2025-07-08	Entregue	1536.29	6.05	18.46
339	14	4	9	2025-07-12	2025-07-22	Entregue	947.42	56.74	33.30
340	26	2	7	2025-07-21	2025-07-21	Entregue	1307.39	7.03	44.28
341	50	2	6	2025-07-05	2025-07-18	Entregue	445.99	49.37	21.44
342	36	3	2	2025-07-17	2025-07-18	Entregue	709.59	15.10	36.32
343	19	2	6	2025-07-18	2025-06-27	Entregue	959.07	19.00	42.95
344	12	3	1	2025-07-22	2025-07-14	Entregue	967.56	18.61	68.81
345	35	3	6	2025-07-06	2025-07-09	Entregue	806.19	73.63	26.22
346	39	1	3	2025-07-18	2025-07-15	Entregue	1546.04	71.93	59.58
347	18	5	8	2025-06-23	2025-06-24	Entregue	333.18	70.85	48.94
348	28	4	6	2025-07-12	2025-07-18	Entregue	1000.14	65.10	48.25
349	49	5	3	2025-07-03	2025-07-01	Entregue	165.85	66.64	32.36
350	41	4	4	2025-06-24	2025-07-11	Entregue	864.99	13.93	5.82
351	12	1	7	2025-07-20	2025-07-03	Entregue	934.33	37.16	27.89
352	6	4	7	2025-06-27	2025-07-06	Entregue	504.50	72.42	39.59
353	40	3	7	2025-06-28	2025-07-02	Entregue	1318.07	42.59	27.32
354	29	5	3	2025-07-01	2025-07-13	Entregue	254.44	12.14	55.51
355	43	4	8	2025-06-28	2025-07-10	Em trânsito	1306.13	37.66	73.20
356	38	2	2	2025-06-27	2025-07-02	Em trânsito	997.23	58.67	53.32
357	19	3	5	2025-07-03	2025-07-15	Em trânsito	1378.59	69.29	70.34
358	12	3	6	2025-07-15	2025-07-18	Entregue	848.72	39.01	15.13
359	27	3	2	2025-06-26	2025-07-10	Entregue	602.55	43.60	30.11
360	19	3	5	2025-07-02	2025-06-25	Entregue	626.08	68.10	9.72
361	8	1	2	2025-07-05	2025-07-05	Entregue	105.60	30.94	27.78
362	43	3	6	2025-07-16	2025-07-17	Entregue	204.16	24.95	2.86
363	44	2	4	2025-07-15	2025-07-03	Em trânsito	1138.05	30.29	56.17
364	44	3	3	2025-06-22	2025-07-06	Entregue	195.17	64.84	43.47
365	19	3	8	2025-06-29	2025-06-23	Entregue	570.93	59.69	32.74
366	12	3	3	2025-06-27	2025-07-20	Entregue	961.66	29.49	43.05
367	34	3	1	2025-07-08	2025-07-19	Entregue	1427.86	39.86	12.00
368	29	3	7	2025-07-15	2025-06-29	Entregue	351.29	33.15	15.68
369	7	2	3	2025-07-12	2025-07-19	Entregue	414.65	53.21	42.32
370	43	3	4	2025-06-29	2025-06-24	Em trânsito	1004.60	55.32	13.34
371	8	5	3	2025-07-10	2025-07-20	Entregue	1334.20	67.50	72.15
372	43	1	1	2025-07-01	2025-06-24	Entregue	627.93	37.82	64.80
373	40	3	3	2025-06-26	2025-07-06	Entregue	976.26	67.88	61.53
374	9	5	2	2025-07-01	2025-06-26	Entregue	175.74	66.90	24.69
375	17	2	9	2025-07-02	2025-07-02	Entregue	268.25	25.99	37.55
376	46	4	4	2025-07-11	2025-07-13	Entregue	772.99	69.09	17.20
377	42	2	6	2025-07-09	2025-06-27	Entregue	1076.40	17.59	70.50
378	29	2	9	2025-07-01	2025-06-25	Entregue	831.79	67.25	59.26
379	26	5	8	2025-07-02	2025-07-20	Entregue	560.97	35.58	12.03
380	4	4	1	2025-06-23	2025-07-03	Entregue	641.68	47.41	51.13
381	7	3	10	2025-06-30	2025-07-20	Entregue	365.01	37.46	5.25
382	45	4	1	2025-06-22	2025-07-07	Entregue	1470.49	26.16	61.88
383	48	4	2	2025-07-10	2025-07-06	Entregue	1341.90	70.06	17.32
384	33	2	6	2025-06-23	2025-07-10	Atrasada	1066.33	16.39	11.51
385	20	4	4	2025-07-21	2025-06-26	Entregue	867.42	36.78	47.44
386	17	2	8	2025-07-09	2025-06-26	Entregue	1200.26	3.93	50.31
387	50	1	3	2025-07-13	2025-07-08	Entregue	617.89	58.65	61.92
388	8	3	5	2025-07-01	2025-07-10	Entregue	113.62	21.09	60.61
389	25	2	8	2025-06-22	2025-07-20	Entregue	186.63	59.09	42.23
390	42	5	5	2025-07-07	2025-07-16	Entregue	1365.80	61.87	10.48
391	47	4	10	2025-07-19	2025-07-13	Entregue	743.63	4.76	22.04
392	30	3	9	2025-07-18	2025-07-15	Entregue	242.95	45.96	4.33
393	44	3	4	2025-07-18	2025-06-26	Entregue	361.75	34.60	38.69
394	9	2	9	2025-06-29	2025-07-10	Entregue	119.85	11.15	6.22
395	33	2	1	2025-06-25	2025-07-15	Em trânsito	753.09	44.76	39.66
396	38	3	6	2025-07-03	2025-07-09	Entregue	445.28	72.40	71.61
397	42	4	9	2025-06-28	2025-07-17	Entregue	903.92	36.66	4.58
398	8	4	6	2025-07-03	2025-07-04	Entregue	668.36	13.08	34.39
399	27	5	3	2025-07-11	2025-07-07	Entregue	739.52	73.16	3.81
400	34	3	6	2025-06-23	2025-07-04	Entregue	1122.80	69.89	40.28
401	8	5	3	2025-06-28	2025-07-20	Entregue	399.75	39.31	32.08
402	42	4	7	2025-06-22	2025-06-23	Entregue	1283.96	17.04	64.75
403	49	3	2	2025-07-07	2025-06-28	Entregue	1399.09	25.14	6.10
404	7	4	2	2025-07-05	2025-07-13	Entregue	95.36	36.38	38.52
405	6	3	3	2025-07-13	2025-07-03	Entregue	1471.08	25.39	21.21
406	20	5	4	2025-06-28	2025-06-24	Entregue	1076.82	56.37	59.62
407	49	4	4	2025-07-06	2025-07-13	Entregue	396.02	7.42	69.48
408	3	3	1	2025-07-09	2025-07-03	Entregue	366.60	3.29	68.43
409	23	5	4	2025-07-10	2025-07-06	Entregue	706.10	5.42	69.65
410	17	3	4	2025-06-26	2025-07-13	Em trânsito	653.26	69.17	57.90
411	7	4	3	2025-07-07	2025-06-25	Entregue	979.04	57.11	20.29
412	36	5	9	2025-07-13	2025-07-07	Em trânsito	1381.53	23.64	58.23
413	24	5	4	2025-07-16	2025-06-29	Entregue	1528.35	23.96	33.06
414	16	3	7	2025-07-07	2025-07-13	Em trânsito	241.80	16.33	8.14
415	28	2	8	2025-07-13	2025-07-05	Entregue	99.61	14.18	26.98
416	10	4	3	2025-07-14	2025-07-16	Entregue	371.98	70.36	47.87
417	30	3	5	2025-07-11	2025-07-22	Entregue	653.96	16.49	46.64
418	35	5	7	2025-06-24	2025-07-11	Entregue	236.36	14.75	47.07
419	25	2	2	2025-06-29	2025-07-12	Entregue	1284.12	28.05	33.22
420	42	4	6	2025-07-04	2025-06-29	Entregue	1288.50	65.63	7.66
421	50	5	5	2025-07-21	2025-07-06	Entregue	705.02	6.36	33.80
422	23	3	7	2025-06-24	2025-07-08	Entregue	676.47	30.84	70.35
423	39	1	1	2025-07-11	2025-07-04	Em trânsito	530.00	72.89	38.77
424	32	1	5	2025-07-09	2025-07-05	Entregue	653.39	33.46	63.40
425	19	3	1	2025-07-21	2025-07-04	Entregue	1073.28	44.36	6.52
426	24	1	6	2025-07-18	2025-07-15	Entregue	1210.52	60.13	28.13
427	6	4	5	2025-07-22	2025-07-10	Entregue	882.31	68.71	35.91
428	13	5	5	2025-07-08	2025-07-20	Entregue	183.14	8.80	45.40
429	34	2	2	2025-07-22	2025-07-09	Entregue	330.57	34.42	13.76
430	23	2	6	2025-07-05	2025-06-30	Atrasada	513.61	58.19	14.20
431	40	2	7	2025-06-23	2025-07-22	Entregue	238.00	20.54	32.59
432	39	2	5	2025-07-15	2025-07-02	Entregue	1533.72	13.14	43.70
433	43	1	8	2025-07-05	2025-07-07	Entregue	1324.20	40.23	70.87
434	17	5	2	2025-07-04	2025-07-21	Entregue	1531.66	31.63	42.63
435	4	3	10	2025-06-30	2025-06-28	Em trânsito	144.27	65.81	37.89
436	28	2	3	2025-07-19	2025-07-06	Entregue	826.39	40.76	8.16
437	29	4	6	2025-07-06	2025-07-12	Entregue	1092.88	7.38	13.26
438	12	1	9	2025-07-02	2025-07-10	Em trânsito	1257.97	53.57	28.84
439	12	3	7	2025-07-18	2025-07-15	Entregue	972.21	43.77	33.57
440	18	1	7	2025-07-03	2025-06-24	Em trânsito	151.81	57.41	28.52
441	7	3	5	2025-07-04	2025-07-13	Entregue	625.62	39.94	66.59
442	8	2	2	2025-07-17	2025-07-16	Entregue	321.89	8.63	44.79
443	24	4	6	2025-06-26	2025-07-14	Entregue	1369.89	3.17	35.49
444	46	4	1	2025-07-20	2025-07-01	Entregue	1324.43	69.76	10.91
445	35	3	9	2025-07-01	2025-07-22	Entregue	745.33	7.05	54.31
446	33	2	6	2025-07-14	2025-07-13	Entregue	762.20	33.67	43.57
447	1	3	7	2025-07-19	2025-07-21	Entregue	100.85	14.07	29.88
448	49	2	5	2025-07-04	2025-06-26	Entregue	616.17	61.02	34.36
449	5	2	9	2025-07-17	2025-06-26	Em trânsito	1233.31	69.33	69.04
450	10	1	6	2025-07-07	2025-07-05	Entregue	748.38	30.20	45.57
451	49	3	7	2025-06-24	2025-06-28	Entregue	946.40	19.43	30.21
452	4	3	3	2025-06-22	2025-06-25	Entregue	956.96	21.87	11.13
453	13	4	7	2025-07-01	2025-07-05	Entregue	304.81	30.67	55.66
454	13	2	3	2025-06-24	2025-06-28	Entregue	519.46	62.76	72.95
455	45	5	2	2025-07-11	2025-07-12	Entregue	880.51	38.29	31.26
456	8	2	2	2025-06-28	2025-07-17	Entregue	1537.55	4.56	6.75
457	12	5	4	2025-07-20	2025-07-23	Entregue	745.14	62.88	2.03
458	32	3	9	2025-06-26	2025-06-29	Entregue	1202.86	73.88	42.08
459	14	2	8	2025-06-25	2025-07-04	Entregue	289.65	8.42	2.46
460	4	5	8	2025-06-30	2025-07-17	Entregue	1394.34	72.75	72.82
461	13	3	6	2025-07-04	2025-07-17	Entregue	961.34	65.93	41.52
462	11	4	5	2025-06-30	2025-07-21	Entregue	680.21	55.88	52.42
463	34	3	5	2025-07-12	2025-06-28	Entregue	1521.88	47.60	47.69
464	49	4	9	2025-07-11	2025-06-30	Entregue	931.17	72.18	49.58
465	39	3	7	2025-07-13	2025-07-19	Entregue	334.39	12.28	5.89
466	20	2	9	2025-07-01	2025-07-07	Entregue	1270.36	60.57	62.79
467	44	4	2	2025-06-23	2025-07-10	Entregue	506.31	5.50	58.34
468	14	5	5	2025-07-01	2025-06-29	Entregue	868.46	47.73	69.29
469	25	4	4	2025-07-04	2025-06-28	Em trânsito	1284.86	48.86	18.13
470	2	5	2	2025-06-27	2025-06-24	Entregue	287.01	8.07	15.26
471	32	3	9	2025-07-03	2025-06-26	Entregue	356.78	61.03	63.22
472	22	3	3	2025-07-09	2025-07-23	Em trânsito	428.41	9.76	38.13
473	44	3	4	2025-07-13	2025-06-27	Entregue	1079.59	11.26	6.21
474	34	2	10	2025-07-19	2025-06-29	Entregue	920.31	53.66	31.87
475	25	3	9	2025-06-24	2025-07-10	Entregue	322.51	67.06	34.64
476	44	2	3	2025-06-25	2025-07-19	Entregue	1313.12	45.94	44.96
477	11	5	6	2025-07-16	2025-07-22	Entregue	793.50	17.58	11.42
478	17	3	8	2025-06-27	2025-07-10	Em trânsito	92.00	63.17	73.12
479	13	2	3	2025-07-03	2025-07-17	Entregue	1031.55	57.65	72.80
480	50	4	9	2025-07-08	2025-07-19	Entregue	560.12	57.91	62.58
481	32	2	10	2025-06-23	2025-07-02	Entregue	929.52	59.74	47.77
482	17	4	1	2025-07-16	2025-07-19	Em trânsito	1321.64	23.19	35.25
483	49	3	2	2025-07-10	2025-07-06	Entregue	156.07	37.37	17.86
484	3	3	8	2025-07-16	2025-07-06	Entregue	1091.82	56.94	52.90
485	36	4	2	2025-07-18	2025-07-10	Entregue	1011.06	16.13	25.93
486	29	4	3	2025-07-18	2025-07-12	Entregue	1210.76	28.80	30.72
487	9	2	6	2025-07-08	2025-07-11	Em trânsito	1115.64	41.83	7.74
488	22	2	8	2025-06-27	2025-07-05	Entregue	1276.41	69.47	12.57
489	14	3	5	2025-07-15	2025-06-27	Entregue	171.99	72.66	56.66
490	8	4	4	2025-06-23	2025-07-17	Entregue	1210.32	25.52	64.83
491	44	3	8	2025-07-14	2025-07-02	Entregue	1157.02	56.61	24.31
492	43	2	2	2025-07-19	2025-07-16	Entregue	72.56	51.13	61.55
493	41	1	6	2025-06-30	2025-07-18	Entregue	454.09	57.03	64.06
494	13	2	7	2025-07-05	2025-06-25	Em trânsito	1328.83	56.56	20.80
495	27	2	3	2025-07-20	2025-07-20	Entregue	1067.81	44.15	61.07
496	29	4	4	2025-07-18	2025-07-13	Entregue	382.46	64.55	71.01
497	13	2	5	2025-07-08	2025-07-10	Em trânsito	1068.20	22.44	68.90
498	37	5	2	2025-07-05	2025-07-04	Em trânsito	1111.45	8.61	57.97
499	6	2	7	2025-07-19	2025-07-23	Entregue	831.18	53.58	42.64
500	21	2	2	2025-06-30	2025-07-13	Em trânsito	1023.09	19.25	36.48
501	3	4	7	2025-07-07	2025-07-04	Entregue	935.31	7.31	54.10
502	43	5	10	2025-07-05	2025-07-08	Atrasada	661.16	25.31	49.28
503	6	3	2	2025-07-05	2025-06-26	Entregue	257.54	20.98	53.62
504	31	5	8	2025-07-06	2025-07-23	Entregue	528.66	48.44	69.76
505	10	3	3	2025-06-23	2025-07-02	Em trânsito	1384.21	27.11	50.07
506	10	2	3	2025-07-14	2025-07-04	Entregue	852.49	12.37	25.13
507	6	5	6	2025-07-11	2025-06-29	Entregue	1356.39	37.52	10.16
508	17	2	2	2025-07-05	2025-07-14	Entregue	768.09	22.88	25.91
509	24	4	4	2025-07-02	2025-07-04	Entregue	650.80	71.89	73.98
510	47	5	9	2025-06-30	2025-06-27	Entregue	372.98	14.52	70.75
511	5	2	2	2025-07-12	2025-07-05	Entregue	1416.85	5.24	9.88
512	10	2	6	2025-07-13	2025-07-23	Entregue	496.44	22.45	61.04
513	40	2	3	2025-06-23	2025-07-11	Entregue	1162.30	4.96	22.38
514	47	3	2	2025-07-13	2025-07-02	Entregue	383.16	58.68	38.61
515	2	5	3	2025-07-05	2025-06-23	Entregue	351.19	19.46	14.06
516	43	3	2	2025-07-20	2025-06-26	Entregue	705.32	23.24	25.00
517	20	4	8	2025-07-17	2025-07-21	Entregue	1064.60	5.44	15.61
518	44	4	6	2025-07-16	2025-07-19	Entregue	1045.22	8.97	51.76
519	2	1	9	2025-07-09	2025-07-12	Entregue	1314.98	52.17	21.70
520	25	4	8	2025-07-10	2025-06-28	Entregue	494.51	17.96	49.27
521	7	4	5	2025-07-11	2025-06-23	Entregue	1375.52	21.65	44.49
522	35	1	10	2025-07-10	2025-07-07	Entregue	1359.92	23.13	62.08
523	37	4	8	2025-07-12	2025-07-12	Entregue	864.41	15.01	42.20
524	35	3	3	2025-07-21	2025-06-30	Entregue	768.45	50.55	18.30
525	8	3	6	2025-06-28	2025-07-16	Entregue	556.29	54.62	30.39
526	45	1	5	2025-07-16	2025-07-02	Entregue	212.26	29.53	70.16
527	10	5	9	2025-07-22	2025-06-27	Entregue	1383.13	50.51	13.33
528	25	4	7	2025-07-06	2025-07-08	Em trânsito	368.42	35.54	50.30
529	17	4	9	2025-07-04	2025-07-14	Entregue	159.04	31.86	12.82
530	35	2	5	2025-07-03	2025-06-30	Entregue	828.44	8.51	42.48
531	5	4	5	2025-07-11	2025-07-11	Entregue	1439.56	12.81	41.81
532	13	1	6	2025-07-13	2025-07-04	Entregue	460.55	36.43	18.67
533	2	4	5	2025-07-04	2025-06-26	Em trânsito	111.23	55.62	61.40
534	35	2	3	2025-07-10	2025-06-29	Entregue	224.33	60.72	9.68
535	24	5	4	2025-07-11	2025-07-22	Entregue	194.15	34.91	48.01
536	30	2	2	2025-07-07	2025-07-04	Entregue	691.76	12.79	53.82
537	7	3	9	2025-07-08	2025-07-09	Entregue	1508.51	21.66	61.32
538	33	5	1	2025-07-17	2025-07-02	Em trânsito	284.25	37.71	38.95
539	44	4	4	2025-07-18	2025-07-09	Entregue	108.83	40.24	37.13
540	12	2	5	2025-07-11	2025-07-04	Entregue	399.30	43.81	64.28
541	32	1	9	2025-07-14	2025-07-18	Entregue	870.75	5.01	72.97
542	40	2	3	2025-07-15	2025-06-30	Entregue	841.97	35.41	20.55
543	31	3	5	2025-06-28	2025-07-05	Entregue	1461.11	61.58	38.48
544	30	3	9	2025-07-07	2025-07-19	Entregue	1406.77	70.53	12.44
545	2	2	9	2025-07-16	2025-07-03	Entregue	123.24	8.11	68.84
546	31	4	4	2025-07-10	2025-07-09	Entregue	808.81	64.79	37.99
547	45	4	3	2025-06-28	2025-07-05	Entregue	419.59	65.44	17.01
548	14	4	6	2025-07-02	2025-07-20	Entregue	194.65	68.06	65.95
549	13	3	4	2025-07-20	2025-07-07	Entregue	692.39	4.31	43.50
550	44	5	4	2025-06-30	2025-06-30	Entregue	1090.75	7.77	40.99
551	33	4	1	2025-07-02	2025-07-14	Em trânsito	345.39	57.16	6.43
552	26	2	3	2025-07-06	2025-07-15	Entregue	530.74	5.99	45.82
553	32	5	6	2025-07-20	2025-07-20	Entregue	593.90	18.70	42.62
554	47	5	8	2025-06-22	2025-07-10	Entregue	196.34	71.21	15.74
555	3	2	6	2025-07-19	2025-07-12	Entregue	1456.52	46.78	8.52
556	21	4	5	2025-07-07	2025-07-14	Em trânsito	208.75	37.05	12.31
557	6	2	4	2025-06-28	2025-07-04	Entregue	457.85	43.23	52.50
558	30	4	8	2025-06-30	2025-07-05	Entregue	1263.94	11.96	40.44
559	6	2	3	2025-07-16	2025-06-28	Em trânsito	846.00	9.84	54.12
560	5	2	9	2025-07-06	2025-07-06	Entregue	291.46	65.05	59.32
561	11	1	8	2025-07-11	2025-06-27	Entregue	444.74	69.55	26.56
562	11	3	3	2025-07-08	2025-07-04	Em trânsito	1344.14	47.39	35.71
563	14	2	2	2025-07-13	2025-07-04	Entregue	742.90	67.54	71.28
564	34	5	4	2025-07-08	2025-07-21	Entregue	1272.85	2.77	58.68
565	12	4	9	2025-07-14	2025-07-05	Entregue	1499.86	7.89	35.68
566	30	3	2	2025-07-02	2025-06-28	Entregue	1161.57	58.58	59.29
567	11	3	9	2025-07-18	2025-07-13	Entregue	1082.83	39.95	3.18
568	33	4	9	2025-07-13	2025-07-20	Entregue	1219.15	45.00	29.94
569	25	5	7	2025-07-02	2025-07-09	Entregue	1265.40	61.71	63.66
570	15	4	2	2025-07-10	2025-07-04	Entregue	580.88	63.81	27.87
571	21	1	8	2025-07-07	2025-07-14	Entregue	1501.57	50.21	28.11
572	3	2	7	2025-07-10	2025-07-13	Entregue	640.08	55.14	20.54
573	32	1	10	2025-07-21	2025-07-04	Entregue	894.46	57.75	5.10
574	20	2	2	2025-07-07	2025-06-25	Em trânsito	1375.96	38.57	65.11
575	40	2	6	2025-07-16	2025-07-11	Entregue	765.22	46.54	61.94
576	18	1	3	2025-07-11	2025-07-02	Entregue	702.62	34.08	20.40
577	5	4	9	2025-07-18	2025-07-19	Em trânsito	505.36	49.84	31.74
578	20	3	8	2025-07-16	2025-07-09	Entregue	1128.90	41.86	6.24
579	41	2	5	2025-06-24	2025-07-10	Entregue	167.44	12.45	44.59
580	29	4	5	2025-07-01	2025-06-30	Entregue	69.93	72.14	4.66
581	3	4	5	2025-07-06	2025-06-30	Entregue	590.06	72.41	37.69
582	19	4	2	2025-07-15	2025-06-30	Em trânsito	559.62	24.05	19.12
583	26	4	9	2025-06-29	2025-07-01	Entregue	652.68	22.28	65.84
584	34	4	4	2025-06-24	2025-07-08	Entregue	159.30	66.02	25.69
585	11	4	2	2025-07-06	2025-07-12	Entregue	539.38	26.85	18.03
586	41	4	5	2025-07-12	2025-07-02	Entregue	413.01	24.90	58.51
587	9	3	6	2025-07-21	2025-06-25	Entregue	97.27	67.72	69.69
588	19	2	2	2025-06-26	2025-06-27	Entregue	829.16	48.10	59.70
589	10	3	7	2025-06-28	2025-07-21	Entregue	1319.74	2.87	55.03
590	42	4	1	2025-07-18	2025-07-13	Entregue	1517.37	53.01	15.13
591	23	4	9	2025-07-14	2025-07-12	Entregue	346.66	45.27	62.04
592	14	5	8	2025-07-04	2025-07-12	Entregue	662.91	8.38	16.38
593	34	4	3	2025-07-17	2025-07-15	Entregue	1108.59	41.98	55.49
594	36	4	6	2025-07-11	2025-07-19	Entregue	1040.46	17.33	59.65
595	20	1	5	2025-06-24	2025-07-08	Entregue	909.27	26.90	61.19
596	47	3	1	2025-07-06	2025-07-17	Entregue	518.64	26.19	37.42
597	39	3	9	2025-07-04	2025-07-01	Entregue	1533.69	42.66	3.94
598	4	4	9	2025-07-03	2025-07-09	Entregue	843.44	43.26	10.58
599	23	4	4	2025-07-07	2025-07-02	Entregue	1253.10	72.84	35.81
600	7	4	3	2025-06-23	2025-07-15	Entregue	957.02	68.18	16.13
\.


--
-- TOC entry 4946 (class 0 OID 16811)
-- Dependencies: 228
-- Data for Name: itens_entrega; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itens_entrega (item_id, entrega_id, produto_id, quantidade, valor_total) FROM stdin;
1	1	60	7	1084.09
2	2	60	7	1084.09
3	3	60	7	1084.09
4	4	60	7	1084.09
5	5	60	7	1084.09
6	6	60	7	1084.09
7	7	60	7	1084.09
8	8	60	7	1084.09
9	9	60	7	1084.09
10	10	60	7	1084.09
11	11	60	7	1084.09
12	12	60	7	1084.09
13	13	60	7	1084.09
14	14	60	7	1084.09
15	15	60	7	1084.09
16	16	60	7	1084.09
17	17	60	7	1084.09
18	18	60	7	1084.09
19	19	60	7	1084.09
20	20	60	7	1084.09
21	21	60	7	1084.09
22	22	60	7	1084.09
23	23	60	7	1084.09
24	24	60	7	1084.09
25	25	60	7	1084.09
26	26	60	7	1084.09
27	27	60	7	1084.09
28	28	60	7	1084.09
29	29	60	7	1084.09
30	30	60	7	1084.09
31	31	60	7	1084.09
32	32	60	7	1084.09
33	33	60	7	1084.09
34	34	60	7	1084.09
35	35	60	7	1084.09
36	36	60	7	1084.09
37	37	60	7	1084.09
38	38	60	7	1084.09
39	39	60	7	1084.09
40	40	60	7	1084.09
41	41	60	7	1084.09
42	42	60	7	1084.09
43	43	60	7	1084.09
44	44	60	7	1084.09
45	45	60	7	1084.09
46	46	60	7	1084.09
47	47	60	7	1084.09
48	48	60	7	1084.09
49	49	60	7	1084.09
50	50	60	7	1084.09
51	51	60	7	1084.09
52	52	60	7	1084.09
53	53	60	7	1084.09
54	54	60	7	1084.09
55	55	60	7	1084.09
56	56	60	7	1084.09
57	57	60	7	1084.09
58	58	60	7	1084.09
59	59	60	7	1084.09
60	60	60	7	1084.09
61	61	60	7	1084.09
62	62	60	7	1084.09
63	63	60	7	1084.09
64	64	60	7	1084.09
65	65	60	7	1084.09
66	66	60	7	1084.09
67	67	60	7	1084.09
68	68	60	7	1084.09
69	69	60	7	1084.09
70	70	60	7	1084.09
71	71	60	7	1084.09
72	72	60	7	1084.09
73	73	60	7	1084.09
74	74	60	7	1084.09
75	75	60	7	1084.09
76	76	60	7	1084.09
77	77	60	7	1084.09
78	78	60	7	1084.09
79	79	60	7	1084.09
80	80	60	7	1084.09
81	81	60	7	1084.09
82	82	60	7	1084.09
83	83	60	7	1084.09
84	84	60	7	1084.09
85	85	60	7	1084.09
86	86	60	7	1084.09
87	87	60	7	1084.09
88	88	60	7	1084.09
89	89	60	7	1084.09
90	90	60	7	1084.09
91	91	60	7	1084.09
92	92	60	7	1084.09
93	93	60	7	1084.09
94	94	60	7	1084.09
95	95	60	7	1084.09
96	96	60	7	1084.09
97	97	60	7	1084.09
98	98	60	7	1084.09
99	99	60	7	1084.09
100	100	60	7	1084.09
101	101	60	7	1084.09
102	102	60	7	1084.09
103	103	60	7	1084.09
104	104	60	7	1084.09
105	105	60	7	1084.09
106	106	60	7	1084.09
107	107	60	7	1084.09
108	108	60	7	1084.09
109	109	60	7	1084.09
110	110	60	7	1084.09
111	111	60	7	1084.09
112	112	60	7	1084.09
113	113	60	7	1084.09
114	114	60	7	1084.09
115	115	60	7	1084.09
116	116	60	7	1084.09
117	117	60	7	1084.09
118	118	60	7	1084.09
119	119	60	7	1084.09
120	120	60	7	1084.09
121	121	60	7	1084.09
122	122	60	7	1084.09
123	123	60	7	1084.09
124	124	60	7	1084.09
125	125	60	7	1084.09
126	126	60	7	1084.09
127	127	60	7	1084.09
128	128	60	7	1084.09
129	129	60	7	1084.09
130	130	60	7	1084.09
131	131	60	7	1084.09
132	132	60	7	1084.09
133	133	60	7	1084.09
134	134	60	7	1084.09
135	135	60	7	1084.09
136	136	60	7	1084.09
137	137	60	7	1084.09
138	138	60	7	1084.09
139	139	60	7	1084.09
140	140	60	7	1084.09
141	141	60	7	1084.09
142	142	60	7	1084.09
143	143	60	7	1084.09
144	144	60	7	1084.09
145	145	60	7	1084.09
146	146	60	7	1084.09
147	147	60	7	1084.09
148	148	60	7	1084.09
149	149	60	7	1084.09
150	150	60	7	1084.09
151	151	60	7	1084.09
152	152	60	7	1084.09
153	153	60	7	1084.09
154	154	60	7	1084.09
155	155	60	7	1084.09
156	156	60	7	1084.09
157	157	60	7	1084.09
158	158	60	7	1084.09
159	159	60	7	1084.09
160	160	60	7	1084.09
161	161	60	7	1084.09
162	162	60	7	1084.09
163	163	60	7	1084.09
164	164	60	7	1084.09
165	165	60	7	1084.09
166	166	60	7	1084.09
167	167	60	7	1084.09
168	168	60	7	1084.09
169	169	60	7	1084.09
170	170	60	7	1084.09
171	171	60	7	1084.09
172	172	60	7	1084.09
173	173	60	7	1084.09
174	174	60	7	1084.09
175	175	60	7	1084.09
176	176	60	7	1084.09
177	177	60	7	1084.09
178	178	60	7	1084.09
179	179	60	7	1084.09
180	180	60	7	1084.09
181	181	60	7	1084.09
182	182	60	7	1084.09
183	183	60	7	1084.09
184	184	60	7	1084.09
185	185	60	7	1084.09
186	186	60	7	1084.09
187	187	60	7	1084.09
188	188	60	7	1084.09
189	189	60	7	1084.09
190	190	60	7	1084.09
191	191	60	7	1084.09
192	192	60	7	1084.09
193	193	60	7	1084.09
194	194	60	7	1084.09
195	195	60	7	1084.09
196	196	60	7	1084.09
197	197	60	7	1084.09
198	198	60	7	1084.09
199	199	60	7	1084.09
200	200	60	7	1084.09
201	201	60	7	1084.09
202	202	60	7	1084.09
203	203	60	7	1084.09
204	204	60	7	1084.09
205	205	60	7	1084.09
206	206	60	7	1084.09
207	207	60	7	1084.09
208	208	60	7	1084.09
209	209	60	7	1084.09
210	210	60	7	1084.09
211	211	60	7	1084.09
212	212	60	7	1084.09
213	213	60	7	1084.09
214	214	60	7	1084.09
215	215	60	7	1084.09
216	216	60	7	1084.09
217	217	60	7	1084.09
218	218	60	7	1084.09
219	219	60	7	1084.09
220	220	60	7	1084.09
221	221	60	7	1084.09
222	222	60	7	1084.09
223	223	60	7	1084.09
224	224	60	7	1084.09
225	225	60	7	1084.09
226	226	60	7	1084.09
227	227	60	7	1084.09
228	228	60	7	1084.09
229	229	60	7	1084.09
230	230	60	7	1084.09
231	231	60	7	1084.09
232	232	60	7	1084.09
233	233	60	7	1084.09
234	234	60	7	1084.09
235	235	60	7	1084.09
236	236	60	7	1084.09
237	237	60	7	1084.09
238	238	60	7	1084.09
239	239	60	7	1084.09
240	240	60	7	1084.09
241	241	60	7	1084.09
242	242	60	7	1084.09
243	243	60	7	1084.09
244	244	60	7	1084.09
245	245	60	7	1084.09
246	246	60	7	1084.09
247	247	60	7	1084.09
248	248	60	7	1084.09
249	249	60	7	1084.09
250	250	60	7	1084.09
251	251	60	7	1084.09
252	252	60	7	1084.09
253	253	60	7	1084.09
254	254	60	7	1084.09
255	255	60	7	1084.09
256	256	60	7	1084.09
257	257	60	7	1084.09
258	258	60	7	1084.09
259	259	60	7	1084.09
260	260	60	7	1084.09
261	261	60	7	1084.09
262	262	60	7	1084.09
263	263	60	7	1084.09
264	264	60	7	1084.09
265	265	60	7	1084.09
266	266	60	7	1084.09
267	267	60	7	1084.09
268	268	60	7	1084.09
269	269	60	7	1084.09
270	270	60	7	1084.09
271	271	60	7	1084.09
272	272	60	7	1084.09
273	273	60	7	1084.09
274	274	60	7	1084.09
275	275	60	7	1084.09
276	276	60	7	1084.09
277	277	60	7	1084.09
278	278	60	7	1084.09
279	279	60	7	1084.09
280	280	60	7	1084.09
281	281	60	7	1084.09
282	282	60	7	1084.09
283	283	60	7	1084.09
284	284	60	7	1084.09
285	285	60	7	1084.09
286	286	60	7	1084.09
287	287	60	7	1084.09
288	288	60	7	1084.09
289	289	60	7	1084.09
290	290	60	7	1084.09
291	291	60	7	1084.09
292	292	60	7	1084.09
293	293	60	7	1084.09
294	294	60	7	1084.09
295	295	60	7	1084.09
296	296	60	7	1084.09
297	297	60	7	1084.09
298	298	60	7	1084.09
299	299	60	7	1084.09
300	300	60	7	1084.09
301	301	60	7	1084.09
302	302	60	7	1084.09
303	303	60	7	1084.09
304	304	60	7	1084.09
305	305	60	7	1084.09
306	306	60	7	1084.09
307	307	60	7	1084.09
308	308	60	7	1084.09
309	309	60	7	1084.09
310	310	60	7	1084.09
311	311	60	7	1084.09
312	312	60	7	1084.09
313	313	60	7	1084.09
314	314	60	7	1084.09
315	315	60	7	1084.09
316	316	60	7	1084.09
317	317	60	7	1084.09
318	318	60	7	1084.09
319	319	60	7	1084.09
320	320	60	7	1084.09
321	321	60	7	1084.09
322	322	60	7	1084.09
323	323	60	7	1084.09
324	324	60	7	1084.09
325	325	60	7	1084.09
326	326	60	7	1084.09
327	327	60	7	1084.09
328	328	60	7	1084.09
329	329	60	7	1084.09
330	330	60	7	1084.09
331	331	60	7	1084.09
332	332	60	7	1084.09
333	333	60	7	1084.09
334	334	60	7	1084.09
335	335	60	7	1084.09
336	336	60	7	1084.09
337	337	60	7	1084.09
338	338	60	7	1084.09
339	339	60	7	1084.09
340	340	60	7	1084.09
341	341	60	7	1084.09
342	342	60	7	1084.09
343	343	60	7	1084.09
344	344	60	7	1084.09
345	345	60	7	1084.09
346	346	60	7	1084.09
347	347	60	7	1084.09
348	348	60	7	1084.09
349	349	60	7	1084.09
350	350	60	7	1084.09
351	351	60	7	1084.09
352	352	60	7	1084.09
353	353	60	7	1084.09
354	354	60	7	1084.09
355	355	60	7	1084.09
356	356	60	7	1084.09
357	357	60	7	1084.09
358	358	60	7	1084.09
359	359	60	7	1084.09
360	360	60	7	1084.09
361	361	60	7	1084.09
362	362	60	7	1084.09
363	363	60	7	1084.09
364	364	60	7	1084.09
365	365	60	7	1084.09
366	366	60	7	1084.09
367	367	60	7	1084.09
368	368	60	7	1084.09
369	369	60	7	1084.09
370	370	60	7	1084.09
371	371	60	7	1084.09
372	372	60	7	1084.09
373	373	60	7	1084.09
374	374	60	7	1084.09
375	375	60	7	1084.09
376	376	60	7	1084.09
377	377	60	7	1084.09
378	378	60	7	1084.09
379	379	60	7	1084.09
380	380	60	7	1084.09
381	381	60	7	1084.09
382	382	60	7	1084.09
383	383	60	7	1084.09
384	384	60	7	1084.09
385	385	60	7	1084.09
386	386	60	7	1084.09
387	387	60	7	1084.09
388	388	60	7	1084.09
389	389	60	7	1084.09
390	390	60	7	1084.09
391	391	60	7	1084.09
392	392	60	7	1084.09
393	393	60	7	1084.09
394	394	60	7	1084.09
395	395	60	7	1084.09
396	396	60	7	1084.09
397	397	60	7	1084.09
398	398	60	7	1084.09
399	399	60	7	1084.09
400	400	60	7	1084.09
401	401	60	7	1084.09
402	402	60	7	1084.09
403	403	60	7	1084.09
404	404	60	7	1084.09
405	405	60	7	1084.09
406	406	60	7	1084.09
407	407	60	7	1084.09
408	408	60	7	1084.09
409	409	60	7	1084.09
410	410	60	7	1084.09
411	411	60	7	1084.09
412	412	60	7	1084.09
413	413	60	7	1084.09
414	414	60	7	1084.09
415	415	60	7	1084.09
416	416	60	7	1084.09
417	417	60	7	1084.09
418	418	60	7	1084.09
419	419	60	7	1084.09
420	420	60	7	1084.09
421	421	60	7	1084.09
422	422	60	7	1084.09
423	423	60	7	1084.09
424	424	60	7	1084.09
425	425	60	7	1084.09
426	426	60	7	1084.09
427	427	60	7	1084.09
428	428	60	7	1084.09
429	429	60	7	1084.09
430	430	60	7	1084.09
431	431	60	7	1084.09
432	432	60	7	1084.09
433	433	60	7	1084.09
434	434	60	7	1084.09
435	435	60	7	1084.09
436	436	60	7	1084.09
437	437	60	7	1084.09
438	438	60	7	1084.09
439	439	60	7	1084.09
440	440	60	7	1084.09
441	441	60	7	1084.09
442	442	60	7	1084.09
443	443	60	7	1084.09
444	444	60	7	1084.09
445	445	60	7	1084.09
446	446	60	7	1084.09
447	447	60	7	1084.09
448	448	60	7	1084.09
449	449	60	7	1084.09
450	450	60	7	1084.09
451	451	60	7	1084.09
452	452	60	7	1084.09
453	453	60	7	1084.09
454	454	60	7	1084.09
455	455	60	7	1084.09
456	456	60	7	1084.09
457	457	60	7	1084.09
458	458	60	7	1084.09
459	459	60	7	1084.09
460	460	60	7	1084.09
461	461	60	7	1084.09
462	462	60	7	1084.09
463	463	60	7	1084.09
464	464	60	7	1084.09
465	465	60	7	1084.09
466	466	60	7	1084.09
467	467	60	7	1084.09
468	468	60	7	1084.09
469	469	60	7	1084.09
470	470	60	7	1084.09
471	471	60	7	1084.09
472	472	60	7	1084.09
473	473	60	7	1084.09
474	474	60	7	1084.09
475	475	60	7	1084.09
476	476	60	7	1084.09
477	477	60	7	1084.09
478	478	60	7	1084.09
479	479	60	7	1084.09
480	480	60	7	1084.09
481	481	60	7	1084.09
482	482	60	7	1084.09
483	483	60	7	1084.09
484	484	60	7	1084.09
485	485	60	7	1084.09
486	486	60	7	1084.09
487	487	60	7	1084.09
488	488	60	7	1084.09
489	489	60	7	1084.09
490	490	60	7	1084.09
491	491	60	7	1084.09
492	492	60	7	1084.09
493	493	60	7	1084.09
494	494	60	7	1084.09
495	495	60	7	1084.09
496	496	60	7	1084.09
497	497	60	7	1084.09
498	498	60	7	1084.09
499	499	60	7	1084.09
500	500	60	7	1084.09
501	501	60	7	1084.09
502	502	60	7	1084.09
503	503	60	7	1084.09
504	504	60	7	1084.09
505	505	60	7	1084.09
506	506	60	7	1084.09
507	507	60	7	1084.09
508	508	60	7	1084.09
509	509	60	7	1084.09
510	510	60	7	1084.09
511	511	60	7	1084.09
512	512	60	7	1084.09
513	513	60	7	1084.09
514	514	60	7	1084.09
515	515	60	7	1084.09
516	516	60	7	1084.09
517	517	60	7	1084.09
518	518	60	7	1084.09
519	519	60	7	1084.09
520	520	60	7	1084.09
521	521	60	7	1084.09
522	522	60	7	1084.09
523	523	60	7	1084.09
524	524	60	7	1084.09
525	525	60	7	1084.09
526	526	60	7	1084.09
527	527	60	7	1084.09
528	528	60	7	1084.09
529	529	60	7	1084.09
530	530	60	7	1084.09
531	531	60	7	1084.09
532	532	60	7	1084.09
533	533	60	7	1084.09
534	534	60	7	1084.09
535	535	60	7	1084.09
536	536	60	7	1084.09
537	537	60	7	1084.09
538	538	60	7	1084.09
539	539	60	7	1084.09
540	540	60	7	1084.09
541	541	60	7	1084.09
542	542	60	7	1084.09
543	543	60	7	1084.09
544	544	60	7	1084.09
545	545	60	7	1084.09
546	546	60	7	1084.09
547	547	60	7	1084.09
548	548	60	7	1084.09
549	549	60	7	1084.09
550	550	60	7	1084.09
551	551	60	7	1084.09
552	552	60	7	1084.09
553	553	60	7	1084.09
554	554	60	7	1084.09
555	555	60	7	1084.09
556	556	60	7	1084.09
557	557	60	7	1084.09
558	558	60	7	1084.09
559	559	60	7	1084.09
560	560	60	7	1084.09
561	561	60	7	1084.09
562	562	60	7	1084.09
563	563	60	7	1084.09
564	564	60	7	1084.09
565	565	60	7	1084.09
566	566	60	7	1084.09
567	567	60	7	1084.09
568	568	60	7	1084.09
569	569	60	7	1084.09
570	570	60	7	1084.09
571	571	60	7	1084.09
572	572	60	7	1084.09
573	573	60	7	1084.09
574	574	60	7	1084.09
575	575	60	7	1084.09
576	576	60	7	1084.09
577	577	60	7	1084.09
578	578	60	7	1084.09
579	579	60	7	1084.09
580	580	60	7	1084.09
581	581	60	7	1084.09
582	582	60	7	1084.09
583	583	60	7	1084.09
584	584	60	7	1084.09
585	585	60	7	1084.09
586	586	60	7	1084.09
587	587	60	7	1084.09
588	588	60	7	1084.09
589	589	60	7	1084.09
590	590	60	7	1084.09
591	591	60	7	1084.09
592	592	60	7	1084.09
593	593	60	7	1084.09
594	594	60	7	1084.09
595	595	60	7	1084.09
596	596	60	7	1084.09
597	597	60	7	1084.09
598	598	60	7	1084.09
599	599	60	7	1084.09
600	600	60	7	1084.09
601	1	2	8	3776.72
602	2	2	8	3776.72
603	3	2	8	3776.72
604	4	2	8	3776.72
605	5	2	8	3776.72
606	6	2	8	3776.72
607	7	2	8	3776.72
608	8	2	8	3776.72
609	9	2	8	3776.72
610	10	2	8	3776.72
611	11	2	8	3776.72
612	12	2	8	3776.72
613	13	2	8	3776.72
614	14	2	8	3776.72
615	15	2	8	3776.72
616	16	2	8	3776.72
617	17	2	8	3776.72
618	18	2	8	3776.72
619	19	2	8	3776.72
620	20	2	8	3776.72
621	21	2	8	3776.72
622	22	2	8	3776.72
623	23	2	8	3776.72
624	24	2	8	3776.72
625	25	2	8	3776.72
626	26	2	8	3776.72
627	27	2	8	3776.72
628	28	2	8	3776.72
629	29	2	8	3776.72
630	30	2	8	3776.72
631	31	2	8	3776.72
632	32	2	8	3776.72
633	33	2	8	3776.72
634	34	2	8	3776.72
635	35	2	8	3776.72
636	36	2	8	3776.72
637	37	2	8	3776.72
638	38	2	8	3776.72
639	39	2	8	3776.72
640	40	2	8	3776.72
641	41	2	8	3776.72
642	42	2	8	3776.72
643	43	2	8	3776.72
644	44	2	8	3776.72
645	45	2	8	3776.72
646	46	2	8	3776.72
647	47	2	8	3776.72
648	48	2	8	3776.72
649	49	2	8	3776.72
650	50	2	8	3776.72
651	51	2	8	3776.72
652	52	2	8	3776.72
653	53	2	8	3776.72
654	54	2	8	3776.72
655	55	2	8	3776.72
656	56	2	8	3776.72
657	57	2	8	3776.72
658	58	2	8	3776.72
659	59	2	8	3776.72
660	60	2	8	3776.72
661	61	2	8	3776.72
662	62	2	8	3776.72
663	63	2	8	3776.72
664	64	2	8	3776.72
665	65	2	8	3776.72
666	66	2	8	3776.72
667	67	2	8	3776.72
668	68	2	8	3776.72
669	69	2	8	3776.72
670	70	2	8	3776.72
671	71	2	8	3776.72
672	72	2	8	3776.72
673	73	2	8	3776.72
674	74	2	8	3776.72
675	75	2	8	3776.72
676	76	2	8	3776.72
677	77	2	8	3776.72
678	78	2	8	3776.72
679	79	2	8	3776.72
680	80	2	8	3776.72
681	81	2	8	3776.72
682	82	2	8	3776.72
683	83	2	8	3776.72
684	84	2	8	3776.72
685	85	2	8	3776.72
686	86	2	8	3776.72
687	87	2	8	3776.72
688	88	2	8	3776.72
689	89	2	8	3776.72
690	90	2	8	3776.72
691	91	2	8	3776.72
692	92	2	8	3776.72
693	93	2	8	3776.72
694	94	2	8	3776.72
695	95	2	8	3776.72
696	96	2	8	3776.72
697	97	2	8	3776.72
698	98	2	8	3776.72
699	99	2	8	3776.72
700	100	2	8	3776.72
701	101	2	8	3776.72
702	102	2	8	3776.72
703	103	2	8	3776.72
704	104	2	8	3776.72
705	105	2	8	3776.72
706	106	2	8	3776.72
707	107	2	8	3776.72
708	108	2	8	3776.72
709	109	2	8	3776.72
710	110	2	8	3776.72
711	111	2	8	3776.72
712	112	2	8	3776.72
713	113	2	8	3776.72
714	114	2	8	3776.72
715	115	2	8	3776.72
716	116	2	8	3776.72
717	117	2	8	3776.72
718	118	2	8	3776.72
719	119	2	8	3776.72
720	120	2	8	3776.72
721	121	2	8	3776.72
722	122	2	8	3776.72
723	123	2	8	3776.72
724	124	2	8	3776.72
725	125	2	8	3776.72
726	126	2	8	3776.72
727	127	2	8	3776.72
728	128	2	8	3776.72
729	129	2	8	3776.72
730	130	2	8	3776.72
731	131	2	8	3776.72
732	132	2	8	3776.72
733	133	2	8	3776.72
734	134	2	8	3776.72
735	135	2	8	3776.72
736	136	2	8	3776.72
737	137	2	8	3776.72
738	138	2	8	3776.72
739	139	2	8	3776.72
740	140	2	8	3776.72
741	141	2	8	3776.72
742	142	2	8	3776.72
743	143	2	8	3776.72
744	144	2	8	3776.72
745	145	2	8	3776.72
746	146	2	8	3776.72
747	147	2	8	3776.72
748	148	2	8	3776.72
749	149	2	8	3776.72
750	150	2	8	3776.72
751	151	2	8	3776.72
752	152	2	8	3776.72
753	153	2	8	3776.72
754	154	2	8	3776.72
755	155	2	8	3776.72
756	156	2	8	3776.72
757	157	2	8	3776.72
758	158	2	8	3776.72
759	159	2	8	3776.72
760	160	2	8	3776.72
761	161	2	8	3776.72
762	162	2	8	3776.72
763	163	2	8	3776.72
764	164	2	8	3776.72
765	165	2	8	3776.72
766	166	2	8	3776.72
767	167	2	8	3776.72
768	168	2	8	3776.72
769	169	2	8	3776.72
770	170	2	8	3776.72
771	171	2	8	3776.72
772	172	2	8	3776.72
773	173	2	8	3776.72
774	174	2	8	3776.72
775	175	2	8	3776.72
776	176	2	8	3776.72
777	177	2	8	3776.72
778	178	2	8	3776.72
779	179	2	8	3776.72
780	180	2	8	3776.72
781	181	2	8	3776.72
782	182	2	8	3776.72
783	183	2	8	3776.72
784	184	2	8	3776.72
785	185	2	8	3776.72
786	186	2	8	3776.72
787	187	2	8	3776.72
788	188	2	8	3776.72
789	189	2	8	3776.72
790	190	2	8	3776.72
791	191	2	8	3776.72
792	192	2	8	3776.72
793	193	2	8	3776.72
794	194	2	8	3776.72
795	195	2	8	3776.72
796	196	2	8	3776.72
797	197	2	8	3776.72
798	198	2	8	3776.72
799	199	2	8	3776.72
800	200	2	8	3776.72
801	201	2	8	3776.72
802	202	2	8	3776.72
803	203	2	8	3776.72
804	204	2	8	3776.72
805	205	2	8	3776.72
806	206	2	8	3776.72
807	207	2	8	3776.72
808	208	2	8	3776.72
809	209	2	8	3776.72
810	210	2	8	3776.72
811	211	2	8	3776.72
812	212	2	8	3776.72
813	213	2	8	3776.72
814	214	2	8	3776.72
815	215	2	8	3776.72
816	216	2	8	3776.72
817	217	2	8	3776.72
818	218	2	8	3776.72
819	219	2	8	3776.72
820	220	2	8	3776.72
821	221	2	8	3776.72
822	222	2	8	3776.72
823	223	2	8	3776.72
824	224	2	8	3776.72
825	225	2	8	3776.72
826	226	2	8	3776.72
827	227	2	8	3776.72
828	228	2	8	3776.72
829	229	2	8	3776.72
830	230	2	8	3776.72
831	231	2	8	3776.72
832	232	2	8	3776.72
833	233	2	8	3776.72
834	234	2	8	3776.72
835	235	2	8	3776.72
836	236	2	8	3776.72
837	237	2	8	3776.72
838	238	2	8	3776.72
839	239	2	8	3776.72
840	240	2	8	3776.72
841	241	2	8	3776.72
842	242	2	8	3776.72
843	243	2	8	3776.72
844	244	2	8	3776.72
845	245	2	8	3776.72
846	246	2	8	3776.72
847	247	2	8	3776.72
848	248	2	8	3776.72
849	249	2	8	3776.72
850	250	2	8	3776.72
851	251	2	8	3776.72
852	252	2	8	3776.72
853	253	2	8	3776.72
854	254	2	8	3776.72
855	255	2	8	3776.72
856	256	2	8	3776.72
857	257	2	8	3776.72
858	258	2	8	3776.72
859	259	2	8	3776.72
860	260	2	8	3776.72
861	261	2	8	3776.72
862	262	2	8	3776.72
863	263	2	8	3776.72
864	264	2	8	3776.72
865	265	2	8	3776.72
866	266	2	8	3776.72
867	267	2	8	3776.72
868	268	2	8	3776.72
869	269	2	8	3776.72
870	270	2	8	3776.72
871	271	2	8	3776.72
872	272	2	8	3776.72
873	273	2	8	3776.72
874	274	2	8	3776.72
875	275	2	8	3776.72
876	276	2	8	3776.72
877	277	2	8	3776.72
878	278	2	8	3776.72
879	279	2	8	3776.72
880	280	2	8	3776.72
881	281	2	8	3776.72
882	282	2	8	3776.72
883	283	2	8	3776.72
884	284	2	8	3776.72
885	285	2	8	3776.72
886	286	2	8	3776.72
887	287	2	8	3776.72
888	288	2	8	3776.72
889	289	2	8	3776.72
890	290	2	8	3776.72
891	291	2	8	3776.72
892	292	2	8	3776.72
893	293	2	8	3776.72
894	294	2	8	3776.72
895	295	2	8	3776.72
896	296	2	8	3776.72
897	297	2	8	3776.72
898	298	2	8	3776.72
899	299	2	8	3776.72
900	300	2	8	3776.72
901	301	2	8	3776.72
902	302	2	8	3776.72
903	303	2	8	3776.72
904	304	2	8	3776.72
905	305	2	8	3776.72
906	306	2	8	3776.72
907	307	2	8	3776.72
908	308	2	8	3776.72
909	309	2	8	3776.72
910	310	2	8	3776.72
911	311	2	8	3776.72
912	312	2	8	3776.72
913	313	2	8	3776.72
914	314	2	8	3776.72
915	315	2	8	3776.72
916	316	2	8	3776.72
917	317	2	8	3776.72
918	318	2	8	3776.72
919	319	2	8	3776.72
920	320	2	8	3776.72
921	321	2	8	3776.72
922	322	2	8	3776.72
923	323	2	8	3776.72
924	324	2	8	3776.72
925	325	2	8	3776.72
926	326	2	8	3776.72
927	327	2	8	3776.72
928	328	2	8	3776.72
929	329	2	8	3776.72
930	330	2	8	3776.72
931	331	2	8	3776.72
932	332	2	8	3776.72
933	333	2	8	3776.72
934	334	2	8	3776.72
935	335	2	8	3776.72
936	336	2	8	3776.72
937	337	2	8	3776.72
938	338	2	8	3776.72
939	339	2	8	3776.72
940	340	2	8	3776.72
941	341	2	8	3776.72
942	342	2	8	3776.72
943	343	2	8	3776.72
944	344	2	8	3776.72
945	345	2	8	3776.72
946	346	2	8	3776.72
947	347	2	8	3776.72
948	348	2	8	3776.72
949	349	2	8	3776.72
950	350	2	8	3776.72
951	351	2	8	3776.72
952	352	2	8	3776.72
953	353	2	8	3776.72
954	354	2	8	3776.72
955	355	2	8	3776.72
956	356	2	8	3776.72
957	357	2	8	3776.72
958	358	2	8	3776.72
959	359	2	8	3776.72
960	360	2	8	3776.72
961	361	2	8	3776.72
962	362	2	8	3776.72
963	363	2	8	3776.72
964	364	2	8	3776.72
965	365	2	8	3776.72
966	366	2	8	3776.72
967	367	2	8	3776.72
968	368	2	8	3776.72
969	369	2	8	3776.72
970	370	2	8	3776.72
971	371	2	8	3776.72
972	372	2	8	3776.72
973	373	2	8	3776.72
974	374	2	8	3776.72
975	375	2	8	3776.72
976	376	2	8	3776.72
977	377	2	8	3776.72
978	378	2	8	3776.72
979	379	2	8	3776.72
980	380	2	8	3776.72
981	381	2	8	3776.72
982	382	2	8	3776.72
983	383	2	8	3776.72
984	384	2	8	3776.72
985	385	2	8	3776.72
986	386	2	8	3776.72
987	387	2	8	3776.72
988	388	2	8	3776.72
989	389	2	8	3776.72
990	390	2	8	3776.72
991	391	2	8	3776.72
992	392	2	8	3776.72
993	393	2	8	3776.72
994	394	2	8	3776.72
995	395	2	8	3776.72
996	396	2	8	3776.72
997	397	2	8	3776.72
998	398	2	8	3776.72
999	399	2	8	3776.72
1000	400	2	8	3776.72
1001	401	2	8	3776.72
1002	402	2	8	3776.72
1003	403	2	8	3776.72
1004	404	2	8	3776.72
1005	405	2	8	3776.72
1006	406	2	8	3776.72
1007	407	2	8	3776.72
1008	408	2	8	3776.72
1009	409	2	8	3776.72
1010	410	2	8	3776.72
1011	411	2	8	3776.72
1012	412	2	8	3776.72
1013	413	2	8	3776.72
1014	414	2	8	3776.72
1015	415	2	8	3776.72
1016	416	2	8	3776.72
1017	417	2	8	3776.72
1018	418	2	8	3776.72
1019	419	2	8	3776.72
1020	420	2	8	3776.72
1021	421	2	8	3776.72
1022	422	2	8	3776.72
1023	423	2	8	3776.72
1024	424	2	8	3776.72
1025	425	2	8	3776.72
1026	426	2	8	3776.72
1027	427	2	8	3776.72
1028	428	2	8	3776.72
1029	429	2	8	3776.72
1030	430	2	8	3776.72
1031	431	2	8	3776.72
1032	432	2	8	3776.72
1033	433	2	8	3776.72
1034	434	2	8	3776.72
1035	435	2	8	3776.72
1036	436	2	8	3776.72
1037	437	2	8	3776.72
1038	438	2	8	3776.72
1039	439	2	8	3776.72
1040	440	2	8	3776.72
1041	441	2	8	3776.72
1042	442	2	8	3776.72
1043	443	2	8	3776.72
1044	444	2	8	3776.72
1045	445	2	8	3776.72
1046	446	2	8	3776.72
1047	447	2	8	3776.72
1048	448	2	8	3776.72
1049	449	2	8	3776.72
1050	450	2	8	3776.72
1051	451	2	8	3776.72
1052	452	2	8	3776.72
1053	453	2	8	3776.72
1054	454	2	8	3776.72
1055	455	2	8	3776.72
1056	456	2	8	3776.72
1057	457	2	8	3776.72
1058	458	2	8	3776.72
1059	459	2	8	3776.72
1060	460	2	8	3776.72
1061	461	2	8	3776.72
1062	462	2	8	3776.72
1063	463	2	8	3776.72
1064	464	2	8	3776.72
1065	465	2	8	3776.72
1066	466	2	8	3776.72
1067	467	2	8	3776.72
1068	468	2	8	3776.72
1069	469	2	8	3776.72
1070	470	2	8	3776.72
1071	471	2	8	3776.72
1072	472	2	8	3776.72
1073	473	2	8	3776.72
1074	474	2	8	3776.72
1075	475	2	8	3776.72
1076	476	2	8	3776.72
1077	477	2	8	3776.72
1078	478	2	8	3776.72
1079	479	2	8	3776.72
1080	480	2	8	3776.72
1081	481	2	8	3776.72
1082	482	2	8	3776.72
1083	483	2	8	3776.72
1084	484	2	8	3776.72
1085	485	2	8	3776.72
1086	486	2	8	3776.72
1087	487	2	8	3776.72
1088	488	2	8	3776.72
1089	489	2	8	3776.72
1090	490	2	8	3776.72
1091	491	2	8	3776.72
1092	492	2	8	3776.72
1093	493	2	8	3776.72
1094	494	2	8	3776.72
1095	495	2	8	3776.72
1096	496	2	8	3776.72
1097	497	2	8	3776.72
1098	498	2	8	3776.72
1099	499	2	8	3776.72
1100	500	2	8	3776.72
1101	501	2	8	3776.72
1102	502	2	8	3776.72
1103	503	2	8	3776.72
1104	504	2	8	3776.72
1105	505	2	8	3776.72
1106	506	2	8	3776.72
1107	507	2	8	3776.72
1108	508	2	8	3776.72
1109	509	2	8	3776.72
1110	510	2	8	3776.72
1111	511	2	8	3776.72
1112	512	2	8	3776.72
1113	513	2	8	3776.72
1114	514	2	8	3776.72
1115	515	2	8	3776.72
1116	516	2	8	3776.72
1117	517	2	8	3776.72
1118	518	2	8	3776.72
1119	519	2	8	3776.72
1120	520	2	8	3776.72
1121	521	2	8	3776.72
1122	522	2	8	3776.72
1123	523	2	8	3776.72
1124	524	2	8	3776.72
1125	525	2	8	3776.72
1126	526	2	8	3776.72
1127	527	2	8	3776.72
1128	528	2	8	3776.72
1129	529	2	8	3776.72
1130	530	2	8	3776.72
1131	531	2	8	3776.72
1132	532	2	8	3776.72
1133	533	2	8	3776.72
1134	534	2	8	3776.72
1135	535	2	8	3776.72
1136	536	2	8	3776.72
1137	537	2	8	3776.72
1138	538	2	8	3776.72
1139	539	2	8	3776.72
1140	540	2	8	3776.72
1141	541	2	8	3776.72
1142	542	2	8	3776.72
1143	543	2	8	3776.72
1144	544	2	8	3776.72
1145	545	2	8	3776.72
1146	546	2	8	3776.72
1147	547	2	8	3776.72
1148	548	2	8	3776.72
1149	549	2	8	3776.72
1150	550	2	8	3776.72
1151	551	2	8	3776.72
1152	552	2	8	3776.72
1153	553	2	8	3776.72
1154	554	2	8	3776.72
1155	555	2	8	3776.72
1156	556	2	8	3776.72
1157	557	2	8	3776.72
1158	558	2	8	3776.72
1159	559	2	8	3776.72
1160	560	2	8	3776.72
1161	561	2	8	3776.72
1162	562	2	8	3776.72
1163	563	2	8	3776.72
1164	564	2	8	3776.72
1165	565	2	8	3776.72
1166	566	2	8	3776.72
1167	567	2	8	3776.72
1168	568	2	8	3776.72
1169	569	2	8	3776.72
1170	570	2	8	3776.72
1171	571	2	8	3776.72
1172	572	2	8	3776.72
1173	573	2	8	3776.72
1174	574	2	8	3776.72
1175	575	2	8	3776.72
1176	576	2	8	3776.72
1177	577	2	8	3776.72
1178	578	2	8	3776.72
1179	579	2	8	3776.72
1180	580	2	8	3776.72
1181	581	2	8	3776.72
1182	582	2	8	3776.72
1183	583	2	8	3776.72
1184	584	2	8	3776.72
1185	585	2	8	3776.72
1186	586	2	8	3776.72
1187	587	2	8	3776.72
1188	588	2	8	3776.72
1189	589	2	8	3776.72
1190	590	2	8	3776.72
1191	591	2	8	3776.72
1192	592	2	8	3776.72
1193	593	2	8	3776.72
1194	594	2	8	3776.72
1195	595	2	8	3776.72
1196	596	2	8	3776.72
1197	597	2	8	3776.72
1198	598	2	8	3776.72
1199	599	2	8	3776.72
1200	600	2	8	3776.72
\.


--
-- TOC entry 4938 (class 0 OID 16768)
-- Dependencies: 220
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (produto_id, nome, categoria, unidade_medida, peso_kg, volume_m3, preco_unitario) FROM stdin;
1	Produto 1	Alimentício	un	2.85	0.067	15.38
2	Produto 2	Químico	un	7.12	0.066	472.09
3	Produto 3	Eletrônicos	un	9.88	0.045	351.50
4	Produto 4	Alimentício	un	8.49	0.089	490.63
5	Produto 5	Químico	un	5.32	0.031	402.49
6	Produto 6	Eletrônicos	un	6.24	0.103	490.17
7	Produto 7	Alimentício	un	7.40	0.024	265.97
8	Produto 8	Químico	un	4.40	0.077	448.61
9	Produto 9	Eletrônicos	un	8.51	0.098	273.16
10	Produto 10	Alimentício	un	6.96	0.066	463.31
11	Produto 11	Químico	un	6.79	0.032	179.30
12	Produto 12	Eletrônicos	un	10.03	0.040	306.68
13	Produto 13	Alimentício	un	9.55	0.017	203.48
14	Produto 14	Químico	un	4.91	0.105	37.30
15	Produto 15	Eletrônicos	un	10.11	0.091	254.51
16	Produto 16	Alimentício	un	5.95	0.013	406.13
17	Produto 17	Químico	un	4.40	0.040	361.76
18	Produto 18	Eletrônicos	un	7.84	0.051	136.06
19	Produto 19	Alimentício	un	10.52	0.043	220.44
20	Produto 20	Químico	un	6.00	0.069	479.19
21	Produto 21	Eletrônicos	un	8.48	0.076	86.26
22	Produto 22	Alimentício	un	2.19	0.035	263.23
23	Produto 23	Químico	un	7.96	0.015	277.81
24	Produto 24	Eletrônicos	un	4.26	0.108	253.89
25	Produto 25	Alimentício	un	1.05	0.071	288.14
26	Produto 26	Químico	un	10.51	0.066	223.14
27	Produto 27	Eletrônicos	un	10.80	0.019	343.50
28	Produto 28	Alimentício	un	5.56	0.014	427.02
29	Produto 29	Químico	un	10.21	0.070	105.66
30	Produto 30	Eletrônicos	un	8.30	0.078	169.62
31	Produto 1	Alimentício	un	10.60	0.106	229.76
32	Produto 2	Químico	un	7.57	0.045	145.28
33	Produto 3	Eletrônicos	un	9.27	0.060	378.77
34	Produto 4	Alimentício	un	9.28	0.010	299.44
35	Produto 5	Químico	un	9.70	0.082	468.61
36	Produto 6	Eletrônicos	un	10.89	0.029	361.28
37	Produto 7	Alimentício	un	5.34	0.038	375.81
38	Produto 8	Químico	un	8.26	0.083	275.78
39	Produto 9	Eletrônicos	un	3.17	0.077	448.57
40	Produto 10	Alimentício	un	7.25	0.109	405.36
41	Produto 11	Químico	un	9.20	0.064	487.62
42	Produto 12	Eletrônicos	un	5.63	0.097	258.35
43	Produto 13	Alimentício	un	1.79	0.040	285.26
44	Produto 14	Químico	un	6.42	0.104	109.80
45	Produto 15	Eletrônicos	un	3.04	0.047	134.75
46	Produto 16	Alimentício	un	4.03	0.091	256.71
47	Produto 17	Químico	un	1.57	0.044	141.08
48	Produto 18	Eletrônicos	un	4.15	0.074	221.05
49	Produto 19	Alimentício	un	2.76	0.062	324.47
50	Produto 20	Químico	un	10.98	0.025	115.39
51	Produto 21	Eletrônicos	un	10.53	0.076	393.09
52	Produto 22	Alimentício	un	7.11	0.060	367.27
53	Produto 23	Químico	un	8.19	0.050	162.00
54	Produto 24	Eletrônicos	un	9.60	0.013	507.00
55	Produto 25	Alimentício	un	6.81	0.080	86.05
56	Produto 26	Químico	un	6.27	0.097	233.00
57	Produto 27	Eletrônicos	un	2.82	0.019	179.01
58	Produto 28	Alimentício	un	10.42	0.063	449.98
59	Produto 29	Químico	un	7.21	0.069	135.86
60	Produto 30	Eletrônicos	un	4.10	0.099	154.87
\.


--
-- TOC entry 4940 (class 0 OID 16775)
-- Dependencies: 222
-- Data for Name: transportadoras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportadoras (transportadora_id, nome, tipo_veiculo, placa_veiculo, capacidade_kg, capacidade_m3) FROM stdin;
1	Transp 1	Van	ABC1001	14268.53	49.566
2	Transp 2	Caminhão	ABC1002	11812.44	28.867
3	Transp 3	Van	ABC1003	20315.79	54.766
4	Transp 4	Caminhão	ABC1004	21658.60	57.648
5	Transp 5	Van	ABC1005	7734.97	64.907
6	Transp 6	Caminhão	ABC1006	20252.49	86.898
7	Transp 7	Van	ABC1007	15502.00	83.333
8	Transp 8	Caminhão	ABC1008	16378.91	37.270
9	Transp 9	Van	ABC1009	15766.49	50.251
10	Transp 10	Caminhão	ABC1010	21445.87	88.433
\.


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 223
-- Name: armazens_armazem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.armazens_armazem_id_seq', 5, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_cliente_id_seq', 50, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 225
-- Name: entregas_entrega_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entregas_entrega_id_seq', 600, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 227
-- Name: itens_entrega_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itens_entrega_item_id_seq', 1200, true);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 219
-- Name: produtos_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_produto_id_seq', 60, true);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 221
-- Name: transportadoras_transportadora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transportadoras_transportadora_id_seq', 10, true);


--
-- TOC entry 4780 (class 2606 OID 16787)
-- Name: armazens armazens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazens
    ADD CONSTRAINT armazens_pkey PRIMARY KEY (armazem_id);


--
-- TOC entry 4774 (class 2606 OID 16766)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cliente_id);


--
-- TOC entry 4782 (class 2606 OID 16794)
-- Name: entregas entregas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregas
    ADD CONSTRAINT entregas_pkey PRIMARY KEY (entrega_id);


--
-- TOC entry 4784 (class 2606 OID 16816)
-- Name: itens_entrega itens_entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_entrega
    ADD CONSTRAINT itens_entrega_pkey PRIMARY KEY (item_id);


--
-- TOC entry 4776 (class 2606 OID 16773)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (produto_id);


--
-- TOC entry 4778 (class 2606 OID 16780)
-- Name: transportadoras transportadoras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportadoras
    ADD CONSTRAINT transportadoras_pkey PRIMARY KEY (transportadora_id);


--
-- TOC entry 4785 (class 2606 OID 16800)
-- Name: entregas entregas_armazem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregas
    ADD CONSTRAINT entregas_armazem_id_fkey FOREIGN KEY (armazem_id) REFERENCES public.armazens(armazem_id);


--
-- TOC entry 4786 (class 2606 OID 16795)
-- Name: entregas entregas_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregas
    ADD CONSTRAINT entregas_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(cliente_id);


--
-- TOC entry 4787 (class 2606 OID 16805)
-- Name: entregas entregas_transportadora_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregas
    ADD CONSTRAINT entregas_transportadora_id_fkey FOREIGN KEY (transportadora_id) REFERENCES public.transportadoras(transportadora_id);


--
-- TOC entry 4788 (class 2606 OID 16817)
-- Name: itens_entrega itens_entrega_entrega_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_entrega
    ADD CONSTRAINT itens_entrega_entrega_id_fkey FOREIGN KEY (entrega_id) REFERENCES public.entregas(entrega_id);


--
-- TOC entry 4789 (class 2606 OID 16822)
-- Name: itens_entrega itens_entrega_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_entrega
    ADD CONSTRAINT itens_entrega_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(produto_id);


-- Completed on 2025-07-22 15:50:28

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-22 15:50:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16388)
-- Name: pgagent; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgagent;


ALTER SCHEMA pgagent OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA pgagent; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';


--
-- TOC entry 2 (class 3079 OID 16389)
-- Name: pgagent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgagent WITH SCHEMA pgagent;


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgagent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgagent IS 'A PostgreSQL job scheduler';


--
-- TOC entry 4779 (class 0 OID 16390)
-- Dependencies: 222
-- Data for Name: pga_jobagent; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobagent (jagpid, jaglogintime, jagstation) FROM stdin;
6532	2025-07-22 11:58:09.344713-03	VINNY-PC
\.


--
-- TOC entry 4780 (class 0 OID 16399)
-- Dependencies: 224
-- Data for Name: pga_jobclass; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobclass (jclid, jclname) FROM stdin;
\.


--
-- TOC entry 4781 (class 0 OID 16409)
-- Dependencies: 226
-- Data for Name: pga_job; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_job (jobid, jobjclid, jobname, jobdesc, jobhostagent, jobenabled, jobcreated, jobchanged, jobagentid, jobnextrun, joblastrun) FROM stdin;
\.


--
-- TOC entry 4783 (class 0 OID 16457)
-- Dependencies: 230
-- Data for Name: pga_schedule; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_schedule (jscid, jscjobid, jscname, jscdesc, jscenabled, jscstart, jscend, jscminutes, jschours, jscweekdays, jscmonthdays, jscmonths) FROM stdin;
\.


--
-- TOC entry 4784 (class 0 OID 16485)
-- Dependencies: 232
-- Data for Name: pga_exception; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_exception (jexid, jexscid, jexdate, jextime) FROM stdin;
\.


--
-- TOC entry 4785 (class 0 OID 16499)
-- Dependencies: 234
-- Data for Name: pga_joblog; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_joblog (jlgid, jlgjobid, jlgstatus, jlgstart, jlgduration) FROM stdin;
\.


--
-- TOC entry 4782 (class 0 OID 16433)
-- Dependencies: 228
-- Data for Name: pga_jobstep; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobstep (jstid, jstjobid, jstname, jstdesc, jstenabled, jstkind, jstcode, jstconnstr, jstdbname, jstonerror, jscnextrun) FROM stdin;
\.


--
-- TOC entry 4786 (class 0 OID 16515)
-- Dependencies: 236
-- Data for Name: pga_jobsteplog; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobsteplog (jslid, jsljlgid, jsljstid, jslstatus, jslresult, jslstart, jslduration, jsloutput) FROM stdin;
\.


-- Completed on 2025-07-22 15:50:29

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-07-22 15:50:29

--
-- PostgreSQL database cluster dump complete
--

