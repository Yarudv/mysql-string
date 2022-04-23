CREATE TABLE tlvbd.proveedores (
id_proveedor INT NOT NULL auto_increment,
nombre_representante varchar(25),
nombre_coorporativo varchar(25),
telf_contacto1 varchar(20),
telf_contacto2 varchar(20),
nombre_contacto varchar(25),
categoria_productos varchar(25),
correo_fact varchar(25),
primary key (id_proveedor));

CREATE TABLE tlvbd.clientes (
id_cliente INT NOT NULL auto_increment,
nombre_cliente varchar(25),
apellido_cliente varchar(25),
direccion_cliente varchar(30),
primary key (id_cliente)
);

CREATE TABLE tlvbd.productos (
id_producto INT not null auto_increment,
id_proveedor INT,
nombre varchar(25),
categoria varchar(25),
proveedor varchar(25),
precio INT,
color varchar(12),
primary key (id_producto),
constraint fk_proveedor foreign key(id_proveedor) references tlvbd.proveedores(id_proveedor));

INSERT INTO tlvbd.proveedores (nombre_representante, nombre_coorporativo, telf_contacto1, telf_contacto2, nombre_contacto, categoria_productos, correo_fact)
VALUES 
('Jose Perez','Perez y CIA',78956245874,7854236987,'Maria B','Tecnología','jperez@fhg.cl'),
('Maria Perez','MariaP y CIA',78956445874,7354236987,'Fernando B','Electronica','mperez@fhg.cl'),
('Manuel Osandon','Manuel y CIA',78958245874,7454236987,'Martin B','Telecomunicaciones','mosandon@fhg.cl'),
('Laura Lopez','Lopez y CIA',78956145874,7954236987,'Fernando F','Luminaria','Llopez@fhg.cl'),
('Hernan Briones','Briones y CIA',98956245874,4854236987,'Hernan B','Herramientas','hbriones@fhg.cl');

INSERT INTO tlvbd.clientes (nombre_cliente, apellido_cliente, direccion_cliente)
VALUES 
('Jose','Perez','Los platanos 123'),
('Manuel','Hernandez','Los platanos 12'),
('Andrea','Jaramillo','Los platanos 13'),
('Florencia','Ollarce','Los manzanos 3'),
('Javiera','Fuenzalida','Los naranjos 25');

ALTER TABLE tlvbd.productos ADD Stock INT;
INSERT INTO tlvbd.productos (id_proveedor, nombre, categoria, proveedor, precio, color, stock)
VALUES 
(1,'Antena digital','Tecnologia','Perez y CIA',25000,'rojo',25),
(2,'Bateria Litio','Electronica','MariaP y CIA',15000,'verde',30),
(3,'SmartPhone','Telecomunicaciones','Manuel y CIA',10000,'amarillo',12),
(4,'Ampolletas LED','Luminaria','Lopez y CIA',16000,'naranjo',2),
(5,'Taladro Percutor','Herramientas','Briones y CIA',35000,'azul',23),
(1,'NoteBook Lenovo 15"','Tecnologia','Perez y CIA',450000,'negra',50),
(2,'Condensadores','Electronica','MariaP y CIA',25000,'grises',30),
(3,'Walkie-Tok inalambricos','Telecomunicaciones','Manuel y CIA',300000,'verde',15),
(4,'Lampara halogena','Luminaria','Lopez y CIA',90000,'blanca',10),
(5,'Partidor de baterias','Herramientas','Briones y CIA',50000,'cafe',1);

/*categoria de producto que mas se repite */
Select categoria, count(categoria) from tlvbd.productos group by categoria; 

/*productos con mayor stock */
select stock from tlvbd.productos order by stock desc;

/*color de producto mas comun */
select color, count(color) c from tlvbd.productos group by color having c >1;

/*proveedores con menor stock */
select proveedor, stock from tlvbd.productos order by stock asc;

/*cambio de categoria mas popular (todas las categorías estaban en igual condiciones por lo que tomamos la categoria herramientas para cambiar */
UPDATE tlvbd.proveedores set categoria_productos ='Electronica y computacion' where id_proveedor=5; 
UPDATE tlvbd.productos set categoria ='Electronica y computacion' where id_proveedor=5; 