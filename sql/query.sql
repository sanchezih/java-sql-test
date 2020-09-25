SET @semestre = 2;
SET @anio_calendario = 2014;
SET @cant_min_alumnos = 2;
SET @des_carrera = "INGENIERIA EN SISTEMAS";

SELECT m.des_materia AS descripcion_materia,
       COUNT(1) AS cant_total_alumnos,
       AVG(am.nota) AS nota_promedio
FROM alumnoxmateria am,
     materia m,
     alumno a
WHERE am.id_alumno = a.id_alumno
  AND am.id_materia = m.id_materia
  AND am.anio_calendario = @anio_calendario
  AND am.semestre = @semestre
  AND am.id_materia IN
    (SELECT am.id_materia
     FROM alumnoxmateria am,
          materia m
     WHERE m.id_materia = am.id_materia
       AND am.anio_calendario = @anio_calendario
       AND am.semestre = @semestre
       AND m.id_carrera =
         (SELECT c.id_carrera
          FROM carrera c
          WHERE c.des_carrera = @des_carrera )
     GROUP BY am.id_materia
     HAVING COUNT(am.id_materia) > @cant_min_alumnos)
GROUP BY m.des_materia
ORDER BY m.des_materia ASC;