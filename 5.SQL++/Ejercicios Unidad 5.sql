

--Teniendo la DB MundoPokemon instalada y cargada, realizar las siguientes consultas.

--1)  Consulta para encontrar el nombre y número de Pokémon ordenados alfabéticamente.

select P.Nombre, P.Numero from Pokemons P
order by Nombre Asc, Numero Asc

--2) Consulta para mostrar el nombre y la cantidad de Pokémon por tipo.

select E.Descripcion, count(E.Id) as 'Cantidad de Pokemons'
from Elementos E
inner join [Pokemons.Tipos] PT on PT.IdElemento = E.Id
group by E.Descripcion

--3) Crear un Stored Procedure para cargar la Tabla Entrenadores.Medallas.

	--select * from Entrenadores
	--select * from Medallas
	--select * from [Entrenadores.Medallas]

--Create Procedure spEntrenadoresPokemon
--@Id int,
--@IdEntrenador int,
--@IdMedalla int, 
--@FechaObtencion date
--AS
--BEGIN
	--	insert into [Entrenadores.Medallas] values (@Id, @IdEntrenador, @IdMedalla, @FechaObtencion) 
--END;

--exec spEntrenadoresPokemon @Id, @IdEntrenador, @IdMedalla, @FechaObtencion

--4) Consulta para mostrar las medallas obtenidas por cada entrenador (primero debe haber sido creado y utilizado el SP del punto anterior)

select E.Nombre, M.Nombre
From Entrenadores E
inner join [Entrenadores.Medallas] EM on EM.IdEntrenador = E.Id
inner join Medallas M on M.Id = EM.IdMedalla

--5) Consulta para mostrar el nombre de los entrenadores y la cantidad de Pokémon que poseen, solo para aquellos que tienen más de 3 Pokémon.

Select E.Nombre,count(P.Id) 'Cantidad de Pokemons'
from Pokemons P
inner join [Entrenadores.Pokemons] EP on Ep.IdPokemon = P.Id
inner join Entrenadores E on E.Id = EP.IdEntrenador
group by E.Nombre
having count(P.Id) > 3

--6) Consulta para mostrar el nombre del entrenador, el nombre del Pokémon y su tipo, solo para aquellos Pokémon que tienen habilidades con descripción que contenga la palabra "ataque".

select E.Nombre, P.Nombre, El.Descripcion,H.Descripcion
from Pokemons P
inner join [Entrenadores.Pokemons] EP on Ep.IdPokemon = P.Id
inner join Entrenadores E on E.Id = EP.IdEntrenador
inner join [Pokemons.Tipos] PT on PT.IdPokemon = P.Id
inner join Elementos El on El.Id = PT.IdElemento
inner join Habilidades H on H.IdTipo = PT.IdElemento
where H.Descripcion like '%ataque%'

--select E.Nombre, P.Nombre, El.Descripcion
--from Pokemons P
--inner join [Entrenadores.Pokemons] EP on Ep.IdPokemon = P.Id
--inner join Entrenadores E on E.Id = EP.IdEntrenador

--select E.Descripcion
--from Pokemons P
--inner join [Pokemons.Tipos] PT on P.Id = PT.IdPokemon
--inner join Elementos E on E.Id = PT.IdElemento

--H.Descripcion
--from Habilidades H
--where H.Descripcion like '%ataque%'

--7) Consulta para mostrar el nombre de los entrenadores y la cantidad de Pokémon que tienen, ordenados de forma descendente por la cantidad de Pokémon.

select E.Nombre, Count(P.Id) 'Cantidad de Pokemons'
From Entrenadores E
inner join [Entrenadores.Pokemons] EP on EP.IdEntrenador = E.Id
inner join Pokemons P on P.Id = EP.IdPokemon
group by E.Nombre
order by 'Cantidad de Pokemons' desc


--8) Crear un Procedimiento Almacenado para Insertar un Entrenador.

--create procedure spInsertarEntrenador 
--@Nombre varchar(50),
--@Apellido varchar(50),
--@NickName varchar(50),
--@Email varchar(50),
--@Clave varchar(25),
--@FechaNacimiento date
--AS
--BEGIN
--insert into Entrenadores (Nombre,Apellido, NickName,Email, Clave, FechaNacimiento) 
--values (@Nombre, @Apellido, @NickName, @Email, @Clave, @FechaNacimiento)
--END;

--9) Crear un SP para Actualizar una Ciudad.

--UPDATE nombre-de-la-tabla
--SET nombre-de-la-columna = valor[, nombre-de-la-columna=valor]
--[WHERE condición]

--select * from Ciudades

--create procedure spActualizarCiudad
--@idCiudad int,
--@nombre varchar(50)
--AS
--begin
--update Ciudades set Nombre = @nombre where id = @idCiudad
--end;
--exec spActualizarCiudad 1, 'Pueblo Paleta'

--10) ¿Cargaste los entrenadores desde MaxiFlixDB como hizo Maxi? Bueno, ahora eliminalos.
--Armá un Delete con subconsulta para que elimine todos los registros agregados pero no los quites todos,
--solo vamos a eliminar aquellos que pertenezcan al mundo actoral
--pero que además hayan nacido antes de 1980.
--queremos dejar afuera a los que tengan un apellido que comience con “S”, no nos gustan… en ese caso no importa la fecha de nacimiento.
--Recordá primero consultar los datos para asegurarte de que vas a eliminar lo indicado.

--Select * From Entrenadores
--Where (Id > 12
--AND year(FechaNacimiento) < 1980)
--OR (Id > 12 AND Apellido like 'S%')

--Delete From Entrenadores
--Where (Id > 12
--AND year(FechaNacimiento) < 1980)
--OR (Id > 12 AND Apellido like 'S%')





--Teniendo la DB MaxiFlix instalada y cargada, realizar las siguientes consultas.


--1)  Obtener una lista de películas que incluya el título de la película y su duración en minutos.
--Además, agregar una columna adicional llamada 'ClasificacionDuracion'
--que clasifique la duración de cada película en tres categorías:
--'Corta' si la duración es menor a 90 minutos,
--'Media' si la duración está entre 90 y 119 minutos,
--y 'Larga' si la duración es igual o mayor a 120 minutos.

Select P.Titulo, P.MinutosDuracion AS 'Duración',
case when P.MinutosDuracion >= 120 then 'Larga'
when P.MinutosDuracion > 90 then 'Media'
when P.MinutosDuracion < 90 then 'Corta'
END AS 'ClasificacionDuracion'
From Peliculas P
Order by P.MinutosDuracion Asc

--2)  Obtener una lista de películas junto con una columna adicional llamada 'Disponibilidad'
--que indique si la película está disponible en alguna plataforma de streaming.
--Si la película está disponible en al menos una plataforma, mostrar 'Disponible';
--de lo contrario, mostrar 'No disponible'.

select Distinct Titulo
From Peliculas P
inner join [Peliculas.Plataformas] PP on P.Id = PP.IdPelicula
inner join Plataformas Pl on Pl.Id = PP.IdPlataforma

Select Distinct P.Titulo,
CASE when PP.IdPlataforma is null then 'No Disponible'
else 'Disponible'
END AS 'Disponibilidad'
From Peliculas P
inner join [Peliculas.Plataformas] PP on P.Id = PP.IdPelicula

--3)  Obtener una lista de todas las clasificaciones únicas de las películas disponibles en la plataforma.

--Select Descripcion From Clasificaciones

Select Distinct C.Descripcion,
CASE when PP.IdPlataforma is null then 'No Disponible'
else 'Disponible'
END AS 'Disponibilidad'
From Peliculas P
inner join [Peliculas.Plataformas] PP on P.Id = PP.IdPelicula
inner join [Peliculas.Clasificaciones] PC on P.Id = PC.IdPelicula
inner join Clasificaciones C on C.Id = PC.IdClasificacion

--4)  Obtener una lista de todas las plataformas únicas disponibles para ver películas.

--Select Nombre From Plataformas

Select Distinct Pl.Nombre,
CASE when PP.IdPlataforma is null then 'No Disponible'
else 'Disponible'
END AS 'Disponibilidad'
From Peliculas P
inner join [Peliculas.Plataformas] PP on P.Id = PP.IdPelicula
inner join Plataformas Pl on PP.IdPlataforma = Pl.Id

--5)  Obtener la cantidad de Peliculas registradas en cada Plataforma.

select Pl.Nombre, Count(P.Id) AS 'CantidadPelis'
From Peliculas P
inner join [Peliculas.Plataformas] PP on P.Id = PP.IdPelicula
inner join Plataformas Pl on PP.IdPlataforma = Pl.Id
group by Pl.Nombre

--6)  Obtener las Plataformas que no cuenta con ninguna Película.

select Pl.Nombre
From Plataformas Pl
left join [Peliculas.Plataformas] PP on PP.IdPlataforma = Pl.Id
where PP.IdPlataforma is null

--7)  Obtener la cantidad de películas por género,
--pero solo incluir aquellos géneros que tengan al menos 3 películas asociadas.

Select G.Descripcion, Count(P.Id) AS 'CantidadPelis'
from Generos G
inner join [Peliculas.Generos] PG on G.Id = PG.IdGenero
inner join Peliculas P on PG.IdPelicula = P.Id
group by G.Descripcion
having Count(P.Id) > 3

--8)  Obtener el promedio de duración de las películas por clasificación,
--pero solo incluir aquellas clasificaciones que tengan un promedio de duración mayor o igual a 120 minutos.

Select * From Clasificaciones
inner join [Peliculas.Clasificaciones] PC on P.Id = PC.IdPelicula
inner join Clasificaciones C on C.Id = PC.IdClasificacion

Select AVG(P.MinutosDuracion) AS 'Promedio de Duracion', C.Descripcion
From Peliculas P
inner join [Peliculas.Clasificaciones] PC on P.Id = PC.IdPelicula
inner join Clasificaciones C on C.Id = PC.IdClasificacion
group by C.Descripcion
Having AVG(P.MinutosDuracion) >= 120

--9)  Crear una vista llamada 'VistaPeliculasCategorias'
--que muestre el título de las películas y sus categorías correspondientes.

--create view VistaPeliculasCategorias
--AS
--Select P.Titulo, C.Descripcion
--From Peliculas P
--inner join [Peliculas.Categorias] PC on P.Id = PC.IdPelicula
--inner join Categorias C on C.Id = PC.IdCategoria

--select VPC.Titulo,VPC.Descripcion from VistaPeliculasCategorias VPC

--10)  Crear un procedimiento almacenado llamado 'ObtenerPeliculasPorCategoria'
--que tome un parámetro de entrada 'CategoriaId'
--y devuelva todas las películas que pertenecen a la categoría especificada.
--El procedimiento debe seleccionar el título, la fecha de estreno y la duración en minutos de cada película.

--create procedure spObtenerPeliculasPorCategoria
--@CategoriaId int
--AS
--select P.Titulo, P.FechaEstreno, P.MinutosDuracion
--From Peliculas P
--inner join [Peliculas.Categorias] PC on P.Id = PC.IdPelicula
--inner join Categorias C on C.Id = PC.IdCategoria
--where PC.IdCategoria = @CategoriaId

--exec spObtenerPeliculasPorCategoria 1