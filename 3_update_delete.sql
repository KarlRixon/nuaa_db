-- 把 1 号课程的非空成绩提高 10%。
update SC
set Grade = Grade * 1.1
where Grade is not null
    and Cno='1';

-- 在 SC 表中删除课程名为数据结构的成绩的元组。
delete
from SC
where Cno in (
    select Cno
    from C
    where Cname='数据结构'
);

-- 在 S 和 SC 表中删除学号为 95002 的所有数据。
delete
from SC
where Sno='201215122';

delete
from S
where Sno='201215122';