\--

-- PostgreSQL database dump

\--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;

\--

-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp

\--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

\--

-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp

\--

CREATE TABLE public.constellation (

  constellation_id integer NOT NULL,

  name character varying(20) NOT NULL,

  amounts_of_stars integer

);

ALTER TABLE public.constellation OWNER TO freecodecamp;

\--

-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

\--

CREATE SEQUENCE public.constellation_constellation_id_seq

  AS integer

  START WITH 1

  INCREMENT BY 1

  NO MINVALUE

  NO MAXVALUE

  CACHE 1;

ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

\--

-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

\--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;

\--

-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp

\--

CREATE TABLE public.galaxy (

  galaxy_id integer NOT NULL,

  name character varying(20) NOT NULL,

  age_in_millions_of_years numeric(6,1),

  distance_from_earth integer,

  description text,

  galaxy_types character varying(20) NOT NULL,

  has_life boolean NOT NULL

);

ALTER TABLE public.galaxy OWNER TO freecodecamp;

\--

-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

\--

CREATE SEQUENCE public.galaxy_galaxy_id_seq

  AS integer

  START WITH 1

  INCREMENT BY 1

  NO MINVALUE

  NO MAXVALUE

  CACHE 1;

ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

\--

-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

\--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

\--

-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp

\--

CREATE TABLE public.moon (

  moon_id integer NOT NULL,

  planet_id integer NOT NULL,

  is_spherical boolean DEFAULT true,

  name character varying(20) NOT NULL,

  description text DEFAULT 'This is a moon.'::text

);

ALTER TABLE public.moon OWNER TO freecodecamp;

\--

-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

\--

CREATE SEQUENCE public.moon_moon_id_seq

  AS integer

  START WITH 1

  INCREMENT BY 1

  NO MINVALUE

  NO MAXVALUE

  CACHE 1;

ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

\--

-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

\--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

\--

-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp

\--

CREATE TABLE public.planet (

  planet_id integer NOT NULL,

  name character varying(20) NOT NULL,

  is_spherical boolean DEFAULT true,

  star_id integer NOT NULL,

  description text DEFAULT 'This is a planet.'::text

);

ALTER TABLE public.planet OWNER TO freecodecamp;

\--

-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

\--

CREATE SEQUENCE public.planet_planet_id_seq

  AS integer

  START WITH 1

  INCREMENT BY 1

  NO MINVALUE

  NO MAXVALUE

  CACHE 1;

ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

\--

-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

\--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

\--

-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp

\--

CREATE TABLE public.star (

  star_id integer NOT NULL,

  name character varying(20) NOT NULL,

  galaxy_id integer NOT NULL,

  star_type character varying(20) NOT NULL,

  age_in_millions_of_years numeric(6,1),

  distance_from_earth integer,

  description text,

  has_life boolean DEFAULT false

);

ALTER TABLE public.star OWNER TO freecodecamp;

\--

-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

\--

CREATE SEQUENCE public.star_star_id_seq

  AS integer

  START WITH 1

  INCREMENT BY 1

  NO MINVALUE

  NO MAXVALUE

  CACHE 1;

ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

\--

-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp

\--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

\--

-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);

\--

-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);

\--

-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

\--

-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);

\--

-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);

\--

-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp

\--

INSERT INTO public.constellation VALUES (1, 'Sun', 8);

INSERT INTO public.constellation VALUES (2, 'Orion', 10);

INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 14);

\--

-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp

\--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 13510.0, 100000, 'Description for Milky Way Galaxy.', 'Barred Spiral Galaxy', true);

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 11000.0, 2537000, 'Description for Andromeda Galaxy.', 'Spiral Galaxy', false);

INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 8000.0, 2723000, 'Description for Triangulum Galaxy.', 'Spiral Galaxy', false);

INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 400.0, 23000000, 'Description for Whirlpool Galaxy.', 'Spiral Galaxy', false);

INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 14000.0, 16, 'Description for Centaurus A.', 'Elliptical', false);

INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 9000.0, 28000000, 'Description for Sombrero Galaxy.', 'Spiral Galaxy', false);

\--

-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp

\--

INSERT INTO public.moon VALUES (1, 1, true, 'Moon1', 'This is a moon.');

INSERT INTO public.moon VALUES (2, 1, true, 'Moon2', 'This is a moon.');

INSERT INTO public.moon VALUES (3, 2, true, 'Moon3', 'This is a moon.');

INSERT INTO public.moon VALUES (4, 2, true, 'Moon4', 'This is a moon.');

INSERT INTO public.moon VALUES (5, 3, true, 'Moon5', 'This is a moon.');

INSERT INTO public.moon VALUES (6, 3, true, 'Moon6', 'This is a moon.');

INSERT INTO public.moon VALUES (7, 4, true, 'Moon7', 'This is a moon.');

INSERT INTO public.moon VALUES (8, 4, true, 'Moon8', 'This is a moon.');

INSERT INTO public.moon VALUES (9, 5, true, 'Moon9', 'This is a moon.');

INSERT INTO public.moon VALUES (10, 5, true, 'Moon10', 'This is a moon.');

INSERT INTO public.moon VALUES (11, 6, true, 'Moon11', 'This is a moon.');

INSERT INTO public.moon VALUES (12, 6, true, 'Moon12', 'This is a moon.');

INSERT INTO public.moon VALUES (13, 7, true, 'Moon13', 'This is a moon.');

INSERT INTO public.moon VALUES (14, 7, true, 'Moon14', 'This is a moon.');

INSERT INTO public.moon VALUES (15, 8, true, 'Moon15', 'This is a moon.');

INSERT INTO public.moon VALUES (16, 8, true, 'Moon16', 'This is a moon.');

INSERT INTO public.moon VALUES (17, 9, true, 'Moon17', 'This is a moon.');

INSERT INTO public.moon VALUES (18, 9, true, 'Moon18', 'This is a moon.');

INSERT INTO public.moon VALUES (19, 10, true, 'Moon19', 'This is a moon.');

INSERT INTO public.moon VALUES (20, 10, true, 'Moon20', 'This is a moon.');

INSERT INTO public.moon VALUES (21, 11, true, 'Moon21', 'This is a moon.');

INSERT INTO public.moon VALUES (22, 11, true, 'Moon22', 'This is a moon.');

INSERT INTO public.moon VALUES (23, 12, true, 'Moon23', 'This is a moon.');

INSERT INTO public.moon VALUES (24, 12, true, 'Moon24', 'This is a moon.');

\--

-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp

\--

INSERT INTO public.planet VALUES (1, 'Planet1', true, 1, 'This is a planet.');

INSERT INTO public.planet VALUES (2, 'Planet2', true, 1, 'This is a planet.');

INSERT INTO public.planet VALUES (3, 'Planet3', true, 2, 'This is a planet.');

INSERT INTO public.planet VALUES (4, 'Planet4', true, 2, 'This is a planet.');

INSERT INTO public.planet VALUES (5, 'Planet5', true, 3, 'This is a planet.');

INSERT INTO public.planet VALUES (6, 'Planet6', true, 3, 'This is a planet.');

INSERT INTO public.planet VALUES (7, 'Planet7', true, 4, 'This is a planet.');

INSERT INTO public.planet VALUES (8, 'Planet8', true, 4, 'This is a planet.');

INSERT INTO public.planet VALUES (9, 'Planet9', true, 5, 'This is a planet.');

INSERT INTO public.planet VALUES (10, 'Planet10', true, 5, 'This is a planet.');

INSERT INTO public.planet VALUES (11, 'Planet11', true, 6, 'This is a planet.');

INSERT INTO public.planet VALUES (12, 'Planet12', true, 6, 'This is a planet.');

\--

-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp

\--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 1, 'Main Sequence', 6500.0, 4, 'Description for Alpha Centauri A.', false);

INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Main Sequence', 300.0, 8, 'Description for Sirius.', false);

INSERT INTO public.star VALUES (3, 'Alpheratz', 2, 'B type', 60.0, 96, 'Description for Alpheratz.', false);

INSERT INTO public.star VALUES (4, 'Mirach', 2, 'Red Giant', 0.0, 199, 'Age remains unknown.', false);

INSERT INTO public.star VALUES (5, 'Beta Trianguli', 3, 'White Giant', 0.0, 127, 'Age remains unknown.', false);

INSERT INTO public.star VALUES (6, 'Mothallah', 3, 'Sub Giant', 1600.0, 63, 'The second brightest star in Triangulum.', false);

\--

-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

\--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);

\--

-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

\--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);

\--

-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

\--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);

\--

-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

\--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);

\--

-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp

\--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);

\--

-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.constellation

  ADD CONSTRAINT constellation_name_key UNIQUE (name);

\--

-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.constellation

  ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);

\--

-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.galaxy

  ADD CONSTRAINT galaxy_name_key UNIQUE (name);

\--

-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.galaxy

  ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

\--

-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.moon

  ADD CONSTRAINT moon_name_key UNIQUE (name);

\--

-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.moon

  ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

\--

-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.planet

  ADD CONSTRAINT planet_name_key UNIQUE (name);

\--

-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.planet

  ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

\--

-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.star

  ADD CONSTRAINT star_name_key UNIQUE (name);

\--

-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.star

  ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

\--

-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.moon

  ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

\--

-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.planet

  ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

\--

-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp

\--

ALTER TABLE ONLY public.star

  ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

\--

-- PostgreSQL database dump complete

\--