INSERT INTO EMPGASOLINERA VALUES ('001', 'Pemex', 'Victor', 'Rodriguez Padilla');
INSERT INTO EMPGASOLINERA VALUES ('002', 'Shell', 'Alberto', 'Fuente');
INSERT INTO EMPGASOLINERA VALUES ('003', 'Mobil', 'Solid', 'Perez');
INSERT INTO EMPGASOLINERA VALUES ('004', 'Hidrosina', 'Ricardo', 'Moran');
INSERT INTO EMPGASOLINERA VALUES ('005', 'Oxxogas', 'Jose Antonio', 'Fernandez Carbajal');
INSERT INTO EMPGASOLINERA VALUES ('006', 'G500 Network', 'Guillermo', 'Diez Barroso');
INSERT INTO EMPGASOLINERA VALUES ('007', 'TotalEnergies', 'Patrick', 'Pouyanne');
INSERT INTO EMPGASOLINERA VALUES ('008', 'Gasmart', 'Alejandro', 'Uribe Herrera');
INSERT INTO EMPGASOLINERA VALUES ('009', 'Gulf', ' Daniel', 'Hernandez Trejo');
INSERT INTO EMPGASOLINERA VALUES ('010', 'Gas Bienestar', 'Octavio', 'Romero Oropeza');

INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('001', 1000, 'Av. Insurgentes Sur 2075, San Ángel, Álvaro Obregón, 01000 Ciudad de México, CDMX', '5512345678');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('002', 1001, 'Av. Miguel Angel Quevedo, Monte de Piedad, Coyoacán, 04310 Ciudad de México, CDMX', '5512345677');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('003', 1002, 'Av Toluca 400, Olivar de los Padres, Álvaro Obregón, 01780 Ciudad de México, CDMX', '5512345676');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('004', 1003, 'Adolfo López Mateos 3352, Jardines del Pedregal, Álvaro Obregón, 01900 CDMX, CDMX', '5512345675');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('005', 1004, 'Blvd. Adolfo López Mateos 2173, Los Alpes, Álvaro Obregón, 01010 Ciudad de México, CDMX', '5512345674');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('006', 1005, 'Sagredo 265, Guadalupe Inn, Álvaro Obregón, 01020 Ciudad de México, CDMX', '5512345673');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('007', 1006, 'Av. Félix Cuevas, Col del Valle Sur, Benito Juárez, 03104 Ciudad de México, CDMX', '5512345672');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('008', 1007, 'Esq., Av. Universidad 1291, Acacias, Benito Juárez, 03240 Ciudad de México, CDMX', '5512345671');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('009', 1008, 'Eje 10 Sur, Av. Pedro Henríquez Ureña, Pedregal de San Francisco, 04369 Ciudad de México', '5512345670');
INSERT INTO SUCURSAL (idEmpGas, noSucursal, direccion, telefono) VALUES
('010', 1009, 'Centenario, Esq. Belisario Domínguez 13, Del Carmen, Coyoacán, 04000 CDMX', '5512345679');


INSERT INTO TIPOCOMBUSTIBLE VALUES ('Magna', 19.32,23.45);
INSERT INTO TIPOCOMBUSTIBLE VALUES ('Premium', 20.39,25.86);
INSERT INTO TIPOCOMBUSTIBLE VALUES ('Diesel', 22.69, 28.4);

INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (1, 'Magna', 65000, 60000, 0);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (1, 'Premium', 50000, 46000, 0);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (1, 'Diesel', 45000, 10000, 0);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (2, 'Magna', 65000, 5100, 1);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (3, 'Premium', 50000, 3400, 1);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (4, 'Premium', 50000, 6200, 0);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (5, 'Diesel', 45000, 2600, 1);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (9, 'Magna', 65000, 29000, 0);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (9, 'Premium', 50000, 15000, 0);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (9, 'Diesel', 45000, 21500, 0);
INSERT INTO CISTERNA (idSucursalSub, tipoComb, capacidadMax, litrosDisponibles, nivelBajo)
VALUES (7, 'Magna', 65000, 61500, 0);