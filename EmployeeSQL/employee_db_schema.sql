PGDMP         1            
    x            employee_SQL_db    12.3    12.3     a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            d           1262    33344    employee_SQL_db    DATABASE     o   CREATE DATABASE "employee_SQL_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
 !   DROP DATABASE "employee_SQL_db";
                postgres    false            �            1259    33466    departments    TABLE     u   CREATE TABLE public.departments (
    dept_no character varying(10) NOT NULL,
    dept_name character varying(40)
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    33484    dept_employee    TABLE     ]   CREATE TABLE public.dept_employee (
    emp_no integer,
    dept_no character varying(10)
);
 !   DROP TABLE public.dept_employee;
       public         heap    postgres    false            �            1259    33471    dept_manager    TABLE     \   CREATE TABLE public.dept_manager (
    dept_no character varying(10),
    emp_no integer
);
     DROP TABLE public.dept_manager;
       public         heap    postgres    false            �            1259    33450 	   employees    TABLE     ,  CREATE TABLE public.employees (
    id integer NOT NULL,
    emp_no integer,
    emp_title_id character varying(30),
    birth_date character varying(30),
    first_name character varying(50),
    last_name character varying(50),
    sex character varying(10),
    hire_date character varying(20)
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    33448    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          postgres    false    205            e           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          postgres    false    204            �            1259    33414    salaries    TABLE     R   CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer
);
    DROP TABLE public.salaries;
       public         heap    postgres    false            �            1259    33419    titles    TABLE     m   CREATE TABLE public.titles (
    title_id character varying(30) NOT NULL,
    title character varying(30)
);
    DROP TABLE public.titles;
       public         heap    postgres    false            �           2604    33453    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �           2606    33470    departments departments_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    206            �           2606    33455    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    205            �           2606    33418    salaries salaries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no);
 @   ALTER TABLE ONLY public.salaries DROP CONSTRAINT salaries_pkey;
       public            postgres    false    202            �           2606    33423    titles titles_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);
 <   ALTER TABLE ONLY public.titles DROP CONSTRAINT titles_pkey;
       public            postgres    false    203            �           2606    33492 (   dept_employee dept_employee_dept_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_employee
    ADD CONSTRAINT dept_employee_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);
 R   ALTER TABLE ONLY public.dept_employee DROP CONSTRAINT dept_employee_dept_no_fkey;
       public          postgres    false    206    208    3034            �           2606    33487 '   dept_employee dept_employee_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_employee
    ADD CONSTRAINT dept_employee_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.salaries(emp_no);
 Q   ALTER TABLE ONLY public.dept_employee DROP CONSTRAINT dept_employee_emp_no_fkey;
       public          postgres    false    3028    202    208            �           2606    33474 &   dept_manager dept_manager_dept_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);
 P   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_dept_no_fkey;
       public          postgres    false    207    3034    206            �           2606    33479 %   dept_manager dept_manager_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.salaries(emp_no);
 O   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_emp_no_fkey;
       public          postgres    false    202    207    3028            �           2606    33456    employees employees_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.salaries(emp_no);
 I   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_emp_no_fkey;
       public          postgres    false    3028    202    205            �           2606    33461 %   employees employees_emp_title_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_emp_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES public.titles(title_id);
 O   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_emp_title_id_fkey;
       public          postgres    false    203    205    3030           