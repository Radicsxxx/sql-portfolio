CREATE TABLE zajezdy
(
    KOD varchar2 (50),
    LOKALITA varchar2 (50),
    POPIS VARCHAR2 (50),
    ODJEZD DATE,
    PRIJEZD DATE,
    REZIE NUMBER,
    CENA NUMBER
);

INSERT INTO ZAJEZDY (KOD, lokalita, popis, odjezd, prijezd, rezie, cena) VALUES ('CRA', 'TURNOV','Geopark a CHKO �esk� R�j',TO_DATE('2018-07-02','YYYY-MM-DD'), TO_DATE('2018-07-09','YYYY-MM-DD'),10000,7000 );
INSERT INTO ZAJEZDY (KOD, lokalita, popis, odjezd, prijezd, rezie, cena) VALUES ('EGE', 'KARLOVY VARY','Geopark Egeria - v�etn� CHKO Slavkovsk� les',TO_DATE('2018-07-02','YYYY-MM-DD'), TO_DATE('2018-07-08','YYYY-MM-DD'),9000,6500 );
INSERT INTO ZAJEZDY (KOD, lokalita, popis, odjezd, prijezd, rezie, cena) VALUES ('LPI', 'DECIN','CHKO Labsk� p�skovce + NP �esk� �v�carsko',TO_DATE('2018-07-02','YYYY-MM-DD'), TO_DATE('2018-07-10','YYYY-MM-DD'),8000,8000 );

-- Vytvo�en� tabulky ucastnici
CREATE TABLE ucastnici (
    oscis VARCHAR2(3),
    prijmeni VARCHAR2(50),
    jmeno VARCHAR2(50),
    datum_narozeni DATE,
    zena VARCHAR2(3),
    zajezd VARCHAR2(3),
    zaloha NUMBER
);

-- Vlo�en� 40 ��dk� do tabulky
BEGIN
    FOR i IN 1..40 LOOP
        INSERT INTO ucastnici (oscis, prijmeni, jmeno, datum_narozeni, zena, zajezd, zaloha)
        VALUES (
            SUBSTR(dbms_random.string('A', 50), 1, 3), -- Prvn� t�i p�smena z n�hodn�ho �et�zce pro oscis
            (SELECT prijmeni FROM (
                SELECT 'Nov�k' AS prijmeni FROM dual UNION ALL
                SELECT 'Svoboda' AS prijmeni FROM dual UNION ALL
                SELECT 'Dvo��k' AS prijmeni FROM dual UNION ALL
                SELECT '�ern�' AS prijmeni FROM dual UNION ALL
                SELECT 'Proch�zka' AS prijmeni FROM dual UNION ALL
                SELECT 'Ku�era' AS prijmeni FROM dual UNION ALL
                SELECT 'Vesel�' AS prijmeni FROM dual UNION ALL
                SELECT 'Hor�k' AS prijmeni FROM dual UNION ALL
                SELECT 'N�mec' AS prijmeni FROM dual UNION ALL
                SELECT 'Kr�l' AS prijmeni FROM dual
            ) ORDER BY dbms_random.value() FETCH FIRST 1 ROWS ONLY), -- N�hodn� v�b�r klasick�ho p��jmen� v �R
            (SELECT jmeno FROM (
                SELECT 'Jan' AS jmeno FROM dual UNION ALL
                SELECT 'Pavel' AS jmeno FROM dual UNION ALL
                SELECT 'Martin' AS jmeno FROM dual UNION ALL
                SELECT 'Petr' AS jmeno FROM dual UNION ALL
                SELECT 'Tom�' AS jmeno FROM dual UNION ALL
                SELECT 'Josef' AS jmeno FROM dual UNION ALL
                SELECT 'Luk�' AS jmeno FROM dual UNION ALL
                SELECT 'Jaroslav' AS jmeno FROM dual UNION ALL
                SELECT 'Miroslav' AS jmeno FROM dual UNION ALL
                SELECT 'Michal' AS jmeno FROM dual
            ) ORDER BY dbms_random.value() FETCH FIRST 1 ROWS ONLY), -- N�hodn� v�b�r jm�na z kalend��e v �R
            TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '1950-01-01', 'J'), TO_CHAR(DATE '2000-12-31', 'J'))), 'J'), -- N�hodn� datum narozen� mezi roky 1950 a 2000
            CASE WHEN dbms_random.value(0, 1) < 0.5 THEN 'ano' ELSE 'ne' END, -- N�hodn� zda je ��astn�k �ena
            (SELECT zajezd FROM (
                SELECT 'CRA' AS zajezd FROM dual UNION ALL
                SELECT 'LPI' AS zajezd FROM dual UNION ALL
                SELECT 'EGE' AS zajezd FROM dual
            ) ORDER BY dbms_random.value() FETCH FIRST 1 ROWS ONLY), -- N�hodn� v�b�r z�jezdu
            ROUND(dbms_random.value(2000, 5000), 2) -- N�hodn� hodnota pro z�lohu mezi 2000 a 5000
        );
    END LOOP;
END;
/






