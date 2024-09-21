


create database GaleriaDeArteDB
go
use GaleriaDeArteDB
go

create table Obras (
Id int identity(1,1) not null,
Titulo varchar(50),
IdEstilo int,
IdArtista int
)

create table Estilos (
Id int identity(1,1),
Nombre varchar(50)
)

create table Artistas (
Id int identity(1,1),
Nombre varchar(50),
IdPais int
)

create table Paises (
Id int identity(1,1),
Nombre varchar(75)
)

create table Exposiciones (
Id int identity(1,1),
Nombre varchar(50),
FechaInicio date,
FechaFin date
)

create table ObrasExposiciones (
Id int identity(1,1),
IdObra int,
IdExposicion int
)



alter table Obras
ADD
CONSTRAINT PK_IdObra PRIMARY KEY(Id);

alter table Estilos
ADD
CONSTRAINT PK_IdEstilo PRIMARY KEY(Id);

alter table Artistas
ADD
CONSTRAINT PK_IdArtista PRIMARY KEY(Id);

alter table Paises
ADD
CONSTRAINT PK_IdPais PRIMARY KEY(Id);

alter table Exposiciones
ADD
CONSTRAINT PK_IdExposicion PRIMARY KEY(Id);

alter table ObrasExposiciones
ADD
CONSTRAINT PK_IdObraExposicion PRIMARY KEY(Id);



alter table Obras
ADD
CONSTRAINT FK_Obras_IdEstilo_Estilos_Id FOREIGN KEY(IdEstilo) REFERENCES Estilos(Id),
CONSTRAINT FK_Obras_IdArtista_Artistas_Id FOREIGN KEY(IdArtista) REFERENCES Artistas(Id);

alter table Artistas
ADD
CONSTRAINT FK_Artistas_IdPais_Paises_Id FOREIGN KEY(IdPais) REFERENCES Paises(Id);

alter table ObrasExposiciones
ADD
CONSTRAINT FK_ObrasExposiciones_IdObra_Obras_Id FOREIGN KEY(IdObra) REFERENCES Obras(Id),
CONSTRAINT FK_ObrasExposiciones_IdExposicion_Exposiciones_Id FOREIGN KEY(IdExposicion) REFERENCES Exposiciones(Id);
