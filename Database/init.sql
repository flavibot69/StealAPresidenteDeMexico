CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    puntaje INT DEFAULT 0
);

INSERT INTO usuarios (nombre, puntaje) VALUES
('Genaro', 10),
('Compañero', 20),
('JugadorX', 5);
