

------------------Consultas de UPDATE---------------------------------
--UPDATE tabla SET (campo1, campo2, campoN) WHERE condicion
--(SINO SE ACTUALIZA TODA LA TABLA con los datos nuevos)

--15) La Película de Rocky dejó de estar disponible en la Plataforma de Paramount+ el 16 de enero del 2024.
	
	--select Id from Peliculas Where Titulo LIKE '%Rocky%'
	--select * from Plataformas Where 
	--select * from [Peliculas.Plataformas]
	
	UPDATE [Peliculas.Plataformas] SET FechaBaja = NULL WHERE IdPelicula = 3 AND NOT (IdPlataforma = 9)

--16) Hubo un error al momento de registrar la película de Iron Man. El Protagonista no fue Robert Downey Jr., quién interpretó el papel fue Diego Peretti.
	
	--select Id from Peliculas where Peliculas.Titulo = 'Iron Man'
		--Id = 2
	--Select Id, R.Nombre, R.Apellido FROM Reparto R WHERE R.Nombre = 'Diego Peretti'
		--Id = 107
	--Select Id, R.Nombre, R.Apellido FROM Reparto R WHERE R.Nombre LIKE '%Robert%'
		--Id = 1

	UPDATE [Peliculas.Reparto] SET Protagonista = 0 WHERE IdReparto = 1 AND IdPelicula = 2
	UPDATE [Peliculas.Reparto] SET Protagonista = 1 WHERE IdReparto = 107

--17) La Plataforma Tubi TV cambia de firma, dado que cambiará su nombre a MaxiPrograma TV.

	--Select * From Plataformas
	UPDATE Plataformas SET Nombre = 'MaxiPrograma TV' WHERE Nombre = 'Tubi TV'

--18) La Película de Spiderman cambia su Clasificación de PG-13 a 'Apta para todos los Públicos'.
	
	--Select * from Clasificaciones
	--ATP --> Id = 8
	--Select * from Peliculas Where P.Titulo LIKE '%Spiderman%'
	--Id = 12
	Select P.Titulo, C.Descripcion, C.Id
	From [Peliculas.Clasificaciones] PC 
	inner join Peliculas P on P.Id = PC.IdPelicula
	inner join Clasificaciones C on C.Id = PC.IdClasificacion
	Where P.Titulo = 'Spiderman'

	UPDATE [Peliculas.Clasificaciones] SET IdClasificacion = 8 Where IdPelicula = 12
