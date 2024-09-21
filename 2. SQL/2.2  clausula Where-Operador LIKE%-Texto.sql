

-- bit: 1, 0
-- a, b, c, d...
-- 65, 66, 67... Codigo ASCII

--Asi lo que compara/filtra es el valor del codigo ASCII
--Select * From Peliculas
--Where Titulo > 'Robocop'

--Operador LIKE: se utiliza para texto 
--Su comodin: '%a%', '%a', 'a%'
Select Titulo, Bio From Peliculas
Where Bio Like '%cien%'
