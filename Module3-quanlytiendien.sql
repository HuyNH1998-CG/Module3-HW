create database quanlytiendien;

use quanlytiendien;

create table khachhang(
makh int not null primary key,
tenkh nvarchar(45),
ngaysinh nvarchar(45),
diachi nvarchar(45),
dienthoai nvarchar(45),
ghichu nvarchar(45)
);

create table dongia(
maloai int not null primary key,
loaiho nvarchar(45),
gia int
);

create table chiso(
makh int not null primary key,
chisocuoi int,
chisodau int,
maloai int,
foreign key (makh) references khachhang(makh),
foreign key (maloai) references dongia(maloai)
);

insert into khachhang
value (1,"tung","18-5-1980","hanoi",1,1);

insert into khachhang
value (2,"tuan","27-09-1980","hanoi",1,1);

insert into khachhang
value (3,"hoang","15-02-1990","hanoi",1,1);

insert into khachhang
value (4,"linh","25-3-1990","hanoi",1,1);

insert into khachhang
value (5,"toan","27-3-1995","hanoi",1,1);

insert into dongia
value(1,"Gia dinh",5000);

insert into chiso
value (1,0,5,1);

insert into chiso
value (2,0,3,1);

insert into chiso
value (3,0,7,1);

insert into chiso
value (4,0,18,1);

insert into chiso
value (5,0,1,1);

-- delete from chiso where makh;
-- delete from khachhang where makh;
-- delete from dongia where maloai;

select * from khachhang;
select * from khachhang where ngaysinh like "%1980%" ;
select k.*, c.chisocuoi-c.chisodau as "chisotieuthu" from khachhang k join chiso c 
on k.makh = c.makh;

select k.*, c.chisocuoi-c.chisodau as "so dien tieu thu" from khachhang k inner join chiso c, dongia d
where k.makh = c.makh;

select k.* from khachhang k, chiso c, dongia
where k.makh = c.makh and c.chisocuoi-c.chisodau >1;

select tenkh,loaiho,c.chisocuoi-c.chisodau as "chi so tieu thu",(c.chisocuoi-c.chisodau)*d.gia as "so tien phai tra" from khachhang k, chiso c, dongia d
where k.makh = c.makh and c.chisocuoi >1;

select k.*, loaiho from khachhang k, chiso c, dongia d
where k.makh = c.makh and d.loaiho = "Gia dinh";

select * from khachhang k, chiso c, dongia
where k.makh = c.makh and c.chisocuoi-c.chisodau <=1;