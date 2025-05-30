--DROP TABLE EMPLOYEES;
CREATE TABLE EMPLOYEES (
    ID NUMBER(3) NOT NULL,
    FIRST_NAME VARCHAR2(20) NOT NULL,
    LAST_NAME VARCHAR2(20) NOT NULL,
    DEPT_ID NUMBER(2) NOT NULL,
    SALARY NUMBER(6) NOT NULL,
    CONSTRAINT PK_EMPLOYEES PRIMARY KEY(ID));

--DROP SEQUENCE SQ_EMPLOYEES;
CREATE SEQUENCE SQ_EMPLOYEES
    INCREMENT BY 1 
    START WITH 1
    MINVALUE 1
    MAXVALUE 999
    NOCACHE;

INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'John', 'Woody', 1, 100000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Joann', 'Herby', 1, 90000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Anna', 'Brenton', 2, 75000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Brenda', 'Bryant', 2, 75000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Will', 'Ackeby', 2, 55000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Karen', 'Portman', 3, 20000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Miles', 'Aberdeen', 3, 20000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Laura', 'Palmer', 4, 55000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Harry', 'Freeman', 4, 60000);
INSERT INTO EMPLOYEES (ID, FIRST_NAME, LAST_NAME, DEPT_ID, SALARY) VALUES (SQ_EMPLOYEES.NEXTVAL, 'Sheila', 'Aberdeen', 4, 55000);


COMMIT;

-- tools->preferences->database->object viewer->
--zaškrtnout “automatically freeze object viewer windows”


SET SERVEROUTPUT ON;
--ANON BLOCK
DECLARE
--v_salaries NUMBER(7):=1 lze priradit hodmnotu prommenne takto
    v_salaries NUMBER(7);
    v_count NUMBER;
BEGIN
  SELECT SUM(salary)INTO v_salaries FROM  employees;
  SELECT COUNT(*) INTO v_count FROM  employees;
  DBMS_OUTPUT.PUT_LINE('Firma vyplati svym '|| v_count ||' zamestnancum ' ||v_salaries||' CZK');
END;
/

--cviceni: napiste anonymni blok plsql pro vypocet prumerne mzdy v 
---oddeleni 4 a pocet zamestnancu v tomto oddeleni
DECLARE
    v_pocet NUMBER;
    v_plat NUMBER (7,2);
BEGIN
    --SELECT (SUM(salary)/COUNT(id)) FROM EMPLOYEES 
    --GROUP BY DEPT_ID
    SELECT (SUM(salary)/COUNT(id))INTO v_plat FROM EMPLOYEES WHERE DEPT_ID=4;
    --SELECT AVG(salary)INTO v_plat FROM EMPLOYEES WHERE DEPT_ID=4;
    SELECT COUNT(id)INTO v_pocet FROM EMPLOYEES WHERE DEPT_ID=4;
    DBMS_OUTPUT.PUT_LINE ('Prumerna mzda v oddeleni 4 je ' ||v_plat||' a pracuje tam ' ||v_pocet|| ' lidi');
END;

--FUNKCE
--secteni dvou cisel pomocic fce
CREATE OR REPLACE FUNCTION addNumbers1 (pNumber1 NUMBER,pNumber2 NUMBER)
RETURN NUMBER IS
    v_result NUMBER;
BEGIN
    SELECT (pNumber1+pNumber2)
    INTO v_result
    FROM DUAL;
    RETURN v_result;
END;
--VOLANI FUNKCE
SELECT addNumbers1(5,6) FROM DUAL;
 --2.ZPUSOB
CREATE OR REPLACE FUNCTION addNumbers2 (pNumber1 NUMBER, pNumber2 NUMBER)
RETURN NUMBER IS
    v_result NUMBER;
BEGIN
    v_result:= pNumber1+pNumber2;
    RETURN v_result;
END;
/
SELECT addNumbers2(5,6) FROM DUAL;
--NAPISTE FUNKCI "AvgSalDept", KTERA VYPOCITA A VRATI PRUMERNOU MZDU
--V KONKRETNIM ODDELENI, NAPOVEDA: CISLO ODDELENI PREDEJTE FUNKCI JAKO
--PdEPTnO
CREATE OR REPLACE FUNCTION AvgSalDept (pDeptNo NUMBER)
RETURN NUMBER IS
    v_result NUMBER;
BEGIN
    SELECT AVG(salary)
    INTO v_result 
    FROM employees 
    WHERE DEPT_ID = pDeptNo;
    RETURN v_result;
END AvgSalDept;
/
SELECT AvgSalDept (3) FROM DUAL;

--PROCEDURY
--NAPISU PROCEDURA KTERA MI NAHRADI DBMS_OUTPUT.PUT_LINE
CREATE OR REPLACE PROCEDURE pl(pText VARCHAR2) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE (pText);
END;
/

EXECUTE PL ('AHOJ');
--PROCEDURU O CLOVEKU JEHOZ ID ZNAME ID BUDE PARAMTER
--V RAMCI JINE PROCEDURY NEMUSIS POUZIVAT EXECUTE
CREATE OR REPLACE PROCEDURE empInfo (pId NUMBER ) IS 
v_firstname EMPLOYEES.FIRST_NAME%TYPE ;
v_lastname EMPLOYEES.LAST_NAME%TYPE ;
v_salary EMPLOYEES.SALARY%TYPE ;
BEGIN
    SELECT first_name INTO v_firstname FROM EMPLOYEES 
    WHERE id = pId;
    SELECT last_name INTO v_lastname FROM EMPLOYEES 
    WHERE id = pId;
    SELECT salary INTO v_salary FROM EMPLOYEES 
    WHERE id = pId;
    pl(v_firstname||' '|| v_lastname ||', '|| v_salary);
END;
/
EXECUTE empInfo (5);

--procedura vypise info o cloveku, 
--jehoz id zname s pouzitim recordu

CREATE OR REPLACE PROCEDURE  empInfoRec(pId NUMBER) IS
    r_emp EMPLOYEES%ROWTYPE;
BEGIN
    SELECT *INTO r_emp FROM EMPLOYEES WHERE ID = pID;
    pl(r_emp.FIRST_NAME||' '|| r_emp.LAST_NAME ||', '|| r_emp.SALARY);
END;
/

EXECUTE empInfoRec(1)
--Napi3te proceduru"deptInfo", ktera vypise pocet zamestnancnu
--v konkretnim oddeleni, kolik firma mesicne da 
--za mzdy v tomto oddeleni,
--napoveda:parametrem"pDepId" predejte cislo oddeleni procedure
--a a vypiste pomoci procedur pl


CREATE OR REPLACE PROCEDURE deptInfo(pDepId  NUMBER) IS
    v_cnt NUMBER;
    v_salSum NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cnt FROM EMPLOYEES WHERE dept_id= pDepId;
    SELECT SUM(salary) INTO v_salSum FROM EMPLOYEES WHERE DEPT_ID= pDepId;
    
    pl ('ODDELENI CISLO' ||TO_CHAR(pDepId)||'ma'||TO_CHAR(v_cnt)||'zamestnancu a platy jsou '||to_char(v_salSum));
END deptInfo;
/
EXECUTE deptInfo (2);

--kurzory 3 RUZNE ZPUSOBY
--anonymni blok s implicitnim kurzorem, ktery vypise
--jmeno a prijmeni jako jeden retezec od kazdeho zamestnance
BEGIN
--PRO KAZDY ZAZNAM V KUZORU:
    FOR r_emp IN(
        SELECT FIRST_NAME, LAST_NAME
        FROM EMPLOYEES
    )
--UDELEJ:
    LOOP
        pl(r_emp.FIRST_NAME ||' '||r_emp.LAST_NAME);   
    END LOOP;
END;
/

--EXPLICITNI
DECLARE
    CURSOR c_emp IS 
        SELECT FIRST_NAME, LAST_NAME
        FROM EMPLOYEES;
BEGIN
    FOR i IN c_emp
    LOOP
        pl (i.FIRST_NAME ||' '||i.LAST_NAME);  
    END LOOP;
END;

--druhy zpusob zapisu - OPEN/FETCH/CLOSE
DECLARE
    CURSOR c_emp IS 
        SELECT FIRST_NAME, LAST_NAME
        FROM EMPLOYEES;
    r_emp c_emp%ROWTYPE;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO r_emp;
        EXIT WHEN c_emp%NOTFOUND;
        pl(r_emp.FIRST_NAME ||' '||r_emp.LAST_NAME);
    END LOOP;
    CLOSE c_emp;
END;
/

--CV VYBERTE SI JEDEN CURSOR A UDELEJTE ANONYMNI BLOK,
--KTERY UDELA UPPERCASE FIRSTNAME, LOWERCASE LASTNAME
--PRIDA KAZDEMU 10000 NA VYPLATU, DATA
--V TZBULCE EMPLOYEES NEMENTE, UZIJTE DATA Z RECORDU
-- A VYPISTE POMOCI PROCEDURY PL

BEGIN
--PRO KAZDY ZAZNAM V KUZORU:
    FOR i IN(
        SELECT FIRST_NAME, LAST_NAME,salary
        FROM EMPLOYEES
    )
--UDELEJ:
    LOOP
        pl(UPPER(i.FIRST_NAME) ||' '||LOWER(i.LAST_NAME)
        ||', '|| (i.SALARY+10000));   
        --UPDATE EMPLOYEES set salary = salary-10000 
        --TAKTO BYCH TO AKTUALIZOVAL CELE CHCI JEN RECORD
    END LOOP;
END;
/

--TRIGGERS
--DEFINUJEME TRIGGER
--1)TRIGGER BEFORE INSERT
CREATE OR REPLACE TRIGGER TR_EMPLOYEES_BI
--KDY SE MA SPUSTIT A KDE
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN
--POKUD ID NULL TAM VEME ZE SEKVENCE NEXTVAL A VLOZI JI DO VKLADANEHO ID
    IF(:NEW.ID IS NULL) THEN
        SELECT SQ_EMPLOYEES.NEXTVAL
        INTO:NEW.ID
        FROM DUAL;
    END IF;
END;
/
--POKUD VKLADANEHO ID BEY HODNOTZ VEME SI 
--ZE SEKVENCE NEXTVALL A VLOZI DO VKLADANEHO ID
--POKUD JA TAM DAM TO ID TAK TO 
--NEUDELA NIC PODMINKA NEPLATI

--lze to i takto udelat trigger, 
--ale nedoporucuje pokud smazu zaznam udela to bordel
CREATE OR REPLACE TRIGGER TR_EMPLOYEES_BI
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN
    IF(:NEW.ID IS NULL) THEN
        SELECT (MAX(ID)+1) INTO :NEW.ID FROM EMPLOYEES;
    END IF;
END;
/

INSERT INTO EMPLOYEES(FIRST_NAME, LAST_NAME,DEPT_ID, SALARY)
VALUES(' Johanna', ' Schmied',1,56000);


--2)TRIGGER PRO KAZDY UPDATE: BEFORE UPDATE
CREATE OR REPLACE TRIGGER TR_EMPLOYEES_BU
BEFORE UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN
    :NEW.VERSION :=:OLD.VERSION+1;
END;
/

--TRIGGER BEFORE UPDATE KTERY JE NAVAZANY NA TU TABULKU MI
--UDELAL VERSION NA 2 
UPDATE EMPLOYEES SET SALARY = 120000 WHERE ID=12;













