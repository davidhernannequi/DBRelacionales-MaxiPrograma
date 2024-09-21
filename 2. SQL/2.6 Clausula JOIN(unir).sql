------------------------------------------------------------------------------------------------------------

--JOIN/ON (unirse por-en el)
-->on: funciona como el where para establecer la condicion que une las tablas)

-- Hay 4 tipos:
-->normalmente la condicion de union es el id(primary_key) de una tabla y el id(foregein_key) de otra tabla.

------------------------------------------------------------------------------------------------------------

--INNER JOIN (union interna por CONDICION
--> combina ambas tablas segun la coincidencia de datos entre ellas siempre que no sean NULOS)

select P.Titulo Pelicula, R.Nombre , R.Apellido
From Peliculas P
INNER JOIN Reparto R ON P.IdDirector = R.Id

------------------------------------------------------------------------------------------------------------

--LEFT JOIN (union a la izquierda por CONDICION -->)
--> combina dando prioridad a los datos de la izquierda, me muestra los nulos

select P.Titulo Pelicula, R.Nombre , R.Apellido
From Peliculas P LEFT JOIN Reparto R 
ON P.IdDirector = R.Id

------------------------------------------------------------------------------------------------------------

--RIGHT JOIN (union a la derecha por CONDICION)
--> combina dando prioridad a los datos de la derecha, me muestra los nulos

select P.Titulo Pelicula, R.Nombre , R.Apellido
From Peliculas P RIGHT JOIN Reparto R 
ON P.IdDirector = R.Id

------------------------------------------------------------------------------------------------------------

--FULL OUTER JOIN (union externa completa por CONDICION)

--FULL OUTER JOIN (union  por CONDICION -->)
--> combina sumando un left join y un right join
-->restando el resultado del inner join, me muestra los nulos de ambos

select P.Titulo Pelicula, R.Nombre , R.Apellido
From Peliculas P FULL OUTER JOIN Reparto R 
ON P.IdDirector = R.Id

------------------------------------------------------------------------------------------------------------

-->25 peliculas
select COUNT(id) 'Total de pelis' from peliculas

-->111 actores de reparto/ posibles directores/as
select COUNT(id) 'Total de Reparto' from Reparto

--que datos traen haciendo la misma consulta?
--inner --> 3 coincidencias (no nulas, entre las tablas peliculas y reparto)
--left --> 25 filas (cantidad total de campos de la tabla peliculas)
--rigth --> 111 filas (cantidad total de campos de la tabla reparto)
--full outer join --> 133 filas (25 peliculas + 111 reparto - 3 que coinciden = 133 campos)

------------------------------------------------------------------------------------------------------------

--Ejemplo = cuales son las personas que actuan en una peli determinada
--Pelicula.Id = 6 ('Volver al Futuro')

select Titulo, R.Nombre, R.Apellido From Peliculas P
inner join [Peliculas.Reparto] PR On P.Id = PR.IdPelicula
inner join Reparto R On PR.IdReparto = R.Id
where P.Id = 6
