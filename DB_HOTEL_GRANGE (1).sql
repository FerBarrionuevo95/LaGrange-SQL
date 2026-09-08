CREATE DATABASE hotel_grange;
USE hotel_grange;

-- 1. TABLAS 

CREATE TABLE sector (
    id_sector INT AUTO_INCREMENT PRIMARY KEY,
    areas VARCHAR(40),
    descripcion VARCHAR(100)
);

CREATE TABLE staff (
    id_staff INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40),
    apellido VARCHAR(40),
    nacimiento DATE,
    nacionalidad VARCHAR(40),
    DNI INT,
    labor VARCHAR(40),
    email VARCHAR(40),
    id_sector INT,
    FOREIGN KEY (id_sector) REFERENCES sector(id_sector)
);

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    cantidad INT,
    stock INT,
    id_sector INT,
    FOREIGN KEY (id_sector) REFERENCES sector(id_sector)
);

CREATE TABLE hotel (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    habitaciones VARCHAR(50),
    personas INT,
    garage INT
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40),
    apellido VARCHAR(40),
    nacimiento DATE,
    nacionalidad VARCHAR(40),
    DNI INT,
    email VARCHAR(40),
    dia_activ DATE
);

CREATE TABLE huespedes (
    id_huesped INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40),
    apellido VARCHAR(40),
    nacimiento DATE,
    nacionalidad VARCHAR(40),
    DNI INT,
    email VARCHAR(40),
    check_in DATE,
    check_out DATE,
    id_habitacion INT,
    FOREIGN KEY (id_habitacion) REFERENCES hotel(id_habitacion)
);

CREATE TABLE actividades(
    cod_activ INT AUTO_INCREMENT PRIMARY KEY,
    activ VARCHAR(40),
    turno DATE,
    id_staff INT,
    id_huesped INT,
    id_cliente INT,
    FOREIGN KEY (id_staff) REFERENCES staff(id_staff),
    FOREIGN KEY (id_huesped) REFERENCES huespedes(id_huesped),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE granja (
    id_animales INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    nacimiento DATE,
    tipo VARCHAR(40),
    fecha_vet DATE,
    observaciones VARCHAR(100),
    cod_activ INT,
    id_staff INT,
    FOREIGN KEY (cod_activ) REFERENCES actividades(cod_activ),
    FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(40),
    cantidad INT,
    stock INT DEFAULT 0,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE restaurante (
    id_restaurante INT AUTO_INCREMENT PRIMARY KEY,
    turno DATE,
    tipo VARCHAR(40),
    alergias VARCHAR(40),
    personas INT,
    stock INT,
    id_proveedor INT,
    id_cliente INT,
    id_huesped INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_huesped) REFERENCES huespedes(id_huesped)
);
CREATE TABLE reservas_hotel (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    fecha_reserva DATE,
    id_huesped INT,
    id_habitacion INT,
    estado VARCHAR(30),
    FOREIGN KEY (id_huesped) REFERENCES huespedes(id_huesped),
    FOREIGN KEY (id_habitacion) REFERENCES hotel(id_habitacion)
);
CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    fecha_pago DATE,
    monto DECIMAL(10,2),
    metodo VARCHAR(30),
    id_reserva INT,
    FOREIGN KEY (id_reserva) REFERENCES reservas_hotel(id_reserva)
);
CREATE TABLE facturacion (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    total DECIMAL(10,2),
    id_pago INT,
    FOREIGN KEY (id_pago) REFERENCES pagos(id_pago)
);
CREATE TABLE tipos_actividad (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50)
);
CREATE TABLE actividades_detalle (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_actividad INT,
    id_tipo INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (id_actividad) REFERENCES actividades(cod_activ),
    FOREIGN KEY (id_tipo) REFERENCES tipos_actividad(id_tipo)
);
CREATE TABLE categorias_productos (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);
CREATE TABLE historial_stock (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
CREATE TABLE turnos_staff (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    turno VARCHAR(20),
    id_staff INT,
    FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);
CREATE TABLE mantenimiento_habitaciones (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    descripcion VARCHAR(100),
    id_habitacion INT,
    FOREIGN KEY (id_habitacion) REFERENCES hotel(id_habitacion)
);
CREATE TABLE opiniones_clientes (
    id_opinion INT AUTO_INCREMENT PRIMARY KEY,
    comentario TEXT,
    puntuacion INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

SHOW TABLES;
-- INSERT 
INSERT INTO sector (areas, descripcion) VALUES
('Recepción', 'Atención al cliente'),
('Granja', 'Cuidado de animales'),
('Restaurante', 'Servicio de comidas');


INSERT INTO staff (nombre, apellido, nacimiento, nacionalidad, DNI, labor, email, id_sector) VALUES
('Ana', 'Lopez', '1990-05-10', 'Española', 12345678, 'Recepcionista', 'ana@gmail.com', 1),
('Juan', 'Perez', '1985-08-20', 'Argentina', 23456789, 'Granjero', 'juan@mail.com', 2);


INSERT INTO hotel (habitaciones, personas, garage) VALUES
('Suite 1', 2, 1),
('Habitación Familiar', 4, 1);


INSERT INTO clientes (nombre, apellido, nacimiento, nacionalidad, DNI, email, dia_activ) VALUES
('Laura', 'Gomez', '1995-06-15', 'Española', 34567890, 'laura@gmail.com', '2026-03-20');


INSERT INTO huespedes (nombre, apellido, nacimiento, nacionalidad, DNI, email, check_in, check_out, id_habitacion) VALUES
('Carlos', 'Ruiz', '1988-02-10', 'Española', 45678901, 'carlos@gmail.com', '2026-03-01', '2026-03-05', 1);


INSERT INTO actividades (activ, turno, id_staff, id_huesped, id_cliente) VALUES
('Visita a la granja', '2026-03-02', 2, 1, 1);


INSERT INTO granja (nombre, edad, nacimiento, tipo, fecha_vet, observaciones, cod_activ, id_staff) VALUES
('Vaca Lola', 5, '2020-01-01', 'Vaca', '2026-01-10', 'Saludable', 1, 2);


INSERT INTO proveedores (tipo, cantidad, stock, id_sector) VALUES
('Alimentos', 100, 50, 3);


INSERT INTO productos (tipo, cantidad, stock, id_proveedor) VALUES
('Queso', 20, 10, 1);


INSERT INTO restaurante (turno, tipo, alergias, personas, stock, id_proveedor, id_cliente, id_huesped) VALUES
('2026-03-03', 'Cena', 'Ninguna', 2, 5, 1, 1, 1);

INSERT INTO reservas_hotel (fecha_reserva, id_huesped, id_habitacion, estado) VALUES
('2026-03-01', 1, 1, 'Confirmada'),
('2026-03-02', 1, 2, 'Pendiente');

INSERT INTO pagos (fecha_pago, monto, metodo, id_reserva) VALUES
('2026-03-01', 200.50, 'Tarjeta', 1),
('2026-03-02', 150.00, 'Efectivo', 2);

INSERT INTO facturacion (fecha, total, id_pago) VALUES
('2026-03-01', 200.50, 1),
('2026-03-02', 150.00, 2);

INSERT INTO tipos_actividad (descripcion) VALUES
('Granja'),
('Paseo'),
('Degustación');

INSERT INTO actividades_detalle (id_actividad, id_tipo, precio) VALUES
(1, 1, 50.00),
(1, 2, 30.00);

INSERT INTO categorias_productos (nombre) VALUES
('Lácteos'),
('Souvenirs');

INSERT INTO historial_stock (fecha, id_producto, cantidad) VALUES
('2026-03-01', 1, 10),
('2026-03-02', 1, -5);

INSERT INTO turnos_staff (fecha, turno, id_staff) VALUES
('2026-03-01', 'Mañana', 1),
('2026-03-01', 'Tarde', 2);

INSERT INTO mantenimiento_habitaciones (fecha, descripcion, id_habitacion) VALUES
('2026-03-01', 'Revisión general', 1);

INSERT INTO opiniones_clientes (comentario, puntuacion, id_cliente) VALUES
('Excelente servicio', 5, 1),
('Muy buena experiencia', 4, 1);

SELECT * FROM pagos;
SELECT * FROM facturacion;
SELECT * FROM historial_stock;

-- VISTAS

CREATE VIEW vista_huespedes_hotel AS
SELECT 
    h.nombre,
    h.apellido,
    h.check_in,
    h.check_out,
    ho.habitaciones
FROM huespedes h
JOIN hotel ho ON h.id_habitacion = ho.id_habitacion;

CREATE VIEW vista_actividades AS
SELECT 
    a.activ,
    a.turno,
    s.nombre AS staff_nombre,
    c.nombre AS cliente_nombre,
    h.nombre AS huesped_nombre
FROM actividades a
LEFT JOIN staff s ON a.id_staff = s.id_staff
LEFT JOIN clientes c ON a.id_cliente = c.id_cliente
LEFT JOIN huespedes h ON a.id_huesped = h.id_huesped;

CREATE VIEW vista_restaurante AS
SELECT 
    r.tipo,
    r.turno,
    r.personas,
    c.nombre AS cliente,
    h.nombre AS huesped
FROM restaurante r
LEFT JOIN clientes c ON r.id_cliente = c.id_cliente
LEFT JOIN huespedes h ON r.id_huesped = h.id_huesped;

SELECT * FROM vista_huespedes_hotel;
SELECT * FROM vista_actividades;
SELECT * FROM vista_restaurante;

CREATE VIEW vista_ingresos_totales AS
SELECT 
    SUM(monto) AS total_ingresos
FROM pagos;
CREATE VIEW vista_ingresos_por_dia AS
SELECT 
    fecha_pago,
    SUM(monto) AS total_dia
FROM pagos
GROUP BY fecha_pago;
CREATE VIEW vista_actividades_populares AS
SELECT 
    activ,
    COUNT(*) AS cantidad
FROM actividades
GROUP BY activ;
CREATE VIEW vista_ocupacion_hotel AS
SELECT 
    ho.habitaciones,
    COUNT(h.id_huesped) AS ocupacion
FROM hotel ho
LEFT JOIN huespedes h ON ho.id_habitacion = h.id_habitacion
GROUP BY ho.habitaciones;
CREATE VIEW vista_stock_productos AS
SELECT 
    p.tipo,
    SUM(hs.cantidad) AS stock_total
FROM productos p
JOIN historial_stock hs ON p.id_producto = hs.id_producto
GROUP BY p.tipo;

SELECT * FROM vista_ingresos_totales;
SELECT * FROM vista_ingresos_por_dia;
SELECT * FROM vista_actividades_populares;
SELECT * FROM vista_ocupacion_hotel;
SELECT * FROM vista_stock_productos;

-- FUNCIONES
DELIMITER //
CREATE FUNCTION total_huespedes()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM huespedes;
    
    RETURN total;
END //

DELIMITER ;

SELECT total_huespedes();

DELIMITER //

CREATE FUNCTION actividades_por_cliente(id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM actividades
    WHERE id_cliente = id;
    
    RETURN total;
END //
DELIMITER ;
SELECT actividades_por_cliente(1);

DELIMITER //

CREATE FUNCTION calcular_total_pagos()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(monto) INTO total
    FROM pagos;

    RETURN total;
END //

DELIMITER ;

SELECT IFNULL(SUM(monto),0) INTO total
FROM pagos;

SELECT calcular_total_pagos();

DELIMITER //

CREATE FUNCTION contar_reservas_cliente(p_id_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM reservas_hotel
    WHERE id_cliente = p_id_cliente;

    RETURN total;
END //

DELIMITER ;


-- STORED PROCEDURES
DELIMITER //

CREATE PROCEDURE agregar_cliente (
    IN p_nombre VARCHAR(40),
    IN p_apellido VARCHAR(40),
    IN p_nacimiento DATE,
    IN p_nacionalidad VARCHAR(40),
    IN p_DNI INT,
    IN p_email VARCHAR(40),
    IN p_dia_activ DATE
)
BEGIN
    INSERT INTO clientes (nombre, apellido, nacimiento, nacionalidad, DNI, email, dia_activ)
    VALUES (p_nombre, p_apellido, p_nacimiento, p_nacionalidad, p_DNI, p_email, p_dia_activ);
END //

DELIMITER ;

CALL agregar_cliente('Mario', 'Lopez', '1992-05-10', 'Española', 99999999, 'mario@gmail.com', '2026-03-25');

DELIMITER //

CREATE PROCEDURE ver_actividades_cliente (
    IN p_id_cliente INT
)
BEGIN
    SELECT *
    FROM actividades
    WHERE id_cliente = p_id_cliente;
END //

DELIMITER ;

CALL ver_actividades_cliente(1);

DELIMITER //

CREATE PROCEDURE registrar_pago(
    IN p_fecha DATE,
    IN p_monto DECIMAL(10,2),
    IN p_metodo VARCHAR(50),
    IN p_id_reserva INT
)
BEGIN
    INSERT INTO pagos (fecha_pago, monto, metodo, id_reserva)
    VALUES (p_fecha, p_monto, p_metodo, p_id_reserva);
END //

DELIMITER ;

CALL registrar_pago('2026-03-10', 500, 'Tarjeta', 1);

DROP PROCEDURE IF EXISTS reservas_por_cliente;

DELIMITER //

CREATE PROCEDURE reservas_por_cliente(
    IN p_id_cliente INT
)
BEGIN
    SELECT r.*
    FROM reservas_hotel r
    JOIN huespedes h ON r.id_huesped = h.id_huesped
    WHERE h.id_cliente = p_id_cliente;
END //

DELIMITER ;

CALL reservas_por_cliente(1);


-- TRIGEER
DELIMITER //

CREATE TRIGGER actualizar_stock_proveedor
AFTER INSERT ON productos
FOR EACH ROW
BEGIN
    UPDATE proveedores
    SET stock = stock + NEW.cantidad
    WHERE id_proveedor = NEW.id_proveedor;
END //

DELIMITER ;
INSERT INTO productos (tipo, cantidad, stock, id_proveedor)
VALUES ('Leche', 10, 0, 1);

SELECT * FROM proveedores;


DELIMITER //

CREATE TRIGGER generar_factura
AFTER INSERT ON pagos
FOR EACH ROW
BEGIN
    INSERT INTO facturacion (fecha, total, id_pago)
    VALUES (NEW.fecha_pago, NEW.monto, NEW.id_pago);
END //

DELIMITER ;

INSERT INTO pagos (fecha_pago, monto, metodo, id_reserva)
VALUES ('2026-03-05', 300.00, 'Tarjeta', 1);

SELECT * FROM facturacion; 

-- Inserción de datos en pagos
INSERT INTO pagos (fecha_pago, monto, metodo, id_reserva) VALUES
('2026-03-03', 180.00, 'Tarjeta', 1),
('2026-03-03', 220.00, 'Efectivo', 2),
('2026-03-04', 150.00, 'Transferencia', 1),
('2026-03-04', 300.00, 'Tarjeta', 2),
('2026-03-05', 250.00, 'Efectivo', 1),
('2026-03-06', 400.00, 'Tarjeta', 2),
('2026-03-06', 100.00, 'Efectivo', 1),
('2026-03-07', 350.00, 'Transferencia', 2);


SELECT * FROM vista_ingresos_por_dia;