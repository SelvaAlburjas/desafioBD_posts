CREATE DATABASE posts;
\c posts
--Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
--contenido y descripción.

CREATE TABLE post(
    id VARCHAR(12),
    nombre_usuario VARCHAR(255),
    fecha_creacion DATE,
    contenido VARCHAR(255),
    descripcion VARCHAR(255),
    PRIMARY KEY (id)
);


--Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post(id,nombre_usuario, fecha_creacion, contenido,descripcion) VALUES
('P000001', 'Pamela', '2022-05-15', 'Estilo y Moda', 'En este espacio tocaremos todo lo referente a la colección invierno');

INSERT INTO post(id,nombre_usuario, fecha_creacion, contenido,descripcion) VALUES
('P000002', 'Pamela', '2022-05-20', 'Salud', 'En este espacio tocaremos todo lo referente a la salud');

INSERT INTO post(id,nombre_usuario, fecha_creacion, contenido,descripcion) VALUES
('P000003', 'Carlos', '2022-05-22', 'Desconectate', 'En este espacio tocaremos todo lo referente a disfrutar más del aire libre');

--Modificar la tabla post, agregando la columna título.

ALTER TABLE post ADD titulo VARCHAR(100);

--Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo = 'Actualidad' WHERE id = 'P000001';
UPDATE post SET titulo = 'Tendencia' WHERE id = 'P000002';
UPDATE post SET titulo = 'Tecnología' WHERE id = 'P000003';

--Insertar 2 post para el usuario "Pedro".
INSERT INTO post(id,nombre_usuario, fecha_creacion, contenido,descripcion,titulo) VALUES
('P000004', 'Pedro', '2022-05-22', 'Deportes', 'Colo-colo en la cima', 'Campeones');
INSERT INTO post(id,nombre_usuario, fecha_creacion, contenido,descripcion,titulo) VALUES
('P000005', 'Pedro', '2022-05-22', 'Deportes', 'UC no avanza', 'Actualidad');

--Eliminar el post de Carlos.
DELETE FROM post WHERE nombre_usuario='Carlos';

--Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post(id,nombre_usuario, fecha_creacion, contenido,descripcion,titulo) VALUES
('P000006', 'Carlos', '2022-05-22', 'Postgres', 'Ve a otrol nivel con SQL', 'Tecnología');

--Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts.
CREATE TABLE comentarios(
    id_comen SERIAL,
    fecha DATE,
    hora_creacion TIME,
    contenido VARCHAR(255),
    post_id VARCHAR(12),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

--Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". 
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '12:00:00', 'Mientras mas comodos mejor', 'P000001');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '12:00:00', 'Come Sano', 'P000002');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '12:00:00', 'Futbol', 'P000006');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '13:00:00', 'Tenis', 'P000006');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '14:00:00', 'Beisbol', 'P000006');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '15:00:00', 'Natación', 'P000006');

--Crear un nuevo post para "Margarita". 
INSERT INTO post(id,nombre_usuario, fecha_creacion, contenido,descripcion,titulo) VALUES
('P000007', 'Margarita', '2022-05-22', 'Cocina', 'Comida Venezolana', 'Arepas');

--Ingresar 5 comentarios para el post de Margarita. 
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '16:00:00', 'Tequeños', 'P000007');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '17:00:00', 'Hallacas', 'P000007');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '18:00:00', 'Pabellon', 'P000007');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '19:00:00', 'Patacón', 'P000007');
INSERT INTO comentarios(fecha, hora_creacion, contenido, post_id) VALUES
('2022-05-23', '20:00:00', 'Cachapas', 'P000007');


