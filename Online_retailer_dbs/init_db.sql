drop database if exists online_retailer;
create database online_retailer;
use online_retailer;

create table commodity(
    gid integer auto_increment primary key,
    gname char(40) not null,
    gprice float not null
);

create table customer(
    cid integer auto_increment primary key,
    cname char(10) not null,
    csex char(2) not null,
    cbirthday date,
    caddr char(50) not null,
    cphone char(11) not null
);

create table record(
    gid int,
    cid int,
    primary key (gid, cid),
    foreign key (gid) references commodity(gid),
    foreign key (cid) references customer(cid),
    rtime datetime not null,
    rnum int not null
);

insert into customer values (1, '小乔', '女', '1760-1-2', '安徽潜山xx路xx号', '10000000000');
insert into customer values (2, '干将', '男', '1200-2-3', '安徽无锡xx路xx号', '10000000001');
insert into customer values (3, '诸葛亮', '男', '1810-4-5', '山东临沂xx路xx号', '10000000002');
insert into customer values (4, '吕布', '男', '1890-6-7', '包头九原xx路xx号', '10000000003');
insert into customer values (5, '庄周', '男', '1369-8-9', '河南商丘xx路xx号', '10000000004');

insert into commodity values (1, '康师傅矿泉水', '1.0');
insert into commodity values (2, '彪马散打鞋', '345.0');
insert into commodity values (3, '微软游戏手柄', '289.0');
insert into commodity values (4, 'F1 2019 steam游戏', '78.0');
insert into commodity values (5, '王老吉凉茶', '48.0');

insert into record values (1, 1, '2019-06-15 06:00:00', 1);
insert into record values (2, 2, '2019-06-15 07:00:00', 2);
insert into record values (3, 3, '2019-06-15 08:00:00', 3);
insert into record values (4, 4, '2019-06-15 09:00:00', 4);
insert into record values (5, 5, '2019-06-15 10:00:00', 5);
