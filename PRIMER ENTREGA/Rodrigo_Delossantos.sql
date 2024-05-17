CREATE DATABASE ComidApp;
USE ComidApp;

CREATE TABLE UsuariosWeb (
ID int auto_increment not null,
Direccion varchar (100) not null,
Mail varchar(50) not null,
Nombre varchar(20) not null,
PRIMARY KEY (ID)
);

CREATE TABLE Cliente (
IDCli int not null,
Apellido varchar(20) not null,
CICli varchar(8) not null,
FormaDePago varchar(100),
PRIMARY KEY (IDCli),
FOREIGN KEY (IDCli) REFERENCES UsuariosWeb(ID)
);


CREATE TABLE Solicitud (
ID int auto_increment not null,
Fecha date not null,
Direccion varchar(100) not null,
Nombre varchar(20) not null,
Mail varchar(50) not null,
Estado varchar (30) not null,
PRIMARY KEY (ID)
);

CREATE TABLE Empresa (
IDEmp int not null,
RUT int not null,
PRIMARY KEY (IDEmp),
FOREIGN KEY (IDEmp) REFERENCES UsuariosWeb(ID)
);

CREATE TABLE TelefonosCliente (
IDCli int not null,
Telefono int not null,
PRIMARY KEY (IDCli, Telefono),
FOREIGN KEY (IDCli) REFERENCES Cliente(IDCli)
);

CREATE TABLE TelefonosSolicitud (
IDSoli int not null,
Telefono int not null,
PRIMARY KEY (IDSoli, Telefono),
FOREIGN KEY (IDSoli) REFERENCES Solicitud(ID)
);


CREATE TABLE TelefonosEmpresa (
IDEmp int not null,
Telefono int not null,
PRIMARY KEY (IDEmp, Telefono),
FOREIGN KEY (IDEmp) REFERENCES Empresa(IDEmp)
);

CREATE TABLE Local (
ID int auto_increment not null,
IDEmp int not null,
Foto varchar(500),
Direccion varchar(100) not null,
Nombre varchar(20) not null,
Delivery boolean not null,
PRIMARY KEY (ID),
FOREIGN KEY (IDEmp) REFERENCES Empresa(IDEmp)
);



CREATE TABLE Articulos (
Codigo int auto_increment not null,
Nombre varchar(20) not null,
PRIMARY KEY(Codigo)
);

CREATE TABLE Envia (
IDEmp int not null,
Direccion varchar (100) not null,
Mail varchar(50) not null,
Nombre varchar(20) not null,
RUT int not null,
IDSoli int not null,
PRIMARY KEY (IDEmp),
FOREIGN KEY (IDEmp) REFERENCES UsuariosWeb(ID)
);

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
