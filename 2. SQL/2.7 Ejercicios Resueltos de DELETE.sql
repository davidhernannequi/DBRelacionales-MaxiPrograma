


-------------------------Consultas de DELETE-------------------------------------

--19) El Usuario Homero Simpson hace mucho tiempo que está inactivo. Hay que eliminarlo de la Base de manera física.

	DELETE FROM Usuarios WHERE Usuarios.Nombre = 'Homero' AND Usuarios.Apellido = 'Simpson'
		--Select * FROM Usuarios

--20) Realizar una limpieza de las Puntuaciones de las Películas. Eliminar todas las Puntuaciones desde el 2020 hasta el 2023 (inclusive). ¿Se podrá realizar la Consulta?
	
	--Select P.Puntuacion, P.FechaPuntuacion, P.IdUsuario, P.IdPelicula FROM [Peliculas.Puntuacion] P WHERE P.FechaPuntuacion Between '2020-01-01' AND '2023-01-01'
	DELETE FROM [Peliculas.Puntuacion] WHERE [Peliculas.Puntuacion].FechaPuntuacion Between '2020-01-01' AND '2023-01-01'

--21) Se debe realizar una limpieza de Películas. Hay que eliminar las Películas que se hayan estrenado desde 1980 hasta 1989 (inclusive). ¿Se podrá realizar la Consulta?
	
	--NO SE PUDO REALIZAR LA ELIMINACION
		-- Error de conflicto por referencia obligatoria de la tabla media peliculas a las peliculas mediante el IdPelicula
		--The DELETE statement conflicted with the REFERENCE constraint "FK_Media_Peliculas". The conflict occurred in database "MaxiFlix_DB", table "dbo.Media", column 'IdPelicula'.

	--Select * FROM Peliculas WHERE Peliculas.FechaEstreno BETWEEN '1980-01-01' AND '1989-01-01'
	--DELETE FROM Peliculas WHERE Peliculas.FechaEstreno BETWEEN '1980-01-01' AND '1989-01-01'