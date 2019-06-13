-- 创建表
drop table if exists test1;
create table test1 (
    id int primary key,
    sname varchar(255),
    sage int
);

-- 生成指定长度的随机字符串
DROP function IF EXISTS gen_name;
delimiter //
create function gen_name(n int) returns varchar(255)
begin
    declare str varchar(100) default 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    declare i int default 0;
    declare res_str varchar (255) default '';
    while i < n do
        set res_str = concat(res_str, substr(str, floor(1+rand()*52), 1));
        set i = i+1;
    end while;
    return res_str;
end//
delimiter ;

-- 插入随机数据
drop procedure if exists insert_test1;
delimiter //
create procedure insert_test1(in start_num int, in max_num int)
begin
    declare i int default 0;
    -- 关闭自动提交
    set autocommit = 0;
    repeat
        set i = i+1;
        insert into test1 values(start_num+i, gen_name(floor(rand()*10)+1), floor(10+rand()*30));
        until i = max_num
    end repeat;
    commit;
end//
delimiter ;

call insert_test1(10, 100);
select * from test1;