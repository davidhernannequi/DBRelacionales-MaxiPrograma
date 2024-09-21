

select E.Id,E.Nombre,E.Apellido,E.NickName,E.Email,Clave,FechaNacimiento
From Entrenadores E

--select * 
--From MaxiFlix_DB.dbo.Reparto

--Insert into Entrenadores (Id,Nombre, Apellido, NickName, Email, Clave, FechaNacimiento) 
--Select ((Select Max(Id) From Entrenadores) + Id) AS Id,Nombre, Apellido, Nombre, Concat(Nombre, Apellido, '@maxiprograma.com') AS Email,
--Concat(Nombre, '123') AS Clave, FechaNacimiento From MaxiFlix_DB.dbo.Reparto