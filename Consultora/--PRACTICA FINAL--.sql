--PRACTICA FINAL--

--Instrucciones: Lleve a cabo las operaciones que se solicitan.
-- En un archivo de texto copie la sintaxis de los comandos que utilice. 
--Al final guarde el archivo con el nombre del ejercicio y envíelo a la cuenta de correo. 
--(NO SUBIR A LA PLATAFORMA)



--1. Cree la base de datos Cursos, utilizando el archivo cursos.sql




--a. Agregue las siguientes tres tablas a su base de datos Cursos:


CREATE TABLE Bonos(
Bono CHAR(4) NOT NULL DEFAULT '',
Monto NUMERIC(4,0) NOT NULL DEFAULT 0,

CONSTRAINT PK_Bono
PRIMARY KEY (Bono)


);

CREATE TABLE Prestaciones(
clave_nivel NUMERIC(1,0) NOT NULL DEFAULT 0,
Nivel CHAR(15) NOT NULL DEFAULT '' ,
Prestamo NUMERIC(5,0) NOT NULL DEFAULT 0,
Aguinaldo NUMERIC(3,0) NOT NULL DEFAULT 0,
Bono_Anual NUMERIC(6,2) NOT NULL DEFAULT 0,
Dias NUMERIC(3,0) NOT NULL DEFAULT 0,

CONSTRAINT PkClaveNivel
PRIMARY KEY (clave_nivel)

);

CREATE TABLE Temas(

Clave_tema CHAR(4) NOT NULL DEFAULT '',
Tema NUMERIC(4,0) NOT NULL DEFAULT '',
DESCRIPCION VARCHAR(50) NULL,

CONSTRAINT PkCve_tema
PRIMARY KEY (Clave_tema)

);


--b. Modifique la tabla Temas agregando el campo ACTUALIZADO del tipo carácter de un espacio,
 --que acepte nulos y como default la letra ‘S’.

 ALTER TABLE Temas 
 ADD  Actualizado CHAR(3)  NULL DEFAULT 'S' ;

 --c. Sólo escriba la instrucción para eliminar la tabla Temas
DROP TABLE Temas;

--d. Agregue los siguientes datos a la tabla de bonos
--‘A’,’ 1000’
--‘B’, ‘1500’
--‘C’,’ 2500’
--‘D’,’ 3000’
--‘E’,’ 4000’
--‘F’, ‘4500’
--‘G’,’ 5000’
--‘H’, ‘5500’

INSERT INTO Bonos VALUES ('A',1000);
INSERT INTO Bonos VALUES ('B',1500);
INSERT INTO Bonos VALUES ('C',2500);
INSERT INTO Bonos VALUES ('D',3000);
INSERT INTO Bonos VALUES ('E',4000);
INSERT INTO Bonos VALUES ('F',4500);
INSERT INTO Bonos VALUES ('G',5000);
INSERT INTO Bonos VALUES ('H',5500);


--e. Modifique el bono de 1000 por 1250

UPDATE Bonos SET Monto= 1250
WHERE Monto = 1000 

--f. Modifique el bono de 4000 por 5000

UPDATE Bonos SET Monto= 5000
WHERE Monto = 4000 

--g. Elimine los bonos iguales a 5000

DELETE Bonos WHERE Monto= 5000


--h. Agregue los siguientes datos a la tabla prestaciones

--‘1’,’Directivo’,’25000’,’45’,’1.50’,’9’
--‘2’,’Gerencia’,’20000’,’20’,’1.00’,’7’
--‘3’,’De confianza’,’15000’,’15’,’0.80’,’5’
--‘4’,’Operativos’,’10000’,’30’,’0.75’,’15’
--‘5’,’Eventuales’,’8000’,’15’,’0.10’,’3’
--‘6’,’tramoya’,’1500’,’15’,’0.10’,’3’
--‘7’,’temporales’,’800’,’15’,’0.10’,’3’

INSERT INTO Prestaciones VALUES (1,'Directivo',25000,45,1.50,9)
GO
INSERT INTO Prestaciones VALUES (2,'Gerencia',20000,20,1.00,7)
GO
INSERT INTO Prestaciones VALUES (3,'De Confianza',15000,15,0.80,5)
GO
INSERT INTO Prestaciones VALUES (4,'Operativos',10000,30,0.75,15)
GO
INSERT INTO Prestaciones VALUES (5,'Eventuales',8000,15,0.10,3)
GO
INSERT INTO Prestaciones VALUES (6,'tramoya',1500,15,0.10,3)
GO
INSERT INTO Prestaciones VALUES (7,'temporales',800,15,0.10,3);

--i. Modifique el campo préstamo a eventuales a 1250

UPDATE Prestaciones SET Prestamo = 1250 where Nivel = 'Eventuales';

--j. Elimine los puestos iguales a tramoya y temporales

Delete Prestaciones where nivel = 'Tramoya' or nivel = 'Temporales'



--DML
--2. Desarrolle las operaciones de selección solicitadas sobre la tabla enunciada


--Tabla: Empleados
--a. Seleccione todos los campos de la tabla empleados

Select * From Empleados

--b. Seleccione el campo clave_puesto y muestre el resultado sin registro duplicados

SELECT DISTINCT clave_puesto FROM Empleados;

--c. Concatene los campos nombre, apellidop y apellidom, procurando dejar un espacio en
--blanco entre los valores llame el nuevo campo nombre

SELECT nombre + ' ' + apellidop + ' ' + apellidom AS Nombre FROM Empleados

--d. Seleccione el campo fecha_ingreso de la tabla empleados pero sólo despliegue el año

SELECT YEAR(fecha_ingreso) AS 'Año de Ingreso' from empleados

--e. Seleccione los campos nombre apellidop, clave_puesto y fecha_ingreso. Del campo nombre
--tome las primeras letras, del apellido a partir del segundo caracter 3 caracteres más.

SELECT SUBSTRING(nombre,LEN(nombre)-LEN(nombre),+4) as Nombre,SUBSTRING(apellidop,LEN(apellidop)-LEN(apellidop)+2,+3) AS Apellido,
clave_puesto ,fecha_ingreso FROM EMPLEADOS

--f. Seleccione los campos nombre y fecha_ingreso. El campo fecha_ingreso que muestre el
--mes. Nombre este último campo como mes de ingreso.

SELECT nombre, 
CASE 
WHEN MONTH(fecha_ingreso)= 1 Then 'Enero'
WHEN MONTH(fecha_ingreso)= 2 Then 'Febrero'
WHEN MONTH(fecha_ingreso)= 3 Then 'Marzo'
WHEN MONTH(fecha_ingreso)= 4 Then 'Abril'
WHEN MONTH(fecha_ingreso)= 5 Then 'Mayo'
WHEN MONTH(fecha_ingreso)= 6 Then 'Junio'
WHEN MONTH(fecha_ingreso)= 7 Then 'Julio'
WHEN MONTH(fecha_ingreso)= 8 Then 'Agosto'
WHEN MONTH(fecha_ingreso)= 9 Then 'Septiembre'
WHEN MONTH(fecha_ingreso)= 10 Then 'Octubre'
WHEN MONTH(fecha_ingreso)= 11 Then 'Noviembre'
WHEN MONTH(fecha_ingreso)= 12 Then 'Diciembre'
END
AS 'Mes de Ingreso'
from empleados


--Tabla: Cal_curso


--a. Seleccione los campos clave_curso, id_curso y fecha_curso. Del campo fecha_curso
--muestre el día del curso y asígnele el valor de Dia_inicio, del mismo campo muestre el año y
--asígnele el valor de Anio_inicio

SELECT clave_curso,id_curso,DAY(fecha_curso) as 'Dia de Inicio',YEAR(fecha_curso) as
 'Año de Inicio' FROM cal_cursos;


-- b. Seleccione los campos clave_curso, id_curso, fecha_curso. Del campo clave_curso muestre
--sólo los últimos 3 caracteres y concatene puntos suspensivos ‘…’

SELECT '...' + SUBSTRING(clave_curso,LEN(clave_curso)-2,3) AS Cve_Curso,clave_curso, id_curso,fecha_curso 
		FROM cal_cursos;


--		Tabla Cat_curso

--a. Seleccione los campos curso_costo y tema. Del campo curso muestre los primeros 10
--caracteres

SELECT SUBSTRING(curso,LEN(curso)-LEN(curso),11),curso,costo,tema 
FROM cat_cursos

--b. Seleccione los campos clave_curso, costo y tema. Del campo costo muestre el resultado
--redondeado.

SELECT clave_curso,ROUND(costo,0) as redondeo,tema 
		FROM cat_cursos


--3. Desarrolle las operaciones de selección solicitadas
--JOINS


--a. Seleccione el nombre del curso, el costo y su fecha de impartición de las tablas cat_cursos y
--cal_cursos


SELECT l.fecha_curso ,t.curso,t.costo 
		FROM cat_cursos t INNER JOIN cal_cursos l
		 ON (t.clave_curso=l.clave_curso);

--b. Seleccione el nombre del curso, el costo y su fecha de impartición de las tablas cat_cursos 
--y cal_cursos pero mostrando sólo aquellos registros que en su título se refieran a sistemas.


SELECT l.fecha_curso ,t.curso,t.costo 
		FROM cat_cursos t INNER JOIN cal_cursos l
		 ON (t.clave_curso=l.clave_curso)
		 WHERE t.curso like '%Sistemas%';


--c. Seleccione el nombre y apellido del empleado, puesto y el nombre de su departamento.
--Muestre sólo aquellos cuyo departamento sea ventas.



SELECT e.nombre + ' ' + e.apellidop AS Nombre, p.puesto , d.depto FROM Empleados e 
Inner JOIN puestos p ON (e.clave_puesto=p.clave_puesto)  
INNER JOIN departamentos d ON(e.clave_depto = d.clave_depto)


--d. Seleccione el nombre y apellido del empleado, puesto y el nombre de su departamento. 
--Muestre sólo aquellos cuyo departamento NO sea ventas.

SELECT e.nombre + ' ' + e.apellidop AS Nombre, p.puesto , d.depto FROM Empleados e 
Inner JOIN puestos p ON (e.clave_puesto=p.clave_puesto)  
INNER JOIN departamentos d ON(e.clave_depto = d.clave_depto)
WHERE d.depto != 'Ventas'


--e. Seleccione el nombre completo del empleado, los cursos que ha tomado,
-- promedio y fecha de inicio del curso. Concatene el nombre del empleado
--  separado por un espacio en blanco



SELECT e.clave,e.nombre + ' '+e.apellidop+' '+e.apellidom AS NOMBRE,t.curso, r.promedio,l.fecha_curso FROM
empleados e INNER JOIN resultados r ON (e.clave = r.clave) INNER JOIN cal_cursos l ON(l.id_curso =r.id_curso)INNER JOIN cat_cursos t ON (l.clave_curso=t.clave_curso)
ORDER BY clave

--f. Seleccione el nombre del curso, su costo y su fecha de inicio solo aquellos cursos que 
--se imparten en el mes de abril

SELECT t.curso,t.costo,l.fecha_curso FROM
cat_cursos t  INNER JOIN cal_cursos l ON (t.clave_curso = l.clave_curso) 
WHERE MONTH(fecha_curso) = 4

--g. Seleccione nombre del curso, su costo y su fecha de inicio solo
-- de aquellos cuyo precio sea inferior o igual a 2500

SELECT t.curso,t.costo,l.fecha_curso FROM
cat_cursos t  INNER JOIN cal_cursos l ON (t.clave_curso = l.clave_curso) 
WHERE t.costo <= 2500;

--h. Seleccione nombre del curso, su costo y su fecha de inicio solo de aquellos cuyo
-- precio sea superior a 2500 y su tema no sea SC.

SELECT t.curso,t.costo,l.fecha_curso FROM
cat_cursos t  INNER JOIN cal_cursos l ON (t.clave_curso = l.clave_curso) 
WHERE t.costo > 2500 and t.Tema != 'SC';


--i. Seleccione los cursos de computación con costo y fecha de inicio

SELECT t.curso,t.costo,l.fecha_curso FROM
cat_cursos t  INNER JOIN cal_cursos l ON (t.clave_curso = l.clave_curso)
WHERE t.curso = 'Sistemas de c¢mputo';



--FUNCIONES

--a. Haga un conteo de los registros de la tabla cursos

SELECT COUNT( *) 'TOTAL DE CURSOS' FROM cat_cursos

--b. Calcule el promedio de precios de todos los cursos

SELECT AVG(costo)as 'Promedio de Precios' FROM cat_cursos


--Calcule la suma total de precios de todos los cursos

SELECT SUM(costo)as 'Suma de Precios' FROM cat_cursos

--d. ¿Cuántos cursos existen para el tema AM?

SELECT COUNT(*) 'CURSOS CON AM' from cat_cursos
WHERE Tema = 'AM';

--e. Obtenga el número de cursos cuyo nombre se refiere a sistemas

SELECT COUNT(*) Sistemas
		FROM cat_cursos
		WHERE curso like '%Sistemas%';

--f. Calcule el promedio de precios para aquellos cursos que fueron programados en abril


SELECT  l.fecha_curso 'fecha de los Cursos',AVG(t.costo)'Promedio Mes de Abril' FROM cat_cursos t INNER JOIN cal_cursos l
ON (t.clave_curso=l.clave_curso)
WHERE MONTH(l.fecha_curso)=04
GROUP BY l.fecha_curso


--g. Calcule el promedio de precios para aquellos curos que fueron programados 
--en noviembre (de cualquier año)

SELECT  CASE  WHEN MONTH(l.fecha_curso)= 11 THEN 'Noviembre'END AS Mes  ,AVG(t.costo)'Promedio Mes de Noviembre de todos los años'   FROM cat_cursos t INNER JOIN cal_cursos l
ON (t.clave_curso=l.clave_curso)
WHERE MONTH(l.fecha_curso)=11
GROUP BY MONTH(l.fecha_curso)


--h. Sume los precios de los cursos de los años de 1998 y 1999



SELECT  SUM(t.costo)'Suma de los cursos de 1988 y 1999' FROM cat_cursos t INNER JOIN cal_cursos l
ON (t.clave_curso=l.clave_curso)
WHERE YEAR(l.fecha_curso)=1998 or YEAR(l.fecha_curso)=1999


--i. Indique cuál es el sueldo máximo

SELECT MAX(sueldo)'Sueldo Maximo' from puestos

--Indique cuál es el sueldo mínimo

SELECT MIN(sueldo)'Sueldo Minimo' from puestos

--k. ¿Cuántos empleados tiene la compañía?

SELECT COUNT(*)'Total de Empleados' FROM empleados

