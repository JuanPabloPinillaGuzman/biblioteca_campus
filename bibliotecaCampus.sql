CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE AUTOR (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(30),
    nacionalidad VARCHAR(20),
    fecha_nacimiento DATE
);

CREATE TABLE EDITORIAL (
    id_editorial INT PRIMARY KEY,
    nombre VARCHAR(30),
    pais VARCHAR(20)
);

CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(30),
    descripcion TEXT
);

CREATE TABLE UBICACION (
    id_ubicacion INT PRIMARY KEY,
    seccion VARCHAR(20),
    estante VARCHAR(20),
    descripcion TEXT
);

CREATE TABLE LIBRO (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(20),
    genero VARCHAR(20),
    isbn VARCHAR(30),
    disponible BOOLEAN,
    id_categoria INT,
    id_editorial INT,
    id_ubicacion INT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
    FOREIGN KEY (id_editorial) REFERENCES EDITORIAL(id_editorial),
    FOREIGN KEY (id_ubicacion) REFERENCES UBICACION(id_ubicacion)
);

CREATE TABLE LIBRO_AUTOR (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES LIBRO(id_libro),
    FOREIGN KEY (id_autor) REFERENCES AUTOR(id_autor)
);

CREATE TABLE PUBLICACION (
    id_publicacion INT PRIMARY KEY,
    id_libro INT,
    edicion VARCHAR(20),
    fecha_publicacion DATE,
    id_editorial INT,
    FOREIGN KEY (id_libro) REFERENCES LIBRO(id_libro),
    FOREIGN KEY (id_editorial) REFERENCES EDITORIAL(id_editorial)
);

CREATE TABLE MIEMBRO (
    id_miembro INT PRIMARY KEY,
    nombre VARCHAR(30),
    email VARCHAR(30),
    telefono VARCHAR(20),
    fecha_registro DATE,
    estado_activo BOOLEAN
);

CREATE TABLE BIBLIOTECARIO (
    id_bibliotecario INT PRIMARY KEY,
    nombre VARCHAR(30),
    email VARCHAR(30),
    telefono VARCHAR(20),
    fecha_contratacion DATE
);

CREATE TABLE TRANSACCION (
    id_transaccion INT PRIMARY KEY,
    id_libro INT,
    id_miembro INT,
    id_bibliotecario INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    devuelto BOOLEAN,
    FOREIGN KEY (id_libro) REFERENCES LIBRO(id_libro),
    FOREIGN KEY (id_miembro) REFERENCES MIEMBRO(id_miembro),
    FOREIGN KEY (id_bibliotecario) REFERENCES BIBLIOTECARIO(id_bibliotecario)
);

CREATE TABLE MULTA (
    id_multa INT PRIMARY KEY,
    id_miembro INT,
    id_transaccion INT,
    monto DECIMAL(10,2),
    fecha_emision DATE,
    pagada BOOLEAN,
    FOREIGN KEY (id_miembro) REFERENCES MIEMBRO(id_miembro),
    FOREIGN KEY (id_transaccion) REFERENCES TRANSACCION(id_transaccion)
);
