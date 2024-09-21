

create database EventosDB
go

use EventosDB
go



create table Eventos (
Id int identity(1,1),
NombreEvento varchar(50),
FechaInicio date,
FechaFin date,
IdLugar int
)

create table Asistentes (
Id int identity(1,1),
Nombre varchar(50),
Email varchar(250),
Telefono varchar(50)
)

create table EventosAsistentes (
Id int identity(1,1),
IdEvento int,
IdAsistente int
)

create table LugaresEventos (
Id int identity(1,1),
Nombre varchar(250),
Ubicacion varchar(250)
)

alter table Eventos
ADD
CONSTRAINT PK_Eventos_Id PRIMARY KEY(Id);

alter table Asistentes
ADD
CONSTRAINT PK_Asistentes_Id PRIMARY KEY(Id);

alter table EventosAsistentes
ADD
CONSTRAINT PK_EventosAsistentes_Id PRIMARY KEY(Id);

alter table LugaresEventos
ADD
CONSTRAINT PK_LugaresEventos_Id PRIMARY KEY(Id);



alter table Eventos
ADD
CONSTRAINT FK_Eventos_IdLugar_LugaresEventos_Id FOREIGN KEY(IdLugar) REFERENCES LugaresEventos(Id);

alter table EventosAsistentes
ADD
CONSTRAINT FK_EventosAsistentes_IdEvento_Eventos_Id FOREIGN KEY(IdEvento) REFERENCES Eventos(Id),
CONSTRAINT FK_EventosAsistentes_IdAsistente_Asistentes_Id FOREIGN KEY(IdAsistente) REFERENCES Asistentes(Id);

