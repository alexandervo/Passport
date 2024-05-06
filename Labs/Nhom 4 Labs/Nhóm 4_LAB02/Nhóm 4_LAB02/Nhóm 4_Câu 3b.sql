use QLBongDa
go


create table CAUTHU (
    MACT numeric primary key IDENTITY(1,1),
    HOTEN nvarchar(100) not null,
    VITRI nvarchar(20) not null,
    NGAYSINH datetime,
    DIACHI nvarchar(200),
    MACLB varchar(5) not null,
    MAQG varchar(5) not null,
    SO int not null,
    Constraint FK_CAUTHU_CAULACBO foreign key (MACLB) references CAULACBO(MACLB),
    Constraint FK_CAUTHU_QUOCGIA foreign key (MAQG) references QUOCGIA(MAQG)
);
GO 


create table QUOCGIA (
    MAQG varchar(5) primary key,
    TENQG nvarchar(60) not null
);
GO


create table CAULACBO (
    MACLB varchar(5) primary key,
    TENCLB nvarchar(100) not null,
    MASAN varchar(5) not null,
    MATINH varchar(5) not null,
    Constraint FK_CAULACBO_SANVD foreign key (MASAN) references SANVD(MASAN),
    Constraint FK_CAULACBO_TINH foreign key (MATINH) references TINH(MATINH)
);
GO


create table TINH (
    MATINH varchar(5) primary key,
    TENTINH nvarchar(100) not null
);
GO



create table SANVD (
    MASAN varchar(5) primary key,
    TENSAN nvarchar(100) not null,
    DIACHI nvarchar(200)
);
GO


create table HUANLUYENVIEN (
    MAHLV varchar(5) primary key,
    TENHLV nvarchar(100) not null,
    NGAYSINH datetime,
    DIACHI nvarchar(200),
    DIENTHOAI nvarchar(20),
    MAQG varchar(5) not null,
    Constraint FK_HUANLUYENVIEN_QUOCGIA foreign key (MAQG) references QUOCGIA(MAQG)
);
GO


create table HLV_CLB (
    MAHLV varchar(5),
    MACLB varchar(5),
    VAITRO nvarchar(100) not null,
    Constraint PK_HLV_CLB primary key (MAHLV, MACLB),
    Constraint FK_HLV_CLB_HUANLUYENVIEN foreign key (MAHLV) references HUANLUYENVIEN(MAHLV),
    Constraint FK_HLV_CLB_CAULACBO foreign key (MACLB) references CAULACBO(MACLB)
);
GO


create table TRANDAU (
    MATRAN numeric primary key IDENTITY(1,1),
    NAM int not null,
    VONG int not null,
    NGAYTD datetime not null,
    MACLB1 varchar(5) not null,
    MACLB2 varchar(5) not null,
    MASAN varchar(5) not null,
    KETQUA varchar(5) not null,
    Constraint FK_TRANDAU_CAULACBO1 foreign key (MACLB1) references CAULACBO(MACLB),
    Constraint FK_TRANDAU_CAULACBO2 foreign key (MACLB2) references CAULACBO(MACLB),
    Constraint FK_TRANDAU_SANVD foreign key (MASAN) references SANVD(MASAN)
);
GO


create table BANGXH (
    MACLB varchar(5),
    NAM int,
    VONG int,
    SOTRAN int not null,
    THANG int not null,
    HOA int not null,
    THUA int not null,
    HIEUSO varchar(5) not null,
    DIEM int not null,
    HANG int not null,
    Constraint PK_BANGXH primary key (MACLB, NAM, VONG),
    Constraint FK_BANGXH_CAULACBO foreign key (MACLB) references CAULACBO(MACLB)
);
GO