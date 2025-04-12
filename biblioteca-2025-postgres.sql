--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-12 13:41:54

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
-- TOC entry 224 (class 1259 OID 16490)
-- Name: autor_editorial_libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor_editorial_libro (
    id integer NOT NULL,
    autor_id integer,
    editorial_id integer,
    libro_id integer,
    fecha date
);


ALTER TABLE public.autor_editorial_libro OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16489)
-- Name: autor_editorial_libro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autor_editorial_libro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autor_editorial_libro_id_seq OWNER TO postgres;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 223
-- Name: autor_editorial_libro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autor_editorial_libro_id_seq OWNED BY public.autor_editorial_libro.id;


--
-- TOC entry 218 (class 1259 OID 16467)
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    id integer NOT NULL,
    nombres character varying(255) NOT NULL
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16466)
-- Name: autores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autores_id_seq OWNER TO postgres;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 217
-- Name: autores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autores_id_seq OWNED BY public.autores.id;


--
-- TOC entry 220 (class 1259 OID 16474)
-- Name: editorial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editorial (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.editorial OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16473)
-- Name: editorial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editorial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.editorial_id_seq OWNER TO postgres;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 219
-- Name: editorial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editorial_id_seq OWNED BY public.editorial.id;


--
-- TOC entry 222 (class 1259 OID 16481)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    copias integer DEFAULT 1 NOT NULL,
    estante integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16480)
-- Name: libros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libros_id_seq OWNER TO postgres;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 221
-- Name: libros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_id_seq OWNED BY public.libros.id;


--
-- TOC entry 228 (class 1259 OID 16523)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    libro_id integer NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date,
    estado character varying(50) NOT NULL,
    multa numeric(10,2),
    notas text,
    CONSTRAINT estado_valido CHECK (((estado)::text = ANY ((ARRAY['Prestado'::character varying, 'Devuelto'::character varying, 'Atrasado'::character varying])::text[])))
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16522)
-- Name: prestamos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prestamos_id_seq OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_id_seq OWNED BY public.prestamos.id;


--
-- TOC entry 226 (class 1259 OID 16512)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255),
    numero character varying(12)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16511)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 225
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4671 (class 2604 OID 16493)
-- Name: autor_editorial_libro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro ALTER COLUMN id SET DEFAULT nextval('public.autor_editorial_libro_id_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 16470)
-- Name: autores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores ALTER COLUMN id SET DEFAULT nextval('public.autores_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 16477)
-- Name: editorial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorial ALTER COLUMN id SET DEFAULT nextval('public.editorial_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 16484)
-- Name: libros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN id SET DEFAULT nextval('public.libros_id_seq'::regclass);


--
-- TOC entry 4673 (class 2604 OID 16526)
-- Name: prestamos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN id SET DEFAULT nextval('public.prestamos_id_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 16515)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4846 (class 0 OID 16490)
-- Dependencies: 224
-- Data for Name: autor_editorial_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor_editorial_libro (id, autor_id, editorial_id, libro_id, fecha) FROM stdin;
1	2	1	2	\N
2	2	1	3	\N
3	2	2	1	\N
\.


--
-- TOC entry 4840 (class 0 OID 16467)
-- Dependencies: 218
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores (id, nombres) FROM stdin;
1	William Shakespeare
2	Ruben Dario
\.


--
-- TOC entry 4842 (class 0 OID 16474)
-- Dependencies: 220
-- Data for Name: editorial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editorial (id, nombre) FROM stdin;
1	Pearson
2	Panini
\.


--
-- TOC entry 4844 (class 0 OID 16481)
-- Dependencies: 222
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (id, nombre, copias, estante) FROM stdin;
1	Romeo y Julieta	1	1
2	Dragonball	1	1
3	Azul...	1	1
\.


--
-- TOC entry 4850 (class 0 OID 16523)
-- Dependencies: 228
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos (id, usuario_id, libro_id, fecha_prestamo, fecha_devolucion, estado, multa, notas) FROM stdin;
\.


--
-- TOC entry 4848 (class 0 OID 16512)
-- Dependencies: 226
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, email, numero) FROM stdin;
\.


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 223
-- Name: autor_editorial_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_editorial_libro_id_seq', 3, true);


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 217
-- Name: autores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autores_id_seq', 2, true);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 219
-- Name: editorial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editorial_id_seq', 2, true);


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 221
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_id_seq', 3, true);


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_id_seq', 1, false);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 225
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);


--
-- TOC entry 4682 (class 2606 OID 16495)
-- Name: autor_editorial_libro autor_editorial_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro
    ADD CONSTRAINT autor_editorial_libro_pkey PRIMARY KEY (id);


--
-- TOC entry 4676 (class 2606 OID 16472)
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 16479)
-- Name: editorial editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorial
    ADD CONSTRAINT editorial_pkey PRIMARY KEY (id);


--
-- TOC entry 4680 (class 2606 OID 16488)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- TOC entry 4688 (class 2606 OID 16531)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id);


--
-- TOC entry 4684 (class 2606 OID 16521)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 4686 (class 2606 OID 16519)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 16496)
-- Name: autor_editorial_libro autor_editorial_libro_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro
    ADD CONSTRAINT autor_editorial_libro_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.autores(id);


--
-- TOC entry 4690 (class 2606 OID 16501)
-- Name: autor_editorial_libro autor_editorial_libro_editorial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro
    ADD CONSTRAINT autor_editorial_libro_editorial_id_fkey FOREIGN KEY (editorial_id) REFERENCES public.editorial(id);


--
-- TOC entry 4691 (class 2606 OID 16506)
-- Name: autor_editorial_libro autor_editorial_libro_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro
    ADD CONSTRAINT autor_editorial_libro_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(id);


--
-- TOC entry 4692 (class 2606 OID 16537)
-- Name: prestamos fk_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_libro FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 4693 (class 2606 OID 16532)
-- Name: prestamos fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


-- Completed on 2025-04-12 13:41:55

--
-- PostgreSQL database dump complete
--

