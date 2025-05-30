--DROP TABLE USER_GROUP; 

CREATE TABLE USER_GROUP ( 

    USER_GROUP_ID NUMBER(2) NOT NULL, 

    USER_GROUP_NAME VARCHAR2(50) NOT NULL, 

    CREATED DATE NOT NULL, 

    CREATED_BY VARCHAR2(30) NOT NULL, 

    CHANGED DATE NOT NULL, 

    CHANGED_BY VARCHAR2(30) NOT NULL, 

    VERSION NUMBER(10) NOT NULL, 

    CONSTRAINT PK_USER_GROUP PRIMARY KEY (USER_GROUP_ID) 

); 

 

 

--DROP TABLE TASK; 

CREATE TABLE TASK ( 

    TASK_ID NUMBER(3) NOT NULL, 

    TASK_NAME VARCHAR2(30) NOT NULL, 

    DEFAULT_TASK_PARAMS CLOB NOT NULL,  

    CREATED DATE NOT NULL, 

    CREATED_BY VARCHAR2(30) NOT NULL, 

    CHANGED DATE NOT NULL, 

    CHANGED_BY VARCHAR2(30) NOT NULL, 

    VERSION NUMBER(10) NOT NULL, 

    CONSTRAINT PK_TASK PRIMARY KEY (TASK_ID) 

); 

 

--DROP TABLE TASK_PARAMS; 

CREATE TABLE TASK_PARAMS ( 

    TASK_PARAMS_ID NUMBER(10), 

    TASK_PARAMS CLOB, 

    TASK_ID NUMBER(3), 

    USER_GROUP_ID NUMBER(2) NOT NULL, 

    CONSTRAINT PK_TASK_PARAMS PRIMARY KEY(TASK_PARAMS_ID) 

); 

 

--DROP SEQUENCE SQ_USER_GROUP; 

CREATE SEQUENCE SQ_USER_GROUP 

    INCREMENT BY 1  

    START WITH 1 

    MINVALUE 1 

    MAXVALUE 99 

    NOCACHE; 

 

--DROP SEQUENCE SQ_TASK_PARAMS;   

CREATE SEQUENCE SQ_TASK_PARAMS 

    INCREMENT BY 1  

    START WITH 1 

    MINVALUE 1 

    MAXVALUE 9999999999 

    NOCACHE; 

 

--DROP SEQUENCE SQ_TASK; 

CREATE SEQUENCE SQ_TASK  

    INCREMENT BY 1  

    START WITH 1 

    MINVALUE 1 

    MAXVALUE 999 

    NOCACHE; 
    
    
    
--VYTVORENI TRIGGERU PRO SEQKVENCI K TABULCE TASK

CREATE OR REPLACE TRIGGER TR_TASK_BI
BEFORE INSERT ON TASK
FOR EACH ROW
BEGIN
    IF(:NEW.TASK_ID IS NULL) THEN
     SELECT SQ_TASK.NEXTVAL
        INTO:NEW.TASK_ID
        FROM DUAL;
    END IF;
--pokud vkladam novy zaznam
---nastudovat tuto syntaxi
    :NEW.DEFAULT_TASK_PARAMS:='<params task_name='''||:NEW.TASK_NAME ||
    '''task_id='||:NEW.TASK_ID||'></params>';
    :NEW.CREATED:=SYSDATE;
    :NEW.CREATED_BY := SYS_CONTEXT('USERENV','OS_USER');
    :NEW.CHANGED:=SYSDATE;
    :NEW.CHANGED_BY:=:NEW.CREATED_BY;
    :NEW.VERSION:=1;
END;
/

--ahoj bez uvozovek
SELECT ('<params task_name='| |'ahoj'||'
    task_id='|| 1 ||'><params>') FROM dual;
    
--ahoj s uvozovkama
SELECT ('<params task_name="'| |'ahoj'||'"
    task_id='|| 1 ||'><params>') FROM dual;
    

INSERT INTO TASK(TASK_NAME)
VALUES(' Pepa')
INSERT INTO TASK(TASK_NAME) VALUES ('Task1');
Select * FROM TASK

--TRIGGER BEFORE UPDATE PRO TABULKU TASK
CREATE OR REPLACE TRIGGER TR_TASK_BU 
BEFORE UPDATE ON TASK
FOR EACH ROW
BEGIN
    :NEW.CHANGED:=SYSDATE;
    :NEW.CHANGED_BY := SYS_CONTEXT('USERENV','OS_USER');
    :NEW.VERSION :=:OLD.VERSION+1;
END;
/

UPDATE TASK SET TASK_NAME = 'task1' WHERE TASK_ID = 1;
UPDATE TASK SET TASK_NAME = 'Task1' WHERE TASK_ID = 1;
SELECT* FROM TASK;
SELECT TO_CHAR(CREATED, 'DD,MM,YY HH24:MI:SS'), TO_CHAR (CHANGED, 'DD,MM,YY HH24:MI:SS') FROM TASK


--TRIGGERY PRO TAB USER_GROUP - BEFORE INSERT A BEFORE UPDATE
--TR_USER_GROUP_B1, TR_USER_GROUP_BU
--

-- TRIGGER PRO INSERT:
CREATE OR REPLACE TRIGGER TR_USER_GROUP_BI
BEFORE INSERT ON USER_GROUP
FOR EACH ROW
BEGIN
    IF(:NEW.USER_GROUP_ID IS NULL) THEN
    SELECT SQ_USER_GROUP.NEXTVAL
        INTO:NEW.USER_GROUP_ID
        FROM DUAL;
    END IF;
    :NEW.CREATED:=SYSDATE;
    :NEW.CREATED_BY := SYS_CONTEXT('USERENV','OS_USER');
    :NEW.CHANGED:=SYSDATE;
    :NEW.CHANGED_BY:=:NEW.CREATED_BY;
    :NEW.VERSION:=1;
END;
/

--TRIGER PRO UPDATE
CREATE OR REPLACE TRIGGER TR_USER_GROUP_BU 
BEFORE UPDATE ON USER_GROUP
FOR EACH ROW
BEGIN
    :NEW.CHANGED:=SYSDATE;
    :NEW.CHANGED_BY := SYS_CONTEXT('USERENV','OS_USER');
    :NEW.VERSION :=:OLD.VERSION+1;
END;
/

INSERT INTO USER_GROUP(USER_GROUP_NAME) VALUES ('ADMIN');
INSERT INTO USER_GROUP(USER_GROUP_NAME) VALUES ('MAINTENANCE');
INSERT INTO USER_GROUP(USER_GROUP_NAME) VALUES ('ASSISTANCE');
INSERT INTO USER_GROUP(USER_GROUP_NAME) VALUES ('MANAGEMENT');
COMMIT;

INSERT INTO TASK (task_name) VALUES ('task2');
INSERT INTO TASK (task_name) VALUES ('task3');
INSERT INTO TASK (task_name) VALUES ('task4');
INSERT INTO TASK (task_name) VALUES ('task5');
INSERT INTO TASK (task_name) VALUES ('task6');
commit;



SELECT TO_CHAR(CREATED, 'DD,MM,YY HH24:MI:SS'), TO_CHAR (CHANGED, 'DD,MM,YY HH24:MI:SS') FROM TASK



--VYTVORENI TRIGGERU PRO VKLADANI TASK_PARAMS_ID AUTOMATICKY PLUS JEDNA

CREATE OR REPLACE TRIGGER TR_TASK_PARAMS_BI
BEFORE INSERT ON TASK_PARAMS
FOR EACH ROW
BEGIN
    IF(:NEW.TASK_PARAMS_ID IS NULL) THEN
    SELECT SQ_TASK_PARAMS.NEXTVAL
        INTO:NEW.TASK_PARAMS_ID
        FROM DUAL;
    END IF;
END;
/




--ODTUD SPOUSTIM

--PROCEDURY A FUNKCE A MOZNA I TRIGGERY SE JAKO CELEK UKLADAJAI DO TZV. PACKAGE
--HLAVICKA PACKAGE
--PACKAGE PRO 2 PROCEDURY
--1)HLAVIÈKA PACKAGE
CREATE OR REPLACE PACKAGE USER_GROUP_TASK_PARAMS AS

    PROCEDURE pairParamsGroup(pGroupId IN NUMBER, pTaskId IN NUMBER);
    PROCEDURE pairAll;
    
END USER_GROUP_TASK_PARAMS;
/
--2)BODY PACKAGE
CREATE OR REPLACE PACKAGE BODY USER_GROUP_TASK_PARAMS AS

    PROCEDURE pairParamsGroup(pGroupId IN NUMBER, pTaskId IN NUMBER) AS
    --1)ZNÁM ID SKUPINY, ZNÁM ID TASKU (USER_GROUP_ID, TASK_ID)
    --2)ZJISTÍM, ZDA EXISTUJE VAZBA MEZI NIMI
    --3)POKUD EXISTUJE, PROCEDURA ZAHLÁSÍ ŽE BEZ ÚSPÌCHU
    --4)POKUD NEEXISTUJE - UDÌLÁ VAZBU V TABULCE TASK_PARAMS A ZKOPÍRUJE
    --XML SOUBOR Z TASK DO TASK_PARAMS, KDE SE MÙŽE UPRAVIT
        v_grpCnt NUMBER(3);
        v_taskCnt NUMBER(3);
        v_grpParamsCnt NUMBER(3);
    BEGIN
    --kontrola, zda existují zadané parametry
        SELECT COUNT(*) INTO v_grpCnt
        FROM USER_GROUP
        WHERE USER_GROUP_ID = pGroupId;
        
        SELECT COUNT(*) INTO v_taskCnt
        FROM TASK
        WHERE TASK_ID = pTaskId;
        
    --kontrola, zda už nemají vazbu
        SELECT COUNT(*) INTO v_grpParamsCnt
        FROM (
            SELECT USER_GROUP_ID, TASK_ID
            FROM TASK_PARAMS
            WHERE USER_GROUP_ID = pGroupId 
            AND TASK_ID = pTaskId
        );
        
        IF(v_grpParamsCnt = 0 AND v_taskCnt = 1 AND v_grpCnt = 1) THEN
            INSERT INTO TASK_PARAMS (
                TASK_PARAMS,
                TASK_ID,
                USER_GROUP_ID
            )
            SELECT
                TASK.DEFAULT_TASK_PARAMS,
                TASK.TASK_ID,
                USER_GROUP.USER_GROUP_ID
            FROM TASK
            CROSS JOIN USER_GROUP
            WHERE USER_GROUP.USER_GROUP_ID = pGroupId
            AND TASK.TASK_ID = pTaskId;
            COMMIT;
            DBMS_OUTPUT.put_line('Úspìšnì vloženo...');
        ELSE
            DBMS_OUTPUT.put_line('Nelze vykonat...');
        END IF;
    END pairParamsGroup;
    
    PROCEDURE pairAll IS
        --KURZOR PRO USER_GROUP_ID
        CURSOR c_UsrGrpId IS
            SELECT USER_GROUP_ID FROM USER_GROUP;
            
        --PRO TASK
        CURSOR c_Tsk IS
            SELECT TASK_ID FROM TASK;
    BEGIN
        --VNÌJŠÍ SMYÈKA PRO USER_GROUP_ID
        FOR i IN c_UsrGrpId
        LOOP
        --VNITØNÍ SMYÈKA TASK_ID
            FOR j IN c_Tsk
            LOOP
                DECLARE
                    v_cnt NUMBER(3) := 0;
                BEGIN
                    SELECT COUNT(*) INTO v_cnt
                    FROM (
                        SELECT 
                            a.USER_GROUP_ID,
                            a.TASK_ID
                            FROM TASK_PARAMS a
                            WHERE a.USER_GROUP_ID = i.USER_GROUP_ID
                            AND a.TASK_ID = j.TASK_ID
                    );
                    
                    IF(v_cnt = 0) THEN
                        INSERT INTO TASK_PARAMS (
                            TASK_PARAMS,
                            TASK_ID,
                            USER_GROUP_ID)
                        SELECT
                            DEFAULT_TASK_PARAMS,
                            TASK_ID,
                            i.USER_GROUP_ID
                        FROM TASK
                        WHERE TASK_ID = j.TASK_ID;
                        
                        COMMIT;
                    END IF;    
                END;
            END LOOP;
        END LOOP;
    END pairAll;

END USER_GROUP_TASK_PARAMS;


execute user_group_task_params.pairparamsgroup(1,2);

SELECT * FROM TASK_PARAMS
--:POMOCI TRIGGERU SE VYTVORILY ID A HODNOTY Z CROOS JOIN SE PREKOPIROVALY DO TABULKY
EXECUTE user_group_task_params.pairall;
