

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
    nro_doc INT UNSIGNED NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono VARCHAR(40) NOT NULL,
    cargo VARCHAR(40) NOT NULL,
    password VARCHAR(40) NOT NULL,
    nro_suc VARCHAR(40) NOT NULL,

    CONSTRAINT pk_Empleado PRIMARY KEY (nro_suc),

    CONSTRAINT FK_Empleado_Sucursal
    FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
        ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Cliente (
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    tipo_doc VARCHAR(40) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono VARCHAR(40) NOT NULL,
    nro_doc INT UNSIGNED NOT NULL,
    fecha_nac DATE NOT NULL,

    CONSTRAINT pk_Cliente PRIMARY KEY (nro_cliente),

)ENGINE=InnoDB;

CREATE TABLE Plazo_Fijo(
    nro_plazo INT UNSIGNED NOT NULL,
    capital FLOAT(20,2) NOT NULL,
    tasa_interes FLOAT(6,2) NOT NULL,
    interes FLOAT(20,2) NOT NULL,
    nro_suc SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Cliente PRIMARY KEY (nro_cliente)

    CONSTRAINT FK_Plazo_Fijo_Sucursal 
    FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
    ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB;

CREATE TABLE Tasa_Plazo_Fijo (
    periodo SMALLINT UNSIGNED NOT NULL,
    monto_inf FLOAT(20,2) UNSIGNED NOT NULL,
    monto_sup FLOAT(20,2) UNSIGNED NOT NULL,
    tasa FLOAT(7,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_Tasa_Plazo_Fijo PRIMARY KEY (periodo, monto_inf, monto_sup)
)ENGINE=InnoDB;

CREATE TABLE Plazo_Cliente (
    nro_plazo INT UNSIGNED NOT NULL,
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Plazo_Cliente PRIMARY KEY (nro_plazo, nro_cliente),

    CONSTRAINT FK_Plazo_Cliente_Plazo_Fijo 
    FOREIGN KEY (nro_plazo) REFERENCES Plazo_Fijo (nro_plazo) 
       ON DELETE RESTRICT ON UPDATE CASCADE,
    /*RESTRICCIONES DE DELETE*/
    CONSTRAINT FK_Plazo_Cliente_Cliente 
    FOREIGN KEY (nro_cliente) REFERENCES Cliente (nro_cliente)  
       ON DELETE RESTRICT ON UPDATE CASCADE  

)ENGINE=InnoDB;

CREATE TABLE Prestamo (
    nro_prestamo INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    cant_meses TINYINT UNSIGNED NOT NULL,
    monto FLOAT(20,2) UNSIGNED NOT NULL,
    tasa_interes FLOAT(7,2) UNSIGNED NOT NULL,
    interes FLOAT(20,2) UNSIGNED NOT NULL,
    valor_cuota FLOAT(20,2) UNSIGNED NOT NULL,
    legajo SMALLINT UNSIGNED NOT NULL, /*DE EMPLEADO*/
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Prestamo PRIMARY KEY (nro_prestamo),

    CONSTRAINT FK_Prestamo_Empleado 
    FOREIGN KEY (legajo) REFERENCES Empleado (legajo)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    /*RESTRICCIONES DE DELETE*/
    CONSTRAINT FK_Prestamo_Cliente
    FOREIGN KEY (nro_cliente) REFERENCES Cliente (nro_cliente)
    ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB;

CREATE TABLE Pago (
    nro_prestamo INT UNSIGNED NOT NULL,
    nro_pago TINYINT UNSIGNED NOT NULL,
    fecha_venc DATE NOT NULL,
    fecha_pago DATE NOT NULL,

    CONSTRAINT pk_Pago PRIMARY KEY (nro_prestamo, nro_pago),
    
    CONSTRAINT FK_Pago_Prestamo
    FOREIGN KEY (nro_prestamo) REFERENCES Prestamo (nro_prestamo)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    /*RESTRICCIONES DE DELETE*/

)ENGINE=InnoDB;

CREATE TABLE Tasa_Prestamo(
    periodo SMALLINT UNSIGNED NOT NULL,
    monto_inf FLOAT(20,2) UNSIGNED NOT NULL,
    monto_sup FLOAT(20,2) UNSIGNED NOT NULL,
    tasa FLOAT(7,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_Tasa_Prestamo PRIMARY KEY (periodo, monto_inf, monto_sup)   

)ENGINE=InnoDB;

CREATE TABLE Caja_Ahorro (
    nro_ca INT UNSIGNED NOT NULL,
    CBU BIGINT UNSIGNED NOT NULL,
    saldo FLOAT(20,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_Caja_Ahorro PRIMARY KEY (nro_ca)

)ENGINE=InnoDB;

CREATE TABLE Cliente_CA (
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_Caja_Ahorro PRIMARY KEY (nro_cliente, nro_ca),

   CONSTRAINT FK_Cliente_CA_Cliente
    FOREIGN KEY (nro_cliente) REFERENCES Cliente (nro_cliente)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
    /*PREGUNTAR SOBRE LAS RESTRICCIONES DE DELETE*/
    CONSTRAINT FK_Cliente_CA_Caja_Ahorro
    FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro (nro_ca)
        ON DELETE RESTRICT ON UPDATE CASCADE 

)ENGINE=InnoDB;

CREATE TABLE Tarjeta (
    nro_tarjeta BIGINT UNSIGNED NOT NULL,
    PIN VARCHAR(32) NOT NULL,
    CVT VARCHAR (32) NOT NULL,
    fecha_venc DATE NOT NULL,
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_Tarjeta PRIMARY KEY (nro_tarjeta),

    CONSTRAINT FK_Tarjeta_Cliente_CA
    /*FORMATO DE LAS DOS CLAVES ESTA BIEN?????*/
    FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA (nro_cliente, nro_ca)  
       ON DELETE RESTRICT ON UPDATE CASCADE
    /*PREGUNTAR SOBRE LAS RESTRICCIONES DE DELETE*/

)ENGINE=InnoDB;

CREATE TABLE Caja (
    cod_caja MEDIUMINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Caja PRIMARY KEY (cod_caja)
)ENGINE=InnoDB;

CREATE TABLE Ventanilla (
    cod_caja MEDIUMINT UNSIGNED NOT NULL,
    nro_suc SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Ventanilla PRIMARY KEY (cod_caja),

    CONSTRAINT FK_Ventanilla_Caja
    FOREIGN KEY (cod_caja) REFERENCES Caja (cod_caja)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
    /*PREGUNTAR SOBRE LAS RESTRICCIONES DE DEL Delete*/
    CONSTRAINT FK_Ventanilla_Sucursal
    FOREIGN KEY (nro_suc) REFERENCES Sucursal (nro_suc)  
       ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE ATM (
    cod_caja MEDIUMINT UNSIGNED NOT NULL,
    cod_postal SMALLINT UNSIGNED NOT NULL,
    direccion VARCHAR(40) NOT NULL,

    CONSTRAINT pk_ATM PRIMARY KEY (cod_caja),

    CONSTRAINT FK_ATM_Caja
    FOREIGN KEY (cod_caja) REFERENCES Caja (cod_caja)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
    /*PREGUNTAR SOBRE LAS RESTRICCIONES DE DEL Delete*/
    CONSTRAINT FK_ATM_Ciudad
    FOREIGN KEY (cod_postal) REFERENCES Ciudad (cod_postal)  
       ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Transaccion (
    nro_trans BIGINT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    hora VARCHAR(5) NOT NULL, /*FORMATO DE LA HORA (????)*/
    monto FLOAT(20,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_Transaccion PRIMARY KEY (nro_trans)

)ENGINE=InnoDB;

CREATE TABLE Debito (
    nro_trans BIGINT UNSIGNED NOT NULL,
    descripcion VARCHAR (80) NOT NULL,
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_Debito PRIMARY KEY (nro_trans),

    CONSTRAINT FK_Debito_Transaccion
    FOREIGN KEY (nro_trans) REFERENCES Transaccion (nro_trans)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
    /*FORMATO DE DELETE ???????*/
    CONSTRAINT FK_Debito_Cliente_CA
    /*FORMATO DE LAS DOS CLAVES ESTA BIEN?????*/
    FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA (nro_cliente, nro_ca)  
       ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;

CREATE TABLE Transaccion_por_caja (
    nro_trans BIGINT UNSIGNED NOT NULL,
    cod_caja  MEDIUMINT UNSIGNED NOT NULL,

    CONSTRAINT pk_Transaccion_por_caja PRIMARY KEY (nro_trans),

    CONSTRAINT FK_Transaccion_por_caja_Transaccion
    FOREIGN KEY (nro_trans) REFERENCES Transaccion (nro_trans)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
    /*FORMATO DE DELETE ???????*/
    CONSTRAINT FK_Transaccion_por_caja_Caja
    FOREIGN KEY (cod_caja) REFERENCES Caja (cod_caja)
        ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB;

CREATE TABLE Deposito (
    nro_trans BIGINT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_Deposito PRIMARY KEY (nro_trans),

    CONSTRAINT FK_Deposito_Transaccion_por_caja
    FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja (nro_trans)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
    /*DELETE (?) JEJE*/
    CONSTRAINT FK_Deposito_Caja_Ahorro
    FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro (nro_ca)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
    

)ENGINE=InnoDB;

CREATE TABLE Extraccion (
    nro_trans  BIGINT UNSIGNED NOT NULL,
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_Extraccion PRIMARY KEY (nro_trans),

    CONSTRAINT FK_Extraccion_Transaccion_por_caja
    FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja (nro_trans)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
    /*DELETE (?) JEJE*/
    CONSTRAINT FK_Extraccion_Cliente_CA
    /*FORMATO DE LAS DOS CLAVES ESTA BIEN?????*/
    FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA (nro_cliente, nro_ca)  
       ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Transferencia (
    nro_trans BIGINT UNSIGNED NOT NULL,
    nro_cliente MEDIUMINT UNSIGNED NOT NULL,
    origen INT UNSIGNED NOT NULL, /*corresponde con nro caja de ahorro de la relacion Cliente_CA*/
    destino INT UNSIGNED NOT NULL, /*nro caja de ahorro destino*/

    CONSTRAINT pk_Transferencia PRIMARY KEY (nro_trans),

      CONSTRAINT FK_Transferencia_Transaccion_por_caja
    FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja (nro_trans)  
       ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT FK_Transferencia_Cliente
    FOREIGN KEY (nro_cliente) REFERENCES Cliente (nro_cliente)  
       ON DELETE RESTRICT ON UPDATE CASCADE

    CONSTRAINT FK_Transferencia_Cliente_CA
    FOREIGN KEY (origen) REFERENCES Cliente_CA (nro_ca)  
       ON DELETE RESTRICT ON UPDATE CASCADE,
/*LO MISMO PARA EL DESTINO QUE EL ORIGEN???*/
    CONSTRAINT FK_Transferencia_Caja_Ahorro
    FOREIGN KEY (destino) REFERENCES Caja_Ahorro (nro_ca)  
       ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB;

/* VISTA */

 CREATE VIEW trans_cajas_ahorro AS 
   SELECT b.nombre_barco, b.capitan, 
          c.clase, c.pais, c.nro_caniones, c.calibre, c. desplazamiento,
		  b_c.lanzado
   FROM (barcos as b JOIN  barco_clase as b_c ON b.nombre_barco = b_c.nombre_barco) 
        JOIN clases as c   ON c.clase = b_c.clase
   WHERE ;



/* CREACIÓN DE USUARIOS Y PRIVILEGIOS*/


CREATE USER 'admin'@'localhost'  IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'empleado'@'%'  IDENTIFIED BY 'empleado';
GRANT SELECT ON banco.Sucursal TO 'empleado'@'%' ;
GRANT SELECT ON banco.Tasa_Plazo_Fijo TO 'empleado'@'%' ;
GRANT SELECT ON banco.Tasa_Prestamo TO 'empleado'@'%' ;

GRANT SELECT, INSERT ON banco.Prestamo TO 'empleado'@'%' ;
GRANT SELECT, INSERT ON banco.Plazo_Fijo TO 'empleado'@'%' ;
GRANT SELECT, INSERT ON banco.Plazo_Cliente TO 'empleado'@'%' ;
GRANT SELECT, INSERT ON Caja_AhorroTO 'empleado'@'%' ;
GRANT SELECT, INSERT ON Tarjeta TO 'empleado'@'%' ;

GRANT SELECT, INSERT, UPDATE ON Cliente_CA TO 'empleado'@'%' ;
GRANT SELECT, INSERT, UPDATE ON Cliente TO 'empleado'@'%' ;
GRANT SELECT, INSERT, UPDATE ON Pago TO 'empleado'@'%' ;


/*update*/