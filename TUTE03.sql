/* a*/

ALTER TYPE emp_t
ADD MEMBER FUNCTION childallowance
RETURN FLOAT
CASCADE;

CREATE TYPE BODY emp_t AS MEMBER FUNCTION
childalloance RETURN FLOAT IS
count1 INTEGER;
BEGIN
	SELECT COUNT (d.dependents)d
	FROM TABLE(SELF.dependents)d
	WHERE d.relationship ='CHILD'
	RETURN count1*0.05*SELF.salary;
END childalloance

/* b*/

CREATE OR REPLACE TYPE BODY emp_t AS
MEMBER FUNCTION countdependendents RETURN INTEGER IS
count1 INTEGER
BEGIN
	SELECT COUNT(d.depname) INTO count1
	FROM TABLE(SELF.dependents)d
	WHERE d.relationship ='CHILD'
	RETURN count1
END countdependents;

/* c*/

INSERT INTO employee VALUES (dependtb('Jeremy','M',12-march-2001))

/* d*/

ALTER TYPE emp_t
ADD MEMBER FUNCTION bonus(rate FLOAT) 
RETURN FLOAT 
CASCADE;

CREATE OR REPLACE TYPE BODY emp_t AS
MEMBER FUNCTION bonus(rate FLOAT) 
RETURN FLOAT IS

BEGIN
	RETURN SELF.salary*rate/100;
END
END;

/* e*/

SELECT e.name,e.bonus(12.0)
FROM Emp e
WHERE e.edept.dname ='Data mining'



 