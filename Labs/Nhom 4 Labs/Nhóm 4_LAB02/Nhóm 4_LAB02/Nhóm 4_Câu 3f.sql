use QLBongDa
go

create proc SP_SEL_ENCRYPT
@TenCLB nvarchar(100),
@TenQG nvarchar(60)
with encryption
as
begin
select MACT, HOTEN, NGAYSINH, DIACHI, VITRI
from CAUTHU, CAULACBO, QUOCGIA
where CAUTHU.MACLB = CAULACBO.MACLB and CAUTHU.MAQG = QUOCGIA.MAQG
and CAULACBO.TENCLB = @TenCLB and QUOCGIA.TENQG = @TenQG
end

exec SP_SEL_ENCRYPT N'SHB Đà Nẵng', 'Brazil'
