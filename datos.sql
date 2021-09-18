

/*CIUDADES(cod_postal, Ciudad)*/

INSERT INTO Ciudad  VALUES (8000, "Bahía Blanca");
INSERT INTO Ciudad  VALUES (7500, "Tres Arroyos");
INSERT INTO Ciudad  VALUES (7167, "Pinamar'");
INSERT INTO Ciudad  VALUES (8153, "Mote Hermoso");
INSERT INTO Ciudad  VALUES (7000, "Tandil");
INSERT INTO Ciudad  VALUES (9500, "La plata");

/*Caja_ahorro(nro_ca, CBU, saldo)*/

INSERT INTO Caja_Ahorro (CBU, saldo) VALUES(1625532451526379526, 10.50);
INSERT INTO Caja_Ahorro (CBU, saldo) VALUES(9999999990000000999, 10000.50);
INSERT INTO Caja_Ahorro (CBU, saldo) VALUES(23845526, 100000);

/*cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)*/
INSERT INTO Cliente (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES("Villafaña", "Tadeo", "DNI", 42842432, "12 de octubre 870",  "2983444967", str_to_date('12/10/2000', '%d/%m/%Y'));
INSERT INTO Cliente (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES("Rodi", "Quimey", "DNI", 41953903, "Cordoba 39", "2392569167", str_to_date('30/07/1999', '%d/%m/%Y'));
INSERT INTO Cliente (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES("Flores", "Pepe", "DNI", 42815954,"A la vuelta de la esquina", "2917856945", str_to_date('12/10/2000', '%d/%m/%Y'));

/* cliente_CA (nro_cliente, nro_ca)*/

INSERT INTO Cliente_CA VALUES(1, 3); /* (tadeo caja 3) */
INSERT INTO cliente_CA VALUES(2, 2); /* (quimey caja 2) */
INSERT INTO cliente_CA VALUES(3, 1); /* (pepe caja 1) */

/*transaccion(nro_trans, fecha, hora, monto) */

INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('15/07/2019', '%d/%m/%Y'), 1525, 785.21); 
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('30/05/2021', '%d/%m/%Y'), 2025, 1000);
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('24/07/2019', '%d/%m/%Y'), 1230, 475.50);
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('30/06/2020', '%d/%m/%Y'), 0410, 15000.99);


/* Debito(nro_trans, descripcion, nro_cliente,nro_ca)*/
INSERT INTO Debito VALUES(1, "almacen qcyo verduleria", 2, 2);

/*caja(cod_caja)*/
INSERT INTO Caja VALUES(1);
INSERT INTO Caja VALUES(2);

/* Transaccion_por_caja(nro_trans, cod_caja)*/
INSERT INTO Transaccion_por_caja VALUES (2, 1);
INSERT INTO Transaccion_por_caja VALUES (3, 1);
INSERT INTO Transaccion_por_caja VALUES (4, 2);

/* Deposito(nro_trans, nro_ca)*/
INSERT INTO Deposito VALUES(2, 1);

/*extraccion(nro_trans, nro_cliente, nro_ca)*/
INSERT INTO Extraccion VALUES(2,3 ,1);

/*transferencia(nro_trans, nro_cliente, origen, destino)*/
INSERT INTO Transferencia VALUES(4, 1, 3, 2);
