# biblioteca_campus

## Descripcion
Este proyecto consiste en hacer una base de datos para una biblioteca

## Diagramas
Diagrama conceptual:
![diagramaConceptual](https://github.com/user-attachments/assets/1b3f3cff-b897-4f80-8fa3-201d51d49dd0)

Diagrama Racional:
![racional](https://github.com/user-attachments/assets/1f73dc4b-781b-473a-825c-8f83712ba46d)

##Consultas

Listar todos los libros disponibles
```sql
SELECT id_libro, titulo, genero, isbn, disponible, id_categoria, id_editorial, id_ubicacion FROM LIBRO WHERE disponible = TRUE;
```

Buscar libros por género
```sql
SELECT id_libro, titulo, genero, isbn, disponible, id_categoria, id_editorial, id_ubicacion FROM LIBRO WHERE genero = 'Misterio';
```

Obtener información de un libro por ISBN
```sql
SELECT id_libro, titulo, genero, isbn, disponible, id_categoria, id_editorial, id_ubicacion FROM LIBRO WHERE isbn = '12345678';
```

Contar el número de libros en la biblioteca
```sql
SELECT COUNT(id_libro) FROM LIBRO;
```

Listar todos los autores
```sql
SELECT id_autor, nombre, nacionalidad, fecha_nacimiento FROM AUTOR;
```

Buscar autores por nombre
```sql
SELECT id_autor, nombre, nacionalidad, fecha_nacimiento FROM AUTOR WHERE nombre LIKE 'Luis Fernandez';
```

Obtener todos los libros de un autor específico
```sql
SELECT titulo FROM LIBRO
JOIN LIBRO_AUTOR ON LIBRO.id_libro = LIBRO_AUTOR.id_libro
JOIN AUTOR ON LIBRO_AUTOR.id_autor = AUTOR.id_autor
WHERE AUTOR.nombre = 'Luis Fernandez';
```

Listar todas las ediciones de un libro
```sql
SELECT id_publicacion, id_libro, edicion, fecha_publicacion, id_editorial FROM PUBLICACION WHERE id_libro = (SELECT id_libro FROM LIBRO WHERE titulo = 'El misterio del bosque');
```

Obtener la última edición de un libro
```sql
SELECT id_publicacion, id_libro, edicion, fecha_publicacion, id_editorial FROM PUBLICACION WHERE id_libro = (SELECT id_libro FROM LIBRO WHERE titulo = 'El misterio del bosque') ORDER BY fecha_publicacion DESC LIMIT 1;
```

Contar cuántas ediciones hay de un libro específico
```sql
SELECT COUNT(id_publicacion) FROM PUBLICACION WHERE id_libro = (SELECT id_libro FROM LIBRO WHERE titulo = 'El misterio del bosque');
```

Listar todas las transacciones de préstamo
```sql
SELECT id_transaccion, id_libro, id_miembro, id_bibliotecario, fecha_prestamo, fecha_devolucion, devuelto FROM TRANSACCION;
```

Obtener los libros prestados actualmente
```sql
SELECT id_transaccion, id_libro, id_miembro, id_bibliotecario, fecha_prestamo, fecha_devolucion, devuelto FROM TRANSACCION WHERE devuelto = FALSE;
```

Contar el número de transacciones de un miembro específico
```sql
SELECT COUNT(id_transaccion) FROM TRANSACCION WHERE id_miembro = (SELECT id_miembro FROM MIEMBRO WHERE nombre = 'Juan perez');
```

Listar todos los miembros de la biblioteca
```sql
SELECT id_miembro, nombre, email, telefono, fecha_registro, estado_activo FROM MIEMBRO;
```

Buscar un miembro por nombre:
```sql
SELECT id_miembro, nombre, email, telefono, fecha_registro, estado_activo FROM MIEMBRO WHERE nombre LIKE 'Juan perez';
```

Obtener las transacciones de un miembro específico
```sql
SELECT id_transaccion, id_libro, id_miembro, id_bibliotecario, fecha_prestamo, fecha_devolucion, devuelto FROM TRANSACCION WHERE id_miembro = (SELECT id_miembro FROM MIEMBRO WHERE nombre = 'Juan perez');
```

Listar todos los libros y sus autores
```sql
SELECT LIBRO.titulo, AUTOR.nombre FROM LIBRO
JOIN LIBRO_AUTOR ON LIBRO.id_libro = LIBRO_AUTOR.id_libro
JOIN AUTOR ON LIBRO_AUTOR.id_autor = AUTOR.id_autor;
```

Obtener el historial de préstamos de un libro específico
```sql
SELECT id_transaccion, id_libro, id_miembro, id_bibliotecario, fecha_prestamo, fecha_devolucion, devuelto FROM TRANSACCION WHERE id_libro = (SELECT id_libro FROM LIBRO WHERE titulo = 'Alicia mágica');
```

Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(id_transaccion) FROM TRANSACCION;
```

Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT LIBRO.titulo, PUBLICACION.edicion, PUBLICACION.fecha_publicacion, LIBRO.disponible
FROM LIBRO
LEFT JOIN PUBLICACION ON LIBRO.id_libro = PUBLICACION.id_libro
WHERE PUBLICACION.fecha_publicacion = (SELECT MAX(fecha_publicacion) FROM PUBLICACION WHERE id_libro = LIBRO.id_libro);
```
