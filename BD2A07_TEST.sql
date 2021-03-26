set echo on 
set linesize 300 
set pagesize 500 
spool BD2A07_TEST.LIS 

--lista uzytkownikow imie, nazwisko, nazwa kategorii, nr upodobania kategorii
SELECT uzytkownicy.imie, uzytkownicy.nazwisko, kategorie.nazwa,kat_interesujace_uzyt.nr_upodobania
FROM UZYTKOWNICY
INNER JOIN KAT_INTERESUJACE_UZYT
ON UZYTKOWNICY.NUMER_UZYTKOWNIKA = KAT_INTERESUJACE_UZYT.NUMER_UZYTKOWNIKA
INNER JOIN kategorie
ON KAT_INTERESUJACE_UZYT.NUMER_UZYTKOWNIKA = kategorie.id_kategorii;

--lista uzytkownikow z nazwami i wartosciami parametrow
SELECT uzytkownicy.imie, uzytkownicy.nazwisko,PARAMETRY_WYGLADU_STR.NAZWA ,parametry_uzyt.wartosc, parametry_wygladu_str.opis
FROM UZYTKOWNICY
INNER JOIN PARAMETRY_UZYT
ON UZYTKOWNICY.NUMER_UZYTKOWNIKA = PARAMETRY_UZYT.NUMER_UZYTKOWNIKA
INNER JOIN  PARAMETRY_WYGLADU_STR
ON PARAMETRY_UZYT.id_parametru = PARAMETRY_WYGLADU_STR.id_parametru;

--lista uzytkownikow /imie,nazwisko/, data, godzina i url odwiedzonych stron  
SELECT uzytkownicy.imie, uzytkownicy.nazwisko, (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'DD-MM-YYYY HH24:MI')), DZIENNIKI_AKTYWNOSCI.odwiedzona_strona
FROM UZYTKOWNICY
INNER JOIN DZIENNIKI_AKTYWNOSCI
ON UZYTKOWNICY.NUMER_UZYTKOWNIKA = dzienniki_aktywnosci.numer_uzytkownika;

--lista stron odwiedzonych przez uzytkownika o nazwisku Olszewsi
SELECT uzytkownicy.imie, uzytkownicy.nazwisko, (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'DD-MM-YYYY HH24:MI')), DZIENNIKI_AKTYWNOSCI.odwiedzona_strona
FROM UZYTKOWNICY
INNER JOIN DZIENNIKI_AKTYWNOSCI
ON UZYTKOWNICY.NUMER_UZYTKOWNIKA = dzienniki_aktywnosci.numer_uzytkownika
WHERE UZYTKOWNICY.nazwisko='Olszewsi';

--lista stron uzytkownikow odwidzonych o 10:00 04-01-2019
SELECT uzytkownicy.imie, uzytkownicy.nazwisko, (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'DD-MM-YYYY HH24:MI')), DZIENNIKI_AKTYWNOSCI.odwiedzona_strona
FROM UZYTKOWNICY
INNER JOIN DZIENNIKI_AKTYWNOSCI
ON UZYTKOWNICY.NUMER_UZYTKOWNIKA = dzienniki_aktywnosci.numer_uzytkownika
WHERE (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'DD-MM-YYYY HH24:MI'))='04-01-2019 10:00'; 

--lista stron odwiedzonych o 10:00 przez wszytkich uzytkownikow we wszystkich dniach
SELECT uzytkownicy.imie, uzytkownicy.nazwisko, (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'DD-MM-YYYY HH24:MI')), DZIENNIKI_AKTYWNOSCI.odwiedzona_strona
FROM UZYTKOWNICY
INNER JOIN DZIENNIKI_AKTYWNOSCI
ON UZYTKOWNICY.NUMER_UZYTKOWNIKA = dzienniki_aktywnosci.numer_uzytkownika
WHERE (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'HH24:MI'))='10:00';

--lista wszystkich stron odwiedzonych przez wszystkich uzytkownikow 4-01-2019
SELECT uzytkownicy.imie, uzytkownicy.nazwisko, (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'DD-MM-YYYY HH24:MI')), DZIENNIKI_AKTYWNOSCI.odwiedzona_strona
FROM UZYTKOWNICY
INNER JOIN DZIENNIKI_AKTYWNOSCI
ON UZYTKOWNICY.NUMER_UZYTKOWNIKA = dzienniki_aktywnosci.numer_uzytkownika
WHERE (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'DD-MM-YYYY'))='04-01-2019';

--lista uzytkownikow, ktorzy odwidzali strone o url https://www.dziwnaczarnastronaztorrentami.net
SELECT uzytkownicy.imie, uzytkownicy.nazwisko, (TO_CHAR(DZIENNIKI_AKTYWNOSCI.data_i_czas_odwiedzin,'DD-MM-YYYY HH24:MI')), DZIENNIKI_AKTYWNOSCI.odwiedzona_strona
FROM UZYTKOWNICY
INNER JOIN DZIENNIKI_AKTYWNOSCI
ON UZYTKOWNICY.NUMER_UZYTKOWNIKA = dzienniki_aktywnosci.numer_uzytkownika
WHERE (DZIENNIKI_AKTYWNOSCI.odwiedzona_strona)='https://www.dziwnaczarnastronaztorrentami.net';


spool off 