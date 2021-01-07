CREATE TABLE Dysk ( 
ID_Dysku INT AUTO_INCREMENT PRIMARY KEY,
Nazwa VARCHAR(200), 
Pojemnsc VARCHAR(200), 
Interfejs VARCHAR(200),
Predkosc_odczytu VARCHAR(200),
Predkosc_zapisu VARCHAR(200),
Cena INT 
);

INSERT INTO dysk (`Nazwa`, `Pojemnsc`, `Interfejs`, `Predkosc_odczytu`, `Predkosc_zapisu`, `Cena`) 
VALUES ('KIOXIA 480GB 2,5" SATA SSD EXCERIA','480 GB','SATA III (6.0 Gb/s)','555 MB/s','540 MB/s',219),
('Kingston 500GB M.2 PCIe NVMe A2000','500 GB','M.2 PCIe NVMe 3.0 x4','2200 MB/s','2000 MB/s',269),
('Crucial 500GB 2,5" SATA SSD MX500','500 GB','SATA III (6.0 Gb/s)','560 MB/s','510 MB/s',259),
('Crucial 240GB 2,5" SATA SSD BX500','240 GB','SATA III (6.0 Gb/s)','540 MB/s','500 MB/s',123),
('ADATA 1TB M.2 PCIe NVMe XPG SX8200 Pro','1000 GB','M.2 PCIe NVMe 3.0 x4','3500 MB/s','3000 MB/s',549)