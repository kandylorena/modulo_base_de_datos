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
}
-- 1. Tabla de Autores
CREATE TABLE autores (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50),
    fecha_nacimiento DATE
);

-- 2. Tabla de Libros
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

-- 3. Tabla de Clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Tabla de Pedidos (Con columna MONTO incluida)
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    libro_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    monto DECIMAL(10, 2) NOT NULL, 
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    CONSTRAINT fk_libro FOREIGN KEY (libro_id) REFERENCES libros(libro_id)
);
select * from alumnos;



INSERT INTO autores (nombre, nacionalidad, fecha_nacimiento) VALUES
('Gabriel García Márquez', 'Colombiano', '1927-03-06'),
('Isabel Allende', 'Chilena', '1942-08-02'),
('Jorge Luis Borges', 'Argentino', '1899-08-24'),
('Mario Vargas Llosa', 'Peruano', '1936-03-28'),
('Julio Cortázar', 'Argentino', '1914-08-26'),
('Laura Esquivel', 'Mexicana', '1950-09-30'),
('Carlos Ruiz Zafón', 'Español', '1964-09-25'),
('Miguel de Cervantes', 'Español', '1547-09-29'),
('Pablo Neruda', 'Chileno', '1904-07-12'),
('Octavio Paz', 'Mexicano', '1914-03-31');

INSERT INTO libros (titulo, autor_id, precio, stock) VALUES
('Cien años de soledad', 1, 25000, 50),
('La casa de los espíritus', 2, 18500, 30),
('El Aleph', 3, 15000, 20),
('La ciudad y los perros', 4, 21000, 15),
('Rayuela', 5, 19900, 12),
('Como agua para chocolate', 6, 14500, 40),
('La sombra del viento', 7, 23000, 25),
('Don Quijote de la Mancha', 8, 35000, 10),
('Veinte poemas de amor', 9, 12000, 60),
('El laberinto de la soledad', 10, 16000, 18);

INSERT INTO clientes (nombre, email) VALUES
('Ana García', 'ana.garcia@email.com'), ('Luis Rodríguez', 'luis.rod@email.com'),
('María José', 'mjose@email.com'), ('Carlos Peña', 'carlos.p@email.com'),
('Elena Martínez', 'elena.mtz@email.com'), ('Roberto Gómez', 'roberto.g@email.com'),
('Lucía Fernández', 'lucia.f@email.com'), ('Ricardo Soto', 'rsoto@email.com'),
('Sofía Castro', 'sofia.c@email.com'), ('Diego Valdés', 'diego.v@email.com');

INSERT INTO pedidos (cliente_id, libro_id, cantidad, monto) VALUES
(1, 1, 1, 25000), (2, 2, 2, 37000), (3, 3, 1, 15000), (4, 4, 1, 21000), (5, 5, 3, 59700),
(6, 6, 1, 14500), (7, 7, 1, 23000), (8, 8, 1, 35000), (9, 9, 5, 60000), (10, 10, 2, 32000),
(1, 2, 1, 18500), (2, 1, 1, 25000), (3, 5, 2, 39800), (4, 7, 1, 23000), (5, 9, 1, 12000),
(6, 10, 3, 48000), (7, 3, 2, 30000), (8, 4, 1, 21000), (9, 6, 2, 29000), (10, 8, 1, 35000);

select monto from pedidos;
SELECT 
    p.pedido_id AS "Nro Pedido",
    c.nombre AS "Cliente",
    l.titulo AS "Libro Comprado",
    a.nombre AS "Autor",
    p.cantidad AS "Cant.",
    (l.precio * p.cantidad) AS "Total Venta"
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
JOIN libros l ON p.libro_id = l.libro_id
JOIN autores a ON l.autor_id = a.autor_id;


SELECT pedido_id, monto 
FROM pedidos 
WHERE pedido_id = 1;


BEGIN;
UPDATE pedidos SET monto = monto - 1000 WHERE pedido_id = 1;

-- Revisa antes de confirmar
SELECT * FROM pedidos WHERE pedido_id = 1;

-- Si el resultado es el que esperabas:
COMMIT; 
-- Si algo salió mal:
-- ROLLBACK;
 
SELECT monto from pedidos;
SELECT pedido_id, monto AS monto_con_descuento 
FROM pedidos;
ROLLBACK;

BEGIN;



COMMIT;