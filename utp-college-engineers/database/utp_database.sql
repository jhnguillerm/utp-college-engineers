CREATE DATABASE utp_database;

USE utp_database;

CREATE TABLE noticia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imagen BLOB,
    titulo VARCHAR(255),
    fecha_publicacion DATE,
    descripcion TEXT,
    imagen_url VARCHAR(255)
);

DROP TABLE noticia;

DELETE FROM noticias;

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'UTP conforma un Comité Ambiental para promover iniciativas de sostenibilidad', '2023-10-16', 'Con el objetivo de seguir contribuyendo al cuidado del medioambiente a través de acciones y proyectos institucionales, la UTP ha conformado un Comité Ambiental liderado por la Gerencia de Inclusión', 'images/noticias/n-1.jpg'),
    (NULL, 'Estudiantes extranjeros realizan movilidad estudiantil', '2023-10-04', 'Estudiantes de la Universidad Federal de Pernambuco (Brasil), el Instituto Federal de Pernambuco (Brasil), la Universidad Michoacana de San Nicolás de Hidalgo (México), la Universidad del Istmo Pa', 'images/noticias/n-2.jpg'),
    (NULL, 'Innovation Challenge: Estudiantes UTP desarrollaron soluciones', '2023-09-28', 'Durante un mes lleno de energía y colaboración, nuestros estudiantes de Lima, Arequipa y Chiclayo del Programa IMPULSA, aceleradora de talento de UTP, se enfrentaron al desafío de proponer soluciones', 'images/noticias/n-3.jpg');

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'UTP conforma un Comité Ambiental', '2023-10-16', 'Con el objetivo de seguir contribuyendo al cuidado del medioambiente a través de acciones y proyectos institucionales, la UTP ha conformado un Comité Ambiental liderado por la Gerencia de Inclusión', 'images/noticias/n-1.jpg');

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'La UTP se une a la UMAP', '2023-09-25', 'La Universidad Tecnológica del Perú anuncia su incorporación a UMAP, una red de movilidad universitaria que promueve el intercambio académico y cultural entre instituciones de educación superior de 25 países.', 'images/noticias/n-4.jpg');

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'Estudiantes extranjeros realizaron movilidad estudiantil en la UTP', '2023-10-04', 'Estudiantes de la Universidad Federal de Pernambuco (Brasil), el Instituto Federal de Pernambuco (Brasil), la Universidad Michoacana de San Nicolás de Hidalgo (México), la Universidad del Istmo (Panamá) y la Universidad Nacional de Itapúa (Paraguay) realizaron movilidad presencial y virtual en la UTP durante un ciclo académico.', 'images/noticias/n-5.jpg');

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'UTP capacita a Docentes de colegios en la elaboración de podcasts en quechua lambayecano', '2023-08-29', 'En nuestra región, más de 25 mil personas (2.34 % de la población lambayecana) tienen como lengua materna el quechua, según el último censo realizado por el Instituto Nacional de Estadística e Informática (INEI), en 2017. Ante esta realidad, el equipo de Investigación del Campus Chiclayo de la Universidad Tecnológica del Perú (UTP), en alianza con la Gerencia Regional de Educación de Lambayeque (GRED), se encuentra capacitando a docentes de colegios nacionales, de educación básica regular, sobre la elaboración de podcasts en esta lengua. Ello beneficiará a los escolares de ciertas zonas rurales de la región, al contribuir en la reducción de la brecha lingüística, además de fortalecer su cultura y ampliar su aprendizaje.', 'images/noticias/n-6.jpg');

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'Trabajo de investigación de egresados de UTP busca revalorar hongo de Marayhuaca', '2023-08-22', 'Franco Farroñay y Magaly Escobedo, egresados de Ingeniería Industrial del Campus Chiclayo de la Universidad Tecnológica del Perú (UTP), desarrollan el proyecto de investigación “Elaboración y formulación de hamburguesas a base de hongo de Marayhuaca”, en alianza con el Centro de Innovación Tecnológica Turístico Artesanal Sipán (CITE Sipán), el Ministerio de Comercio Exterior y Turismo y la empresa Simbiosis S.A.C. El trabajo lo realizan con la asesoría del Docente Jorge Leiva, quien también los asesora en sus tesis. ', 'images/noticias/n-7.jpg');

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'Programa de ONU brindó conferencia sobre voluntariado a estudiantes del Campus Piura', '2023-08-21', 'Más de 200 estudiantes del Campus UTP Piura participaron en una charla organizada por el Programa de Voluntarios de las Naciones Unidas (VNU), de la mano con el Organismo de las Naciones Unidas para la Migración (OIM). El objetivo de la actividad fue Informar a los jóvenes interesados en ser parte de VNU sobre los tipos de voluntariado, los requisitos de edad, experiencia y estudios necesarios para aplicar, así como los beneficios de ser un miembro voluntario de las Naciones Unidas.', 'images/noticias/n-8.jpg');

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'Estudiantes UTP participaron en actividades del Instituto de Ingenieros de Minas del Perú', '2023-08-10', 'Estudiantes del Campus San Juan de Lurigancho de la UTP asistieron a los Jueves Mineros del Instituto de Ingenieros de Minas del Perú, reunión en la que semana a semana se presenta lo último de la ciencia y tecnología, los más recientes avances y proyectos mineros, entre otros temas de actualidad relacionados con la industria.', 'images/noticias/n-9.jpg');

INSERT INTO noticia (imagen, titulo, fecha_publicacion, descripcion, imagen_url)
VALUES
    (NULL, 'Cerro Verde y la Universidad Tecnológica del Perú firman convenio para impulsar capacitación de mujeres emprendedoras', '2023-08-26', 'Sociedad Minera Cerro Verde y la Universidad Tecnológica del Perú (UTP) suscribieron un convenio de cooperación institucional que permitirá a las mujeres emprendedoras de Arequipa generarse nuevas oportunidades laborales a través de la capacitación en gestión de negocios, utilizando el exitoso programa global denominado DreamBuilder.', 'images/noticias/n-10.jpg');
