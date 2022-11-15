CREATE TABLE  BORROWERR
(
roll_no NUMBER,
NAME VARCHAR2(25),
dateofissue DATE,
NAME_of_book VARCHAR2(25),
status VARCHAR2(20)
);

CREATE TABLE FINE
(
roll_no NUMBER,
date_of_return DATE,
amt NUMBER
);

INSERT INTO BORROWERR VALUES(54,'SUDARSHAN',TO_DATE('10-01-2022','MM-DD-YYYY'),'HARRY POTTER','I');

INSERT INTO BORROWERR VALUES(56,'SUMIT',TO_DATE('10-15-2022','MM-DD-YYYY'),'DARK MATTER','I');

INSERT INTO BORROWERR VALUES(68,'MANDAR',TO_DATE('09-24-2022','MM-DD-YYYY'),'SILENT HILL','I');

INSERT INTO BORROWERR VALUES(66,'SIDDHAM',TO_DATE('08-26-2022','MM-DD-YYYY'),'GOD OF WAR','I');

INSERT INTO BORROWERR VALUES(50,'SHREYAS',TO_DATE('09-09-2022','MM-DD-YYYY'),'SPIDER-MAN','I');

DECLARE
	i_roll_no NUMBER;
	NAME_of_book VARCHAR2(25);
	no_of_days NUMBER;
	return_date DATE := TO_DATE(SYSDATE,'MM-DD-YYYY');
	temp NUMBER;
	doi DATE;
	FINES NUMBER;

BEGIN

	i_roll_no := :i_roll_no;
	NAME_of_book := :NAMEofbook;
	dbms_output.put_line(return_date);
	SELECT to_date(BORROWERR.dateofissue,'MM-DD-YYYY') INTO doi FROM BORROWERR WHERE BORROWERR.roll_no = i_roll_no AND BORROWERR.NAME_of_book = NAME_of_book;
	no_of_days := return_date-doi;
	dbms_output.put_line( no_of_days);
	IF (no_of_days >15 AND no_of_days <=30) THEN
		FINES := 5*no_of_days;
	ELSIF (no_of_days>30 ) THEN
		temp := no_of_days-30;
		FINES := 150 + temp*50;
	END IF;
	dbms_output.put_line( FINES);
	INSERT INTO FINE VALUES(i_roll_no,return_date,FINES);
	UPDATE BORROWERR SET status = 'R' WHERE BORROWERR.roll_no = i_roll_no;

END;
/

