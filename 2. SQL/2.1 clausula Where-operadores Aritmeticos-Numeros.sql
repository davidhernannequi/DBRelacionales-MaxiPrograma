

--operadores relacionales
-- =, <, >, <=, >=, !=, %

--Pelicula: Karate Kid
Select * From [Peliculas.Reparto]
Where IdPelicula = 9

--Actores usando top 5
Select top 5 R.Nombre, R.Apellido
From Reparto R
Where Id >= 45