

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

CREATE TABLE Transaccion (
    nro_trans BIGINT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    hora VARCHAR(5) NOT NULL,
    monto FLOAT(20,2) UNSIGNED NOT NULL

    CONSTRAINT pk_Transaccion PRIMARY KEY (nro_trans)

)

CREATE TABLE Transaccion_por_caja (
    nro_trans
    cod_caja

)

CREATE TABLE Transferencia (
    nro_trans
    nro_cliente 
    origen
    destino

)