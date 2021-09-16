

/*CIUDADES(cod_postal, Ciudad)*/

INSERT INTO Ciudad VALUES (8000, "Bahía Blanca");
INSERT INTO Ciudad VALUES (7500, "Tres Arroyos");
INSERT INTO Ciudad VALUES (7167, "Pinamar'");
INSERT INTO Ciudad VALUES (8153, "Mote Hermoso");
INSERT INTO Ciudad VALUES (7000, "Tandil");
INSERT INTO Ciudad VALUES (9500, "La plata");

/*Caja_ahorro(nro_ca, CBU, saldo)*/

INSERT INTO Caja_Ahorro VALUES(0, 1625532451526379526, 10.50);
INSERT INTO Caja_Ahorro VALUES(1, 9999999990000000999, 10.50);
INSERT INTO Caja_Ahorro VALUES(3, 23845526, 100000);

/*cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)*/
INSERT INTO Cliente VALUES(35555, "Villafaña", "Tadeo", "DNI", 42842432, "2983444967", str_to_date('12/10/2000', '%d/%m/%Y'));
INSERT INTO Cliente VALUES(12946, "Rodi", "Quimey", "DNI", 41953903, "2392569167", str_to_date('30/07/1999', '%d/%m/%Y'));
INSERT INTO Cliente VALUES(35535, "Flores", "Pepe", "DNI", 42815954, "2917856945", str_to_date('12/10/2000', '%d/%m/%Y'));

/*transaccion(nro_trans, fecha, hora, monto) */

INSERT INTO Transaccion VALUES(123568, str_to_date('30/07/2019', '%d/%m/%Y'), 1525, 785.21);
