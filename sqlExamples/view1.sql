-- Active: 1709303123825@@bei2w3cxtoaeyn6fbprx-mysql.services.clever-cloud.com@3306@bei2w3cxtoaeyn6fbprx

-- Crear tabla clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Crear tabla productos
CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    stock INT
);

-- Crear tabla ventas
CREATE TABLE ventas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    cliente_id INT,
    fecha DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Crear tabla ordenes
CREATE TABLE ordenes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    cantidad INT,
    estado VARCHAR(20)
);

-- Insertar datos en la tabla clientes
INSERT INTO clientes (nombre, email) VALUES
('Rubén Aguirre', 'rubenagui@gmail.com'),
('Camilo Manco', 'milomanco@gmail.com'),
('Keity Ortega', 'keityorte@gmail.com'),
('Gabriel Lisboa', 'gaelic@gmail.com'),
('Cristian Sánchez', 'crisan@gmail.com'),
('Tamara Rivas', 'rivastama@gmail.com'),
('Pablo Manrique', 'manrioblopa@gmail.com'),
('Jhon Cárdenas', 'jhoncar@gmail.com'),
('Peter Landázuri', 'peterlanda@gmail.com'),
('Miguel Tabares', 'miguetaba@gmail.com');

DROP TABLE clientes;
DROP TABLE ventas;
DROP TABLE productos;
DROP TABLE ordenes;

-- Insertar datos en la tabla productos
INSERT INTO productos (nombre, precio, stock) VALUES
('Arroz', 12050, 50),
('Fríjol', 9999, 30),
('Papa', 15000, 20),
('Sal', 20000, 10),
('Azúcar', 8000, 15),
('Garbanzo', 11075, 25),
('Habicuela', 7520, 40),
('Arveja', 16000, 12),
('Papa criolla', 9050, 18),
('Yuca', 13025, 22);

-- Insertar datos en la tabla ventas
INSERT INTO ventas (producto_id, cliente_id, fecha, total) VALUES
(1, 1, '2024-01-01', 25000),
(2, 2, '2024-01-02', 15050),
(3, 3, '2024-01-03', 30000),
(4, 4, '2024-01-04', 45075),
(5, 5, '2024-01-05', 12000),
(6, 6, '2024-01-06', 20025),
(7, 7, '2024-01-07', 18000),
(8, 8, '2024-01-08', 28050),
(9, 9, '2024-01-09', 15075),
(10, 10, '2024-01-10', 32000);

-- Insertar datos en la tabla ordenes
INSERT INTO ordenes (producto_id, cantidad, estado) VALUES
(1, 5, 'pendiente'),
(2, 3, 'pendiente'),
(3, 2, 'en proceso'),
(4, 1, 'pendiente'),
(5, 4, 'en proceso'),
(6, 2, 'pendiente'),
(7, 6, 'en proceso'),
(8, 3, 'pendiente'),
(9, 2, 'en proceso'),
(10, 4, 'pendiente');


-- Ejemplo 1: Crear una vista que muestre los productos con un precio superior a $100
CREATE VIEW productos_costosos AS
SELECT * FROM productos WHERE precio > 100;

-- Ejemplo 2: Crear una vista que muestre el número de ventas por cliente
CREATE VIEW ventas_por_cliente AS
SELECT cliente_id, COUNT(*) AS num_ventas FROM ventas GROUP BY cliente_id;

-- Ejemplo 3: Crear una vista que muestre las órdenes pendientes
CREATE VIEW ordenes_pendientes AS
SELECT * FROM ordenes WHERE estado = 'pendiente';

-- Ejemplo 4: Crear una vista que muestre el total de ingresos mensuales
CREATE VIEW ingresos_mensuales AS
SELECT MONTH(fecha), SUM(total) AS ingresos FROM ventas GROUP BY MONTH(fecha);

-- Ejemplo 5: Crear una vista que muestre los productos agotados
CREATE VIEW productos_agotados AS
SELECT * FROM productos WHERE stock = 0;
