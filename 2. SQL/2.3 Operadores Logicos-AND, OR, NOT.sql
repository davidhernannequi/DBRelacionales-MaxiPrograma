

--Operadores Logicos
--AND, OR, NOT

Select p.Titulo, p.MinutosDuracion, p.Bio From Peliculas p
Where NOT(p.MinutosDuracion > 99
AND p.MinutosDuracion <= 120)
AND p.Bio Like '%los%'
OR p.Bio Like '%cien%'
