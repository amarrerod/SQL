

/*Crear un procedimiento PL/SQL que reciba como parametro un DNI y
  muestre por pantalla el nombre de las asignaturas y la titulacion en la 
  que se imparte la asignatura por ese profesor */
  
  
  SET SERVEROUTPUT ON;
  CREATE PROCEDURE asigProf(v_dni PROFESOR.DNI%TYPE)
  IS
    CURSOR asg IS
        SELECT A, T
        FROM PROFESOR NATURAL JOIN PLAN_DOCENTE PD, ASIGNATURA A
        WHERE DNI = v_dni AND PD.CAS = A.CAS;
        
        v_a ASIGNATURA.A%TYPE;
        v_t TITULACION.T%TYPE;
        v_p PROFESOR.P%TYPE;
    BEGIN
        
        SELECT P
        INTO v_p
        FROM PROFESOR
        WHERE DNI = v_dni;
        DBMS_OUTPUT.PUT_LINE('NOMBRE DEL PROFESOR: '||v_p);
        OPEN asg;
            LOOP
                FETCH asg INTO v_a,v_t;
                EXIT WHEN asg%NOTFOUND;
                    DBMS_OUTPUT.PUT_LINE(v_a || ' EN LA TITULACION: ' || v_t);
                END LOOP;
        CLOSE asg;
    END;