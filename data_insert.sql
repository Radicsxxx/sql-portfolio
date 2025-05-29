drop table tridy;
CREATE TABLE TRIDY 
   (	TRIDA VARCHAR2(26 BYTE), 
	ROCNIK NUMBER(38,0), 
	TRIDNI VARCHAR2(26 BYTE), 
	MISTO VARCHAR2(26 BYTE), 
	MAXSTUD NUMBER(38,0)
   )  ;

Insert into TRIDY (TRIDA,ROCNIK,TRIDNI,MISTO,MAXSTUD) values ('Sexta','1','Nov�k','Poruba','40');
Insert into TRIDY (TRIDA,ROCNIK,TRIDNI,MISTO,MAXSTUD) values ('Septima','2','�ern�','Z�b�eh','15');
Insert into TRIDY (TRIDA,ROCNIK,TRIDNI,MISTO,MAXSTUD) values ('Okt�va','3','Aldorf','Dubina','20');


drop table studenti;

CREATE TABLE studenti ( OSCIS VARCHAR2(26),
  PRIJMENI VARCHAR2(26),
  JMENO VARCHAR2(26),
  POHLAVI CHAR(1),
  DATNAROZ DATE,
  ROCNIK NUMBER(38)) ;   

INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('FRO','Frol�kov�','Ingrid','F',to_date('04/14/2002', 'MM/DD/RRRR'),1);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('GLO','Glovi��k','Bohuslav','M',to_date('06/25/2001', 'MM/DD/RRRR'),3);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('HAM','Hamelov�','Milu�ka','F',to_date('07/02/2001', 'MM/DD/RRRR'),3);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('KRP','Krpec','Alois','M',to_date('10/24/2002', 'MM/DD/RRRR'),2);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('LIP','Lipsk�','Waldemar','M',to_date('06/11/2001', 'MM/DD/RRRR'),3);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('MOC','Mockov�','Aneta','F',to_date('04/04/2003', 'MM/DD/RRRR'),1);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('SUC','Such�nek','Ivo','M',to_date('09/07/2002', 'MM/DD/RRRR'),1);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('SUL','Sulowsk�','Alice','F',to_date('04/22/2001', 'MM/DD/RRRR'),3);
INSERT INTO studenti (OSCIS, PRIJMENI, JMENO, POHLAVI, DATNAROZ, ROCNIK) VALUES ('ZAH','Zah�lkov�','Nela','F',to_date('03/22/2001', 'MM/DD/RRRR'),2);

drop table zkousky;

CREATE TABLE ZKOUSKY 
   (	OSCIS VARCHAR2(26 BYTE), 
	PREDMET VARCHAR2(26 BYTE), 
	PEDAGOG VARCHAR2(26 BYTE), 
	ZNAMKA NUMBER(38,0)
   )  ;

Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUL','Matematika','Nov�k','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUL','�e�tina','�ern�','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUL','Angli�tina','Zindulka','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('HAM','Matematika','Nov�k','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('HAM','�e�tina','�ern�','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('HAM','Angli�tina','Zindulka','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUC','Matematika','Nov�k','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUC','�e�tina','�ern�','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('SUC','Angli�tina','Zindulka','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('KRP','Matematika','Nov�k','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('KRP','�e�tina','�ern�','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('KRP','Angli�tina','Zindulka','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('ZAH','Matematika','Nov�k','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('ZAH','�e�tina','�ern�','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('ZAH','Angli�tina','Zindulka','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('GLO','Matematika','Nov�k','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('GLO','�e�tina','�ern�','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('GLO','Angli�tina','Zindulka','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('FRO','Matematika','Nov�k','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('FRO','�e�tina','�ern�','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('FRO','Angli�tina','Zindulka','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('MOC','Angli�tina','Zindulka','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('MOC','�e�tina','�ern�','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('MOC','Matematika','Nov�k','2');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('LIP','Matematika','Nov�k','3');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('LIP','�e�tina','�ern�','1');
Insert into ZKOUSKY (OSCIS,PREDMET,PEDAGOG,ZNAMKA) values ('LIP','Angli�tina','Zindulka','3');

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


