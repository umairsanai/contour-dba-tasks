--
-- PostgreSQL database dump
--

\restrict uacarEPIsDjVqdPAWNeGU8GqtGCKzP348x35yaEJdBkFWlXGa2eMsmu3RwyxnNA

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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
-- Name: courses; Type: TABLE; Schema: public; Owner: umairanwar
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    name text NOT NULL,
    credit_hours integer NOT NULL,
    CONSTRAINT courses_credit_hours_check CHECK (((credit_hours >= 1) AND (credit_hours <= 3)))
);


ALTER TABLE public.courses OWNER TO umairanwar;

--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: umairanwar
--

CREATE TABLE public.enrollments (
    student_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.enrollments OWNER TO umairanwar;

--
-- Name: students; Type: TABLE; Schema: public; Owner: umairanwar
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    name text NOT NULL,
    department text NOT NULL,
    gpa numeric(3,2) NOT NULL,
    CONSTRAINT students_gpa_check CHECK (((gpa >= 0.00) AND (gpa <= 4.00)))
);


ALTER TABLE public.students OWNER TO umairanwar;

--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: umairanwar
--

COPY public.courses (course_id, name, credit_hours) FROM stdin;
601	Thermodynamics	3
602	Fluid Mechanics	3
603	Database Systems	3
604	Web Development	3
605	Organic Chemistry	3
606	Chemical Reactor Design	3
607	Principles of Management	2
608	Corporate Finance	3
609	Network Security	3
610	Ethical Hacking	3
611	Technical Writing	1
612	Professional Ethics	1
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: umairanwar
--

COPY public.enrollments (student_id, course_id) FROM stdin;
201	601
201	602
201	611
202	601
202	602
202	612
203	601
203	602
203	611
204	601
204	602
204	612
205	601
205	602
205	611
206	601
206	602
206	612
207	601
207	602
207	611
208	601
208	602
208	612
209	603
209	604
209	611
210	603
210	604
210	612
211	603
211	604
211	611
212	603
212	604
212	612
213	603
213	604
213	611
214	603
214	604
214	612
215	603
215	604
215	611
216	603
216	604
216	612
217	605
217	606
217	611
218	605
218	606
218	612
219	605
219	606
219	611
220	605
220	606
220	612
221	605
221	606
221	611
222	605
222	606
222	612
223	605
223	606
223	611
224	605
224	606
224	612
225	607
225	608
225	611
226	607
226	608
226	612
227	607
227	608
227	611
228	607
228	608
228	612
229	607
229	608
229	611
230	607
230	608
230	612
231	607
231	608
231	611
232	607
232	608
232	612
233	609
233	610
233	611
234	609
234	610
234	612
235	609
235	610
235	611
236	609
236	610
236	612
237	609
237	610
237	611
238	609
238	610
238	612
239	609
239	610
239	611
240	609
240	610
240	612
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: umairanwar
--

COPY public.students (student_id, name, department, gpa) FROM stdin;
201	James Wilson	Mechanical Engineering	3.40
202	Sophia Martinez	Mechanical Engineering	2.85
203	Liam Anderson	Mechanical Engineering	3.10
204	Mia Thomas	Mechanical Engineering	3.65
205	Noah Jackson	Mechanical Engineering	2.25
206	Ava White	Mechanical Engineering	3.90
207	Lucas Harris	Mechanical Engineering	3.05
208	Harper Martin	Mechanical Engineering	2.70
209	Ethan Thompson	Computer Science	3.80
210	Isabella Garcia	Computer Science	3.15
211	Oliver Martinez	Computer Science	2.60
212	Amelia Robinson	Computer Science	3.92
213	Elijah Clark	Computer Science	3.45
214	Charlotte Rodriguez	Computer Science	2.95
215	William Lewis	Computer Science	3.70
216	Chloe Lee	Computer Science	3.10
217	Mason Walker	Chemical Engineering	3.30
218	Evelyn Hall	Chemical Engineering	2.80
219	Logan Allen	Chemical Engineering	3.55
220	Abigail Young	Chemical Engineering	3.60
221	Alexander King	Chemical Engineering	2.45
222	Emily Wright	Chemical Engineering	3.88
223	Jacob Scott	Chemical Engineering	3.12
224	Elizabeth Torres	Chemical Engineering	2.90
225	Michael Nguyen	Management Sciences	3.25
226	Sofia Hill	Management Sciences	3.75
227	Daniel Flores	Management Sciences	2.65
228	Avery Green	Management Sciences	3.40
229	Henry Adams	Management Sciences	3.00
230	Ella Baker	Management Sciences	3.95
231	Sebastian Gonzalez	Management Sciences	2.10
232	Camila Nelson	Management Sciences	3.50
233	Jackson Carter	Cyber Security	3.60
234	Scarlett Mitchell	Cyber Security	3.15
235	Sebastian Perez	Cyber Security	2.80
236	Victoria Roberts	Cyber Security	3.72
237	Matthew Turner	Cyber Security	3.33
238	Madison Phillips	Cyber Security	2.50
239	David Campbell	Cyber Security	3.89
240	Luna Parker	Cyber Security	3.05
\.


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: umairanwar
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: umairanwar
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (student_id, course_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: umairanwar
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: enrollments enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: umairanwar
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: enrollments enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: umairanwar
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id);


--
-- PostgreSQL database dump complete
--

\unrestrict uacarEPIsDjVqdPAWNeGU8GqtGCKzP348x35yaEJdBkFWlXGa2eMsmu3RwyxnNA

