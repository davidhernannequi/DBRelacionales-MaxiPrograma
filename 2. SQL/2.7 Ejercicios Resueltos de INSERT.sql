
-------------------------------INSERT--------------------------------------------------------------------
--11) Ingresar el siguiente Film.

	--Select * From Peliculas Where Titulo = 'The Good, the Bad and the Ugly'

	INSERT INTO Peliculas (FechaEstreno,Titulo,MinutosDuracion,Bio) VALUES ('1968-01-11','The Good, the Bad and the Ugly', 162, 'Tres hombres violentos pelean por una caja que alberga 200 000 dólares, la cual fue escondida durante la Guerra Civil. Dado que ninguno puede encontrar la tumba donde está el botín sin la ayuda de los otros dos, deben colaborar, pese a odiarse', null)

--12) En base al Film recientemente agregado al Catálogo, agregárselo como Favorito a Severus Snape.

	--Select CONCAT(U.Nombre,' ', U.Apellido) as USUARIO, P.Titulo as PELICULA From Usuarios U
	--inner join [Usuarios.Favoritos] UF on U.Id = UF.IdUsuario
	--inner join Peliculas P on P.Id = UF.IdPelicula
	--where UF.IdUsuario = 4

	INSERT INTO [Usuarios.Favoritos] (IdPelicula, IdUsuario, FechaFavorito) VALUES (27, 4, CURRENT_TIMESTAMP)


--13) Ahora hagamos que esta pelicula se pueda ver en las Plataformas de Netflix y Amazon.
	
	--Select * From Plataformas
	--Select * From [Peliculas.Plataformas]

	INSERT INTO [Peliculas.Plataformas] (Id, IdPelicula, IdPlataforma, FechaAlta) VALUES (44, 27,1,CURRENT_TIMESTAMP)

--14) ¿Cuál es la "relación" que tienen estas consultas al Ejecutarse? ¿Cuál es el motivo?

-- Las 3 consultas devuelven errores.
	--Por falta insertar los datos correctamente:
		--sea por FK inexistente
		--por no poder insertar ID de forma manual
		--o al contrario, por tener que insertar un campo de forma obligatoria al ser su columna NOT NULL
	--Los 3 errores fueron:
		--The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Peliculas_Reparto". The conflict occurred in database "MaxiFlix_DB", table "dbo.Reparto", column 'Id'.
		--Cannot insert explicit value for identity column in table 'Peliculas.Categorias' when IDENTITY_INSERT is set to OFF.
		--Cannot insert the value NULL into column 'Id', table 'MaxiFlix_DB.dbo.Peliculas.Plataformas'; column does not allow nulls. INSERT fails.

INSERT INTO Peliculas (FechaEstreno, Titulo, MinutosDuracion, Bio, IdDirector) VALUES ('2014-08-21', 'Relatos Salvajes', 122, 'Seis relatos que alternan la intriga, la comedia y la violencia. Sus personajes se verán empujados hacia el abismo y hacia el innegable placer de perder el control al cruzar la delgada línea que separa la civilización de la barbarie.', 112);
--Error de clave foranea inexistente para el IdDirector, ya que no exite director con Id =112
	--Select  MAX(R.Id) 'ID de Director' from Reparto R where Dirige = 1


INSERT INTO [Peliculas.Categorias] (Id, IdCategoria, IdPelicula) VALUES (75, 6, 2);
--Error al no poder insertar valores de forma manual al ID ya que es autoincremental

INSERT INTO [Peliculas.Plataformas] (IdPelicula, IdPlataforma, FechaAlta) VALUES (24, 10, '2024-03-27');
--Error de columna Id,ya que no acepta valores nulos, se debe completar el campo si o si con un valor que sea valido, es decir,respetando el tipo de dato de la misma