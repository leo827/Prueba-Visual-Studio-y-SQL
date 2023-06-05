select * from clientes
select * from pedidos
select * from productos


---Crea la estructura de las tablas Clientes, Pedidos y Productos para crear la BD.
CREATE TABLE clientes (
    ID INT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(100)
);

-- Cree datos ficticios y coloque en la respuesta los respectivos INSERT
INSERT INTO clientes (ID, nombre, ubicacion) VALUES
(1, 'Juan Perez', 'Ciudad A'),
(2, 'Maria Rodriguez', 'Ciudad B'),
(3, 'Carlos Sanchez', 'Ciudad C'),
(4, 'Ana Lopez', 'Ciudad D'),
(5, 'Pedro Ramirez', 'Ciudad E'),
(6, 'Laura Torres', 'Ciudad F'),
(7, 'Luis Gomez', 'Ciudad G'),
(8, 'Marta Fernandez', 'Ciudad H'),
(9, 'Roberto Gonzalez', 'Ciudad I'),
(10, 'Sofia Morales', 'Ciudad J'),
(11, 'Daniel Herrera', 'Ciudad K'),
(12, 'Carmen Castro', 'Ciudad L'),
(13, 'Hector Jimenez', 'Ciudad M'),
(14, 'Isabel Vargas', 'Ciudad N'),
(15, 'Ricardo Medina', 'Ciudad O'),
(16, 'Patricia Navarro', 'Ciudad P'),
(17, 'Alejandro Ortega', 'Ciudad Q'),
(18, 'Fernanda Silva', 'Ciudad R'),
(19, 'Gustavo Rios', 'Ciudad S'),
(20, 'Olivia Mendoza', 'Ciudad T');

---Crea la estructura de las tablas Clientes, Pedidos y Productos para crear la BD.
CREATE TABLE pedidos (
    ID INT PRIMARY KEY,
    id_pedido INT,
    fecha_pedido DATE,
    FOREIGN KEY (id_pedido) REFERENCES clientes(ID)
);


-- Cree datos ficticios y coloque en la respuesta los respectivos INSERT
INSERT INTO pedidos (ID, id_pedido, fecha_pedido) VALUES
(1, 1, '2023-05-01'),
(2, 1, '2023-05-05'),
(3, 2, '2023-05-10'),
(4, 3, '2023-05-15'),
(5, 3, '2023-05-20'),
(6, 4, '2023-05-25'),
(7, 5, '2023-06-01'),
(8, 5, '2023-06-05'),
(9, 6, '2023-06-10'),
(10, 6, '2023-06-15'),
(11, 7, '2023-06-20'),
(12, 8, '2023-06-25'),
(13, 8, '2023-06-30'),
(14, 9, '2023-07-05'),
(15, 9, '2023-07-10'),
(16, 10, '2023-07-15'),
(17, 11, '2023-07-20'),
(18, 11, '2023-07-25'),
(19, 12, '2023-07-30'),
(20, 12, '2023-08-01');

---Crea la estructura de las tablas Clientes, Pedidos y Productos para crear la BD.
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_producto DECIMAL(10, 2)
);

-- Cree datos ficticios y coloque en la respuesta los respectivos INSERT
INSERT INTO productos (id_producto, nombre_producto, precio_producto) VALUES
(1, 'Camisa', 29.99),
(2, 'Pantalón', 49.99),
(3, 'Zapatos', 79.99),
(4, 'Blusa', 34.99),
(5, 'Jeans', 59.99),
(6, 'Sudadera', 39.99),
(7, 'Vestido', 69.99),
(8, 'Chaqueta', 89.99),
(9, 'Camiseta', 19.99),
(10, 'Falda', 44.99),
(11, 'Calcetines', 9.99),
(12, 'Bolso', 59.99),
(13, 'Sombrero', 24.99),
(14, 'Bufanda', 19.99),
(15, 'Guantes', 14.99),
(16, 'Gafas de sol', 39.99),
(17, 'Reloj', 99.99),
(18, 'Pulsera', 29.99),
(19, 'Collar', 49.99),
(20, 'Anillo', 39.99);

--- actualizamos a pesos($) el campo precio_producto 
UPDATE productos
SET precio_producto = precio_producto * 4000;

--Encuentra el nombre del cliente y la fecha del pedido para los pedidos más recientes de cada cliente, junto con los nombres de los productos en esos pedidos.
SELECT c.nombre, p.fecha_pedido, pr.nombre_producto
FROM clientes c
JOIN pedidos p ON c.ID = p.id_pedido
JOIN productos pr ON p.id_pedido = pr.id_producto
WHERE p.fecha_pedido IN (
    SELECT MAX(fecha_pedido)
    FROM pedidos
    GROUP BY id_pedido
)
ORDER BY c.nombre;


--Realiza una consulta que agrupe los pedidos por cliente y encuentre la fecha máxima de cada grupo y los ordene mayor a menor para saber cuál es el más reciente
SELECT id_pedido, MAX(fecha_pedido) AS fecha_maxima
FROM Pedidos
GROUP BY id_pedido
ORDER BY fecha_maxima DESC;


-- Selecciona el nombre del cliente, la fecha del pedido y el nombre del producto para obtener el resultado deseado.
SELECT c.nombre AS nombre_cliente, p.fecha_pedido, pr.nombre_producto
FROM Clientes c, Pedidos p, Productos pr
WHERE c.ID = p.id_pedido
AND p.ID = pr.id_producto;


select * from clientes
select * from pedidos
select * from productos