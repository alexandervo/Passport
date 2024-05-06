qCreate Database QL_SV
Use QL_SV
Go

Create Table Nhanvien(
	manv varchar(20),
	hoten nvarchar(100) not null,
	email varchar(20),
	luong varbinary(max),
	tendn nvarchar(100) not null,
	matkau varbinary(max) not null,
	Constraint pk_nhanvien primary key (manv),
)

Create Table Lop(
	malop varchar(20) not null,
	tenlop nvarchar(100) not null,
	manv varchar(20),
	Constraint pk_lop primary key(malop),
	Constraint fk_lop_nhanvien foreign key(manv) references Nhanvien(manv) ,
)

Create Table Sinhvien(
	masv nvarchar(20) not null,
	hoten nvarchar(100) not null,
	ngaysinh datetime,
	diachi nvarchar(200),
	malop varchar(20),
	tendn nvarchar(100) not null,
	matkau varbinary(max) not null,
	Constraint pk_sinhvien primary key (masv),
	Constraint fk_lop foreign key (malop) references Lop(malop)
)


Create Procedure Sp_Ins_Sinhvien (
	@masv nvarchar(20),
	@hoten nvarchar(100),
	@ngaysinh datetime,
	@diachi nvarchar(200),
	@malop varchar(20),
	@tendn nvarchar(100),
	@matkhau nvarchar(100)
	)
as
begin
	Declare @pass varbinary(max)
	Set @pass = Cast(Hashbytes('MD5', @matkhau) as varbinary(max))
	Insert into Sinhvien (masv, hoten, ngaysinh, diachi, malop, tendn, matkau)
	Values(@masv, @hoten, @ngaysinh, @diachi, @malop, @tendn, @pass)
end



Insert Into Lop Values('CNTT-K35', 'Cong nghe thong tin', NULL)
exec Sp_Ins_Sinhvien 'SV01', 'Nguyen Van A', '1900-1-1', '280 An Duong Vuong', 'CNTT-K35', 'NVA', '123456'

Go

Create Procedure Sp_Login_Nhanvien(
	@tendn nvarchar(100),
	@matkhau nvarchar(max),
	@ketqua int out
	)
As
begin
	Declare @dem int
	Declare @pass varbinary(max)
	Set @pass = HASHBYTES('SHA1',@matkhau)
	Select @dem = count(*)
	from Nhanvien
	where tendn = @tendn and @matkhau like cast(hashbytes('SHA1', cast('abcd12' as nvarchar(max))) as varbinary(max))


	set @ketqua = @dem
end

go
Declare @ketqua int
Exec Sp_Login_Nhanvien 'NVA', 'abcd12', @ketqua out
print @ketqua

select * from Sinhvien