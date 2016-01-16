

# Crear una funcion PL/SQL que devuelva el número de conferencias distintas 
# en las que ha participado un intérprete especificado por su DNI

    CREATE FUNCTION F1 (v_dni INTERPRETES.DNI%TYPE)
    RETURN NUMBER
    IS
        v_cant NUMBER;
    BEGIN
        SELECT COUNT(UNIQUE IC)
        INTO v_cant
        FROM TRADUCCIONES 
        WHERE DNI = v_dni;
    
        RETURN (v_cant);
    END;