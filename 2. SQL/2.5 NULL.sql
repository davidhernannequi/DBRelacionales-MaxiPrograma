


--tipo de dato: NULL(nulo--> vacio ABSOLUTO)
--> NULL(nulo) != ''(vacio) != 0 (cero)

-- int: 1, 2, 777, -13, 0 != NULL
-- money: 99,99 / NULL
-- datetime: 1990-01-01 00:00:00 / NULL
-- varchar: 'texto' / '' / NULL
-- bit: True(1)-False(0) / NULL

--es NULO
Select * from Peliculas where IdDirector IS NULL

--NO es NULO
Select * from Peliculas where IdDirector IS NOT NULL