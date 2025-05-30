CREATE TABLE EXPONATY2 (
    INV_CIS NUMBER PRIMARY KEY,
    DRUH VARCHAR2(50),
    JMENO VARCHAR2(50),
    POHLAVI CHAR(1),
    ROK_NAR NUMBER(4),
    UMISTENI VARCHAR2(100),
    OSETROVATEL VARCHAR2(10)
);

INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (1548, 'Nosorožec', 'Pelda', 'M', 2005, 'Pavilon tlustokožcù', 'LAZ05');
INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (1677, 'Hroch', 'Bob', 'M', 2003, 'Pavilon tlustokožcù', 'LAZ05');
INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (1891, 'Hroch', 'Sam', 'M', 2012, 'Pavilon tlustokožcù', 'LAZ05');
INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (3117, 'Žirafa', 'Domina', 'F', 2009, 'Výbìh', 'STA01');
INSERT INTO EXPONATY2 (INV_CIS, druh, jmeno, pohlavi, rok_nar, umisteni, osetrovatel) VALUES (4321, 'Sokol', 'Karlík', 'M', 2021, 'Voliéra', 'NOV23');



CREATE TABLE veterinari2 (
    ident VARCHAR2(10) PRIMARY KEY,
    prijmeni VARCHAR2(50),
    jmeno VARCHAR2(50),
    sazba_den NUMBER
);

INSERT INTO veterinari2 (ident, prijmeni, jmeno, sazba_den) VALUES ('BEN33', 'Benda', 'Bøetislav', 1900);
INSERT INTO veterinari2 (ident, prijmeni, jmeno, sazba_den) VALUES ('COU21', 'Coufal', 'Ctirad', 3200);
INSERT INTO veterinari2 (ident, prijmeni, jmeno, sazba_den) VALUES ('ALD15', 'Aldorf', 'Adam', 2800);



CREATE TABLE nemoci2 (
    exponat NUMBER,
    rok NUMBER,
    nemoc VARCHAR2(100),
    dni NUMBER,
    veterinar VARCHAR2(10)
);

INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (1891, 2020, 'Zánìt kyèle', 7, 'ALD15');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (1891, 2016, 'Nalomený øezák', 1, 'ALD15');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (3117, 2019, 'Porucha krevního obìhu', 2, 'BEN33');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (4321, 2019, 'Nákaza èmelíky', 4, 'BEN33');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (3117, 2020, 'Angína', 5, 'ALD15');
INSERT INTO nemoci2 (exponat, rok, nemoc, dni, veterinar) VALUES (3117, 2018, 'Operace kloubù', 3, 'ALD15');



CREATE TABLE osetrovatele2 (
    OS_CIS VARCHAR2(10) PRIMARY KEY,
    prijmeni VARCHAR2(50),
    jmeno VARCHAR2(50),
    rok_nar NUMBER(4),
    vzdelani VARCHAR2(100)
);

INSERT INTO osetrovatele2 (OS_CIS, prijmeni, jmeno, rok_nar, vzdelani) VALUES ('LAZ05', 'Lazar', 'Ludvík', 1975, 'Veterinární univerzita');
INSERT INTO osetrovatele2 (OS_CIS, prijmeni, jmeno, rok_nar, vzdelani) VALUES ('NOV23', 'Nováková', 'Nela', 1981, 'Støední zdravotní');
INSERT INTO osetrovatele2 (OS_CIS, prijmeni, jmeno, rok_nar, vzdelani) VALUES ('STA01', 'Stárková', 'Simona', 1990, 'Støední veterinární');


