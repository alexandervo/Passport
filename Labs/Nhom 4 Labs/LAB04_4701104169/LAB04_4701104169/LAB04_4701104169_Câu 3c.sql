/*---------------------------------------------------------- 
MASV: 47.01.104.169
HO TEN: Trần Duy Quân
LAB: 04
NGAY: 08/04/2024
----------------------------------------------------------*/
--i)
create proc SP_INS_ENCRYPT_SINHVIEN(
@MASV NVARCHAR(20), 
@HOTEN NVARCHAR(100), 
@NGAYSINH DATETIME, 
@DIACHI VARCHAR(200), 
@MALOP VARCHAR(20), 
@TENDN NVARCHAR(100), 
@MATKHAU VARBINARY(MAX))
as
begin
Insert into SINHVIEN values (@MASV, @HOTEN, @NGAYSINH, @DIACHI, @MALOP, @TENDN, @MATKHAU)
end
go

declare @Pass varbinary(max) = HASHBYTES('MD5', '123456')
EXEC SP_INS_ENCRYPT_SINHVIEN N'SV01', N'NGUYEN VAN A', '1/1/1990', '280 AN 
DUONG VUONG', 'L001', N'NVA', @Pass
go


--ii)
Create certificate LABCert
encryption by password = 'Sigma1234567'
with subject = 'Cert for LAB'
create symmetric key SymKey
with algorithm = AES_256
encryption by certificate LABCert
create proc SP_INS_ENCRYPT_NHANVIEN(
@MANV VARCHAR(20), 
@HOTEN NVARCHAR(100), 
@EMAIL VARCHAR(20),
@LUONG VARBINARY(MAX),
@TENDN NVARCHAR(100), 
@MATKHAU VARBINARY(MAX))
as
begin
Insert into NHANVIEN values (@MANV, @HOTEN, @EMAIL, @LUONG, @TENDN, @MATKHAU)
end
go

Open symmetric key SymKey decryption by certificate LABCert with password = 'Sigma1234567'
declare @luong varbinary(max) = encryptbykey(KEY_GUID('SymKey'), 'aaaaaaaa')
close symmetric key SymKey
declare @pass varbinary(max) = HASHBYTES('SHA1', 'bbbbbbbb')

EXEC SP_INS_ENCRYPT_NHANVIEN 'NV01', 'NGUYEN VAN A', 'NVA@', @luong, 
'NVA', @pass

--iii)
create proc SP_SEL_ENCRYPT_NHANVIEN
as
begin
select MANV, HOTEN, EMAIL, LUONG FROM NHANVIEN
end
go

EXEC SP_SEL_ENCRYPT_NHANVIEN
