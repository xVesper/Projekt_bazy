CREATE TABLE Klient ( ID_Klienta INT AUTO_INCREMENT PRIMARY KEY, Imie VARCHAR(200), Nazwisko VARCHAR(200), Nr_tel INT );

INSERT INTO klient (`Imie`, `Nazwisko`, `Nr_tel`) 
VALUES ('Szymon', 'Mil',1111994),
('Paulina', 'Jakubczyk',7769869),
('Dagmara', 'Pipczynska',513393286),
('Andrzej', 'Kowalski',3979844),
('Seba', 'Masno',7519586);