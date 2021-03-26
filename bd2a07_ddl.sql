-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2019-01-11 21:19:11 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE USER BD2A07 IDENTIFIED BY ACCOUNT UNLOCK ;

CREATE USER BD2A07_APP IDENTIFIED BY ACCOUNT UNLOCK ;

CREATE SEQUENCE ID_KAT_SEKW START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1 ;
  GRANT ALL PRIVILEGES ON ID_KAT_SEKW TO BD2A07_APP ;
  GRANT ALL PRIVILEGES ON ID_KAT_SEKW TO BD2A07 ;

CREATE SEQUENCE ID_PAR_WYG_STR_SEKW START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1 ;
  GRANT ALL PRIVILEGES ON ID_PAR_WYG_STR_SEKW TO BD2A07 ;
  GRANT ALL PRIVILEGES ON ID_PAR_WYG_STR_SEKW TO BD2A07_APP ;

CREATE SEQUENCE NR_UZYT_SEKW START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 ;
  GRANT ALL PRIVILEGES ON NR_UZYT_SEKW TO BD2A07 ;
  GRANT ALL PRIVILEGES ON NR_UZYT_SEKW TO BD2A07_APP ;


CREATE TABLE UZYTKOWNICY
  (
    NUMER_UZYTKOWNIKA NUMBER (10) NOT NULL ,
    HASLO             VARCHAR2 (20 CHAR) NOT NULL ,
    EMAIL             VARCHAR2 (50 CHAR) NOT NULL ,
    NAZWISKO          VARCHAR2 (20 CHAR) NOT NULL ,
    IMIE              VARCHAR2 (20 CHAR) NOT NULL ,
    PESEL             CHAR (11) NOT NULL ,
    TELEFON           VARCHAR2 (15 CHAR) NOT NULL ,
    ULICA             VARCHAR2 (100 CHAR) ,
    NR_DOMU           VARCHAR2 (6 CHAR) NOT NULL ,
    NR_MIESZKANIA     VARCHAR2 (6 CHAR) ,
    MIASTO            VARCHAR2 (58 CHAR) NOT NULL ,
    KOD_POCZTOWY      VARCHAR2 (10 CHAR) NOT NULL
  )
  LOGGING ;
COMMENT ON TABLE UZYTKOWNICY
IS
  'Encja, w ktorej zajduja sie dane oraz informacj�e na temat uzytkownika. ' ;
  COMMENT ON COLUMN UZYTKOWNICY.NUMER_UZYTKOWNIKA
IS
  'Unikalny nr nadawany kazdemu uzytkonikowi.' ;
  COMMENT ON COLUMN UZYTKOWNICY.HASLO
IS
  'Haslo uzytkownika strony.' ;
  COMMENT ON COLUMN UZYTKOWNICY.EMAIL
IS
  'Uzytkownik moze miec tylko jeden unikalny edres email ' ;
  COMMENT ON COLUMN UZYTKOWNICY.NAZWISKO
IS
  'Nazwisko uzytkownika, moze sie powtarzac.' ;
  COMMENT ON COLUMN UZYTKOWNICY.IMIE
IS
  'Imie uzytkownika.' ;
  COMMENT ON COLUMN UZYTKOWNICY.PESEL
IS
  'unikalny nr PESEL uzytkownika, skada sie dokladnie z 11 cyfrl' ;
  COMMENT ON COLUMN UZYTKOWNICY.TELEFON
IS
  'nr telefonu uzytkownika, przewidziano w nim dodatkowe znaki takie jak "-" czy "+"' ;
  COMMENT ON COLUMN UZYTKOWNICY.ULICA
IS
  'Nazwa ulicy zamieszkania u�ytkownika.' ;
  COMMENT ON COLUMN UZYTKOWNICY.NR_DOMU
IS
  'nr domu u�ytkownika, moze sie skladac z cyfr i liter' ;
  COMMENT ON COLUMN UZYTKOWNICY.NR_MIESZKANIA
IS
  'nr mieszkania uzytkonika, moze sie skladac z cyfr i liter' ;
  COMMENT ON COLUMN UZYTKOWNICY.MIASTO
IS
  ' Miasto zamieszkania uzytkownika. Najdluzsza nazwa miasta na swiecie wynosi 58 znakow' ;
  COMMENT ON COLUMN UZYTKOWNICY.KOD_POCZTOWY
IS
  ' Kod pocztowy miasta zamieszkania uzytkownika. Kody pocztowe potrafia posiadac do 10 znakow' ;
  GRANT
  DELETE,
  INSERT,
  SELECT,
  UPDATE ON UZYTKOWNICY TO BD2A07_APP ;
ALTER TABLE UZYTKOWNICY ADD CONSTRAINT UZYT_PK PRIMARY KEY ( NUMER_UZYTKOWNIKA ) ;
ALTER TABLE UZYTKOWNICY ADD CONSTRAINT UZYT_PESEL_UN UNIQUE ( PESEL ) ;
ALTER TABLE UZYTKOWNICY ADD CONSTRAINT UZYT_EMAIL_UN UNIQUE ( EMAIL ) ;




CREATE TABLE DZIENNIKI_AKTYWNOSCI
  (
    NUMER_UZYTKOWNIKA     NUMBER (10) NOT NULL ,
    DATA_I_CZAS_ODWIEDZIN DATE NOT NULL ,
    ODWIEDZONA_STRONA     VARCHAR2 (2083 CHAR) NOT NULL
  )
  LOGGING ;
COMMENT ON TABLE DZIENNIKI_AKTYWNOSCI
IS
  'Encja, gdzie przechowywane s� strony odwiedzone przez uzytkownik�w oraz informacja kiedy dana strona zosta�a odwiedzona /godzina i dzie�/' ;
  COMMENT ON COLUMN DZIENNIKI_AKTYWNOSCI.DATA_I_CZAS_ODWIEDZIN
IS
  'Data odwiedzin uzytkownika, zawiera godzina i data odwiedzin danej strony przez uzytkownika.' ;
  COMMENT ON COLUMN DZIENNIKI_AKTYWNOSCI.ODWIEDZONA_STRONA
IS
  'Strona odwiedzona przez uzytkownika. Zgodnie z przepisami maks. dlugosc URL wynosi 2083' ;
  CREATE INDEX DZIENN_AKTYWN__IDX ON DZIENNIKI_AKTYWNOSCI
    (
      NUMER_UZYTKOWNIKA ASC
    )
    LOGGING ;
  GRANT
  SELECT,
  INSERT,
  UPDATE,
  DELETE ON DZIENNIKI_AKTYWNOSCI TO BD2A07_APP ;
ALTER TABLE DZIENNIKI_AKTYWNOSCI ADD CONSTRAINT DZIEN_AKTYWN_PK PRIMARY KEY ( NUMER_UZYTKOWNIKA, DATA_I_CZAS_ODWIEDZIN ) ;


CREATE TABLE KATEGORIE
  (
    ID_KATEGORII           NUMBER (5) NOT NULL ,
    NAZWA                  VARCHAR2 (20 CHAR) NOT NULL ,
    ID_KATEGORII_HIERARHII NUMBER (5) ,
    OPIS                   VARCHAR2 (200 CHAR)
  )
  LOGGING ;
COMMENT ON TABLE KATEGORIE
IS
  'Encja, zwierajaca informacje o kategoriach oraz ich hierarhii' ;
  COMMENT ON COLUMN KATEGORIE.ID_KATEGORII
IS
  'Unikalny numer przydzielany kazdej kategorii.' ;
  COMMENT ON COLUMN KATEGORIE.NAZWA
IS
  'Unikalna nazwa kategorii.' ;
  COMMENT ON COLUMN KATEGORIE.OPIS
IS
  'Opis danej kategorii. Do 200 znakow.' ;
  CREATE INDEX KAT_HIER__IDX ON KATEGORIE
    (
      ID_KATEGORII_HIERARHII ASC
    )
    LOGGING ;
  GRANT
  DELETE,
  INSERT,
  SELECT,
  UPDATE ON KATEGORIE TO BD2A07_APP ;
ALTER TABLE KATEGORIE ADD CONSTRAINT KAT_PK PRIMARY KEY ( ID_KATEGORII ) ;
ALTER TABLE KATEGORIE ADD CONSTRAINT KAT_NAZWA_UN UNIQUE ( NAZWA ) ;


CREATE TABLE KAT_INTERESUJACE_UZYT
  (
    NUMER_UZYTKOWNIKA NUMBER (10) NOT NULL ,
    ID_KATEGORII      NUMBER (5) NOT NULL ,
    NR_UPODOBANIA     NUMBER (2) NOT NULL,
    CONSTRAINT check_nr_upod
    CHECK (NR_UPODOBANIA BETWEEN 1 and 10)
  )
  LOGGING ;
COMMENT ON TABLE KAT_INTERESUJACE_UZYT
IS
  'Encja, gdzie dla danej katekorii dany uzytkowik przypisuje nr upodobania kategorii wedlug wlsasnego uznania' ;
  COMMENT ON COLUMN KAT_INTERESUJACE_UZYT.NR_UPODOBANIA
IS
  'Nr upodobania katagorii, przydzielany wedlug upodobania u�ytkownika. Wartosc calkowita od  0 do 10' ;
  CREATE INDEX KAT_INT_UZYT__IDX ON KAT_INTERESUJACE_UZYT
    (
      NUMER_UZYTKOWNIKA ASC
    )
    LOGGING ;
  CREATE INDEX KAT_INT_UZYT__IDXv1 ON KAT_INTERESUJACE_UZYT
    (
      ID_KATEGORII ASC
    )
    LOGGING ;
  GRANT
  SELECT,
  INSERT,
  UPDATE,
  DELETE ON KAT_INTERESUJACE_UZYT TO BD2A07_APP ;
ALTER TABLE KAT_INTERESUJACE_UZYT ADD CONSTRAINT KAT_INT_UZYT_PK PRIMARY KEY ( NUMER_UZYTKOWNIKA, ID_KATEGORII ) ;


CREATE TABLE PARAMETRY_WYGLADU_STR
  (
    ID_PARAMETRU     NUMBER (5) NOT NULL ,
    NAZWA            VARCHAR2 (30 CHAR) NOT NULL ,
    TYP_DANYCH       CHAR (1 CHAR) NOT NULL ,
    CZY_OPCJONALNY   CHAR (1 CHAR) NOT NULL ,
    WARTOSC_DOMYSLNA VARCHAR2 (30 CHAR) NOT NULL ,
    OPIS             VARCHAR2 (200 CHAR)
  )
  LOGGING ;
COMMENT ON TABLE PARAMETRY_WYGLADU_STR
IS
  'Encja, w ktorej przechowywane sie parametry wygladu strony uzytkownika, typ parametrow oraz infomacji o nich.' ;
  COMMENT ON COLUMN PARAMETRY_WYGLADU_STR.ID_PARAMETRU
IS
  'Uniikalny nr nadawany parametrowi wygladu strony.' ;
  COMMENT ON COLUMN PARAMETRY_WYGLADU_STR.NAZWA
IS
  'Unikalna nazwa parametru.' ;
  COMMENT ON COLUMN PARAMETRY_WYGLADU_STR.WARTOSC_DOMYSLNA
IS
  'Wartosc domyslna dla parametru uzytkonika' ;
  COMMENT ON COLUMN PARAMETRY_WYGLADU_STR.TYP_DANYCH
IS
  'Typ danych parametru. N - number, C - char, D - date' ;
  COMMENT ON COLUMN PARAMETRY_WYGLADU_STR.CZY_OPCJONALNY
IS
  'Opcjonalnosc danego parametru w zestawie parametrow. T -  opcjonalny, N - nie opcjonalny' ;
  COMMENT ON COLUMN PARAMETRY_WYGLADU_STR.OPIS
IS
  'Opis danego parametru. Do 200 znakow.' ;
  GRANT
  DELETE,
  SELECT,
  UPDATE,
  INSERT ON PARAMETRY_WYGLADU_STR TO BD2A07_APP ;
ALTER TABLE PARAMETRY_WYGLADU_STR ADD CONSTRAINT PAR_WYGL_STR_PK PRIMARY KEY ( ID_PARAMETRU ) ;
ALTER TABLE PARAMETRY_WYGLADU_STR ADD CONSTRAINT PAR_WYGL_STR_NAZWA_UN UNIQUE ( NAZWA ) ;
ALTER TABLE PARAMETRY_WYGLADU_STR ADD CONSTRAINT check_typ_danych CHECK (TYP_DANYCH IN ('N', 'C', 'D'));
ALTER TABLE PARAMETRY_WYGLADU_STR ADD CONSTRAINT check_czy_opcj CHECK (CZY_OPCJONALNY IN ('T', 'N'));



CREATE TABLE PARAMETRY_UZYT
  (
    NUMER_UZYTKOWNIKA NUMBER (10) NOT NULL ,
    ID_PARAMETRU      NUMBER (5) NOT NULL ,
    WARTOSC           VARCHAR2 (30 CHAR) NOT NULL
  )
  LOGGING ;
COMMENT ON TABLE PARAMETRY_UZYT
IS
  'Encja, w ktorej przechowywana jest  wartosc danego parametru danego uzytkownika.' ;
  COMMENT ON COLUMN PARAMETRY_UZYT.WARTOSC
IS
  'Wartosc parametru wygladu strony. Dokonywana jest konwersja na potrzebny typ' ;
  CREATE INDEX PAR_UZYT__IDX ON PARAMETRY_UZYT
    (
      NUMER_UZYTKOWNIKA ASC
    )
    LOGGING ;
  CREATE INDEX PAR_UZYT__IDXv1 ON PARAMETRY_UZYT
    ( ID_PARAMETRU ASC
    ) LOGGING ;
  GRANT
  DELETE,
  INSERT,
  SELECT,
  UPDATE ON PARAMETRY_UZYT TO BD2A07_APP ;
ALTER TABLE PARAMETRY_UZYT ADD CONSTRAINT PARY_UZYT_PK PRIMARY KEY ( NUMER_UZYTKOWNIKA, ID_PARAMETRU ) ;




ALTER TABLE DZIENNIKI_AKTYWNOSCI ADD CONSTRAINT DZIENN_AKTYWN_UZYT_FK FOREIGN KEY ( NUMER_UZYTKOWNIKA ) REFERENCES UZYTKOWNICY ( NUMER_UZYTKOWNIKA ) DEFERRABLE ;

ALTER TABLE KAT_INTERESUJACE_UZYT ADD CONSTRAINT KAT_INT_UZYT_KATEGORIE_FK FOREIGN KEY ( ID_KATEGORII ) REFERENCES KATEGORIE ( ID_KATEGORII ) ON
DELETE CASCADE DEFERRABLE ;

ALTER TABLE KAT_INTERESUJACE_UZYT ADD CONSTRAINT KAT_INT_UZYT_UZYTKOWNICY_FK FOREIGN KEY ( NUMER_UZYTKOWNIKA ) REFERENCES UZYTKOWNICY ( NUMER_UZYTKOWNIKA ) ON
DELETE CASCADE DEFERRABLE ;

ALTER TABLE KATEGORIE ADD CONSTRAINT KAT_KAT_FK FOREIGN KEY ( ID_KATEGORII_HIERARHII ) REFERENCES KATEGORIE ( ID_KATEGORII ) DEFERRABLE ;

ALTER TABLE PARAMETRY_UZYT ADD CONSTRAINT PAR_UZYT_PAR_WYG_STR_FK FOREIGN KEY ( ID_PARAMETRU ) REFERENCES PARAMETRY_WYGLADU_STR ( ID_PARAMETRU ) ON
DELETE CASCADE DEFERRABLE ;

ALTER TABLE PARAMETRY_UZYT ADD CONSTRAINT PAR_UZYT_UZYT_FK FOREIGN KEY ( NUMER_UZYTKOWNIKA ) REFERENCES UZYTKOWNICY ( NUMER_UZYTKOWNIKA ) ON
DELETE CASCADE DEFERRABLE ;

CREATE OR REPLACE SYNONYM BD2A07_APP.DZIENNIKI_AKTYWNOSCI FOR DZIENNIKI_AKTYWNOSCI ;

CREATE OR REPLACE SYNONYM BD2A07_APP.KATEGORIE FOR KATEGORIE ;

CREATE OR REPLACE SYNONYM BD2A07_APP.KAT_INTERESUJACE_UZYT FOR KAT_INTERESUJACE_UZYT ;

CREATE OR REPLACE SYNONYM BD2A07_APP.PARAMETRY_UZYT FOR PARAMETRY_UZYT ;

CREATE OR REPLACE SYNONYM BD2A07_APP.PARAMETRY_WYGLADU_STR FOR PARAMETRY_WYGLADU_STR ;

CREATE OR REPLACE SYNONYM BD2A07_APP.UZYTKOWNICY FOR UZYTKOWNICY ;

CREATE OR REPLACE TRIGGER ID_KAT_TRG 
    BEFORE INSERT ON KATEGORIE 
    FOR EACH ROW 
    WHEN ( NEW.ID_KATEGORII IS NULL ) 
BEGIN
    SELECT ID_KAT_SEKW.NEXTVAL INTO :NEW.ID_KATEGORII FROM dual; 
END;
/



CREATE OR REPLACE TRIGGER ID_PAR_WYG_STR_TRG 
    BEFORE INSERT ON PARAMETRY_WYGLADU_STR 
    FOR EACH ROW 
    WHEN ( NEW.ID_PARAMETRU IS NULL ) 
BEGIN
SELECT ID_PAR_WYG_STR_SEKW.NEXTVAL INTO :NEW.ID_PARAMETRU FROM dual ;
END;
/



CREATE OR REPLACE TRIGGER NR_UZYT_TRG 
    BEFORE INSERT ON UZYTKOWNICY 
    FOR EACH ROW 
    WHEN ( NEW.NUMER_UZYTKOWNIKA IS NULL ) 
BEGIN
SELECT NR_UZYT_SEKW.NEXTVAL INTO :NEW.NUMER_UZYTKOWNIKA FROM dual; 
END;
/



CREATE OR REPLACE TRIGGER FKNTM_DZIENNIKI_AKTYWNOSCI BEFORE
  UPDATE OF NUMER_UZYTKOWNIKA ON DZIENNIKI_AKTYWNOSCI BEGIN raise_application_error(-20225,'Non Transferable FK constraint  on table DZIENNIKI_AKTYWNOSCI is violated');
END;
/

CREATE OR REPLACE TRIGGER FKNTM_KAT_INTERESUJACE_UZYT BEFORE
  UPDATE OF ID_KATEGORII,
    NUMER_UZYTKOWNIKA ON KAT_INTERESUJACE_UZYT BEGIN raise_application_error(-20225,'Non Transferable FK constraint  on table KAT_INTERESUJACE_UZYT is violated');
END;
/

CREATE OR REPLACE TRIGGER FKNTM_PARAMETRY_UZYT BEFORE
  UPDATE OF ID_PARAMETRU,
    NUMER_UZYTKOWNIKA ON PARAMETRY_UZYT BEGIN raise_application_error(-20225,'Non Transferable FK constraint  on table PARAMETRY_UZYT is violated');
END;
/


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             6
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           6
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          3
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           6
-- CREATE TABLESPACE                        0
-- CREATE USER                              2
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0