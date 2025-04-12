- -- Crear la base de datos (ejecutar esto solo si aún no existe)
CREATE DATABASE biblioteca2025;

-- Conectarse a la base de datos
\c biblioteca2025;

-- Tabla: autores
CREATE TABLE IF NOT EXISTS autores (
  id SERIAL PRIMARY KEY,
  nombres VARCHAR(255) NOT NULL
);

-- Tabla: editorial
CREATE TABLE IF NOT EXISTS editorial (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL
);

-- Tabla: libros
CREATE TABLE IF NOT EXISTS libros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  copias INTEGER NOT NULL DEFAULT 1,
  estante INTEGER NOT NULL DEFAULT 1
);

-- Tabla de unión: autor_editorial_libro
CREATE TABLE IF NOT EXISTS autor_editorial_libro (
  id SERIAL PRIMARY KEY,
  autor_id INTEGER REFERENCES autores(id),
  editorial_id INTEGER REFERENCES editorial(id),
  libro_id INTEGER REFERENCES libros(id),
  fecha DATE -- Fecha de publicación
);

-- Tabla: usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE,
  numero VARCHAR(12)
);

-- Tabla: prestamos 
CREATE TABLE IF NOT EXISTS prestamos (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER NOT NULL,
  libro_id INTEGER NOT NULL,
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion DATE,
  estado CHARACTER VARYING(50) NOT NULL,
  multa NUMERIC(10, 2),
  notas TEXT,
  CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  CONSTRAINT fk_libro FOREIGN KEY (libro_id) REFERENCES libros(id) ON DELETE CASCADE,
  CONSTRAINT estado_valido CHECK (estado IN ('Prestado', 'Devuelto', 'Atrasado'))
);

-- Insertar datos iniciales
INSERT INTO autores (nombres) VALUES
  ('William Shakespeare'),
  ('Ruben Dario');

INSERT INTO editorial (nombre) VALUES
  ('Pearson'),
  ('Panini');

INSERT INTO libros (nombre, copias, estante) VALUES
  ('Romeo y Julieta', 1, 1),
  ('Dragonball', 1, 1),
  ('Azul...', 1, 1);

INSERT INTO autor_editorial_libro (autor_id, editorial_id, libro_id, fecha) VALUES
  (2, 1, 2, NULL),
  (2, 1, 3, NULL),
  (2, 2, 1, NULL);
