set echo on 
spool BD2A07_DML.LIS
--proba wstawienia do tabeli reekordu bez Adresu
INSERT INTO UZYTKOWNICY
( NUMER_UZYTKOWNIKA, 
    HASLO,
    EMAIL,
    NAZWISKO,
    IMIE,
    PESEL,
    TELEFON,
    NR_DOMU,
    NR_MIESZKANIA,
    MIASTO,
    KOD_POCZTOWY 
)
VALUES
(
    NR_UZYT_SEKW.NEXTVAL,
    'kotek217',
    'AdelajdaKaminska@armyspy.com',
    'Kaminska',
    'Adelajda', 
    '98765437930',
    '99999999987',
    "Kamienna",
    '56',
    '',
    'Katowice',
    '40-75'
);

--proba wstawienia do tabeli za długiego kodu pocztowego
INSERT INTO UZYTKOWNICY
( NUMER_UZYTKOWNIKA, 
    HASLO,
    EMAIL,
    NAZWISKO,
    IMIE,
    PESEL,
    TELEFON,
    NR_DOMU,
    NR_MIESZKANIA,
    MIASTO,
    KOD_POCZTOWY 
)
VALUES
(
    NR_UZYT_SEKW.NEXTVAL,
    'kotek217',
    'AdelajdaKaminska@armyspy.com',
    'Kaminska',
    'Adelajda', 
    '98765437930',
    '99999999987',
    '56',
    '',
    'Katowice',
    '40-75000000000000000000000'
);


--proba wstawienia nie wlasciwego nr pesel
INSERT INTO UZYTKOWNICY
( NUMER_UZYTKOWNIKA, 
    HASLO,
    EMAIL,
    NAZWISKO,
    IMIE,
    PESEL,
    TELEFON,
    NR_DOMU,
    NR_MIESZKANIA,
    MIASTO,
    KOD_POCZTOWY 
)
VALUES
(
    NR_UZYT_SEKW.NEXTVAL,
    'kotek217',
    'AdelajdaKaminska@armyspy.com',
    'Kami?ska',
    'Adelajda', 
    '98765437930',
    '99999999999557',
    '56',
    '',
    'Katowice',
    '40-75'
);
--Wprowadzenie juz isteniejacego recordu /to samo id i nazwa/
  INSERT INTO KATEGORIE
(
    ID_KATEGORII,
    NAZWA,
    ID_KATEGORII_HIERARHII,
    OPIS                   
)
VALUES
(
    1,
    'MOTORYZACJA',
    '',
    ' '
);
--Wprowadzenie juz isteniejacego recordu /ta sama nazwa/
  INSERT INTO KATEGORIE
(
    ID_KATEGORII,
    NAZWA,
    ID_KATEGORII_HIERARHII,
    OPIS                   
)
VALUES
(
    ID_KAT_SEKW.NEXTVAL,
    'MOTORYZACJA',
    '',
    ' '
);
--Wprowadzenie nie isteniejacego id nad kategorii
  INSERT INTO KATEGORIE
(
    ID_KATEGORII,
    NAZWA,
    ID_KATEGORII_HIERARHII,
    OPIS                   
)
VALUES
(
    ID_KAT_SEKW.NEXTVAL,
    'MUZYKA_NOWOCZESNA',
    '8',
    ' '
);


--Przypisanie nie istniejacego par dla uzytkownika
 INSERT INTO PARAMETRY_UZYT
  (
    NUMER_UZYTKOWNIKA,
    ID_PARAMETRU,
    WARTOSC
  )
VALUES
(
    '1',
    '12',
    '14'
);
--przypożdkownia nie istniejącego parametru dla użytkownika
 INSERT INTO PARAMETRY_UZYT
  (
    NUMER_UZYTKOWNIKA,
    ID_PARAMETRU,
    WARTOSC
  )
VALUES
(
    '1',
    '12',
    '14'
);
--utworzenie parametru ze złym typem danych
 INSERT INTO PARAMETRY_WYGLADU_STR
  (
    ID_PARAMETRU,
    NAZWA,
    TYP_DANYCH,
    CZY_OPCJONALNY,
    WARTOSC_DOMYSLNA,
    OPIS
  )
VALUES
(
    ID_PAR_WYG_STR_SEKW.NEXTVAL,
    'TEMP_PARAMETR_1000',
    'K',
    'T',
    'Upper',
    ''
);
--utworzenie parametru ze złą opcjonalnością
 INSERT INTO PARAMETRY_WYGLADU_STR
  (
    ID_PARAMETRU,
    NAZWA,
    TYP_DANYCH,
    CZY_OPCJONALNY,
    WARTOSC_DOMYSLNA,
    OPIS
  )
VALUES
(
    ID_PAR_WYG_STR_SEKW.NEXTVAL,
    'TEMP_PARAMETR_9800',
    'C',
    'L',
    '11',
    ''
);


--usuniecia uzytkownika 
DELETE FROM UZYTKOWNICY WHERE NUMER_UZYTKOWNIKA = '1';

--usuniecie samej nad kategorii kategorii bez podkategorii
DELETE FROM KATEGORIE WHERE ID_KATEGORII = '2';

--usuniécie dzienika aktywnoci
DELETE FROM DZIENNIKI_AKTYWNOSCI WHERE ID_PARAMETRU = '3';

--usuniécie dzienika aktywnoci, dla nie isniejącego użytkownika
DELETE FROM DZIENNIKI_AKTYWNOSCI WHERE ID_PARAMETRU = '9999999';

spool off