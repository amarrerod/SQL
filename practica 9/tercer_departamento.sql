
-- ESCRIBIR UN BLOQUE PL/SQL QUE VISUALICE 
-- EL NOMBRE DEL DEPARTAMENTO QUE TIENE EL
-- TERCER MAYOR NÚMERO DE ÁREAS ADSCRITAS.

SET SERVEROUTPUT ON;
DECLARE

  CURSOR departamentos
  IS SELECT D,COUNT(*) areas_adscritas
  FROM DEPARTAMENTO NATURAL JOIN AREA
  GROUP BY D
  ORDER BY COUNT(*) DESC; -- Ordenamos de mayor a menor.

  v_nom DEPARTAMENTO.D%TYPE;
  v_areas NUMBER;
  v_Cont NUMBER;

BEGIN

  OPEN departamentos; -- Abrimos el cursor y se ejecuta la consulta
  v_Cont := 0; -- Iniciamos la variable contador para controlar la posicion del cursor
  LOOP -- Entramos en el bucle para recorrer el cursor
      FETCH departamentos INTO v_nom,v_areas; -- Extraemos las t-uplas del cursor
      IF v_Cont = 2 THEN -- Cuando estemos por la tercera posicion hay que imprimir
      DBMS_OUTPUT.PUT_LINE('EL TERCER DEPARTAMENTO CON MÁS AREAS ES: '||v_nom);
      END IF; -- Salimos del IF
      v_Cont := v_Cont + 1;
      EXIT WHEN v_Cont > 2;
  END LOOP; -- Salimos del bucle
  CLOSE departamentos; -- Cerramos el cursor
END;
