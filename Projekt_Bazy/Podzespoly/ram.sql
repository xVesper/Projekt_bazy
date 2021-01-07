CREATE TABLE ram (
ID_Ram INT AUTO_INCREMENT PRIMARY KEY,
Nazwa VARCHAR(200),
Seria VARCHAR(200),
Rodzaj_pamieci VARCHAR(200),
Pojemnosc VARCHAR(200),
Cena INT
);

INSERT INTO ram (`Nazwa`, `Seria`, `Rodzaj_pamieci`, `Pojemnosc`, `Cena`) 
VALUES ('G.SKILL 16GB (2x8GB) 3000MHz CL16 Aegis','Aegis','DDR4','16 GB (2x8 GB)',279),
('G.SKILL 16GB (2x8GB) 3200MHz CL16 Ripjaws V Black','Ripjaws V','DDR4','16 GB (2x8 GB)',309),
('HyperX 16GB (2x8GB) 2666MHz CL16 Fury','Fury','DDR4','16 GB (2x8 GB)',305),
('HyperX 16GB (2x8GB) 3200MHz CL16 Fury RGB','Fury RGB','DDR4','16 GB (2x8 GB)',369),
('Patriot 16GB (2x8GB) 3200MHz CL16 Viper 4','Viper 4','DDR4','16 GB (2x8 GB)',299);