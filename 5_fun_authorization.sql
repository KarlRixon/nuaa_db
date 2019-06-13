-- 计算每个学生有成绩的课程门数、平均成绩。
select Sno, count(Cno), avg(Grade)
from SC
where Grade is not null
group by Sno;

-- 使用 GRANT 语句,把对基本表 S、SC、C 的使用权限授给其它用户。
create user 'test'@'localhost' identified by 'karl';

grant all privileges on table S to 'test'@'localhost';
grant all privileges on table C to 'test'@'localhost';
grant all privileges on table SC to 'test'@'localhost';

-- 实验完成后,撤消建立的基本表和视图。
drop view if exists S_male;
drop table if exists SC, S, C;
drop procedure if exists insert_stu;
drop function if exists gen_id;
drop function if exists gen_name;
drop user if exists 'test'@'localhost';