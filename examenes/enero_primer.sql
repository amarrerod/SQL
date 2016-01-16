

# Crear un procedimiento PL/SQL que muestre en pantalla las máquinas en las que tiene cuenta una persona especificada por su DNI

    SET SERVEROUTPUT ON;
    CREATE PROCEDURE P1 (v_dni CUENTAS.DNI%TYPE)
    IS  
        v_c MAQUINAS.CM%TYPE;

        CURSOR c_m IS
            SELECT UNIQUE CM
            FROM CUENTAS 
            WHERE DNI = v_dni;
    BEGIN
    
        OPEN c_m;
        LOOP
            FETCH c_m INTO v_c;
                EXIT WHEN c_m%NOTFOUND;
                    DBMS_OUTPUT.PUT_LINE(v_c);
        END LOOP;
        CLOSE c_m;
    END;