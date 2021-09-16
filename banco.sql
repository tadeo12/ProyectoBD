

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
)ENGINE=InnoDB;

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
)ENGINE=InnoDB;

CREATE TABLE Caja_Ahorro (
    nro_ca INT UNSIGNED NOT NULL,
    CBU BIGINT UNSIGNED NOT NULL,
    saldo FLOAT(20,2) UNSIGNED NOT NULL

    CONSTRAINT pk_Caja_Ahorro PRIMARY KEY (nro_ca)

)ENGINE=InnoDB;

CREATE TABLE Cliente_CA (
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_Caja_Ahorro PRIMARY KEY (nro_cliente, nro_ca)

   CONSTRAINT FK_Cliente_CA_Cliente
    FOREIGN KEY (nro_cliente) REFERENCES Cliente (nro_cliente)  
       ON DELETE RESTRICT ON UPDATE CASCADE

    CONSTRAINT FK_Cliente_CA_Caja_Ahorro
    FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro (nro_ca)
        ON DELETE RESTRICT ON UPDATE CASCADE 

)ENGINE=InnoDB;

CREATE TABLE Caja (
    cod_caja MEDIUMINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Caja PRIMARY KEY (cod_caja)
)ENGINE=InnoDB;

CREATE TABLE Transaccion (
    nro_trans BIGINT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    hora VARCHAR(5) NOT NULL,
    monto FLOAT(20,2) UNSIGNED NOT NULL

    CONSTRAINT pk_Transaccion PRIMARY KEY (nro_trans)

)ENGINE=InnoDB;

CREATE TABLE Transaccion_por_caja (
    nro_trans BIGINT UNSIGNED NOT NULL,
    cod_caja  MEDIUMINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Transaccion_por_caja PRIMARY KEY (nro_trans)

    CONSTRAINT FK_Transaccion_por_caja_Transaccion
    FOREIGN KEY (nro_trans) REFERENCES Transaccion (nro_trans)  
       ON DELETE RESTRICT ON UPDATE CASCADE

    CONSTRAINT FK_Transaccion_por_caja_Caja
    FOREIGN KEY (cod_caja) REFERENCES Caja (cod_caja)
        ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB;

CREATE TABLE Transferencia (
    nro_trans BIGINT UNSIGNED NOT NULL,
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,
    origen INT UNSIGNED NOT NULL, /*corresponde con nro caja de ahorro de la relacion Cliente_CA*/
    destino INT UNSIGNED NOT NULL /*nro caja de ahorro destino*/

    CONSTRAINT pk_Transferencia PRIMARY KEY (nro_trans)

    CONSTRAINT FK_Transferencia_Cliente_CA
    FOREIGN KEY (origen) REFERENCES Transaccion (nro_ca)  
       ON DELETE RESTRICT ON UPDATE CASCADE

    CONSTRAINT FK_Transferencia_Cliente_Caja_Ahorro
    FOREIGN KEY (destino) REFERENCES Transaccion (nro_ca)  
       ON DELETE RESTRICT ON UPDATE CASCADE


)ENGINE=InnoDB;

