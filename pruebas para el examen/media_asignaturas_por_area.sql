

DECLARE
    
    v_med NUMBER;

BEGIN
    
    SELECT AVG(COUNT(*))
    INTO v_med
    FROM ASIGNATURA NATURAL JOIN AREA
    GROUP BY CAR;
    
    DBMS_OUTPUT.PUT_LINE(v_med);
END;