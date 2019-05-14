Rem
Rem $Header: hr_drop.sql 03-mar-2001.10:05:14 ahunold Exp $
Rem
Rem hr_drop.sql
Rem
Rem  Copyright (c) Oracle Corporation 2001. All Rights Reserved.
Rem
Rem    NAME
Rem      hr_drop.sql - Drop objects from HR schema
Rem
Rem    DESCRIPTION
Rem
Rem
Rem    NOTES
Rem
Rem    CREATED by Nancy Greenberg - 06/01/00
Rem    MODIFIED   (MM/DD/YY)
Rem    ahunold     02/20/01 - New header, non-table objects
Rem    vpatabal    03/02/01 - DROP TABLE region 

SET SERVEROUTPUT ON  VERIFY OFF

DROP SEQUENCE departments_seq;
DROP SEQUENCE employees_seq;
DROP SEQUENCE locations_seq;

DROP TABLE regions     CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;
DROP TABLE locations   CASCADE CONSTRAINTS;
DROP TABLE jobs        CASCADE CONSTRAINTS;
DROP TABLE job_history CASCADE CONSTRAINTS;
DROP TABLE employees   CASCADE CONSTRAINTS;
DROP TABLE countries   CASCADE CONSTRAINTS;  

Rem added by hong 2007.5.4

DROP TABLE sales_reps   CASCADE CONSTRAINTS;  
DROP TABLE copy_emp   CASCADE CONSTRAINTS;  

DROP TABLE job_grades CASCADE CONSTRAINTS;

COMMIT;


