# Database Experiment 1 & 2
# SQL 定义表、数据插入 & 数据查询
# Date: 2019-06-11
# Author: KarlRixon

DROP table if exists S, C, SC;

CREATE TABLE S (
    Sno CHAR(9) PRIMARY KEY,
    Sname CHAR(20) NOT NULL,
    Ssex CHAR(2),
    Sage SMALLINT,
    Sdept CHAR(20)
);

CREATE TABLE C (
    Cno CHAR(4) PRIMARY KEY,
    Cname CHAR(40) NOT NULL,
    Cpno CHAR(4),
    Ccredit SMALLINT,
    FOREIGN KEY (cPNO) REFERENCES C(cNO)
);

CREATE TABLE SC (
    Sno CHAR(9),
    Cno CHAR(4),
    PRIMARY KEY (Sno, Cno),
    FOREIGN KEY (Sno) REFERENCES S(Sno),
    FOREIGN KEY (Cno) REFERENCES C(Cno),
    Grade SMALLINT
);

-- 创建表
drop table if exists test1;
create table test1 (
    id int primary key,
    sname varchar(255),
    sage int
);

-- 生成9位学号
drop function if exists gen_id;
delimiter //
create function gen_id() returns char(9)
begin
    declare str varchar(50) default '0123456789';
    declare i int default 0;
		declare res_str char(9) default '';
    while i < 9 do
        set res_str = concat(res_str, substr(str, floor(1+rand()*10), 1));
        set i = i+1;
    end while;
    return res_str;
end//
delimiter ;

-- 生成指定长度的随机字符串
DROP function IF EXISTS gen_name;
delimiter //
create function gen_name(n int) returns varchar(255)
begin
    declare str varchar(100) default 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    declare i int default 0;
    declare res_str varchar(255) default '';
    while i < n do
        set res_str = concat(res_str, substr(str, floor(1+rand()*52), 1));
        set i = i+1;
    end while;
    return res_str;
end//
delimiter ;

-- 插入随机数据
drop procedure if exists insert_stu;
delimiter //
create procedure insert_stu(in max_num int)
begin
    declare i int default 0;
		declare str varchar(10) default '男女';
    -- 关闭自动提交
    set autocommit = 0;
    repeat
        set i = i+1;
        insert into S values(gen_id(), gen_name(floor(rand()*10)+1),
            substr(str, floor(1+rand()*2), 1), floor(10+rand()*30), null);
        until i = max_num
    end repeat;
    commit;
end//
delimiter ;

call insert_stu(100);

-- 插入指定数据
insert into C(Cno, Cname, Ccredit) values ('1', '数据库', 4);
insert into C(Cno, Cname, Ccredit) values ('2', '数学', 2);
insert into C(Cno, Cname, Ccredit) values ('3', '信息系统', 4);
insert into C(Cno, Cname, Ccredit) values ('4', '操作系统', 3);
insert into C(Cno, Cname, Ccredit) values ('5', '数据结构', 4);
insert into C(Cno, Cname, Ccredit) values ('6', '数据处理', 2);
insert into C(Cno, Cname, Ccredit) values ('7', 'C语言', 4);

update C set Cpno='5' where Cno='1';
update C set Cpno='1' where Cno='3';
update C set Cpno='6' where Cno='4';
update C set Cpno='7' where Cno='5';
update C set Cpno='6' where Cno='7';

insert into S values ('201215121', '李勇', '男', 20, 'CS');
insert into S values ('201215122', '刘晨', '女', 19, 'CS');
insert into S values ('201215123', '王敏', '女', 18, 'MA');
insert into S values ('201215125', '张立', '男', 19, 'IS');

create unique index Stusno on S(Sno);
create unique index Coucno on C(Cno);
create unique index SCno on SC(Sno ASC, Cno DESC );

drop index Stusno on S;

insert into SC values ('201215121', '1', 92);
insert into SC values ('201215121', '2', 85);
insert into SC values ('201215121', '3', 88);
insert into SC values ('201215122', '2', 90);
insert into SC values ('201215122', '3', 80);

select * from S;
select * from C;
select * from SC;
