# modulo_base_de_datos
modulo_base_de_datos


🧠 Guía Completa de SQL – Desde Cero a Consultas Relacionales
🎯 Objetivo
Aprender a usar SQL para:

Crear estructuras de datos
Insertar y modificar información
Consultar datos
Relacionar tablas
Entender cómo funcionan sistemas reales
📌 1. ¿Qué es SQL?
SQL (Structured Query Language) es el lenguaje que usamos para interactuar con bases de datos.

👉 Con SQL puedes:

Crear tablas
Guardar datos
Consultar información
Relacionar datos
🧱 2. Estructura básica de una base de datos
📦 Tabla
Una tabla guarda información en filas y columnas.

Ejemplo mental:

id	nombre	ciudad
1	Juan	Valparaíso
🔑 PRIMARY KEY
Identifica cada fila de forma única
No se repite
id SERIAL PRIMARY KEY
🔗 FOREIGN KEY
Conecta una tabla con otra
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
🏗️ 3. Crear tablas
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);
➕ 4. Insertar datos
INSERT INTO clientes (nombre, ciudad)
VALUES ('Juan', 'Valparaíso');
🔍 5. Consultar datos (SELECT)
Obtener todo
SELECT * FROM clientes;
Seleccionar columnas
SELECT nombre, ciudad FROM clientes;
🎯 6. Filtrar datos (WHERE)
SELECT * FROM clientes
WHERE ciudad = 'Valparaíso';
Buscar texto
SELECT * FROM clientes
WHERE nombre LIKE '%Juan%';
🔢 7. Funciones básicas
COUNT()
SELECT COUNT(*) FROM clientes;
DISTINCT
SELECT DISTINCT ciudad FROM clientes;
📊 8. Agrupar datos (GROUP BY)
SELECT ciudad, COUNT(*)
FROM clientes
GROUP BY ciudad;
🔗 9. Relaciones entre tablas
🧠 Idea clave
Las tablas se conectan usando llaves

Ejemplo
clientes → id
pedidos → cliente_id
🔄 10. JOIN (muy importante)
INNER JOIN
SELECT *
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id;
👉 Solo datos que coinciden

LEFT JOIN
SELECT *
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;
👉 Incluye clientes sin pedidos

🧮 11. Agrupación con JOIN
SELECT clientes.nombre, COUNT(pedidos.id)
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nombre;
🧠 12. Subconsultas
SELECT nombre
FROM clientes
WHERE id IN (
    SELECT cliente_id FROM pedidos
);
✏️ 13. Actualizar datos
UPDATE clientes
SET ciudad = 'Santiago'
WHERE id = 1;
❌ 14. Eliminar datos
DELETE FROM clientes
WHERE id = 1;
🔄 15. Transacciones
🧠 Concepto
Todo se ejecuta o nada se ejecuta

BEGIN;

UPDATE cuentas SET saldo = saldo - 1000 WHERE id = 1;
UPDATE cuentas SET saldo = saldo + 1000 WHERE id = 2;

COMMIT;
Cancelar cambios
ROLLBACK;
⚠️ 16. Errores comunes
No usar PRIMARY KEY
No entender relaciones
Usar JOIN sin ON
No usar GROUP BY correctamente
Escribir SQL sin entender el problema
🧠 17. Cómo pensar en SQL
Antes de escribir código:

¿Qué datos necesito?
¿En qué tabla están?
¿Necesito más de una tabla?
¿Cómo se relacionan?
¿Necesito filtrar o agrupar?
🎯 18. Flujo mental para consultas
SELECT ...
FROM ...
JOIN ...
WHERE ...
GROUP BY ...
💡 19. Analogía simple
SELECT → preguntar
WHERE → filtrar
JOIN → conectar
GROUP BY → agrupar
🚀 20. Recomendaciones
Practica escribiendo consultas
Prueba errores (aprendes más)
No memorices → entiende
Piensa antes de escribir
🧠 Frase clave
“SQL no se memoriza, se entiende”

