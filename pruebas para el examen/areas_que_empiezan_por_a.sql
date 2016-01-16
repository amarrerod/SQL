

 /**    CREAR UN BLOQUE PL/SQL QUE MUESTRE POR PANTALLA
        EL NUMERO DE PROFESORES QUE TIENEN LAS AREAS QUE
        EMPIEZAN POR LA LETRA A. ADEMÁS DEL NOMBRE DE TODOS
        ESOS PROFESORES
 **/
 
 
 DECLARE
    v_p NUMBER;
    v_n PROFESOR.P%TYPE;
    v_area AREA.AR%TYPE;
    
    CURSOR nombres IS
        SELECT AR,P
        FROM AREA NATURAL JOIN PROFESOR
        WHERE AR LIKE 'A%'
        GROUP BY AR;
        
BEGIN
    
      OPEN nombres;
        WHILE nombres%FOUND LOOP
            FETCH nombres INTO v_area, v_n;
                DBMS_OUTPUT.PUT_LINE(v_area || '   ' v_n);
        END LOOP;
    CLOSE nombres;
END;