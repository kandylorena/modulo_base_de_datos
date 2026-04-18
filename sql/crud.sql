CREATE TABLE alumnos (
id_alumno INT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
fecha_nacimiento DATE,
correo VARCHAR(100),
promedio_general DECIMAL(3,2)
);

-- 2. Insertar los datos
INSERT INTO alumnos (id_alumno, nombre, apellido, fecha_nacimiento, correo, promedio_general) VALUES
(1, 'Alejandro', 'García', '2005-03-12', 'ale.garcia@email.com', 8.50),
(2, 'Sofía', 'Martínez', '2004-11-25', 'sofia.mtz@email.com', 9.25),
(3, 'Diego', 'Rodríguez', '2005-07-08', 'diego.rod@email.com', 7.80),
(4, 'Lucía', 'Fernández', '2006-01-15', 'lucia.fer@email.com', 9.90),
(5, 'Carlos', 'López', '2004-05-30', 'carlos.lopez@email.com', 6.45),
(6, 'Valeria', 'Sánchez', '2005-09-22', 'val.sanchez@email.com', 8.12),
(7, 'Mateo', 'Pérez', '2005-12-02', 'mateo.perez@email.com', 7.30),
(8, 'Isabella', 'Gómez', '2004-08-14', 'isa.gomez@email.com', 9.05),
(9, 'Javier', 'Hernández', '2006-04-19', 'javier.h@email.com', 8.88),
(10, 'Camila', 'Torres', '2005-10-10', 'camila.t@email.com', 9.50);

-- 3. Consultar (AHORA SÍ verás los 10 registros)
SELECT * FROM alumnos;
select * from alumnos where id_alumno = 1;

update alumnos set nombre ='Santiago' where id_alumno = 1;

SELECT * FROM alumnos;
select * from alumnos where id_alumno = 1;

delete from alumnos where id_alumno = 1;

SELECT * FROM alumnos;
select * from alumnos where id_alumno = 1;