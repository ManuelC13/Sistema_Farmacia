create database bd_farmacia;

use bd_farmacia;

-- crear tabla persona
create table tb_persona(
idPersona int(11) auto_increment primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
edad int(2) not null,
telefono int(11) not null,
direccion varchar(100) not null,
estado int(1) not null
);

insert into tb_persona(nombre, apellido, edad, telefono, direccion, estado)
values("Manuel", "Cupul", 19, "986100405", "12a", 1);

-- crear tabla usuario
create table tb_usuario(
idUsuario int(11) auto_increment primary key,
idPersona int(11) not null,
usuario varchar(15) not null,
password varchar(15) not null
);

-- select p.idCliente, c.nombre, c.apellido, c.edad, c.telefono, c.direccion, c.fechaVen, p.estado from tb_cliente As p, tb_persona As c where p.idPersona = c.idPersona;

insert into tb_usuario(idPersona, usuario, password)
values(1, "Manuel", "12345");

insert into tb_usuario(idPersona, usuario, password)
values(2, "Raul", "67890");

-- crear tabla cliente
create table tb_cliente(
idCliente int(11) auto_increment primary key,
idPersona int(11) not null,
clienteAmigo int(11) not null,
foreign key (idPersona) references tb_persona(idPersona)
);

-- crear tabla cliente 2
create table tb_cliente2(
idCliente int(11) auto_increment primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
edad int(2) not null,
telefono long not null,
direccion varchar(100) not null,
clienteAmigo int(11) not null,
estado int(1) not null
);

select * from tb_cliente2;

drop table tb_cliente2;

-- crear tabla categoria
create table tb_categoria(
idCategoria int(11) auto_increment primary key,
descripcion varchar(200) not null,
estado int(1) not null
);

insert into tb_categoria(idCategoria, descripcion, estado)
values(2, "Suplementos", 1);

insert into tb_categoria(idCategoria, descripcion, estado)
values(3, "Unguentos", 1);

insert into tb_categoria(idCategoria, descripcion, estado)
values(4, "Anticonceptivos", 1);

insert into tb_categoria(idCategoria, descripcion, estado)
values(5, "Analgésicos", 1);

insert into tb_categoria(idCategoria, descripcion, estado)
values(6, "Antiinflamatorios", 1);

insert into tb_categoria(idCategoria, descripcion, estado)
values(7, "Antivirales", 1);

insert into tb_categoria(idCategoria, descripcion, estado)
values(8, "Primeros Auxilios", 1);

select * from tb_categoria;

-- crear tabla producto
create table tb_producto(
idProducto int(11) auto_increment primary key,
codigo int(11) not null,
nombre varchar(100) not null,
cantidad int(11) not null,
idCategoria int(11) not null,
precio double(10,2) not null,
receta boolean not null,
fechaVen varchar(200) not null,
estado int(1) not null
);

select p.codigo, p.nombre, p.cantidad, p.precio, p.receta, c.descripcion as categoria, p.fechaVen, p.estado from tb_producto as p, tb_categoria as c where p.idCategoria = c.idCategoria;

select cv.idCabeceraVenta as id, concat(c.nombre, ' ', c.apellido) as cliente, cv.valorPagar as total, cv.fechaVenta as fecha, cv.estado from tb_cabecera_venta as cv, tb_cliente2 as c where cv.idCliente = c.idCliente;

drop table tb_usuario;
show tables;

select * from tb_producto;
select p.idProducto, p.codigo, p.nombre, p.cantidad, c.descripcion, p.precio, p.receta, p.fechaVen, p.estado from tb_producto As p, tb_categoria As c where p.idCategoria = c.idCategoria;

-- select c.descripcion from tb_producto As p, tb_categoria As c where p.idCategoria = c.idCategoria;


-- crear tabla cabecera de venta
create table tb_cabecera_venta(
idCabeceraVenta int(11) auto_increment primary key,
idCliente int(11) not null,
valorPagar double(10,2) not null,
fechaVenta date not null,
estado int(1) not null
);

drop table tb_cabecera_venta;

-- crear tabla detalle de venta
create table tb_detalle_venta(
idDetalleVenta int(11) auto_increment primary key,
idCabeceraVenta int(11) not null,
idProducto int(11) not null,
nombre varchar(50) not null,
cantidad int(11) not null,
precioUnitario double(10,2) not null,
subtotal double(10,2) not null,
descuento double(10,2) not null,
totalPagar double(10,2) not null,
estado int(1) not null
);

select cv.idCabeceraVenta as id, concat(c.nombre, ' ', c.apellido) as cliente, cv.valorPagar as total, cv.fechaVenta as fecha, cv.estado from tb_cabecera_venta as cv, tb_cliente2 as c where cv.idCliente = c.idCliente;

select cv.idCabeceraVenta, cv.idCliente, concat(c.nombre, ' ', c.apellido) as cliente, cv.valorPagar, cv.fechaVenta, cv.estado  from tb_cabecera_venta as cv, tb_cliente2 as c where  cv.idCabeceraVenta = 3 and cv.idCliente = c.idCliente;

select * from tb_cabecera_venta;
select * from tb_detalle_venta;

drop table tb_detalle_venta;

show tables;

select * from tb_categoria;
select descripcion from tb_categoria where descripcion = '';
truncate table tb_categoria;

select usuario, password from tb_usuario where usuario = "Manuel" and password = "12345";
