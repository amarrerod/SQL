
# Crear un procedimiento PL/SQL que muestre en pantalla las competiciones en las que ha participado, en una determinada temporada, un atleta especificado por su DNI.

SET SERVEROUTPUT ON;
    CREATE PROCEDURE P1 (v_dni ATLETAS.DNI%TYPE)
    IS  
        v_i RESULTADOS.IC%TYPE;
        v_t RESULTADOS.TEMP%TYPE;
        CURSOR c_i IS
            SELECT TEMP, IC
            FROM RESULTADOS 
            WHERE DNI = v_dni
            GROUP BY TEMP;
    BEGIN
    
        OPEN c_i;
            LOOP 
                FETCH c_i INTO v_t,v_i;
                    EXIT WHEN c_i%NOTFOUND;
                    DBMS_OUTPUT.PUT_LINE(v_t||' '||v_i);
            END LOOP;
        CLOSE c_i;
    END;