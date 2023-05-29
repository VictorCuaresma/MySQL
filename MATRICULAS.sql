CREATE DATABASE MATRICULAS;
use MATRICULAS;
CREATE TABLE APODERADOS (
    DNI varchar(90)  NOT NULL,
    Nombres varchar(60)  NOT NULL,
    Apellidos varchar(90)  NOT NULL,
    Celular char(9)  NOT NULL,
    Direccion varchar(90)  NOT NULL,
    Gmail integer  NULL,
    Fecha_nacimiento date  NOT NULL,
    CONSTRAINT APODERADO_pk PRIMARY KEY (DNI)
) ;

CREATE TABLE DOCENTES (
    id integer  NOT NULL,
    DNI char(8)  NOT NULL,
    Nombres varchar(60)  NOT NULL,
    Apellidos varchar(80)  NOT NULL,
    Gmail varchar(80)  NOT NULL,
    Celular char(9)  NOT NULL,
    Direccion varchar(80)  NOT NULL,
    CONSTRAINT DOCENTE_pk PRIMARY KEY (id)
) ;

CREATE TABLE ESTUDIANTES (
    Id integer  NOT NULL,
    DNI char(8)  NOT NULL,
    Nombres varchar(80)  NOT NULL,
    Apellidos varchar(80)  NOT NULL,
    Direccion varchar(80)  NOT NULL,
    Fecha_nacimiento date  NOT NULL,
    grado_estudiar integer  NOT NULL,
    Apoderado_dni char(8)  NOT NULL,
    Gmail integer  NOT NULL,
    Celular char(9)  NOT NULL,
    APODERADOS_DNI varchar(90)  NOT NULL,
    CONSTRAINT ESTUDIANTE_pk PRIMARY KEY (Id)
) ;

CREATE TABLE GRADOS (
    codigo_grado varchar(60)  NOT NULL,
    seccion integer  NOT NULL,
    nivel integer  NOT NULL,
    CONSTRAINT GRADO_pk PRIMARY KEY (codigo_grado)
) ;

CREATE TABLE MATRICULAS (
    ID integer  NOT NULL,
    ID_estudiante integer  NOT NULL,
    Fecha_Matricula varchar(80)  NOT NULL,
    Grado_academico varchar(80)  NOT NULL,
    Notas integer  NOT NULL,
    ID_docente integer  NOT NULL,
    ESTUDIANTE_Id  integer  NOT NULL,
    DOCENTE_id integer  NOT NULL,
    GRADO_codigo_grado varchar(60)  NOT NULL,
    CONSTRAINT MATRICULA_pk PRIMARY KEY (ID)
) ;

ALTER TABLE MATRICULAS ADD CONSTRAINT ESTUDIANTE_MATRICULAS
    FOREIGN KEY (ESTUDIANTE_Id)
    REFERENCES ESTUDIANTES (Id);

ALTER TABLE ESTUDIANTES ADD CONSTRAINT ESTUDIANTES_APODERADOS
    FOREIGN KEY (APODERADO_DNI)
    REFERENCES APODERADOS (DNI);

ALTER TABLE MATRICULAS ADD CONSTRAINT MATRICULAS_DOCENTES
    FOREIGN KEY (DOCENTE_id)
    REFERENCES DOCENTES (id);
    
ALTER TABLE MATRICULAS ADD CONSTRAINT MATRICULAS_GRADO
    FOREIGN KEY (GRADO_codigo_grado)
    REFERENCES GRADOS (codigo_grado);
