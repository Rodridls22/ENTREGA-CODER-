CREATE DATABASE ComidApp;
USE ComidApp;

CREATE TABLE UsuariosWeb (
ID int auto_increment not null,
Direccion varchar (100) not null,
Mail varchar(50) not null,
Nombre varchar(60) not null,
PRIMARY KEY (ID)
);

INSERT INTO UsuariosWeb (Direccion, Mail, Nombre)
VALUES ("18 de Julio 3284", "agustin@gmail.com", "Agustin Acosta"),
("8 de Octubre 2722", "martin@gmail.com", "Martin Martinez"),
("Colonia 2523", "santiago@gmail.com", "Santiago De Leon"),
("Durazno 1320", "rodrigo@gmail.com", "Rodrigo de Los Santos"),
("Av Bulevar Artigas 1754", "comidawow@gmail.com", "Comida WOW"),
("San Jose 1822", "elpepecomida@gmail.com", "El Pepe Comida"),
("Camino Carrasco 5062", "leapowersa@gmail.com", "Lea Power Comida");

CREATE TABLE Cliente (
IDCli int not null,
Apellido varchar(20) not null,
CICli varchar(8) not null,
FormaDePago varchar(100),
PRIMARY KEY (IDCli),
FOREIGN KEY (IDCli) REFERENCES UsuariosWeb(ID)
);

INSERT INTO Cliente (IDCli, Apellido, CICli, FormaDePago)
VALUES ("1", "Acosta", "11111111", "Tarjeta"),
("2", "Martinez", "22222222", "Tarjeta"),
("3", "De Leon", "33333333", "Efectivo"),
("4", "de Los Santos", "44444444", "Efectivo");

CREATE TABLE Solicitud (
ID int auto_increment not null,
Fecha date not null,
Direccion varchar(100) not null,
Nombre varchar(60) not null,
Mail varchar(50) not null,
Estado varchar (30) not null,
PRIMARY KEY (ID)
);

INSERT INTO Solicitud (Fecha, Direccion, Mail , Nombre, Estado)
VALUES (str_to_date('2023-07-01','%Y-%m-%d'), "Av Bulevar Artigas 1754", "comidawow@gmail.com" , "Comida WOW", "Validada"),
(str_to_date('2023-07-01','%Y-%m-%d'), "San Jose 1822", "El Pepe Comida", "elpepecomida@gmail.com", "Denegada"),
(str_to_date('2023-07-01','%Y-%m-%d'), "Camino Carrasco 5062", "Lea Power Comida", "leapowersa@gmail.com" , "Validada");

CREATE TABLE Empresa (
IDEmp int not null,
RUT varchar(20) not null,
PRIMARY KEY (IDEmp),
FOREIGN KEY (IDEmp) REFERENCES UsuariosWeb(ID)
);

INSERT INTO Empresa (IDEmp, RUT)
VALUES ("5", "11111111111"),
("6", "22222222222"),
("7", "33333333333");

CREATE TABLE TelefonosCliente (
IDCli int not null,
Telefono int not null,
PRIMARY KEY (IDCli, Telefono),
FOREIGN KEY (IDCli) REFERENCES Cliente(IDCli)
);

INSERT INTO TelefonosCliente (IDCli, Telefono)
VALUES ("1", "111111111"),
("2", "222222222"),
("3", "333333333"),
("4", "444444444");

CREATE TABLE TelefonosSolicitud (
IDSoli int not null,
Telefono int not null,
PRIMARY KEY (IDSoli, Telefono),
FOREIGN KEY (IDSoli) REFERENCES Solicitud(ID)
);

INSERT INTO TelefonosSolicitud (IDSoli, Telefono)
VALUES ("1", "555555555"),
("2", "666666666"),
("3", "777777777");

CREATE TABLE TelefonosEmpresa (
IDEmp int not null,
Telefono int not null,
PRIMARY KEY (IDEmp, Telefono),
FOREIGN KEY (IDEmp) REFERENCES Empresa(IDEmp)
);

INSERT INTO TelefonosEmpresa (IDEmp, Telefono)
VALUES ("5", "555555555"),
("6", "666666666"),
("7", "777777777");

CREATE TABLE Local (
ID int auto_increment not null,
IDEmp int not null,
Foto varchar(500),
Direccion varchar(100) not null,
Nombre varchar(60) not null,
Delivery boolean not null,
PRIMARY KEY (ID),
FOREIGN KEY (IDEmp) REFERENCES Empresa(IDEmp)
);

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("5", "https://lh3.googleusercontent.com/p/AF1QipPuEzx2guj16GDlfn8LRTVaa41rzDVon8tmeNQW=s680-w680-h510", "Colonia 1399", "Carrito Ale", "1");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("5", "https://lh3.googleusercontent.com/p/AF1QipODIRVufmYeocCFwuVaIesJVicvMcWDOCfbqifa=s680-w680-h510", "Rambla Presidente Charles de Gaulle", "Hamburgueseria El Condor", "0");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("5", "https://lh3.googleusercontent.com/p/AF1QipNzSGumcVfsNv9cPOFsFAzZptx3wATY1_UgbfKF=s680-w680-h510", "Avenida Jose Belloni 4603", "El Carro Naranja", "1");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("5", "https://lh3.googleusercontent.com/p/AF1QipOTnOZQWr-RwHoAywp11pDSui5JZB5HbiAcuJ19=s680-w680-h510", "Avenida Jose Belloni 4575", "El Carrito de Jorge", "0");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("6", "", "Camino Carrasco 6713", "Carrito Delicias Caseras", "1");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("6", "", "Rambla Edinson 2501", "Carrito Puerto Madero", "0");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("6", "https://lh3.googleusercontent.com/p/AF1QipOTkfM15SnovCyntN6E2dFC_CweTqJdQkiIB-DA=s680-w680-h510", "Colonia 1152", "Carrito El Italiano", "1");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("6", "", "Cuareim 1652", "Carrito Los Carlitos", "0");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("7", "https://lh3.googleusercontent.com/p/AF1QipMl-QThA1iMS9g_ZBS2yaJf2G1t2DvcEmh9TVKb=s680-w680-h510", "Avenida Libertador 1436", "El Macanudo", "1");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("7", "https://lh3.googleusercontent.com/p/AF1QipNnDr2AWtkcj9TP7QeinA3ICVI09OMffujaonen=s680-w680-h510", "General Pablo Galarza", "Carrito Rosita", "0");

INSERT INTO Local (IDEmp, Foto, Direccion, Nombre, Delivery)
VALUES ("7", "https://lh3.googleusercontent.com/p/AF1QipNtevGGGRZEOY0FV3IPYaeYu9fdGm_gheJKTxRr=s680-w680-h510", "Pablo de Maria", "Carrito Lalo", "1");

CREATE TABLE Articulos (
Codigo int auto_increment not null,
Nombre varchar(20) not null,
PRIMARY KEY(Codigo)
);

INSERT INTO Articulos (Nombre)
VALUES ("Hamburguesa completa");

INSERT INTO Articulos (Nombre)
VALUES ("Hamburguesa simple");

INSERT INTO Articulos (Nombre)
VALUES ("Pancho");

INSERT INTO Articulos (Nombre)
VALUES ("Pancho largo");

INSERT INTO Articulos (Nombre)
VALUES ("Bauru");

INSERT INTO Articulos (Nombre)
VALUES ("Chorizo al pan");

INSERT INTO Articulos (Nombre)
VALUES ("Hungara");

INSERT INTO Articulos (Nombre)
VALUES ("Kebab");

INSERT INTO Articulos (Nombre)
VALUES ("Coca Cola");

INSERT INTO Articulos (Nombre)
VALUES ("Coca Cola Zero");

INSERT INTO Articulos (Nombre)
VALUES ("Coca Cola Light");

INSERT INTO Articulos (Nombre)
VALUES ("Fanta");

INSERT INTO Articulos (Nombre)
VALUES ("Sprite");

INSERT INTO Articulos (Nombre)
VALUES ("Sprite Zero");

INSERT INTO Articulos (Nombre)
VALUES ("Agua con gas");

INSERT INTO Articulos (Nombre)
VALUES ("Agua sin gas");

CREATE TABLE Envia (
IDEmp int not null,
Direccion varchar (100) not null,
Mail varchar(50) not null,
Nombre varchar(20) not null,
RUT varchar(20) not null,
IDSoli int not null,
PRIMARY KEY (IDEmp),
FOREIGN KEY (IDEmp) REFERENCES UsuariosWeb(ID)
);

INSERT INTO Envia (IDEmp, Direccion, Mail, Nombre, RUT, IDSoli)
VALUES ("5", "Av Bulevar Artigas 1754", "comidawow@gmail.com", "Comida WOW", "11111111111", "1"),
("6", "San Jose 1822", "elpepecomida@gmail.com", "El Pepe Comida", "22222222222", "2"),
("7", "Camino Carrasco 5062", "leapowersa@gmail.com", "Lea Power Comida", "33333333333", "3");

CREATE TABLE Vende (
IDLoc int not null,
CodigoArt int not null,
Precio int not null,
FechaIniPrecio date not null,
FechaFinPrecio date,
PRIMARY KEY (IDLoc, CodigoArt, FechaIniPrecio),
FOREIGN KEY (IDLoc) REFERENCES Local(ID),
FOREIGN KEY (CodigoArt) REFERENCES Articulos(Codigo)
);

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("1", "1", "300", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "2", "190", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "5", "220", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "6", "200", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "8", "220", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("1", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("2", "1", "290", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "2", "150", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "5", "200", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "6", "160", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "8", "270", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("2", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("3", "1", "280", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "2", "155", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "5", "220", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "6", "170", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "8", "250", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("3", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("4", "1", "260", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "2", "160", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "5", "230", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "6", "170", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "8", "255",str_to_date('2023-07-01','%Y-%m-%d') ), 
("4", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("4", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("5", "1", "280", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "2", "170", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "5", "190", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "6", "160", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "8", "240", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "10", "60", str_to_date('2022-01-01','%Y-%m-%d') ), 
("5", "11", "60", str_to_date('2022-01-01','%Y-%m-%d') ), 
("5", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("5", "14", "60", str_to_date('2022-01-01','%Y-%m-%d') ), 
("5", "15", "60", str_to_date('2022-01-01','%Y-%m-%d') ), 
("5", "16", "60", str_to_date('2022-01-01','%Y-%m-%d') );

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("6", "1", "260", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "2", "250", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "5", "180", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "6", "150", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "8", "250", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("6", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("7", "1", "270", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "2", "250", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "4", "120", str_to_date('2022-01-01','%Y-%m-%d') ), 
("7", "5", "285", str_to_date('2022-01-01','%Y-%m-%d') ), 
("7", "6", "155", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "8", "270", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("7", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("8", "1", "295", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "2", "260", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "5", "270", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "6", "140", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "8", "240", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("8", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("9", "1", "300", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "2", "270", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "5", "250", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "6", "135", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "8", "260", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("9", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("10", "1", "275", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "2", "255", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "5", "260", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "6", "140", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "8", "270", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')),
("10", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("10", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

INSERT INTO Vende (IDLoc, CodigoArt, Precio, FechaIniPrecio)
VALUES ("11", "1", "265", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "2", "200", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "3", "75", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "4", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "5", "265", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "6", "120", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "7", "90", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "8", "255", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "9", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "10", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "11", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "12", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "13", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "14", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "15", "60", str_to_date('2022-01-01','%Y-%m-%d')), 
("11", "16", "60", str_to_date('2022-01-01','%Y-%m-%d'));

CREATE TABLE Compra (
IDCli int not null,
IDLoc int not null,
CodigoArt int not null,
Cantidad int not null,
Monto int not null,
Fecha date not null,
FechaIniPrecio date not null,
Valida boolean not null,
PRIMARY KEY (IDCli, IDLoc, CodigoArt, Fecha, FechaIniPrecio),
FOREIGN KEY (IDCli) REFERENCES Cliente(IDCli),
FOREIGN KEY (IDLoc, CodigoArt, FechaIniPrecio) REFERENCES Vende(IDLoc, CodigoArt, FechaIniPrecio)
);

INSERT INTO Compra (IDCli, IDLoc, CodigoArt, Cantidad, Monto, Fecha, FechaIniPrecio, Valida)
VALUES ("1", "1", "1", "2", "600", str_to_date('2023-07-02','%Y-%m-%d'), str_to_date('2022-01-01','%Y-%m-%d'), "1"),
("2", "2", "2", "2", "300", str_to_date('2022-01-01','%Y-%m-%d'), str_to_date('2022-01-01','%Y-%m-%d'), "1"),
("3", "3", "3", "3", "150", str_to_date('2023-06-30','%Y-%m-%d'), str_to_date('2022-01-01','%Y-%m-%d'), "0"),
("4", "4", "4", "1", "240", str_to_date('2023-06-29','%Y-%m-%d'), str_to_date('2022-01-01','%Y-%m-%d'), "0"),
("1", "1", "1", "4", "1200", str_to_date('2023-07-30','%Y-%m-%d'), str_to_date('2022-01-01','%Y-%m-%d'), "0");

/*VISTAS ARTICULO MAS VENDIDO*/

CREATE VIEW ArticulosMasVendidos AS
SELECT 
    A.Nombre AS NombreArticulo,
    COUNT(V.CodigoArt) AS CantidadVendida
FROM 
    Vende V
JOIN 
    Articulos A ON V.CodigoArt = A.Codigo
GROUP BY 
    A.Nombre
ORDER BY 
    CantidadVendida DESC;

/*SUCURSAL QUE VENDE MAS*/

CREATE VIEW SucursalMasVende AS
SELECT 
    L.ID AS IDLocal,
    L.Nombre AS NombreSucursal,
    COUNT(V.IDLoc) AS TotalVentas
FROM 
    Local L
JOIN 
    Vende V ON L.ID = V.IDLoc
GROUP BY 
    L.ID, L.Nombre
ORDER BY 
    TotalVentas DESC
LIMIT 1;

/*...................................*/
            /*FUNCIONES*/
	/*TOTAL DE EMPRESAS Y CLIENTES*/
/*...................................*/

DELIMITER //

CREATE FUNCTION TotalEmpresasYClientes()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE totalEmpresas INT;
    DECLARE totalClientes INT;
    DECLARE result VARCHAR(100);

    -- cuenta los numeros de empresas y clientes
    SELECT COUNT(*) INTO totalEmpresas FROM Empresa;
    SELECT COUNT(*) INTO totalClientes FROM Cliente;

    -- muestra el dato todo junto
    SET result = CONCAT('Total de Empresas: ', totalEmpresas, ', Total de Clientes: ', totalClientes);

    RETURN result;
END //

DELIMITER ;
/*...................................*/
		/*FORMAS DE PAGO*/
/*...................................*/

DELIMITER //

CREATE FUNCTION FormasDePagosCuenta()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE tarjeta_count INT;
    DECLARE efectivo_count INT;
    DECLARE result VARCHAR(100);
    
    SELECT COUNT(*) INTO tarjeta_count
    FROM Cliente
    WHERE FormaDePago = 'Tarjeta';
    
    SELECT COUNT(*) INTO efectivo_count
    FROM Cliente
    WHERE FormaDePago = 'Efectivo';
    
    SET result = CONCAT('Clientes que pagan con tarjeta: ', tarjeta_count, '. Clientes que pagan con efectivo: ', efectivo_count);
    
    RETURN result;
END //

DELIMITER ;

/*.........Stored Procedure.......*/
/*ACTUALIZAR EL ESTADO DE UNA SOLICITUD*/
/*...................................*/
DELIMITER //

CREATE PROCEDURE ActualizarEstadoSolicitud(
    IN p_IDSoli INT,
    IN p_NuevoEstado VARCHAR(30)
)
BEGIN
    UPDATE Solicitud
    SET Estado = p_NuevoEstado
    WHERE ID = p_IDSoli;
END //

DELIMITER ;
/*...................................*/
/*....Actaulzar delivery.....*/
/*...................................*/
DELIMITER //

CREATE PROCEDURE ActualizarDelivery(
    IN p_IDLoc INT,
    IN p_TieneDelivery BOOLEAN
)
BEGIN
    UPDATE Local
    SET Delivery = p_TieneDelivery
    WHERE ID = p_IDLoc;
END //

DELIMITER ;

/*..................................*/
/*............TRIGGERS.............*/
/*.....CheckDeliveryAntesDe......*/

DELIMITER //

CREATE TRIGGER CheckDeliveryAntesDe
BEFORE INSERT ON Compra
FOR EACH ROW
BEGIN
    DECLARE delivery BOOLEAN;
    SELECT Delivery INTO delivery
    FROM Local
    WHERE ID = NEW.IDLoc;

    IF delivery = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Esta sucursal no ofrece servicio de delivery.';
    END IF;
END //

DELIMITER ;
/*.....CheckDireccionEnviaAntesDe......*/
DELIMITER //
CREATE TRIGGER CheckDireccionEnviaAntesDe
BEFORE INSERT ON Envia
FOR EACH ROW
BEGIN
    -- Verificar si la dirección está vacía o nula
    IF NEW.Direccion IS NULL OR NEW.Direccion = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede enviar sin una dirección especificada.';
    END IF;
END //
DELIMITER ;
/*..................................*/
/*..................................*/