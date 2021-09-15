

CREATE DATABASE banco;

USE banco;

CREATE TABLE Ciudad (
    cod_postal SMALLINT UNSIGNED NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    CONSTRAINT pk_Ciudad PRIMARY KEY (cod_postal)

)ENGINE=InnoDB;

CREATE TABLE Sucursal (
    nro_suc SMALLINT UNSIGNED NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    horario VARCHAR(40) NOT NULL,
    cod_postal SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Sucursal PRIMARY KEY (nro_suc),

    CONSTRAINT FK_Sucursal_Ciudad
    FOREIGN KEY (cod_postal) REFERENCES Ciudad(cod_postal)
        ON DELETE RESTRICT ON UPDATE CASCADE
)

CREATE TABLE Empleado(
    legajo SMALLINT UNSIGNED NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    tipo_doc VARCHAR(40) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono VARCHAR(40) NOT NULL,
    cargo VARCHAR(40) NOT NULL,
    password VARCHAR(40) NOT NULL,
    nro_suc VARCHAR(40) NOT NULL

    CONSTRAINT pk_Empleado PRIMARY KEY (nro_suc),

    CONSTRAINT FK_Empleado_Sucursal
    FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
        ON DELETE RESTRICT ON UPDATE CASCADE
)
