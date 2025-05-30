CREATE TABLE EXPONATY2 (
    INV_CIS NUMBER PRIMARY KEY,
    DRUH VARCHAR2(50),
    JMENO VARCHAR2(50),
    POHLAVI CHAR(1),
    ROK_NAR NUMBER(4),
    UMISTENI VARCHAR2(100),
    OSETROVATEL VARCHAR2(10)
);

INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (1548, 'Nosoro�ec', 'Pelda', 'M', 2005, 'Pavilon tlustoko�c�', 'LAZ05');
INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (1677, 'Hroch', 'Bob', 'M', 2003, 'Pavilon tlustoko�c�', 'LAZ05');
INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (1891, 'Hroch', 'Sam', 'M', 2012, 'Pavilon tlustoko�c�', 'LAZ05');
INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (3117, '�irafa', 'Domina', 'F', 2009, 'V�b�h', 'STA01');
INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (4321, 'Sokol', 'Karl�k', 'M', 2021, 'Voli�ra', 'NOV23');



CREATE TABLE veterinari2 (
    ident VARCHAR2(10) PRIMARY KEY,
    prijmeni VARCHAR2(50),
    jmeno VARCHAR2(50),
    sazba_den NUMBER
);

INSERT INTO veterinari2 (ident, prijmeni, jmeno, sazba_den) VALUES ('BEN33', 'Benda', 'B�etislav', 1900);
INSERT INTO veterinari2 (ident, prijmeni, jmeno, sazba_den) VALUES ('COU21', 'Coufal', 'Ctirad', 3200);
INSERT INTO veterinari2 (ident, prijmeni, jmeno, sazba_den) VALUES ('ALD15', 'Aldorf', 'Adam', 2800);



CREATE TABLE nemoci2 (
    exponat NUMBER,
    rok NUMBER,
    nemoc VARCHAR2(100),
    dni NUMBER,
    veterinar VARCHAR2(10)
);

INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (1891, 2020, 'Z�n�t ky�le', 7, 'ALD15');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (1891, 2016, 'Nalomen� �ez�k', 1, 'ALD15');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (3117, 2019, 'Porucha krevn�ho ob�hu', 2, 'BEN33');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (4321, 2019, 'N�kaza �mel�ky', 4, 'BEN33');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (3117, 2020, 'Ang�na', 5, 'ALD15');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (3117, 2018, 'Operace kloub�', 3, 'ALD15');



CREATE TABLE osetrovatele2 (
    OS_CIS VARCHAR2(10) PRIMARY KEY,
    prijmeni VARCHAR2(50),
    jmeno VARCHAR2(50),
    rok_nar NUMBER(4),
    vzdelani VARCHAR2(100)
);

INSERT INTO osetrovatele2 (OS_CIS, prijmeni, jmeno, rok_nar, vzdelani) VALUES ('LAZ05', 'Lazar', 'Ludv�k', 1975, 'Veterin�rn� univerzita');
INSERT INTO osetrovatele2 (OS_CIS, prijmeni, jmeno, rok_nar, vzdelani) VALUES ('NOV23', 'Nov�kov�', 'Nela', 1981, 'St�edn� zdravotn�');
INSERT INTO osetrovatele2 (OS_CIS, prijmeni, jmeno, rok_nar, vzdelani) VALUES ('STA01', 'St�rkov�', 'Simona', 1990, 'St�edn� veterin�rn�');


