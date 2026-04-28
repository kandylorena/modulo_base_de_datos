CREATE TABLE departamentos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
);

CREATE TABLE empleados (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(100),
	departamento_id INT,
	FOREIGN KEY (departamento_id) REFERENCES departamentos (id)
);

SELECT * FROM empleados;
SELECT * FROM departamentos;

--alter (agregar columnas)
alter table empleados
add column profesion varchar(100);

alter table empleados
add column fecha_de_ingreso date;

alter table departamentos
add column ubicacion varchar(100);


--alter (modificar columnas)
alter table empleados
alter column correo set not null;



Insert into departamentos (nombre) values
('Recusros humanos'),
('Tecnologia'),
('Ventas'),
('Marcketing');

Insert into empleados (nombre, correo, departamento_id,profesion) values
('juan perez', 'juanperez@empresa.com', 1, 'ing'),
('Maria lopez', 'Marialopez@empresa.com', 1, 'ing'),
('carlos Arias', 'carlosArias@empresa.com', 1, 'ing'),
('Andres perez', 'Andresperez@empresa.com', 1, 'ing');

-- cargar datos reales a los null de la nueva columna fecha
update empleados 
set fecha_de_ingreso = '2025-01-01'
where fecha_de_ingreso is null;

update empleados 
set departamento_id = 2
where nombre = 'juan perez';

update empleados 
set departamento_id = 3
where nombre = 'carlos Arias';

update empleados 
set fecha_de_ingreso = CURRENT_DATE
where fecha_de_ingreso= '2025-01-01';

SELECT * FROM empleados;
SELECT * FROM departamentos;



