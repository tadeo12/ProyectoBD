/*CIUDADES(cod_postal, Ciudad)*/
INSERT INTO Ciudad  VALUES (8000, "Bahía Blanca");
INSERT INTO Ciudad  VALUES (7500, "Tres Arroyos");
INSERT INTO Ciudad  VALUES (7167, "Pinamar'");
INSERT INTO Ciudad  VALUES (8153, "Mote Hermoso");
INSERT INTO Ciudad  VALUES (7000, "Tandil");
INSERT INTO Ciudad  VALUES (9500, "La plata");

/*Sucursal (nro_suc, nombre, direccion, telefono, horario, cod_postal)*/
INSERT INTO Sucursal (nombre, direccion, telefono, horario, cod_postal) 
    VALUES("la Sucu", "Peru 200", "291 6789191", "de 9 a 9:15", 8000);
INSERT INTO Sucursal (nombre, direccion, telefono, horario, cod_postal) 
    VALUES("Rsal", "Alsina 560", "2983 568941", "de 8 a 9:15", 7500);

/*Empleado (legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, PASSWORD, nro_suc)*/
INSERT INTO Empleado (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, PASSWORD, nro_suc) 
VALUES("Gonzalo", "Selene", "DNI", 41956781, "Cordoba 569", "2392 589641","Administrativo", md5('Cl123'), 1);
INSERT INTO Empleado (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, PASSWORD, nro_suc) 
VALUES("Alvarez", "Fermin", "DNI", 41563485, "Panama 1200", "2392 590269","Ejecutivo", md5('Fermin321'), 1);
INSERT INTO Empleado (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, PASSWORD, nro_suc) 
VALUES("Villafaña", "Tobias", "DNI", 32563785, "Vieytes 700", "2983 560269","Administrativo", md5('Tobi123'),2);

/*Cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)*/
INSERT INTO Cliente (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES("Villafaña", "Tadeo", "DNI", 42842432, "12 de octubre 870",  "2983444967", str_to_date('12/10/2000', '%d/%m/%Y'));
INSERT INTO Cliente (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES("Rodi", "Quimey", "DNI", 41953903, "Cordoba 39", "2392569167", str_to_date('30/07/1999', '%d/%m/%Y'));
INSERT INTO Cliente (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES("Flores", "Pepe", "DNI", 42815954,"A la vuelta de la esquina", "2917856945", str_to_date('12/10/2000', '%d/%m/%Y'));

/*Plazo_fijo (nro_plazo, capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc)*/
INSERT INTO Plazo_fijo (capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc) 
    VALUES("2300.50", "2021/08/17", "2021/09/17", 2.5, (capital * tasa_interes), 1);
INSERT INTO Plazo_fijo (capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc) 
    VALUES("30000", "2021/07/20", "2021/09/20", 5.5, (capital * tasa_interes), 2);
INSERT INTO Plazo_fijo (capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc) 
    VALUES("500000", "2021/07/7", "2021/09/7", 6.5, (capital * tasa_interes), 1);

/*Tasa_plazo_fijo (periodo, monto_inf, monto_sup, tasa)*/
INSERT INTO Tasa_plazo_fijo (periodo, monto_inf, monto_sup, tasa)
    VALUES(30,1000, 10000, 2.5);
INSERT INTO Tasa_plazo_fijo (periodo, monto_inf, monto_sup, tasa)
    VALUES(60,10000, 100000, 5.5);
INSERT INTO Tasa_plazo_fijo (periodo, monto_inf, monto_sup, tasa)
    VALUES(90,100000, 1000000, 6.5);

/*Plazo_cliente (nro_plazo, nro_cliente)*/
INSERT INTO Plazo_cliente VALUES(1, 3);
INSERT INTO Plazo_cliente VALUES(2, 1);
INSERT INTO Plazo_cliente VALUES(3, 2);

/*Prestamo (nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente)*/
INSERT INTO Prestamo (fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente)
     VALUES("2021/08/20", 10, 100000, 25, (monto * tasa_interes), 10000, 2, 1);
INSERT INTO Prestamo (fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente)
     VALUES("2021/07/30", 10, 100000, 25, (monto * tasa_interes), 10000, 1, 2);

/*Pago (nro_prestamo, nro_pago, fecha_venc, fecha_pago)*/
INSERT INTO Pago VALUES(1, 1, "2022/06/20", NULL);
INSERT INTO Pago VALUES(2, 1, "2022/05/30", NULL);

/*Tasa_prestamo (periodo, monto_inf, monto_sup, tasa)*/
INSERT INTO Tasa_prestamo VALUES(30,1000, 10000, 2.5);
INSERT INTO Tasa_prestamo VALUES(60,10000, 100000, 5.5);
INSERT INTO Tasa_prestamo VALUES(90,100000, 1000000, 6.5);

/*Caja_ahorro(nro_ca, CBU, saldo)*/
INSERT INTO Caja_Ahorro (CBU, saldo) VALUES(1625532451526379526, 10.50);
INSERT INTO Caja_Ahorro (CBU, saldo) VALUES(9999999990000000999, 10000.50);
INSERT INTO Caja_Ahorro (CBU, saldo) VALUES(23845526, 100000);

/*Cliente_CA (nro_cliente, nro_ca)*/
INSERT INTO Cliente_CA VALUES(1, 3); /* (tadeo caja 3) */
INSERT INTO Cliente_CA VALUES(2, 2); /* (quimey caja 2) */
INSERT INTO Cliente_CA VALUES(3, 1); /* (pepe caja 1) */

/*Tarjeta (nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)*/
INSERT INTO Tarjeta (PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES( md5(3652), md5(65312), "2027/09/01", 2, 2);
INSERT INTO Tarjeta (PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES( md5(2916), md5(65310), "2025/07/01", 1, 3);
INSERT INTO Tarjeta (PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES( md5(0918), md5(65316), "2023/08/01", 3, 1);

/*Caja(cod_caja) */ 
INSERT INTO Caja VALUES();
INSERT INTO Caja VALUES();
INSERT INTO Caja VALUES();
INSERT INTO Caja VALUES();
INSERT INTO Caja VALUES();

/*Ventanilla (cod_caja, nro_suc)*/
INSERT INTO Ventanilla VALUES (1, 1);
INSERT INTO Ventanilla VALUES (2, 1);
INSERT INTO Ventanilla VALUES (3, 2);

/*ATM  (cod_caja, cod_postal, direccion)*/
INSERT INTO ATM VALUES (4, 8000, "Zelarrayan 620");
INSERT INTO ATM VALUES (5, 8153, "Monte Verde 210");

/*Transaccion(nro_trans, fecha, hora, monto) */
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('15/07/2019', '%d/%m/%Y'), '15:25', 785.21); 
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('30/05/2021', '%d/%m/%Y'), '20:25', 1000);
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('24/07/2019', '%d/%m/%Y'), '12:30', 475.50);
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('30/06/2020', '%d/%m/%Y'), '04:10', 15000.99);

INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('20/06/2021', '%d/%m/%Y'), '16:18', 1800);
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('15/01/2021', '%d/%m/%Y'), '17:40', 8000.99);
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('14/02/2021', '%d/%m/%Y'), '20:30', 10000.50);

INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('03/06/2021', '%d/%m/%Y'), '18:10', 1330.25);
INSERT INTO Transaccion (fecha, hora, monto) VALUES(str_to_date('21/07/2021', '%d/%m/%Y'), '07:40', 1692.99);

/* Debito(nro_trans, descripcion, nro_cliente,nro_ca)*/
INSERT INTO Debito VALUES(1, " Verduleria 'Los hermanos' ", 1, 3);
INSERT INTO Debito VALUES(8, " Edna modas ", 2, 2);
INSERT INTO Debito VALUES(9, " kios-kito ", 3, 1);

/* Transaccion_por_caja(nro_trans, cod_caja)*/
INSERT INTO Transaccion_por_caja VALUES (2, 1);
INSERT INTO Transaccion_por_caja VALUES (3, 3);
INSERT INTO Transaccion_por_caja VALUES (4, 2);

INSERT INTO Transaccion_por_caja VALUES (5, 2);
INSERT INTO Transaccion_por_caja VALUES (6, 4);
INSERT INTO Transaccion_por_caja VALUES (7, 5);

/* Deposito(nro_trans, nro_ca)*/
INSERT INTO Deposito VALUES(2, 1);
INSERT INTO Deposito VALUES(6, 2);

/*Extraccion(nro_trans, nro_cliente, nro_ca)*/
INSERT INTO Extraccion VALUES(3, 3 ,1);
INSERT INTO Extraccion VALUES(5, 1 ,3);

/*Transferencia(nro_trans, nro_cliente, origen, destino)*/
INSERT INTO Transferencia VALUES(4, 1, 3, 2);
INSERT INTO Transferencia VALUES(7, 3, 1, 3);

