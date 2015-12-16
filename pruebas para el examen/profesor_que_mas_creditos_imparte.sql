

DECLARE
    v_profesor PROFESOR.P%TYPE;

BEGIN
        
        SELECT P
        INTO v_profesor
        FROM PROFESOR P
        WHERE DNI = ( SELECT DNI
                      FROM PLAN_DOCENTE PD
                      GROUP BY DNI
                      HAVING SUM(CTA+CPA+CLA) = (SELECT MAX(SUM(CTA+CPA+CLA))
                                                 FROM PLAN_DOCENTE
                                                 GROUP BY DNI));
                                                                 
                /** 
                        OJO NO SE PUEDE UNIR EN UNA UNICA SUBCONSULTA
                        SQL> SELECT P
                        2  FROM PROFESOR 
                        3  WHERE DNI = (SELECT DNI
                        4               FROM PLAN_DOCENTE
                        5               GROUP BY DNI
                        6               HAVING MAX(SUM(CTA+CPA+CLA)));
                                        HAVING MAX(SUM(CTA+CPA+CLA)))
                                             *
                        ERROR at line 6:
                        ORA-00935: group function is nested too deeply
                
                
                **/
                DBMS_OUTPUT.PUT_LINE(v_profesor);
    END;