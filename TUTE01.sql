/*(a)*/
SELECT d.dno,d.mgr.ename,d.magr.salary
  FROM Dept d

/*(b)*/
SELECT p.pname,p.pdeptt.mgr.ename
  FROM Proj p
  WHERE p.budget>50000

/*(c)*/
SELECT p.dept.dno,p.dept.dname, SUM(p.budget)
  FROM Proj p
  GROUP BY p.dept.dno,p.dept.dname

/*(d)*/
SELECT p.dept.mgr.ename
  FROM Proj p
  WHERE p.budget=(SELECT MAX(p.budget)
                  FROM Proj p)

/*(e)*/
SELECT p.dept.mgr.eno,SUM(p.budget)
  FROM Proj p
  HAVING SUM(p.budget)>60000 
  GROUP BY p.dept.mgr.eno

/*(f)*/
SELECT p.dept.mgr.eno,SUM(p.budget)
  FROM Proj p
  WHERE p.dept.mgr.eno(SELECT p.dept.mgr.eno) 
                       FROM Proj p 
                       WHERE p.budget=(SELECT MAX(p.budget) FROM Proj p)
  GROUP BY p.dept.mgr.eno


