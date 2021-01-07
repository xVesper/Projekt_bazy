CREATE TABLE Zasilacz (
ID_Zasilacza INT AUTO_INCREMENT PRIMARY KEY,
Nazwa VARCHAR(200),
Moc_max VARCHAR(200),
Standard VARCHAR(200),
Certyfikat VARCHAR(200),
Cena INT
);

INSERT INTO zasilacz (`Nazwa`, `Moc_max`, `Standard`, `Certyfikat`, `Cena`) 
VALUES ('SilentiumPC Vero L3 600W 80 Plus Bronze','600 W','ATX','80 PLUS Bronze',239),
('SilentiumPC Vero L3 500W 80 Plus Bronze','500 W','ATX','80 PLUS Bronze',219),
('SilentiumPC Vero L3 700W 80 Plus Bronze','700 W','ATX','80 PLUS Bronze',269),
('SilentiumPC Elementum E2 450W 80 Plus (BULK)','450 W','ATX','80 PLUS',155),
('SilentiumPC Supremo FM2 650W 80 Plus Gold','650 W','ATX','80 PLUS Gold',399);