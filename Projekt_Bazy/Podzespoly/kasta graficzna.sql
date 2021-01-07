CREATE TABLE Grafika (
ID_KartyGr INT AUTO_INCREMENT PRIMARY KEY,
Nazwa VARCHAR(200),
Rodzaj_zlacza VARCHAR(200),
Pamiec VARCHAR(200),
Cena INT
);

INSERT INTO grafika (`Nazwa`, `Rodzaj_zlacza`, `Pamiec`, `Cena`) VALUES ('XFX Radeon RX 580 GTS XXX Edition OC+ 8GB GDDR5','PCI-E x16 3.0','8 GB',1079),
('MSI Radeon RX 5500 XT GAMING X 8GB GDDR6','PCI-E x16 4.0','8 GB',1259),
('Zotac GeForce RTX 3090 Gaming Trinity 24GB GDDR6X','PCI-E x16 4.0','24 GB',7899),
('Gigabyte GeForce RTX 2060 WindForce 2X OC 6GB GDDR6','PCI-E x16 3.0','6 GB',1749),
('Gigabyte GeForce RTX 3060 Ti Gaming OC 8GB GDDR6','PCI-E x16 4.0','8 GB',2549)