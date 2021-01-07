CREATE TABLE Klient ( ID_Zamowienie INT AUTO_INCREMENT PRIMARY KEY,
                     ID_Klienta INT,
                     ID_Dysku INT, 
                     ID_Grafiki INT, 
                     ID_Obudowy INT,
                     ID_Plyty INT,
                    ID_Procesora INT,
                    ID_Ramu INT,
                    ID_Zasilacza INT,
                    Cena INT);

INSERT INTO zamowienie (`ID_Klienta`, `ID_Dysku`, `ID_Grafiki`, `ID_Obudowy`, `ID_Plyty`, `ID_Procesora`, `ID_Ramu`, `ID_Zasilacza`,Cena) VALUES (1,1,1,1,1,1,1,1,3153),(2,2,2,2,2,2,2,2,3783),(3,3,3,3,3,3,3,3,10039),(4,4,4,4,4,4,4,4,4833),(5,5,5,5,5,5,5,5,5083);
