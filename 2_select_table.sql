-- 查询选修 1 号课程的学生学号与姓名。
select S.Sno, S,Sname from S, SC where SC.Cno='1' and S.Sno=SC.Sno;

-- 查询选修课程名为数据结构的学生学号与姓名。
select S.Sno, S.Sname from S, C, SC where C.Cname='数据结构' and S.Sno=SC.Sno and SC.Cno=C.Cno;

-- 查询不选 1 号课程的学生学号与姓名。
select S.Sno, S.Sname from S where not exists(select * from SC where Sno=S.Sno and Cno='1');

-- 查询学习全部课程学生姓名。
select Sname from S
where not exists (
    select * from C
    where not exists (
        select * from SC
        where Sno=S.Sno and Cno=C.Cno
    )
);

-- 查询所有学生除了选修 1 号课程外所有成绩均及格的学生的学号和平均成绩,其结果按平均成绩的降序排列。
select SCX.Sno, avg(SCX.Grade)
from SC SCX
where 59 < all(
    select SCY.Grade
    from SC SCY
    where SCY.Sno=SCX.Sno
        and SCY.Cno!='1'
) and SCX.Cno!='1'
group by SCX.Sno
order by avg(SCX.grade) desc;

-- 查询选修数据库原理成绩第 2 名的学生姓名。
select S.Sname
from SC, C, S
where C.Cname='数学'
    and SC.Sno=S.Sno
    and C.Cno=SC.Cno
order by SC.Grade desc
limit 1,1;

-- 查询所有 3 个学分课程中有 3 门以上(含 3 门)课程获 80 分以上(含 80 分)的学生的姓名。
select Sname
from S
where Sno in(
    select Sno
    from SC, C
    where C.Cno=SC.Cno
        and C.Ccredit >= 3
        and SC.Grade >= 80
    group by Sno
    having count(Grade) >= 3
);

-- 查询选课门数唯一的学生的学号。
select Sno, count(Cno)
from SC
group by Sno;

-- SELECT 语句中各种查询条件的实验。
select distinct SC.Sno
from SC, (select Sno, count(Cno) Count_Cno from SC group by Sno) as Count_SC
where not exists(
    select * from (select Sno, count(Cno) Count_Cno from SC group by Sno) as Count_SC_2
    where SC.Sno != Count_SC_2.Sno
        and Count_SC.Count_Cno=Count_SC_2.Count_Cno
)and SC.Sno=Count_SC.Sno;