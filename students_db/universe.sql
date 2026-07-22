--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    type character varying(30),
    radial_velocity_kms numeric(5,1),
    icrs_coordinates text
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
    name character varying(30) NOT NULL,
    radius_km numeric(10,2),
    orbital_period_d numeric(10,2),
    planet_id integer
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
    name character varying(30) NOT NULL,
    distance_from_earth_ly numeric(12,2) NOT NULL,
    is_rocky boolean,
    number_of_moons integer,
    star_id integer
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(30) NOT NULL,
    country character varying(30),
    launch_year character varying(4),
    deorbit_year character varying(4),
    operational_years integer
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_heavier_than_sun boolean,
    spectral_type text,
    radial_velocity_kms numeric(5,1),
    galaxy_id integer
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
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', -301.0, '00 42 44.3 +41 16 09');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', -179.0, '01 33 50.9 +30 39 37');
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Spiral', -34.0, '09 55 33.2 +69 03 55');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', 1284.0, '12 30 49.4 +12 23 28');
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 'Barred Spiral', 1577.0, '03 19 41.1 -19 24 41');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.40, 27.32, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.27, 0.32, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.20, 1.26, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821.60, 1.77, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.80, 3.55, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.10, 7.15, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.30, 16.69, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 83.45, 0.50, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 2574.70, 15.95, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 252.10, 1.37, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 198.20, 0.94, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 763.80, 4.52, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 734.50, 79.32, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 561.40, 2.74, 6);
INSERT INTO public.moon VALUES (15, 'Titania', 788.90, 8.71, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 761.40, 13.46, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 584.70, 4.14, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 578.90, 2.52, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 1353.40, -5.88, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 210.00, 1.12, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.00, true, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.00, true, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 0.00, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.00, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 0.00, false, 95, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 0.00, false, 274, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 0.00, false, 28, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 0.00, false, 16, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4.24, true, 0, 4);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 4.24, false, 0, 4);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 4.24, true, 0, 4);
INSERT INTO public.planet VALUES (12, 'Sirius b1', 8.61, false, 0, 2);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'Salyut 1', 'USSR', '1971', '1971', NULL);
INSERT INTO public.space_station VALUES (2, 'Salyut 2', 'USSR', '1973', '1973', NULL);
INSERT INTO public.space_station VALUES (3, 'Salyut 3', 'USSR', '1974', '1975', NULL);
INSERT INTO public.space_station VALUES (4, 'Salyut 4', 'USSR', '1974', '1977', NULL);
INSERT INTO public.space_station VALUES (5, 'Salyut 5', 'USSR', '1976', '1977', NULL);
INSERT INTO public.space_station VALUES (6, 'Salyut 6', 'USSR', '1977', '1982', NULL);
INSERT INTO public.space_station VALUES (7, 'Salyut 7', 'USSR', '1982', '1991', NULL);
INSERT INTO public.space_station VALUES (8, 'Skylab', 'United States', '1973', '1979', NULL);
INSERT INTO public.space_station VALUES (9, 'Mir', 'USSR/Russia', '1986', '2001', NULL);
INSERT INTO public.space_station VALUES (10, 'ISS', 'International', '1998', '2031', NULL);
INSERT INTO public.space_station VALUES (11, 'Tiangong', 'China', '2021', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 'G2V', 0.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', true, 'A1V', -5.5, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', true, 'M1-2Ia-Iab', 21.9, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', false, 'M5.5Ve', -22.2, 1);
INSERT INTO public.star VALUES (5, 'Vega', true, 'A0V', -13.9, 1);
INSERT INTO public.star VALUES (6, 'Rigel', true, 'B8Ia', 18.0, 1);
INSERT INTO public.star VALUES (7, 'Polaris', true, 'F7Ib', -16.0, 1);
INSERT INTO public.star VALUES (8, 'Altair', true, 'A7V', -26.1, 1);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 11, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_unique UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

