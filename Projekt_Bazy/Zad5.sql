Funkacja oblicza zysk;
CREATE FUNCTION calcProfit(cost FLOAT, price FLOAT) RETURNS DECIMAL(9,2) BEGIN DECLARE profit DECIMAL(9,2); SET profit = price-cost; RETURN profit; END

Trigger wpisuja w tabele kiedy ktos cos doda do tabeli klient;
CREATE TRIGGER `insertLogi` AFTER INSERT ON `klient` FOR EACH ROW INSERT INTO logs VALUES(null, id,'Inserted',NOW());
Trigger wpisuja w tabele kiedy ktos cos zmieni w tabeli klient;                                                                                         
CREATE TRIGGER `UPDATEtLogi` AFTER UPDATE ON `klient` FOR EACH ROW INSERT INTO logs VALUES(null, id,'Instert',NOW());

Procedury znajdzie klienta po numerze telefonu;
CREATE PROCEDURE `Klient`(IN `tel` INT(11)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN SELECT * FROM klient WHERE Nr_tel = tel; END
Procedury znajdzie zamowienie po id;
CREATE PROCEDURE `Zamowienie`(IN `pro` INT(11)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN SELECT * FROM zamowienie WHERE ID_Zamowienie = pro; END
