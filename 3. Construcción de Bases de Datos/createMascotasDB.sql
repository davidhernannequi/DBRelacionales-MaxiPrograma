--create database MascotasDB
use MascotasDB
go

create table Mascotas (
Id int identity(1,1) not null,
Nombre varchar(50),
IdEspecie int not null,
IdRaza int not null,
FechaNacimiento date,
IdUsuario int not null
)

create table Razas (
Id int identity(1,1) not null,
Nombre varchar(50) not null
)

create table Especies (
Id int identity(1,1) not null,
Nombre varchar(50) not null
)

create table RegistroSalud (
Id int identity(1,1) not null,
FechaRegistro date not null,
Peso float,
Altura float,
Temperatura float,
IdMascota int not null
)

create table Usuarios (
Id int identity(1,1) not null,
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Email varchar(250) not null,
Clave varchar(25) not null,
FechaRegistro date not null
)

create table Citas (
Id int identity(1,1) not null,
FechaCita date not null,
Razon varchar(500),
IdMascota int not null
)



Alter table Mascotas
ADD CONSTRAINT PK_Mascotas_Id PRIMARY KEY(Id);

Alter table Razas
ADD CONSTRAINT PK_Razas_Id PRIMARY KEY(Id);

Alter table Especies
ADD CONSTRAINT PK_Especies_Id PRIMARY KEY(Id);

Alter table RegistroSalud
ADD CONSTRAINT PK_RegistroSalud_Id PRIMARY KEY(Id);

Alter table Usuarios
ADD CONSTRAINT PK_Usuarios_Id PRIMARY KEY(Id);

Alter table Citas
ADD CONSTRAINT PK_Citas_Id PRIMARY KEY(Id);



--FK_tabla_columna_tablareferenciada

Alter table Mascotas
ADD 
CONSTRAINT FK_Mascotas_IdEspecie_Especies_Id FOREIGN KEY (IdEspecie) REFERENCES Especies(Id),
CONSTRAINT FK_Mascotas_IdRaza_Razas_Id FOREIGN KEY (IdRaza) REFERENCES Razas(Id),
CONSTRAINT FK_Mascotas_IdUsuario_Usuarios_Id FOREIGN KEY (IdUsuario) REFERENCES Usuarios(Id);

Alter table RegistroSalud
ADD CONSTRAINT FK_RegistroSalud_IdMascota_Mascotas_Id FOREIGN KEY(IdMascota) REFERENCES Mascotas(Id);

Alter table Citas
ADD CONSTRAINT FK_Citas_IdMascota_Mascotas_Id FOREIGN KEY(IdMascota) REFERENCES Mascotas(Id);-+