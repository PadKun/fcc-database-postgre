--
-- PostgreSQL database dump
--

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
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

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

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text,
    count_of_stars_in_million integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    dist_from_planet_in_kms numeric(10,1),
    has_sister_moons boolean,
    diameter_in_kms integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_types character varying(30),
    has_moons boolean,
    dist_from_sun_in_kms numeric(12,1),
    star_id integer NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: sat_launch; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sat_launch (
    sat_launch_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    moon_id integer,
    launch_date date NOT NULL,
    is_success boolean NOT NULL,
    count_of_astronauts integer
);


ALTER TABLE public.sat_launch OWNER TO freecodecamp;

--
-- Name: sat_launch_sat_launch_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sat_launch_sat_launch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sat_launch_sat_launch_id_seq OWNER TO freecodecamp;

--
-- Name: sat_launch_sat_launch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sat_launch_sat_launch_id_seq OWNED BY public.sat_launch.sat_launch_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_life boolean NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_million_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: sat_launch sat_launch_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sat_launch ALTER COLUMN sat_launch_id SET DEFAULT nextval('public.sat_launch_sat_launch_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 'hazy milky white in color', 1000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spherical', '3.4 times bigger than milky way', 4000000);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 'irregular', 'Dwarf galaxy', 500000);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 'elliptical', NULL, 567000);
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 'elliptical', 'Galaxy close to Milkyway', 9000);
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 'spherical', 'Cluster of galaxies', 942780);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 385.0, false, 1738, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 456.0, true, 12, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 500.0, true, 17, 4);
INSERT INTO public.moon VALUES (4, 'Io', 356.0, true, 1000, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 454.0, true, 35, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 654.0, true, 2003, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 634.3, true, 789, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 264.0, true, 3860, 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 124.0, true, 261, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 351.1, true, 534, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 345.0, true, 473, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 112.8, true, 276, 6);
INSERT INTO public.moon VALUES (13, 'Rheas', 822.3, true, 561, 6);
INSERT INTO public.moon VALUES (14, 'Titan', 641.8, true, 757, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 312.8, true, 55, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 590.1, true, 346, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 749.9, true, 854, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 275.3, true, 834, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 21.1, true, 84, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 274.0, true, 349, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Rocky', false, 54.7, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 'Rocky', false, 66.7, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 'Rocky', true, 94.5, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Rocky', true, 154.5, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giants', true, 507.3, 1, 57);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giants', true, 1000.0, 1, 63);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giants', true, 1200.0, 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giants', true, 1300.0, 1, 14);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Rocky', true, 1500.0, 1, 5);
INSERT INTO public.planet VALUES (10, 'Eris', 'Rocky', true, 1600.0, 1, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Rocky', true, 1800.0, 1, 2);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Rocky', false, 1900.0, 1, 0);
INSERT INTO public.planet VALUES (13, 'Ceres', 'Rocky', false, 1995.0, 1, 0);


--
-- Data for Name: sat_launch; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sat_launch VALUES (1, 'Sputnik', 'first satellite ever launched by humans', 1, '1954-10-04', true, 3);
INSERT INTO public.sat_launch VALUES (2, 'Ranger 1', 'first satellite by USA', 1, '1961-08-23', false, 0);
INSERT INTO public.sat_launch VALUES (3, 'Luna 9', 'first soft landing on moon', 1, '1966-01-31', true, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 1, 461);
INSERT INTO public.star VALUES (2, 'Arcturus Star', true, 1, 711);
INSERT INTO public.star VALUES (3, 'Sirius B', false, 1, 10000);
INSERT INTO public.star VALUES (4, 'Proxima Centuri', true, 1, 3000);
INSERT INTO public.star VALUES (5, 'Aplha Andromedea', true, 2, 55678);
INSERT INTO public.star VALUES (6, 'VY Canis Majoris', true, 3, 5689343);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: sat_launch_sat_launch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sat_launch_sat_launch_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: sat_launch sat_launch_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sat_launch
    ADD CONSTRAINT sat_launch_name_key UNIQUE (name);


--
-- Name: sat_launch sat_launch_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sat_launch
    ADD CONSTRAINT sat_launch_pkey PRIMARY KEY (sat_launch_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: sat_launch sat_launch_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sat_launch
    ADD CONSTRAINT sat_launch_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

