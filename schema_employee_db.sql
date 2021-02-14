--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: department_managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_managers (
    dept_no character varying NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.department_managers OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying NOT NULL,
    dept_name character varying NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_no integer NOT NULL,
    emp_title character varying(30) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(40) NOT NULL,
    sex character varying(1) NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary double precision NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id character varying(30) NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- Name: departments pk_departments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT pk_departments PRIMARY KEY (dept_no);


--
-- Name: employee pk_employee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (emp_no);


--
-- Name: titles pk_titles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT pk_titles PRIMARY KEY (title_id);


--
-- Name: department_managers fk_department_managers_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_managers
    ADD CONSTRAINT fk_department_managers_dept_no FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- Name: department_managers fk_department_managers_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_managers
    ADD CONSTRAINT fk_department_managers_emp_no FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);


--
-- Name: dept_emp fk_dept_emp_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- Name: dept_emp fk_dept_emp_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);


--
-- Name: employee fk_employee_emp_title; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_emp_title FOREIGN KEY (emp_title) REFERENCES public.titles(title_id);


--
-- Name: salaries fk_salaries_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);


--
-- PostgreSQL database dump complete
--

