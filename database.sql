INSERT INTO AUTOR (id_autor, nombre, nacionalidad, fecha_nacimiento) VALUES
(1, 'Luis Fernandez', 'Mexicana', '1980-04-12'),
(2, 'elena Vazquez', 'Argentina', '1975-11-23'),
(3, 'Roberto Jimenez', 'chileno', '1969-08-15');

INSERT INTO EDITORIAL (id_editorial, nombre, pais) VALUES
(1, 'ediciones Aurora', 'México'),
(2, 'Letras del Sur', 'Argentina'),
(3, 'Imprenta Solaris', 'Chile');

INSERT INTO CATEGORIA (id_categoria, nombre, descripcion) VALUES
(1, 'Misterio', 'Historias con suspenso'),
(2, 'Aventura', 'relatos de exploracion'),
(3, 'Fantastico', 'Mundos imaginarios');

INSERT INTO UBICACION (id_ubicacion, seccion, estante, descripcion) VALUES
(1, 'X', '10', 'Zona de misterio'),
(2, 'Y', '7', 'Área de aventuras'),
(3, 'Z', '3', 'Sector de fantasia');

INSERT INTO LIBRO (id_libro, titulo, genero, isbn, disponible, id_categoria, id_editorial, id_ubicacion) VALUES
(1, 'El misterio del bosque', 'Misterio', '12345678', TRUE, 1, 2, 1),
(2, 'Viaje a lo desconocido', 'Aventura', '97654321', TRUE, 2, 3, 2),
(3, 'Alicia mágica', 'Fantástico', '21355466', FALSE, 3, 1, 3);


INSERT INTO LIBRO_AUTOR (id_libro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO PUBLICACION (id_publicacion, id_libro, edicion, fecha_publicacion, id_editorial) VALUES
(1, 1, '1ra Edición', '2010-09-12', 2),
(2, 2, '1ra Edición', '2015-06-26', 3),
(3, 3, '1ra Edición', '2020-01-28', 1);


INSERT INTO MIEMBRO (id_miembro, nombre, email, telefono, fecha_registro, estado_activo) VALUES
(1, 'Juan perez', 'juanp@gmail.com', '3123246699', '2023-01-15', TRUE),
(2, 'Ana Gomez', 'ana.gomez@yahoo.com', '3012345678', '2022-12-20', TRUE);

INSERT INTO BIBLIOTECARIO (id_bibliotecario, nombre, email, telefono, fecha_contratacion) VALUES
(1, 'Carlos rodriguez', 'carlos@biblioteca.com', '3123456789', '2021-07-10');

INSERT INTO TRANSACCION (id_transaccion, id_libro, id_miembro, id_bibliotecario, fecha_prestamo, fecha_devolucion, devuelto) VALUES
(1, 3, 1, 1, '2024-02-01', '2024-02-15', FALSE);

INSERT INTO MULTA (id_multa, id_miembro, id_transaccion, monto, fecha_emision, pagada) VALUES
(1, 1, 1, 15.00, '2024-02-20', FALSE);

