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
    name character varying(50) NOT NULL,
    type character varying(30) NOT NULL,
    age_in_billions_of_years integer NOT NULL,
    size_in_thousands_of_light_years integer NOT NULL,
    number_of_billions_of_stars integer NOT NULL
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_natural boolean NOT NULL,
    radius_in_thousands_of_km integer NOT NULL,
    orbital_period numeric(3,1) NOT NULL
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    type character varying(30) NOT NULL,
    atmosphere text,
    surface_temp_in_celsius integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50) NOT NULL,
    orbit_type character varying(100),
    launch_date date,
    operational_status character varying(20)
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30),
    radius_in_thousands_of_km integer NOT NULL,
    age_in_billions_of_years integer NOT NULL
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13, 100, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10, 220, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 5, 50, 40);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 10, 120, 2000);
INSERT INTO public.galaxy VALUES (5, 'Sculptor Dwarf', 'Dwarf Irregular', 13, 6, 0);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 1, 14, 30);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 'Spiral', 1, 60, 300);
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy', 'Spiral', 9, 50, 800);
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 'Elliptical', 10, 10, 200);
INSERT INTO public.galaxy VALUES (10, 'Black Eye Galaxy', 'Spiral', 1, 40, 600);
INSERT INTO public.galaxy VALUES (11, 'Bode''s Galaxy', 'Spiral', 1, 30, 300);
INSERT INTO public.galaxy VALUES (12, 'Pinwheel Galaxy', 'Spiral', 1, 45, 400);
INSERT INTO public.galaxy VALUES (13, 'Cartwheel Galaxy', 'Ring', 1, 150, 50);
INSERT INTO public.galaxy VALUES (14, 'Cigar Galaxy', 'Barred Spiral', 1, 40, 200);
INSERT INTO public.galaxy VALUES (15, 'Sunflower Galaxy', 'Spiral', 1, 35, 150);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, true, 2, 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 11, 0.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 6, 1.3);
INSERT INTO public.moon VALUES (4, 'Io', 4, true, 18, 1.8);
INSERT INTO public.moon VALUES (5, 'Europa', 4, true, 15, 3.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, true, 26, 7.2);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, true, 24, 16.7);
INSERT INTO public.moon VALUES (8, 'Enceladus', 5, true, 252, 1.4);
INSERT INTO public.moon VALUES (9, 'Titan', 5, true, 25, 16.0);
INSERT INTO public.moon VALUES (10, 'Triton', 3, true, 13, 5.9);
INSERT INTO public.moon VALUES (11, 'Charon', 9, true, 606, 6.4);
INSERT INTO public.moon VALUES (12, 'Dione', 5, true, 562, 2.7);
INSERT INTO public.moon VALUES (13, 'Miranda', 6, true, 235, 1.4);
INSERT INTO public.moon VALUES (14, 'Rhea', 5, true, 764, 4.5);
INSERT INTO public.moon VALUES (15, 'Tethys', 5, true, 533, 1.9);
INSERT INTO public.moon VALUES (16, 'Iapetus', 5, true, 734, 79.3);
INSERT INTO public.moon VALUES (17, 'Hyperion', 5, true, 138, 21.3);
INSERT INTO public.moon VALUES (18, 'Mimas', 5, true, 198, 0.9);
INSERT INTO public.moon VALUES (19, 'Janus', 5, true, 90, 0.7);
INSERT INTO public.moon VALUES (20, 'Epimetheus', 5, true, 58, 0.7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Terrestrial', 'Nitrogen, Oxygen', 15);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 'Terrestrial', 'Carbon Dioxide, Nitrogen', -80);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 'Terrestrial', 'Carbon Dioxide', 467);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, false, 'Gas Giant', 'Hydrogen, Helium', -145);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, false, 'Gas Giant', 'Hydrogen, Helium', -178);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, false, 'Ice Giant', 'Hydrogen. Helium', -214);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 'Ice Giant', 'Hydrogen, Helium', -224);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, false, 'Terrestrial', 'None', 430);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, 'Dwarf', 'Thin Nitrogen', -375);
INSERT INTO public.planet VALUES (10, 'Europa', 4, false, 'Moon', 'Thin Oxygen', -160);
INSERT INTO public.planet VALUES (11, 'Titan', 5, false, 'Moon', 'Thick Nitrogen', -179);
INSERT INTO public.planet VALUES (12, 'Ganymede', 4, false, 'Moon', 'Thin Oxygen', -160);
INSERT INTO public.planet VALUES (13, 'Enceladus', 5, false, 'Moon', 'Water Vapor', -198);
INSERT INTO public.planet VALUES (14, 'Triton', 3, false, 'Moon', 'Thin Nitrogen', -235);
INSERT INTO public.planet VALUES (15, 'Io', 4, false, 'Moon', 'Thin Sulfur Dioxide', 200);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 'Low Earth Orbit', '1990-04-24', 'Active');
INSERT INTO public.satellite VALUES (2, 'International Space Station', 'Low Earth Orbit', '1990-11-20', 'Active');
INSERT INTO public.satellite VALUES (3, 'Voyager 1', 'Interstellar Space', '1977-09-05', 'Active');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 696, 5);
INSERT INTO public.star VALUES (2, 'Andromeda Star 1', 2, 'A0V', 2, 2);
INSERT INTO public.star VALUES (3, 'Triangulum Star 1', 3, 'F5V', 800, 2);
INSERT INTO public.star VALUES (4, 'M87 Star 1', 4, 'B0V', 2, 3);
INSERT INTO public.star VALUES (5, 'Sculptor Star 1', 5, 'G5V', 3, 7);
INSERT INTO public.star VALUES (6, 'LMC Star 1', 6, 'F8V', 400, 1);
INSERT INTO public.star VALUES (7, 'Whirlpool Star 1', 7, 'K0V', 7, 1);
INSERT INTO public.star VALUES (8, 'Sombrero Star 1', 8, 'M1V', 800, 1);
INSERT INTO public.star VALUES (9, 'Centaurus Star 1', 9, 'B1V', 1, 4);
INSERT INTO public.star VALUES (10, 'Black Eye Star 1', 10, 'A5V', 9, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

