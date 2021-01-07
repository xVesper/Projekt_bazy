1.Wyswietlenie jakie dyski sa w ofercie
2.Numer telefonu klienta ktorego imie zaczyna sie na P
3.Wyszykanie karty graficznej ktora ma 8 GB pamieci
4.Nazwa i porownanie cen od najwyższej do najnizszej obudowy do komputera 	
5.Poszukiwanienie plyty glownej o danej cenie lub danym socketem
6.porownanie najdrozszej ceny procesora ze srednia wszystkich cen 
7.Pokazanie roznicy cen pomiedzy najdrozszym i najtanszym ramem w sklepie
8.Pokazanie ile sa warte lacznie zasilacze do komputera w sklepie
9.Pokazanie nazwiska klienta ktory zlozyl najdrozsze zamowienie w sklepie (Cos niedaila jak powino)
10.Wyswietlenie ID_Klienta ktory zlozyl najdrozsze zamowienie

CREATE VIEW widok AS
SELECT * FROM dysk;

CREATE VIEW widok2 AS
SELECT Nr_tel AS Numer_telefonu FROM klient WHERE Imie Like "P%";

CREATE VIEW widok3 AS
SELECT * FROM grafika WHERE Pamiec LIKE '8 GB';

CREATE VIEW widok4 AS
SELECT Nazwa,Cena FROM obudowa 
ORDER BY Cena DESC;

CREATE VIEW widok5 AS
SELECT * FROM plyty WHERE Socket="AMD450" OR Cena="369"
ORDER BY Cena DESC;

CREATE VIEW widok6 AS
SELECT *,AVG(Cena) AS Srednia_Cena,MAX(Cena) AS Najdrorzszy_produkt FROM procesory
ORDER BY Cena DESC;

CREATE VIEW widok7 AS
SELECT *,MIN(Cena) AS Cena_najnizsza ,MAX(Cena)-MIN(Cena) AS Rozstep_pozycji_ram FROM ram 
ORDER BY Cena DESC;

CREATE VIEW widok8 AS
SELECT SUM(Cena) AS Laczna_wartosc_zasilaczy FROM zasilacz 
ORDER BY Cena DESC;

CREATE VIEW widok9 AS
SELECT klient.Nazwisko,zamowienie.Cena FROM zamowienie
INNER JOIN klient.ID_Klienta ON zamowienie.ID_Klienta
WHERE Cena = (SELECT MAX(Cena) FROM zamowienie);

CREATE VIEW widok10 AS
SELECT ID_Klienta FROM zamowienie
WHERE Cena = (SELECT MAX(Cena) FROM zamowienie)
;