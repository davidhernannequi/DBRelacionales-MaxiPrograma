Use master;
GO

--MDF: master data file
--LDF: log data file

--NAME ---> Nombre de la base de datos
--NAMEFILE ---> Ruta de origen de la base de datos
--SIZE
--MAXSIZE
--FILEGROWTH
--create database MundoPokemon_DB ON(
--NAME = 'MundoPokemon_DB_Data',
--FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mundoPokemon_db2.mdf',
--SIZE = 10MB,
--MAXSIZE = 150MB,
--FILEGROWTH = 20MB
--)

--en el LOG estan los datos de la tabla relacional master
--que gestiona las acciones de todas las bases de datos
--LOG ON(
--NAME = 'MundoPokemon_DB_Log',
--FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mundoPokemon_db2.ldf',
--SIZE = 10MB,
--MAXSIZE = 150MB,
--FILEGROWTH = 20MB
--);

USE MundoPokemon_DB
GO

--create table Pokemons(
----nombre de cada columna
----tipo de dato de cada columa
----permite valores nulos o no
----NombreColumna TipoDeDato NULL/NOT NULL

--Id int not null,
--Nombre varchar (50) null,
--Numero int null,
--Bio varchar (250) null,
--Altura float null,
--Peso float null,
--ImagenUrl varchar (500) null,
--IdEvolucion int null
--);
--GO

--create table Entrenadores (
--Id int not null,
--Nombre varchar (50) null,
--Apellido varchar (50) null,
--NickName varchar (50) null,
--Email varchar (50) null,
--Clave varchar (25) null,
--FechaNacimiento date null
--);
--GO

--create table Habilidades(
--Id int not null,
--Nombre varchar(50) null,
--Descripcion varchar(250) null,
--IdTipo int null
--);
--GO

--create table Elementos(
--Id int not null,
--Descripcion varchar (250) null
--);
--GO

--create table Medallas (
--Id int not null,
--Nombre varchar (50) null,
--ImagenUrl varchar (500) null
--);
--GO

--create table [Pokemons.Habilidades] (
--Id int not null,
--IdPokemon int null,
--IdHabilidad int null
--);
--GO

--create table [Pokemons.Debilidades] (
--Id int not null,
--IdPokemon int null,
--IdElemento int null
--);
--GO

--create table [Pokemons.Tipos](
--Id int not null,
--IdPokemon int null,
--IdElemento int null
--);
--GO

--create table [Entrenadores.Pokemons] (
--Id int not null,
--IdEntrenador int null,
--IdPokemon int null,
--Nombre varchar (50)
--);
--GO

--create table [Entrenadores.Medallas](
--Id int not null,
--Nombre varchar (50),
--ImagenUrl varchar (250)
--);
--GO

--create table [Evoluciones.Variables] (
--Id int not null,
--IdEvolucion int null,
--IdPokemon int null
--);
--GO

--create table Gimnasios (
--Id int not null,
--Nombre varchar(50) null,
--IdCiudad int null,
--IdMedalla int null,
--IdEntrenador int null
--);
--GO

--create table Ciudades (
--Id int not null,
--Nombre varchar (50) not null
--);
--GO

--ALTER TABLE para modificar
--ADD para agregar
--DROP para eliminar

--ALTER TABLE Pokemons
--ADD CONSTRAINT PK_Pokemons PRIMARY KEY (Id)


