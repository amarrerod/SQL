
# Crear un procedimiento PL/SQL que muestre en pantalla el gasto realizado en cada mercado, en una fecha especificada como
# argumneto, por una persona identificada por su DNI en otro argumento.

SET SERVEROUTPUT ON;

CREATE PROCEDURE P2 (v_f VENTAS.F%TYPE,
                     v_dni VENTAS.DNI%TYPE)
IS
    v_gasto MERCADOS.PR%TYPE;
    v_m MERCAODS.CM%TYPE;
    
    CURSOR c_gasto IS
        SELECT CM, SUM(PR) GASTO
        FROM MERCADOS NATURAL JOIN VENTAS
        WHERE (DNI = v_dni) AND (F = v_f)
        GROUP BY CM;
    
BEGIN

    OPEN c_gasto;
        LOOP
            FETCH c_gasto INTO v_m, v_gasto;
            EXIT WHEN c_gasto%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('La persona con DNI: '||v_dni||' se gastó el día: '||v_f||' un total de: '||v_gasto||' euros en el supermercado: '||v_m);
        END LOOP;
    CLOSE c_gasto;
    END;