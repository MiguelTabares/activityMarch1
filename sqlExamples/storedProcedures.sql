-- Active: 1709317028701@@bmdhyfbfju3xhih498gm-mysql.services.clever-cloud.com@3306@bmdhyfbfju3xhih498gm
CREATE TABLE IF NOT EXISTS usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT
);

INSERT INTO usuarios (nombre, edad)
VALUES 
('David Hernández', 28),
('Ángela Urrutia', 27),
('Luisa Ortega', 29);


--Ejemplo 1: Procedimiento almacenado 1 - Crear una nueva tabla
DELIMITER $$
CREATE PROCEDURE crear_tabla()
BEGIN
    CREATE TABLE IF NOT EXISTS nueva_tabla (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50),
        edad INT
    );
END
DELIMITER ;

--Ejemplo 2: Procedimiento almacenado 2 - Insertar datos en la nueva tabla

DELIMITER $$
CREATE PROCEDURE insertar_datos(nombre_param VARCHAR(50), edad_param INT)
BEGIN
    INSERT INTO nueva_tabla (nombre, edad) VALUES (nombre_param, edad_param);
END $$
DELIMITER ;

--Ejemplo 3: Procedimiento almacenado 3 - Actualizar datos en la nueva tabla

DELIMITER &&
CREATE PROCEDURE actualizar_edad(IN id_param INT, IN nueva_edad INT)
BEGIN
    UPDATE nueva_tabla SET edad = nueva_edad WHERE id = id_param;
END &&
DELIMITER ;

--Ejemplo 4: Procedimiento almacenado 4 - Eliminar datos en la nueva tabla

DELIMITER $$
CREATE PROCEDURE eliminar_registro(IN id_param INT)
BEGIN
    DELETE FROM nueva_tabla WHERE id = id_param;
END $$
DELIMITER ;

--Ejemplo 5: Procedimiento almacenado 5 - Seleccionar datos de la nueva tabla

DELIMITER $$
CREATE PROCEDURE seleccionar_datos()
BEGIN
    SELECT * FROM nueva_tabla;
END $$
DELIMITER ;

