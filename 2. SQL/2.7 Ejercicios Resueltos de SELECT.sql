


--Ejercicios Unidad 2

--Teniendo la DB MaxiFlix instalada, realizar las siguientes consultas.

--CONSULTAS DE SELECT:
   
   --SELECT N_CAMPOS
   --FROM NOMBRE_TABLA
   --WHERE CONDICION

--1) Obtener las Pel�culas estrenadas en la D�cada de los '80.
	
	SELECT P.Titulo, P.FechaEstreno, P.MinutosDuracion, P.Bio
	FROM Peliculas P
	WHERE YEAR(P.FechaEstreno) BETWEEN 1980 AND 1989

	------------------------------------------------------------------------------------------------------------------------------------
--2) Obtener los Actores nacidos en la D�cada de los '70.

	SELECT CONCAT(R.Nombre, ' ',R.Apellido) Actor, R.FechaNacimiento, P.Nombre Nacionalidad
	FROM Reparto R
	inner join Paises P ON P.Id = R.IdNacionalidad
	WHERE YEAR(R.FechaNacimiento) BETWEEN 1970 AND 1979

	------------------------------------------------------------------------------------------------------------------------------------
--3) Obtener las Peliculas que se encuentran en la Plataforma de Disney+.

	SELECT P.Titulo Pelicula
	FROM [Peliculas.Plataformas] PPl
	inner join Plataformas Pl on PPl.IdPlataforma = Pl.Id
	inner join Peliculas P on P.Id = PPl.IdPelicula
	where Pl.Nombre = 'Disney+'


	------------------------------------------------------------------------------------------------------------------------------------
--4) Obtener la Cantidad de Pel�culas con Clasificaci�n R. (Considerar usar el Comando LIKE)

	SELECT COUNT(PL.IdClasificacion) 'Pelis con Clasificacion R'
	FROM [Peliculas.Clasificaciones] PL
	INNER JOIN Clasificaciones C on PL.IdClasificacion = C.Id
	WHERE C.Descripcion LIKE '%R %'
	
	------------------------------------------------------------------------------------------------------------------------------------
--5) Obtener la Pel�cula que mayor duraci�n tiene.

	SELECT TOP 1 P.Titulo Pelicula, P.MinutosDuracion 'Duracion(Minutos)'
	FROM Peliculas P	
	ORDER BY P.MinutosDuracion DESC

	------------------------------------------------------------------------------------------------------------------------------------
--6) Obtener las Pel�culas de Categor�a 'Superh�roes'.

	SELECT P.Titulo Pelicula
	FROM [Peliculas.Categorias] PC
	inner join Peliculas P on P.Id = PC.IdPelicula
	inner join Categorias C on PC.IdCategoria = C.Id
	WHERE C.Descripcion = 'Superh�roes'

	------------------------------------------------------------------------------------------------------------------------------------
--7) Obtener la Cantidad de Actores que trabajaron en la Pel�cula 'Los Intocables'.

	SELECT COUNT(R.Id) 'Actores de Intocables'
	FROM REPARTO R
	inner join [Peliculas.Reparto] PR on PR.IdReparto = R.Id
	inner join Peliculas P on PR.IdPelicula = P.Id
	where P.Titulo = 'Los Intocables' 

	------------------------------------------------------------------------------------------------------------------------------------
--8) Obtener los Actores que trabajaron en la Pel�culas 'Los Intocables'.

	SELECT CONCAT(R.Nombre, ' ', R.Apellido) 'Nombre', Paises.Nombre 'Naconalidad', R.FechaNacimiento 'Nacimiento'
	FROM Reparto R 
	inner join [Peliculas.Reparto] PR on PR.IdReparto = R.Id
	inner join Paises on R.IdNacionalidad = Paises.Id
	inner join Peliculas P on PR.IdPelicula = P.Id
	where P.Titulo = 'Los Intocables'

	------------------------------------------------------------------------------------------------------------------------------------
--9) Obtener el Total de Pel�culas del Cat�logo.
	
	SELECT COUNT(P.Id) 'Total de Peliculas'
	FROM Peliculas P

	------------------------------------------------------------------------------------------------------------------------------------
--10) Obtener la Lista de Usuarios Inactivos

	SELECT CONCAT(U.Nombre, ' ', U.Apellido) Usuario, U.Email, U.FechaCreacion, U.FotoPerfilURL
	FROM Usuarios U
	WHERE U.Activo = 0
