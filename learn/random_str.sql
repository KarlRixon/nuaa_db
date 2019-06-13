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
select gen_name(5);
