

DECLARE
    v_dept DEPARTAMENTO.D%TYPE;
    
BEGIN

        SELECT D
        INTO v_dept
        FROM DEPARTAMENTO
        WHERE CD IN (SELECT CD 
                     FROM AREA NATURAL JOIN PROFESOR
                     GROUP BY CD,CAR
                     HAVING COUNT(UNIQUE DNI) = (SELECT MIN(COUNT(UNIQUE DNI))
                                                 FROM AREA NATURAL JOIN PROFESOR
                                                 GROUP BY CAR));
        DBMS_OUTPUT.PUT_LINE(v_dept);
END;
