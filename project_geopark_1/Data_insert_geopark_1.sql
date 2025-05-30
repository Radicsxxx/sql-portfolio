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

INSERT INTO ZAJEZDY (KOD, lokalita, popis, odjezd, prijezd, rezie, cena) VALUES ('CRA', 'TURNOV','Geopark a CHKO Èeský Ráj',TO_DATE('2018-07-02','YYYY-MM-DD'), TO_DATE('2018-07-09','YYYY-MM-DD'),10000,7000 );
INSERT INTO ZAJEZDY (KOD, lokalita, popis, odjezd, prijezd, rezie, cena) VALUES ('EGE', 'KARLOVY VARY','Geopark Egeria - vèetnì CHKO Slavkovský les',TO_DATE('2018-07-02','YYYY-MM-DD'), TO_DATE('2018-07-08','YYYY-MM-DD'),9000,6500 );
INSERT INTO ZAJEZDY (KOD, lokalita, popis, odjezd, prijezd, rezie, cena) VALUES ('LPI', 'DECIN','CHKO Labské pískovce + NP Èeské Švýcarsko',TO_DATE('2018-07-02','YYYY-MM-DD'), TO_DATE('2018-07-10','YYYY-MM-DD'),8000,8000 );

-- Vytvoøení tabulky ucastnici
CREATE TABLE ucastnici (
    oscis VARCHAR2(3),
    prijmeni VARCHAR2(50),
    jmeno VARCHAR2(50),
    datum_narozeni DATE,
    zena VARCHAR2(3),
    zajezd VARCHAR2(3),
    zaloha NUMBER
);

-- Vložení 40 øádkù do tabulky
BEGIN
    FOR i IN 1..40 LOOP
        INSERT INTO ucastnici (oscis, prijmeni, jmeno, datum_narozeni, zena, zajezd, zaloha)
        VALUES (
            SUBSTR(dbms_random.string('A', 50), 1, 3), -- První tøi písmena z náhodného øetìzce pro oscis
            (SELECT prijmeni FROM (
                SELECT 'Novák' AS prijmeni FROM dual UNION ALL
                SELECT 'Svoboda' AS prijmeni FROM dual UNION ALL
                SELECT 'Dvoøák' AS prijmeni FROM dual UNION ALL
                SELECT 'Èerný' AS prijmeni FROM dual UNION ALL
                SELECT 'Procházka' AS prijmeni FROM dual UNION ALL
                SELECT 'Kuèera' AS prijmeni FROM dual UNION ALL
                SELECT 'Veselý' AS prijmeni FROM dual UNION ALL
                SELECT 'Horák' AS prijmeni FROM dual UNION ALL
                SELECT 'Nìmec' AS prijmeni FROM dual UNION ALL
                SELECT 'Král' AS prijmeni FROM dual
            ) ORDER BY dbms_random.value() FETCH FIRST 1 ROWS ONLY), -- Náhodný výbìr klasického pøíjmení v ÈR
            (SELECT jmeno FROM (
                SELECT 'Jan' AS jmeno FROM dual UNION ALL
                SELECT 'Pavel' AS jmeno FROM dual UNION ALL
                SELECT 'Martin' AS jmeno FROM dual UNION ALL
                SELECT 'Petr' AS jmeno FROM dual UNION ALL
                SELECT 'Tomáš' AS jmeno FROM dual UNION ALL
                SELECT 'Josef' AS jmeno FROM dual UNION ALL
                SELECT 'Lukáš' AS jmeno FROM dual UNION ALL
                SELECT 'Jaroslav' AS jmeno FROM dual UNION ALL
                SELECT 'Miroslav' AS jmeno FROM dual UNION ALL
                SELECT 'Michal' AS jmeno FROM dual
            ) ORDER BY dbms_random.value() FETCH FIRST 1 ROWS ONLY), -- Náhodný výbìr jména z kalendáøe v ÈR
            TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '1950-01-01', 'J'), TO_CHAR(DATE '2000-12-31', 'J'))), 'J'), -- Náhodné datum narození mezi roky 1950 a 2000
            CASE WHEN dbms_random.value(0, 1) < 0.5 THEN 'ano' ELSE 'ne' END, -- Náhodnì zda je úèastník žena
            (SELECT zajezd FROM (
                SELECT 'CRA' AS zajezd FROM dual UNION ALL
                SELECT 'LPI' AS zajezd FROM dual UNION ALL
                SELECT 'EGE' AS zajezd FROM dual
            ) ORDER BY dbms_random.value() FETCH FIRST 1 ROWS ONLY), -- Náhodný výbìr zájezdu
            ROUND(dbms_random.value(2000, 5000), 2) -- Náhodná hodnota pro zálohu mezi 2000 a 5000
        );
    END LOOP;
END;
/






