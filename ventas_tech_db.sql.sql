--CREAR BASE DE DATO Ventas_Tech_DB
create database Ventas_Tech_DB;

--SELECCIONAMOS LA BASE DE DATO
use Ventas_Tech_DB;

--DROP TABLES
drop table if exists ventas;
drop table if exists productos;
drop table if exists clientes;
drop table if exists categorias;

--SECCIÓN DDL
--CREACIÓN DE TABLAS

create table categorias(
id_producto int not null identity(1,1) primary key,
nombre_categoria varchar (50) not null,
descripción varchar (200)
);

create table clientes(
id_cliente int not null identity(1,1) primary key,
nombre varchar(100) not null,
email varchar(100) unique,
ciudad varchar(50),
fecha_registro date not null
);

create table productos(
id_producto int not null identity (1,1) primary key,
nombre_producto varchar(100) not null,
id_categoria int not null  foreign key (id_categoria) references categorias(id_producto),
precio decimal(10,2),
stock int default 0,
activo tinyint default 1
);

create table ventas(
id_venta int not null identity (1,1) primary key,
id_cliente int not null  foreign key (id_cliente) references clientes (id_cliente),
id_producto int not null foreign key (id_producto) references productos (id_producto),
cantidad int not null,
precio_unitario decimal (10,2),
fecha_venta date not null
);

--SECCIÓN DML
--ENCENDEMOS PERMISO PARA INGRESAR DATOS EN CATEGORIAS

set identity_insert categorias ON


-- INSERT DATA categorias

insert into categorias (id_producto,nombre_categoria,descripción)
values
(1, 'Computación', 'Laptops, PCs y monitores'),
(2, 'Accesorios', 'Periféricos y complementos'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');

--APAGAMOS EL PERMISO

set identity_insert categorias OFF

--ENCENDEMOS PERMISO PARA INGRESAR DATOS EN CLIENTES

set identity_insert clientes ON

--INSERT DATA CLIENTES


insert into clientes(id_cliente,nombre,email,ciudad,fecha_registro)
values
(1, 'María Lopez', 'maria@mail.com', 'Buenos Aires','2024-01-05'),
(2, 'Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10'),
(3, 'Ana Gomez', 'ana@mail.com', 'Rosario', '2024-02-01'),
(4, 'Pedro Sanz','pedro@mail.com', 'Mendoza', '2024-02-15'),
(5,'Laura Torres','laura@mail.com','Tucumán','2024-03-01');

--APAGAMOS EL PERMISO

set identity_insert clientes OFF

--ENCENDEMOS PERMISO PARA INGRESAR DATOS EN PRODUCTOS

set identity_insert productos ON

--INSERT DATA PRODUCTOS

insert into productos(id_producto,nombre_producto,id_categoria,precio,stock,activo)
values
(1, 'Laptop Pro 15', 1, 1200.00, 15, 1),
(2, 'Mouse Inalambrico', 2, 28.00, 80, 1),
(3, 'Monitor 4k 27', 1, 450.00, 12, 1),
(4, 'Auriculares BT Pro', 3, 120.00, 35, 1),
(5, 'SSD Externo 1TB', 4, 130.00, 18, 1),
(6, 'Teclado Mecánico', 2, 95.00, 40, 1);

--APAGAMOS EL PERMISO

set identity_insert productos OFF

--ENCENDEMOS PERMISO PARA INGRESAR DATOS EN VENTAS

set identity_insert ventas ON

--INSERT DATA VENTAS

insert into ventas (id_venta,id_cliente,id_producto,cantidad,precio_unitario,fecha_venta)
values
(1,1,1,2,1200.00,'2024-03-05'),
(2,2,2,5,28.00,'2024-03-06'),
(3,3,3,1,450.00,'2024-03-07'),
(4,1,4,2,120.00,'2024-03-08'),
(5,4,5,3,130.00,'2024-03-10'),
(6,2,6,4,95.00,'2024-03-11'),
(7,5,1,1,1200.00,'2024-03-12'),
(8,3,2,8,28.00,'2024-03-13'),
(9,4,4,1,120.00,'2024-03-14'),
(10,5,3,2,450.00,'2024-03-15');

--APAGAMOS EL PERMISO

set identity_insert ventas OFF


--CONFIRMAMOS CARGA CORRECTA DE DATOS

select * from categorias;
select * from clientes;
select * from productos;
select * from ventas;

