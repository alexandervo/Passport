use QLBongDa
go


create login BDAdmin with password = 'Sigma1207', check_expiration = off, check_policy = off
create login BDBK with password = 'Sigma1208', check_expiration = off, check_policy = off
create login BDRead with password = 'Sigma1209', check_expiration = off, check_policy = off
create login BDU01 with password = 'Sigma1210', check_expiration = off, check_policy = off
create login BDU02 with password = 'Sigma1211', check_expiration = off, check_policy = off
create login BDU03 with password = 'Sigma1212', check_expiration = off, check_policy = off
create login BDU04 with password = 'Sigma1201', check_expiration = off, check_policy = off
create login BDProfile with password = 'Sigma1202', check_expiration = off, check_policy = off
go


create user BDAdmin for login BDAdmin;
alter role db_owner add member BDAdmin;


create user BDBK for login BDBK;
grant backup database to BDBK;


create user BDRead for login BDRead;
grant select to BDRead;


create user BDU01 for login BDU01;
grant create table to BDU01;


create user BDU02 for login BDU02;
grant update to BDU02
deny create table to BDU02
deny delete on dbo.BANGXH to BDU02
deny delete on dbo.CAULACBO to BDU02
deny delete on dbo.CAUTHU to BDU02
deny delete on dbo.HLV_CLB to BDU02
deny delete on dbo.HUANLUYENVIEN to BDU02
deny delete on dbo.QUOCGIA to BDU02
deny delete on dbo.SANVD to BDU02
deny delete on dbo.TINH to BDU02
deny delete on dbo.TRANDAU to BDU02


create user BDU03 for login BDU03;
grant select, insert, update, delete on CAULACBO to BDU03;
deny select, insert, update, delete on QUOCGIA to BDU03;
deny select, insert, update, delete on TINH to BDU03;
deny select, insert, update, delete on SANVD to BDU03;
deny select, insert, update, delete on HUANLUYENVIEN to BDU03;
deny select, insert, update, delete on HLV_CLB to BDU03;
deny select, insert, update, delete on TRANDAU to BDU03;
deny select, insert, update, delete on BANGXH to BDU03;
deny select, insert, update, delete on CAUTHU to BDU03;


create user BDU04 for login BDU04;
grant select, insert, delete on CAUTHU to BDU04;
deny select (NGAYSINH), update (VITRI) on CAUTHU to BDU04;


create user BDProfile for login BDProfile;
grant alter trace to BDProfile;
