--UZYTKOWNICY----------------------------------------------------------------------------------
INSERT INTO UZYTKOWNICY
( NUMER_UZYTKOWNIKA, 
    HASLO,
    EMAIL,
    NAZWISKO,
    IMIE,
    PESEL,
    TELEFON,
    ULICA,
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
    '99999999987',
    'Kamienna',
    '56',
    '',
    'Katowice',
    '40-750'
);

INSERT INTO UZYTKOWNICY
( NUMER_UZYTKOWNIKA, 
    HASLO,
    EMAIL,
    NAZWISKO,
    IMIE,
    PESEL,
    TELEFON,
    ULICA,
    NR_DOMU,
    NR_MIESZKANIA,
    MIASTO,
    KOD_POCZTOWY 
)
VALUES
(
    NR_UZYT_SEKW.NEXTVAL,
    'kotek217',
    'GenowefaOlszewska@armyspy.com',
    'Olszewska',
    'Genowefa', 
    '92876598431',
    '537042594',
    'Topolna',
    '58',
    '',
    'Opole',
    '45-463'
);

INSERT INTO UZYTKOWNICY
( NUMER_UZYTKOWNIKA, 
    HASLO,
    EMAIL,
    NAZWISKO,
    IMIE,
    PESEL,
    TELEFON,
    ULICA,
    NR_DOMU,
    NR_MIESZKANIA,
    MIASTO,
    KOD_POCZTOWY 
)
VALUES
(
    NR_UZYT_SEKW.NEXTVAL,
    'antek98u',
    'MarceliOlszewski@armyspy.com',
    'Olszewsi', 
    'Marceli',
    '34121112438',
    '601731124',
    'Obi-Vana',
    '48',
    '',
    '�?ódź',
    '93-535'
);
--KATEGORIE-------------------------------------------------------------------------------------
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
    'SPORT',
    '',
    ''
);

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
    'BOKS',
    '2',
    ' '
);
--PARAMETRY_WYGL_STR-------------------------------------------------------------------------------------
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
      'KOLOR_TLA',
      'C',
      'N',
      '255',
      'Kolor tla strony'
  );

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
      'ROZMIAR_CZCIONKI',
      'N',
      'N',
      '12',
      'Rozmiar czcionki'
  );

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
      'TYP_CZCIONKI',
      'C',
      'N',
      'Arial',
      'Czcionka, Typ'
  );
--PARAMETRY_UZYTK-------------------------------------------------------------------------------------
INSERT INTO PARAMETRY_UZYT
  (
    NUMER_UZYTKOWNIKA,
    ID_PARAMETRU,
    WARTOSC
  )
VALUES
(
    '1',
    '1',
    '255'
);
 INSERT INTO PARAMETRY_UZYT
  (
    NUMER_UZYTKOWNIKA,
    ID_PARAMETRU,
    WARTOSC
  )
VALUES
(
    '1',
    '2',
    '14'
);
 INSERT INTO PARAMETRY_UZYT
  (
    NUMER_UZYTKOWNIKA,
    ID_PARAMETRU,
    WARTOSC
  )
VALUES
(
    '1',
    '3',
    'Arial'
);

--KATEGORIE_INTERESUJĄCE_UZYTKOWNIKA-------------------------------------------------------------------------------------
 INSERT INTO KAT_INTERESUJACE_UZYT
  (
    NUMER_UZYTKOWNIKA,
    ID_KATEGORII,
    NR_UPODOBANIA
  )
  VALUES
  (
    '1',
    '1',
    '8'
  );

 INSERT INTO KAT_INTERESUJACE_UZYT
  (
    NUMER_UZYTKOWNIKA,
    ID_KATEGORII,
    NR_UPODOBANIA
  )
  VALUES
  (
    '2',
    '3',
    '9'
  );

 INSERT INTO KAT_INTERESUJACE_UZYT
  (
    NUMER_UZYTKOWNIKA,
    ID_KATEGORII,
    NR_UPODOBANIA
  )
  VALUES
  (
    '3',
    '2',
    '6'
  );


--DZIENNIKI_AKTYWNOSCI--------------------------------------------------------------------------------
INSERT INTO DZIENNIKI_AKTYWNOSCI
  (
    NUMER_UZYTKOWNIKA,
    DATA_I_CZAS_ODWIEDZIN,
    ODWIEDZONA_STRONA
  )
VALUES
  (
   '1',
   (TO_DATE('4-01-2019 10:00','DD-MM-YYYY HH24:MI')),
   'https://studia.elka.pw.edu.pl/file/18Z/BD2.WYK.1/priv/projekt/projekt_bd2.html#3'   
  );

INSERT INTO DZIENNIKI_AKTYWNOSCI
  (
    NUMER_UZYTKOWNIKA,
    DATA_I_CZAS_ODWIEDZIN,
    ODWIEDZONA_STRONA
  )
VALUES
  (
   '2',
   (TO_DATE('4-01-2019 10:00','DD-MM-YYYY HH24:MI')),
   'https://google.com'   
  );
  
  INSERT INTO DZIENNIKI_AKTYWNOSCI
  (
    NUMER_UZYTKOWNIKA,
    DATA_I_CZAS_ODWIEDZIN,
    ODWIEDZONA_STRONA
  )
VALUES
  (
   '3',
   (TO_DATE('4-01-2019 10:00','DD-MM-YYYY HH24:MI')),
   'https://www.tutorialspoint.com/oracle_terminal_online.php'   
  );

  INSERT INTO DZIENNIKI_AKTYWNOSCI
  (
    NUMER_UZYTKOWNIKA,
    DATA_I_CZAS_ODWIEDZIN,
    ODWIEDZONA_STRONA
  )
VALUES
  (
   '3',
   (TO_DATE('4-01-2019 12:00','DD-MM-YYYY HH24:MI')),
   'https://www.interia.pl'   
  );

    INSERT INTO DZIENNIKI_AKTYWNOSCI
  (
    NUMER_UZYTKOWNIKA,
    DATA_I_CZAS_ODWIEDZIN,
    ODWIEDZONA_STRONA
  )
VALUES
  (
   '3',
   (TO_DATE('4-01-2019 22:00','DD-MM-YYYY HH24:MI')),
   'https://www.dziwnaczarnastronaztorrentami.net'   
  );

  INSERT INTO DZIENNIKI_AKTYWNOSCI
  (
    NUMER_UZYTKOWNIKA,
    DATA_I_CZAS_ODWIEDZIN,
    ODWIEDZONA_STRONA
  )
VALUES
  (
   '2',
   (TO_DATE('5-01-2019 12:00','DD-MM-YYYY HH24:MI')),
   'https://www.dziwnaczarnastronaztorrentami.net'   
  );

  INSERT INTO DZIENNIKI_AKTYWNOSCI
  (
    NUMER_UZYTKOWNIKA,
    DATA_I_CZAS_ODWIEDZIN,
    ODWIEDZONA_STRONA
  )
VALUES
  (
   '2',
   (TO_DATE('6-01-2019 10:00','DD-MM-YYYY HH24:MI')),
   'https://www.interia.net'   
  );
  
  
  