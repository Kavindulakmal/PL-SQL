/* Create types*/

CREATE TYPE Doctor_t AS OBJECT(
regNo char(10),
name varchar2(50),
specialization varchar2(25)
)/

CREATE TYPE Doctor_t AS OBJECT(
hosChg float,
vDate date,
refDoc REF Doctor_t,
docChg float
)/

CREATE TYPE HospitalVisit_tlb AS TABLE OF HospitalVisit_t

CREATE TYPE patient_t AS OBJECT(
id char(10),
name varchar2(50),
dateOfBirth date,
phone char(10),
hospVisits HospitalVisit_tlb
)/

CREATE TABLE Doctors of Doctor_t(
regNo PRIMARY KEY
)/

CREATE TABLE patients of patient_t(
id PRIMARY KEY
)NESTED TABLE hospVisits STORE AS hospVisits_ntb


/* ---------------- */

ALTER TABLE hospVisits_tlb
ADD SCOPE FOR(refDoc) IS Doctors

/* inserting values for doctor*/

INSERT INTO Doctors VALUES (Doctor_t('1223441234','Dr.k.perera','Gynecologist'))

INSERT INTO Doctors VALUES (Doctor_t('1234421131','Dr.p.Weerasinghe','Dermatologist'))

INSERT INTO Doctors VALUES (Doctor_t('2342111322','Prof S.Fernando','pediatiatrican'))

INSERT INTO Doctors VALUES (Doctor_t('2344114344','Dr.k.sathgunarathnam','pediatiatrican'))

/* inserting values for patient */

INSERT INTO patients VALUES(patient_t('732821122v','sampath weerasinghe','23-JAN-73','033212422',
hospVisits_tlb(HospitalVisit_t(50.00,'24-MAY-06',(SELECT REF(d) FROM Doctors d WHERE
d.regNo ='1223441234'),500.00))))

INSERT INTO patients VALUES(patient_t('491222019v','Dulani perera','03-FEB-49','0112233211',
hospVisits_tlb(HospitalVisit_t(75.00,'25-MAY-06',(SELECT REF(d) FROM Doctors d WHERE
d.regNo ='2344114344'),300.00))))

/* Select queries */
/* (a) */

SELECT COUNT(h.docChg+hosChg) AS totalchg
FROM patients p, TABLE(p.hospVisits) h
WHERE p.id = '732821122v';

/* (b) */
SELECT COUNT(p.id) AS noOfpatients
FROM patients p, TABLE(p.hospVisits) h
WHERE h.refDoc.name ='Prof S.Fernando';


/* (c) */
SELECT COUNT(p.id) AS noOfpatients
FROM patients p, TABLE(p.hospVisits) h
WHERE h.refDoc.specialization ='pediatiatrican';

/* (d) */
SELECT p.id, SUM(h.docChg)
FROM patients p, TABLE(p.hospVisits) h
GROUP BY p.id;

/* (e) */
SELECT h.refDoc.name
FROM patients p, TABLE(p.hospVisits) h
GROUP BY h.refDoc.name
HAVING SUM(h.docChg)>1000;









