CREATE SCHEMA socias;

USE socias;

CREATE TABLE Usuario (
	usuario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(15),
	apellido VARCHAR(20)  ,
    rut	VARCHAR(12)		,
    correo	VARCHAR(40)	,
    user	VARCHAR(15),
    contrasenia VARCHAR(15)	,
    nroDeTelefono	INTEGER 	,
    redSocial	VARCHAR(10)	,
    fechaCreacionCuenta	DATETIME	,
    status		CHAR(1)	,
    descripcion	VARCHAR(250)	,
    imagen VARCHAR(150)
);
CREATE TABLE Valoraciones (
	valoraciones_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   comentario VARCHAR (250),
   usuario_id INTEGER NOT NULL
);
ALTER TABLE Valoraciones
ADD FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id);
CREATE TABLE Foro (
	foro_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    titulo	VARCHAR	(50),
    categoria VARCHAR(20)	,
	cotenido TEXT(64000)	,
    usuario_id INTEGER NOT NULL,
    fecha DATETIME
);
ALTER TABLE Foro
ADD FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id);


CREATE TABLE ValoracionesForo (
	 valoracionesForo_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    valoracion_id  INTEGER NOT NULL    ,
    foro_id		INTEGER NOT NULL
);

ALTER TABLE ValoracionesForo
ADD FOREIGN KEY (valoracion_id) REFERENCES Valoraciones(valoraciones_id);
ALTER TABLE ValoracionesForo
ADD FOREIGN KEY (foro_id) REFERENCES Foro(foro_id);

CREATE TABLE InteresesUsuario (
	interesesUsuarios_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	intereses_id     INTEGER NOT NULL,
    usuario_id		INTEGER NOT NULL
);
ALTER TABLE InteresesUsuario
ADD FOREIGN KEY (intereses_id) REFERENCES Intereses(intereses_id);
ALTER TABLE InteresesUsuario
ADD FOREIGN KEY (usuarios_id) REFERENCES Usuario(usuario_id);
CREATE TABLE TutorialUsuario(
	tutorialUsiario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	usuario_id  INTEGER NOT NULL   ,
    tutorial_id	INTEGER NOT NULL
);
ALTER TABLE TutorialUsuario
ADD FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id);
ALTER TABLE TutorialUsuario
ADD FOREIGN KEY (tutorial_id) REFERENCES Tutorial(tutorial_id);
CREATE TABLE EventoUsuario(
	eventoUsuario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	usuario_id  INTEGER NOT NULL,
    evento_id	INTEGER NOT NULL
);

ALTER TABLE EventoUsuario
ADD FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id);
ALTER TABLE EventoUsuario
ADD FOREIGN KEY (evento_id) REFERENCES Evento(evento_id);


CREATE TABLE Intereses(
   intereses_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nombre VARCHAR (15)
   );
CREATE TABLE Rubro(
   rubro_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nombre VARCHAR (15)
   );
CREATE TABLE RubroUsuario(
   rubroUsuario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   rubro_id INTEGER NOT NULL,
   usuario_id INTEGER NOT NULL
   );
   
ALTER TABLE RubroUsuario
ADD FOREIGN KEY (rubro_id) REFERENCES Rubro (rubro_id);
ALTER TABLE RubroUsuario
ADD FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id);

CREATE TABLE Tutorial(
   tutorial_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   titulo VARCHAR (50),
   descripcion VARCHAR (250),
   contenido TEXT (64000),
   enlace VARCHAR (100),
   categoria VARCHAR (15)
   );
CREATE TABLE Evento(
   evento_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   titulo VARCHAR (50),
   descripcion VARCHAR (250),
   fecha DATETIME ,
   imagen VARCHAR (150)
   );
CREATE TABLE Noticia(
   noticia_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   titulo VARCHAR (50),
   descripcion VARCHAR (250),
   contenido TEXT (64000),
   fecha DATETIME 
   );
CREATE TABLE NoticiaUsuario(
   noticiaUsuario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   noticia_id INTEGER NOT NULL,
   usuario_id INTEGER NOT NULL
   );
ALTER TABLE NoticiaUsuario
ADD FOREIGN KEY (noticia_id) REFERENCES Noticia (noticia_id);
ALTER TABLE NoticiaUsuario
ADD FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id); 