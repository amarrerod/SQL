

-- CREAR UN BLOQUE PL/SQL QE MUESTRE LOS PROFESORES
-- QUE ACTUALMENTE ESTAN DANDO CLASE EN LAS TITULACIONES
-- GII Y MII SIMULTANEAMENTE

SET SERVEROUTPUT ON;
DECLARE
    CURSOR profesores
    IS
        SELECT P
        FROM (PROFESOR NATURAL JOIN PLAN_DOCENTE) NATURAL JOIN ASIGNATURA
        WHERE T = 'GII' AND FF IS NULL
        INTERSECT
        SELECT P
        FROM (PROFESOR NATURAL JOIN PLAN_DOCENTE) NATURAL JOIN ASIGNATURA
        WHERE T = 'MII' AND FF IS NULL;
    
    v_p PROFESOR.P%TYPE;
BEGIN
    OPEN profesores;
    LOOP 
        FETCH profesores INTO v_p;
        EXIT WHEN profesores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_p);
    END LOOP;
END;