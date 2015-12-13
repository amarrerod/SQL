
-- Crear un bloque  PL/SQL que liste, sin contar duplicados,
-- los DNI de los profesores con nombres de, al menos,
-- 5 caracteres de longitud

SET SERVEROUTPUT ON;

DECLARE
	CURSOR profesores_dni (dni PROFESOR.DNI%TYPE)
	IS
		SELECT UNIQUE DNI
		FROM PROFESOR
		WHERE P LIKE '_____%';

	v_dni PROFESOR.DNI%TYPE; 

BEGIN
	OPEN profesores_dni;
	LOOP
		FETCH profesores_dni INTO v_dni;
		DBMS_OUTPUT.PUT_LINE(v_dni || ' ');
		EXIT WHEN profesores_dni%NOTFOUND;
	END LOOP;
	CLOSE profesores_dni;
END;