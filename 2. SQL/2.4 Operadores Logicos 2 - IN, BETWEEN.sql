


-- IN
-- BETWEEN
-- count, max, min, avg, year

-- obtenemos TODOS los datos de la pelicula
Select * from Peliculas P where id = 12

-- obtenemos todos los datos de la tabla reparto de la pelicula
select * from [Peliculas.Reparto] where idPelicula = 12

-- (En este) In(n1,n2,n3/'a', 'b', 'c') --> (en este lote de (datos))
select * from Reparto where Id IN (10, 15, 66, 67)

-- (Rango entre) Between dato And dato --> entre este dato y este otro dato
select * from Reparto where Id BETWEEN 62 AND 67

-- funciones de agregacion integradas en SQL
-- YEAR(columna) (obtiene el año de una columna tipo Fecha)
select * from Peliculas
Where YEAR(FechaEstreno) Between 2000 AND 2009
