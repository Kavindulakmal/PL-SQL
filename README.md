# PL-SQL

![01](https://user-images.githubusercontent.com/80127637/189577690-a4a68f82-cdfd-40b1-a4f4-6d40a99b08f3.jpg)



a)SELECT d.dno,d.mgr.ename,d.magr.salary
  FROM Dept d

b)SELECT p.pname,p.pdeptt.mgr.ename
  FROM Proj p
  WHERE p.budget>50000

c)SELECT p.dept.dno,p.dept.dname, SUM(p.budget)
  FROM Proj p
  GROUP BY p.dept.dno,p.dept.dname

d)SELECT p.dept.mgr.ename
  FROM Proj p
  WHERE p.budget=(SELECT MAX(p.budget)
                  FROM Proj p)


e)SELECT p.dept.mgr.eno,SUM(p.budget)
  FROM Proj p
  HAVING SUM(p.budget)>60000 
  GROUP BY p.dept.mgr.eno

f)SELECT p.dept.mgr.eno,SUM(p.budget)
  FROM Proj p
  WHERE p.dept.mgr.eno(SELECT p.dept.mgr.eno) 
                       FROM Proj p 
                       WHERE p.budget=(SELECT MAX(p.budget) FROM Proj p)
  GROUP BY p.dept.mgr.eno


