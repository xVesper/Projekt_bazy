CREATE TABLE Obudowa (
ID_Obudowy INT AUTO_INCREMENT PRIMARY KEY,
Nazwa VARCHAR(200),
Typ_obudowy VARCHAR(200),
Liczba_wentylatorow INT,
Cena INT    
);

INSERT INTO obudowa (`Nazwa`, `Typ_obudowy`, `Liczba_wentylatorow`, `Cena`) 
VALUES ('SilentiumPC Signum SG1 TG','Middle Tower',8,189),
('SilentiumPC Signum SG1V EVO TG ARGB','Middle Tower',8,259),
('SilentiumPC Regnum RG6V TG Pure Black','Middle Tower',8,269),
('SilentiumPC Regnum RG6V EVO TG ARGB','Middle Tower',8,319),
('be quiet! Pure Base 500DX Black','Middle Tower',6,479);