DROP DATABASE IF EXISTS testdb;
CREATE DATABASE testdb; USE testdb;

DROP TABLE IF EXISTS testdb.alumnoxmateria;
DROP TABLE IF EXISTS testdb.materia;
DROP TABLE IF EXISTS testdb.alumno;
DROP TABLE IF EXISTS testdb.carrera;

/******************************************************************************/
CREATE TABLE testdb.alumno(id_alumno VARCHAR(16) NOT NULL,
 legajo INT NULL,
 nombre_completo VARCHAR(100),
 activo INT(1), 
 PRIMARY KEY (id_alumno)) 
ENGINE = InnoDB DEFAULT CHARSET = latin1;

/******************************************************************************/
CREATE TABLE testdb.carrera(id_carrera VARCHAR(16) NOT NULL,
 cod_carrera CHAR(4) NULL,
 des_carrera VARCHAR(100),
 activo INT(1), 
 PRIMARY KEY (id_carrera)) 
ENGINE = InnoDB DEFAULT CHARSET = latin1;

/******************************************************************************/
CREATE TABLE testdb.materia(id_materia VARCHAR(16) NOT NULL,
 cod_materia CHAR(4) NULL,
 des_materia VARCHAR(100),
 id_carrera VARCHAR(16) NOT NULL,
 PRIMARY KEY (id_materia),
 FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera))
ENGINE = InnoDB DEFAULT CHARSET = latin1;

/******************************************************************************/
CREATE TABLE testdb.alumnoxmateria(id_alumnoxmateria VARCHAR(16) NOT NULL,
 id_alumno VARCHAR(16) NOT NULL,
 id_materia VARCHAR(16) NOT NULL,
 anio_calendario INT(4) NOT NULL,
 semestre INT(1),
 nota INT(3),
 aprobado INT(1),
 PRIMARY KEY (id_alumnoxmateria),
 FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno))
ENGINE = InnoDB DEFAULT CHARSET = latin1;

/******************************************************************************/
DELETE
FROM testdb.alumno;

INSERT INTO alumno VALUES ("1", "63822", "Ignacio Sanchez", "1") ;
INSERT INTO alumno VALUES ("2", "63144", "Victoria Quiroga", "1") ;
INSERT INTO alumno VALUES ("3", "52146", "Sara Quiroga", "1") ;
INSERT INTO alumno VALUES ("4", "74136", "Edgardo Quiroga", "1") ;
INSERT INTO alumno VALUES ("5", "96358", "Juan Perez", "1") ;
INSERT INTO alumno VALUES ("6", "96358", "Maria Fernandez", "1") ;
INSERT INTO alumno VALUES ("7", "31412", "Estefania Gomez", "1") ;
INSERT INTO alumno VALUES ("8", "31411", "Julia Perez", "1") ;
INSERT INTO alumno VALUES ("9", "71312", "Roxana Orzo", "1") ;
INSERT INTO alumno VALUES ("10", "78312", "Rosa Martin", "1") ;

/******************************************************************************/
DELETE
FROM testdb.carrera;

INSERT INTO carrera VALUES ("900", "0109", "INGENIERIA EN SISTEMAS", "1") ;
INSERT INTO carrera VALUES ("505", "0110", "DERECHO", "1") ;
INSERT INTO carrera VALUES ("002", "0111", "COMPUTADOR CIENTIFICO", "0") ;

/******************************************************************************/
DELETE
FROM testdb.materia;

INSERT INTO materia VALUES ("I9000", "0101", "ANALISIS 1", "900") ;
INSERT INTO materia VALUES ("I9001", "0102", "SISTEMAS OPERATIVOS", "900") ;
INSERT INTO materia VALUES ("I9003", "0103", "ALGEBRA", "900") ;
INSERT INTO materia VALUES ("D9001", "0201", "DERECHO PENAL 1", "505") ;

/******************************************************************************/
DELETE
FROM testdb.alumnoxmateria;

INSERT INTO alumnoxmateria VALUES ("1", "1", "I9000", "2014", "2", "1", "0") ;
INSERT INTO alumnoxmateria VALUES ("2", "2", "I9000", "2014", "2", "6", "1") ;
INSERT INTO alumnoxmateria VALUES ("3", "3", "I9000", "2014", "2", "2", "0") ;
INSERT INTO alumnoxmateria VALUES ("11", "4", "I9000", "2014", "2", "10", "1") ;
INSERT INTO alumnoxmateria VALUES ("12", "5", "I9000", "2014", "2", "10", "1") ;

INSERT INTO alumnoxmateria VALUES ("4", "1", "I9001", "2014", "2", "4", "1") ;
INSERT INTO alumnoxmateria VALUES ("5", "2", "I9001", "2014", "2", "8", "1") ;
INSERT INTO alumnoxmateria VALUES ("6", "3", "I9001", "2014", "2", "8", "1") ;
INSERT INTO alumnoxmateria VALUES ("7", "4", "I9001", "2014", "2", "10", "1") ;
INSERT INTO alumnoxmateria VALUES ("8", "5", "I9001", "2014", "2", "2", "0") ;
INSERT INTO alumnoxmateria VALUES ("9", "6", "I9001", "2014", "2", "4", "0") ;
INSERT INTO alumnoxmateria VALUES ("10", "7", "I9001", "2014", "2", "6", "1") ;

INSERT INTO alumnoxmateria VALUES ("101", "8", "D9001", "2014", "2", "2", "0") ;
INSERT INTO alumnoxmateria VALUES ("102", "9", "D9001", "2014", "2", "10", "1") ;
INSERT INTO alumnoxmateria VALUES ("103", "10", "D9001", "2014", "2", "10", "1") ;