--CREAR DATA BASE practicas
create database Practicas;

--USAMOS ESA DATA BASE
use Practicas

--CREAR TABLA clientes
create table clientes(
id_cliente int not null identity (1,1) primary key, -- generamos el id cliente, con valor de numero entero, sin poder dejar en blanco, 1 en 1, siendo llave primaria para la relacion de tablas
nombre varchar (100), -- generamos nombre con varchar de maximo 100 caracteres, para que almacene unicamnete los caracteres ingresados
perfil_bio text, -- generamos perfil_bio  con texto
fecha_registro date -- generamos fecha_registro con date, para ingresar unicamente una fecha (dd/mm/aa)
);

--CREAR TABLA productos
create table productos(
id_producto int not null identity (1,1) primary key, --generamos id_producto, con valor entero, sin poder dejar en blanco, 1 en 1, siendo llave primaria para relacion de tablas
descripcion varchar (255), --generamos descripcion con varchar de maximo 255 caracteres, para que almacene unicamente los caracteres ingresados
precio decimal (10,2), --generamos precio para poder ingresar un numero decimal, con maximo de 10 numeros antes de la coma, y 2 despues
esta_activo bit -- almacena 1 activo, 0 no activo 
);