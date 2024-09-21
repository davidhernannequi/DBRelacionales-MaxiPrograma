--create database ReseniasTechDB

use ReseniasTechDB
go


create table Resenias (
Id int identity(1,1) not null,
IdArticulo int not null,
IdUsuario int not null,
Puntuacion float not null,
Comentario varchar(500),
Fecha date not null
)

create table Usuarios (
Id int identity(1,1) not null,
Nombre varchar(50),
Email varchar(50),
IdPais int
)

create table Articulos (
Id int identity(1,1) not null,
Nombre varchar(50),
Descripcion varchar(250),
IdCategoria int,
Precio money
)

create table Categorias (
Id int identity(1,1) not null,
Nombre varchar(50)
)

create table Paises (
Id int identity(1,1) not null,
Nombre varchar(50)
)

Alter table Resenias
ADD CONSTRAINT PK_Resenias_Id PRIMARY KEY(Id);

Alter table Usuarios
ADD CONSTRAINT PK_Usuarios_Id PRIMARY KEY(Id);

Alter table Articulos
ADD CONSTRAINT PK_Articulos_Id PRIMARY KEY(Id);

Alter table Categorias
ADD CONSTRAINT PK_Categorias_Id PRIMARY KEY(Id);

Alter table Paises
ADD CONSTRAINT PK_Paises_Id PRIMARY KEY(Id);


Alter table Resenias
ADD 
CONSTRAINT FK_Resenias_IdArticulo_Articulos_Id FOREIGN KEY (IdArticulo) REFERENCES Articulos(Id),
CONSTRAINT FK_Resenias_IdUsuario_Usuarios_Id FOREIGN KEY (IdUsuario) REFERENCES Usuarios(Id);

Alter table Usuarios
ADD
CONSTRAINT FK_Usuarios_IdPais_Paises_Id FOREIGN KEY (IdPais) REFERENCES Paises(Id);

Alter table Articulos
ADD
CONSTRAINT FK_Articulos_IdCategoria_Categorias_Id FOREIGN KEY (IdCategoria) REFERENCES Categorias(Id);