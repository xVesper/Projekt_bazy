CREATE TABLE  procesory(
ID_Procesory INT AUTO_INCREMENT PRIMARY KEY,
Nazwa VARCHAR(200),
Rodzina VARCHAR(200),
Liczba_rdzeni INT,
Liczba_watkow INT,
Cena INT
);

INSERT INTO procesory (`Nazwa`, `Rodzina`, `Liczba_rdzeni`, `Liczba_watkow`, `Cena`) VALUES 
('Intel Core i5-10400F','Intel Core i5',6,12,699),
('AMD Ryzen 5 3600','AMD Ryzen',6,12,1069),
('AMD Ryzen 5 2600X','AMD Ryzen',6,12,669),
('Intel Core i7-10700KF','Intel Core i7',8,16,1699),
('Intel Core i3-10100F','Intel Core i3',4,8,419);