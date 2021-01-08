#DDL

create database if not exists PROYECTO;
use PROYECTO;

create table if not exists Persona (
Cedula char(10) primary key,
Nombre varchar(15),
Apellido varchar(15));

create table if not exists Miembro (
cod_miembro char(10) primary key,
foreign key (cod_miembro) references Persona(Cedula));

create table if not exists Entrenador (
cod_entrenador char(10) primary key, 
sueldo float,
activo bool default 1,
foreign key (cod_entrenador) references Persona(Cedula));

create table if not exists Membresia (
id_membresia int primary key auto_increment,
precio float,
fecha_expiracion date,
cod_miembro char(10),
foreign key (cod_miembro) references Miembro(cod_miembro));

create table if not exists Disciplina (
Id_disciplina int primary key auto_increment,
Descripcion varchar(20));

create table if not exists Clase(
id_clase int primary key auto_increment,
entrenador char(10),
horario time,
disciplina int,
foreign key (entrenador) references Entrenador(cod_entrenador),
foreign key (disciplina) references Disciplina(Id_disciplina));

create table if not exists Participacion(
id_miembro char(10) ,
id_clase int ,
primary key (id_miembro,id_clase),
foreign key (id_miembro) references Miembro(cod_miembro),
foreign key (id_clase) references Clase(id_clase));

create table if not exists Factura (
id_factura int primary key auto_increment,
monto_total float,
fecha timestamp DEFAULT CURRENT_TIMESTAMP,
Tipo_transaccion varchar(6),
cod_miembro char(10) null,
foreign key (cod_miembro) references Miembro(cod_miembro));


create table if not exists Implemento (
cod_implemento int primary key auto_increment,
precio_actual float,
descripcion varchar(30) UNIQUE,
stock int);

create table if not exists Detalle_Venta (
id_factura int,
cod_implemento int,
precio_venta float,
cantidad int,
primary key (id_factura,cod_implemento),
foreign key (id_factura) references Factura(id_factura),
foreign key (cod_implemento) references Implemento(cod_implemento));

create table if not exists Inventario (
id_inventario int primary key auto_increment,
descripcion varchar(30) UNIQUE,
stock int);

create table if not exists Detalle_Compra (
id_factura int,
id_inventario int,
precio_de_compra float,
cantidad int,
primary key (id_factura,id_inventario),
foreign key (id_factura) references Factura(id_factura),
foreign key (id_inventario) references Inventario(id_inventario));




#DML

#Tabla Persona
insert into Persona(Cedula,Nombre,Apellido) values ('0999999991','Juan','Perez'),
('0999999992','Marcelo','Noles'),('0999999993','Luis','Rodriguez'),('0999999994','Luis','Aguila'),('0999999995','Gabriel','Sanchez'),
('0999999996','Antonio','Jara'),('0999999997','Fernando','Franco'),('0999999998','Alfonso','Monroy'),('0999999999','Frank','Malo');

#Tabla Miembro
insert into Miembro values ('0999999991'),('0999999992'),('0999999993'),('0999999994'),('0999999995');

#Tabla Entrenador
insert into Entrenador(cod_entrenador,sueldo) values ('0999999996',400),('0999999997',500),('0999999998',450),('0999999999',360);

#Tabla Membresia
insert into Membresia(precio,fecha_expiracion,cod_miembro) values (30,'2019-01-05','0999999991'),(30,'2019-11-05','0999999992'),(30,'2019-12-07','0999999993'),(30,'2019-10-05','0999999994'),
(30,'2019-10-05','0999999995');

#Tabla Disciplina
insert into Disciplina (descripcion) values ('karate'),('box'),('muay thai'),('tae won do'),('heterofilia'),('olimpico'),
('running'),('tennis'),('futbol'),('natacion');

#Tabla Clase
insert into Clase(entrenador,horario,disciplina) values ('0999999996','11:00',1),('0999999996','12:00',1),('0999999997','13:00',3),('0999999998','15:00',4),('0999999999','16:00',1);

#Tabla Participacion
insert into Participacion values ('0999999991',1),('0999999992',2),('0999999993',1),('0999999994',1),('0999999995',1),('0999999991',2),('0999999992',5);

#Tabla Factura
insert into Factura(monto_total,Tipo_transaccion,cod_miembro) values (200,'compra',null),(200,'compra',null),(200,'compra',null),
(200,'venta','0999999991'),(200,'venta','0999999991'),(200,'venta','0999999991');

#Tabla Implemento
insert into Implemento(precio_actual,descripcion,stock) values (50,'guantes',2),(20,'termo',5),(15,'vendas',6),(15,'camiseta',5),(30,'cuerda de saltar',1);

#Tabla Detalle_Venta
insert into Detalle_Venta values(4,1,200,1),(5,1,200,1),(6,1,200,1);


#Talla Inventario
insert into Inventario(descripcion,stock) values ('maquina de ejericio',10),('barra',15),('mancuerna',20),('saco',5),('caminadora',16);

#Talla Detalle_Compra
insert into Detalle_Compra values(1,2,200,1),(2,3,200,1),(3,4,200,1);

#Trigger
Delimiter %%
create trigger ActualizarStock after insert on Detalle_Venta for each row
begin
	update Implemento set stock= stock - new.cantidad where cod_implemento=new.cod_implemento;
end;
%% Delimiter ;


#Stored Procedure
Delimiter %%
create procedure VerificarStock( in descripcion varchar(30), in numero int(11), out resultado boolean)
begin
		set @stock_acual = (select stock from implemento as t1 where t1.descripcion = descripcion );
		set resultado = @stock_acual >= numero;
end;
%% Delimiter ;

call VerificarStock('guantes',2,@resultado);
select  @resultado;

-- Vistas
-- consulta 1
drop view if exists ventas_mensuales;
create view ventas_mensuales as
SELECT factura.cod_miembro, 
SUM(CASE WHEN MONTH(factura.fecha) = 1 THEN 1 ELSE 0 END) AS Ene,
SUM(CASE WHEN MONTH(factura.fecha) = 2 THEN 1 ELSE 0 END) AS Feb,
SUM(CASE WHEN MONTH(factura.fecha) = 3 THEN 1 ELSE 0 END) AS Mar,
SUM(CASE WHEN MONTH(factura.fecha) = 4 THEN 1 ELSE 0 END) AS Abr,
SUM(CASE WHEN MONTH(factura.fecha) = 5 THEN 1 ELSE 0 END) AS May,
SUM(CASE WHEN MONTH(factura.fecha) = 6 THEN 1 ELSE 0 END) AS Jun,
SUM(CASE WHEN MONTH(factura.fecha) = 7 THEN 1 ELSE 0 END) AS Jul,
SUM(CASE WHEN MONTH(factura.fecha) = 8 THEN 1 ELSE 0 END) AS Ago,
SUM(CASE WHEN MONTH(factura.fecha) = 9 THEN 1 ELSE 0 END) AS Sep, 
SUM(CASE WHEN MONTH(factura.fecha) = 10 THEN 1 ELSE 0 END) AS Oct,
SUM(CASE WHEN MONTH(factura.fecha) = 11 THEN 1 ELSE 0 END) AS Nov,
SUM(CASE WHEN MONTH(factura.fecha) = 12 THEN 1 ELSE 0 END) AS Dic
FROM factura
WHERE factura.fecha BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY factura.cod_miembro;

-- consulta 2

drop view if exists ventas_por_persona;
create view ventas_por_persona as
SELECT p.nombre as nombre, p.apellido as apellido, 
SUM(CASE WHEN MONTH(f.fecha) = 1 THEN 1 ELSE 0 END) AS Ene,
SUM(CASE WHEN MONTH(f.fecha) = 2 THEN 1 ELSE 0 END) AS Feb,
SUM(CASE WHEN MONTH(f.fecha) = 3 THEN 1 ELSE 0 END) AS Mar,
SUM(CASE WHEN MONTH(f.fecha) = 4 THEN 1 ELSE 0 END) AS Abr,
SUM(CASE WHEN MONTH(f.fecha) = 5 THEN 1 ELSE 0 END) AS May,
SUM(CASE WHEN MONTH(f.fecha) = 6 THEN 1 ELSE 0 END) AS Jun,
SUM(CASE WHEN MONTH(f.fecha) = 7 THEN 1 ELSE 0 END) AS Jul,
SUM(CASE WHEN MONTH(f.fecha) = 8 THEN 1 ELSE 0 END) AS Ago,
SUM(CASE WHEN MONTH(f.fecha) = 9 THEN 1 ELSE 0 END) AS Sep, 
SUM(CASE WHEN MONTH(f.fecha) = 10 THEN 1 ELSE 0 END) AS Oct,
SUM(CASE WHEN MONTH(f.fecha) = 11 THEN 1 ELSE 0 END) AS Nov,
SUM(CASE WHEN MONTH(f.fecha) = 12 THEN 1 ELSE 0 END) AS Dic
FROM factura as f
inner join miembro as m on f.cod_miembro = m.cod_miembro
inner join persona as p on m.cod_miembro = p.cedula
WHERE f.fecha BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY m.cod_miembro;
select * from ventas_por_persona;
-- consulta 3

drop view if exists implemento_más_vendido;
create view implemento_más_vendido as
SELECT dv.cod_implemento,i.descripcion, 
SUM(CASE WHEN MONTH(f.fecha) = 1 THEN 1 ELSE 0 END) AS Ene,
SUM(CASE WHEN MONTH(f.fecha) = 2 THEN 1 ELSE 0 END) AS Feb,
SUM(CASE WHEN MONTH(f.fecha) = 3 THEN 1 ELSE 0 END) AS Mar,
SUM(CASE WHEN MONTH(f.fecha) = 4 THEN 1 ELSE 0 END) AS Abr,
SUM(CASE WHEN MONTH(f.fecha) = 5 THEN 1 ELSE 0 END) AS May,
SUM(CASE WHEN MONTH(f.fecha) = 6 THEN 1 ELSE 0 END) AS Jun,
SUM(CASE WHEN MONTH(f.fecha) = 7 THEN 1 ELSE 0 END) AS Jul,
SUM(CASE WHEN MONTH(f.fecha) = 8 THEN 1 ELSE 0 END) AS Ago,
SUM(CASE WHEN MONTH(f.fecha) = 9 THEN 1 ELSE 0 END) AS Sep, 
SUM(CASE WHEN MONTH(f.fecha) = 10 THEN 1 ELSE 0 END) AS Oct,
SUM(CASE WHEN MONTH(f.fecha) = 11 THEN 1 ELSE 0 END) AS Nov,
SUM(CASE WHEN MONTH(f.fecha) = 12 THEN 1 ELSE 0 END) AS Dic
FROM factura as f
inner join detalle_venta as dv on f.id_factura = dv.id_factura
inner join implemento as i on dv.cod_implemento = i.cod_implemento
WHERE f.fecha BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY dv.cod_implemento;
select * from implemento_más_vendido;

-- consulta 4

drop view if exists personas_registradas;
create view personas_registradas as
SELECT c.id_clase, c.disciplina, pe.nombre, pe.apellido, count(p.id_miembro) as cantidad 
FROM participacion as  p
inner join clase as c on c.id_clase = p.id_clase
inner join persona as pe on pe.cedula = c.entrenador
GROUP BY id_clase;

-- consulta 5

drop view if exists consultar_membresia;
create view consultar_membresia as
SELECT p.nombre, p.apellido 
FROM miembro as m
inner join membresia as me on m.cod_miembro = me.cod_miembro
inner join persona as p on m.cod_miembro = p.cedula
WHERE me.fecha_expiracion >= CURDATE();

-- consulta 6

drop view if exists monto_compra_mensual;
create view monto_compra_mensual as
SELECT 
SUM(CASE WHEN MONTH(f.fecha) = 1 THEN dc.precio_de_compra ELSE 0 END) AS Ene,
SUM(CASE WHEN MONTH(f.fecha) = 2 THEN dc.precio_de_compra ELSE 0 END) AS Feb,
SUM(CASE WHEN MONTH(f.fecha) = 3 THEN dc.precio_de_compra ELSE 0 END) AS Mar,
SUM(CASE WHEN MONTH(f.fecha) = 4 THEN dc.precio_de_compra ELSE 0 END) AS Abr,
SUM(CASE WHEN MONTH(f.fecha) = 5 THEN dc.precio_de_compra ELSE 0 END) AS May,
SUM(CASE WHEN MONTH(f.fecha) = 6 THEN dc.precio_de_compra ELSE 0 END) AS Jun,
SUM(CASE WHEN MONTH(f.fecha) = 7 THEN dc.precio_de_compra ELSE 0 END) AS Jul,
SUM(CASE WHEN MONTH(f.fecha) = 8 THEN dc.precio_de_compra ELSE 0 END) AS Ago,
SUM(CASE WHEN MONTH(f.fecha) = 9 THEN dc.precio_de_compra ELSE 0 END) AS Sep, 
SUM(CASE WHEN MONTH(f.fecha) = 10 THEN dc.precio_de_compra ELSE 0 END) AS Oct,
SUM(CASE WHEN MONTH(f.fecha) = 11 THEN dc.precio_de_compra ELSE 0 END) AS Nov,
SUM(CASE WHEN MONTH(f.fecha) = 12 THEN dc.precio_de_compra ELSE 0 END) AS Dic
from detalle_compra as dc
inner join factura as f on dc.id_factura = f.id_factura;

select * from monto_compra_mensual;