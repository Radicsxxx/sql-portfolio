drop table tridy;
CREATE TABLE TRIDY 
   (	TRIDA VARCHAR2(26 BYTE), 
	ROCNIK NUMBER(38,0), 
	TRIDNI VARCHAR2(26 BYTE), 
	MISTO VARCHAR2(26 BYTE), 
	MAXSTUD NUMBER(38,0)
   )  ;

Insert into TRIDY (TRIDA,ROCNIK,TRIDNI,MISTO,MAXSTUD) values ('Sexta','1','Novák','Poruba','40');
Insert into TRIDY (TRIDA,ROCNIK,TRIDNI,MISTO,MAXSTUD) values ('Septima','2','Èerná','Zábøeh','15');
Insert into TRIDY (TRIDA,ROCNIK,TRIDNI,MISTO,MAXSTUD) values ('Oktáva','3','Aldorf','Dubina','20');


drop table studenti;

CREATE TABLE studenti ( OSCIS VARCHAR2(26),
  PRIJMENI VARCHAR2(26),
  JMENO VARCHAR2(26),
  POHLAVI CHAR(1),
  DATNAROZ DATE,
  ROCNIK NUMBER(38)) ;   

INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('FRO','Frolíková','Ingrid','F',to_date('04/14/2002', 'MM/DD/RRRR'),1);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('GLO','Glovièík','Bohuslav','M',to_date('06/25/2001', 'MM/DD/RRRR'),3);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('HAM','Hamelová','Miluška','F',to_date('07/02/2001', 'MM/DD/RRRR'),3);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('KRP','Krpec','Alois','M',to_date('10/24/2002', 'MM/DD/RRRR'),2);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('LIP','Lipský','Waldemar','M',to_date('06/11/2001', 'MM/DD/RRRR'),3);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('MOC','Mocková','Aneta','F',to_date('04/04/2003', 'MM/DD/RRRR'),1);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('SUC','Suchánek','Ivo','M',to_date('09/07/2002', 'MM/DD/RRRR'),1);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('SUL','Sulowská','Alice','F',to_date('04/22/2001', 'MM/DD/RRRR'),3);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('ZAH','Zahálková','Nela','F',to_date('03/22/2001', 'MM/DD/RRRR'),2);

drop table zkousky;

CREATE TABLE ZKOUSKY 
   (	OSCIS VARCHAR2(26 BYTE), 
	PREDMET VARCHAR2(26 BYTE), 
	PEDAGOG VARCHAR2(26 BYTE), 
	ZNAMKA NUMBER(38,0)
   )  ;

Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUL','Matematika','Novák','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUL','Èeština','Èerná','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUL','Angliètina','Zindulka','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('HAM','Matematika','Novák','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('HAM','Èeština','Èerná','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('HAM','Angliètina','Zindulka','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUC','Matematika','Novák','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUC','Èeština','Èerná','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUC','Angliètina','Zindulka','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('KRP','Matematika','Novák','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('KRP','Èeština','Èerná','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('KRP','Angliètina','Zindulka','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('ZAH','Matematika','Novák','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('ZAH','Èeština','Èerná','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('ZAH','Angliètina','Zindulka','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('GLO','Matematika','Novák','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('GLO','Èeština','Èerná','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('GLO','Angliètina','Zindulka','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('FRO','Matematika','Novák','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('FRO','Èeština','Èerná','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('FRO','Angliètina','Zindulka','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('MOC','Angliètina','Zindulka','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('MOC','Èeština','Èerná','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('MOC','Matematika','Novák','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('LIP','Matematika','Novák','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('LIP','Èeština','Èerná','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('LIP','Angliètina','Zindulka','3');

commit;


ALTER TABLE STUDENTI
ADD CONSTRAINT pk_kod_studenta PRIMARY KEY (OSCIS)

ALTER TABLE TRIDY
ADD CONSTRAINT pk_rocnik PRIMARY KEY (rocnik)



ALTER TABLE studenti 
ADD CONSTRAINT fk_rocnik FOREIGN KEY (rocnik)
REFERENCES tridy (rocnik)

ALTER TABLE zkousky 
ADD CONSTRAINT fk_zkousky FOREIGN KEY (oscis)
REFERENCES studenti (oscis)

rollback


