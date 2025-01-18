--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(100) NOT NULL,
    age integer,
    distance_from_earth integer,
    mass numeric(5,1),
    description text,
    is_active boolean
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
    name character varying(100) NOT NULL,
    age integer,
    distance_from_earth integer,
    mass numeric(5,1),
    planet_name character varying(20),
    description text,
    is_active boolean,
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
    name character varying(100) NOT NULL,
    age integer,
    distance_from_earth integer,
    mass numeric(5,1),
    star_name character varying(20),
    description text,
    is_active boolean,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer,
    distance_from_earth integer,
    mass numeric(5,1),
    galaxy_name character varying(20),
    description text,
    is_active boolean,
    galaxy_id integer NOT NULL
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer,
    distance_from_earth integer
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, 2, 100.0, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 250, 200.0, 'Closest major galaxy to Milky Way', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 9, 300, 150.0, 'Smaller spiral galaxy near Andromeda', true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 2, 160, 500.0, 'Satellite galaxy of Milky Way', true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 2, 190, 300.0, 'Another satellite of Milky Way', true);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Spheroidal Galaxy', 14, 80, 700.0, 'Smallest major galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4, 3844, 7.2, NULL, 'Only natural satellite of Earth', true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 6, 600, 1.1, NULL, 'Inner moon of Mars', true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 7, 220, 1.4, NULL, 'Outer moon of Mars', true, 3);
INSERT INTO public.moon VALUES (4, 'Io', 4, 4220, 8.9, NULL, 'Volcanic inner moon of Jupiter', true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 670400, 8.3, NULL, 'Icy moon with liquid water', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 1070, 1.5, NULL, 'Largest moon in solar system', true, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 1882, 1.1, NULL, 'Outermost large Jupiter moon', true, 7);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 122, 1.9, NULL, 'Second largest moon in solar system', true, 8);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 23, 1.1, NULL, 'Icy moon with geysers', true, 9);
INSERT INTO public.moon VALUES (10, 'Triton', 4, 354, 2.1, NULL, 'Retreating moon with geysers', true, 10);
INSERT INTO public.moon VALUES (11, 'Miranda', 4, 1290, 6.6, NULL, 'Unique moon with cliffs', true, 2);
INSERT INTO public.moon VALUES (12, 'Titania', 4, 435, 3.5, NULL, 'Largest moon of Uranus', true, 3);
INSERT INTO public.moon VALUES (13, 'Oberon', 4, 583, 3.0, NULL, 'Second largest moon of Uranus', true, 4);
INSERT INTO public.moon VALUES (14, 'M Moon', 4, 3844, 7.2, NULL, 'Only natural satellite of Earth', true, 1);
INSERT INTO public.moon VALUES (15, 'P Phobos', 6, 600, 1.1, NULL, 'Inner moon of Mars', true, 2);
INSERT INTO public.moon VALUES (16, 'D Deimos', 7, 220, 1.4, NULL, 'Outer moon of Mars', true, 3);
INSERT INTO public.moon VALUES (17, 'I Io', 4, 4220, 8.9, NULL, 'Volcanic inner moon of Jupiter', true, 4);
INSERT INTO public.moon VALUES (18, 'E Europa', 4, 670400, 8.3, NULL, 'Icy moon with liquid water', true, 5);
INSERT INTO public.moon VALUES (19, 'G Ganymede', 4, 1070, 1.5, NULL, 'Largest moon in solar system', true, 6);
INSERT INTO public.moon VALUES (20, 'C Callisto', 4, 1882, 1.1, NULL, 'Outermost large Jupiter moon', true, 7);
INSERT INTO public.moon VALUES (21, 'T Titan', 5, 122, 1.9, NULL, 'Second largest moon in solar system', true, 8);
INSERT INTO public.moon VALUES (22, 'E Enceladus', 4, 23, 1.1, NULL, 'Icy moon with geysers', true, 9);
INSERT INTO public.moon VALUES (23, 'T Triton', 4, 354, 2.1, NULL, 'Retreating moon with geysers', true, 10);
INSERT INTO public.moon VALUES (24, 'M Miranda', 4, 1290, 6.6, NULL, 'Unique moon with cliffs', true, 2);
INSERT INTO public.moon VALUES (25, 'T Titania', 4, 435, 3.5, NULL, 'Largest moon of Uranus', true, 3);
INSERT INTO public.moon VALUES (26, 'O Oberon', 4, 583, 3.0, NULL, 'Second largest moon of Uranus', true, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4, 230, 89.5, NULL, 'The planet of humans', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4, 225, 6.5, NULL, 'Red rocky planet', true, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4, 778, 1.9, NULL, 'Gas giant', true, 3);
INSERT INTO public.planet VALUES (4, 'Saturn', 4, 1427, 5.7, NULL, 'Ringed gas giant', true, 4);
INSERT INTO public.planet VALUES (5, 'Uranus', 4, 2871, 8.7, NULL, 'Ice giant', true, 5);
INSERT INTO public.planet VALUES (6, 'Neptune', 4, 4498, 1.0, NULL, 'Blue ice giant', true, 6);
INSERT INTO public.planet VALUES (7, 'Mercury', 4, 57, 3.3, NULL, 'Closest planet to Sun', true, 7);
INSERT INTO public.planet VALUES (8, 'Venus', 4, 108, 4.9, NULL, 'Hottest planet', true, 8);
INSERT INTO public.planet VALUES (9, 'Europa', 4, 670, 8.3, NULL, 'Icy moon with liquid water', true, 9);
INSERT INTO public.planet VALUES (10, 'Ganymede', 4, 1070, 1.5, NULL, 'Largest moon in solar system', true, 10);
INSERT INTO public.planet VALUES (11, 'Callisto', 4, 1882, 1.1, NULL, 'Outermost large Jupiter moon', true, 11);
INSERT INTO public.planet VALUES (14, 'N Neptune', 4, 449800, 1.0, NULL, 'Coldest planet in solar system', true, 1);
INSERT INTO public.planet VALUES (15, 'N Uranus', 4, 28710, 8.7, NULL, 'Tilted planet with extreme seasons', true, 2);
INSERT INTO public.planet VALUES (16, 'S Saturn', 4, 14270, 5.7, NULL, 'Ringed gas giant', true, 3);
INSERT INTO public.planet VALUES (17, 'J Jupiter', 4, 7783, 1.9, NULL, 'Largest planet in solar system', true, 4);
INSERT INTO public.planet VALUES (18, 'M Mars', 4, 57920, 6.4, NULL, 'Red rocky planet', true, 5);
INSERT INTO public.planet VALUES (19, 'M Mercury', 4, 579200, 3.3, NULL, 'Closest planet to Sun', true, 6);
INSERT INTO public.planet VALUES (20, 'M Venus', 4, 1082, 4.9, NULL, 'Hottest planet', true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 4, 0, 2.0, 'Milky Way', 'Home star of Earth', true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 840, 2.6, 'Milky Way', 'Brightest star in night sky', true, 2);
INSERT INTO public.star VALUES (3, 'Canopus', 6, 310, 13.0, 'Milky Way', 'Shining star in southern hemisphere', true, 3);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 6, 410, 1.1, 'Milky Way', 'Closest star to Sun', true, 4);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 5, 640, 22.0, 'Orion Nebula', 'Variable red supergiant', true, 5);
INSERT INTO public.star VALUES (6, 'Rigel', 8, 860, 20.0, 'Orion Nebula', 'Bright blue supergiant', true, 6);
INSERT INTO public.star VALUES (7, 'Procyon', 7, 110, 1.7, 'Milky Way', 'Yellow-white subgiant', true, 1);
INSERT INTO public.star VALUES (8, 'Altair', 5, 170, 1.8, 'Milky Way', 'Fastest spinning star', true, 2);
INSERT INTO public.star VALUES (9, 'Deneb', 8, 260, 20.0, 'Cygnus X-1', 'Bright blue supergiant', true, 3);
INSERT INTO public.star VALUES (10, 'Antares', 5, 610, 16.7, 'Scorpius Cluster', 'Red supergiant', true, 4);
INSERT INTO public.star VALUES (11, 'Arcturus', 7, 370, 1.1, 'Boötes Constellation', 'Bright orange giant', true, 5);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'Milky Way', 14, 0);
INSERT INTO public.universe VALUES (2, 'Andromeda Galaxy', 10, 25000000);
INSERT INTO public.universe VALUES (3, 'Triangulum Galaxy', 10, 30000000);
INSERT INTO public.universe VALUES (4, 'Large Magellanic Cloud', 2, 160000);
INSERT INTO public.universe VALUES (5, 'Small Magellanic Cloud', 2, 190000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 5, true);


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
-- Name: universe universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_name_key UNIQUE (name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

