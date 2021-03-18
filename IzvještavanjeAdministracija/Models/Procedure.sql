use [PRA20-Erika-Raguž]
go
create proc LoginUser
	@username nvarchar(50),
	@password nvarchar(50)
as
begin
  select count(1) from LoginDjelatnik where Username=@username and Password=@password
end
go
create proc GetTeams
 as
 begin
   select * from Tim
 end
go
create proc GetTypes
 as
 begin
   select * from TipDjelatnika
 end
 go
 create proc InsertEmployee
  @ime nvarchar(50), @prezime nvarchar(50), @Email nvarchar(100), 
  @datumZaposlenja date, @tip int, @tim int
 as
  begin
   insert into Djelatnik
   (Ime, Prezime, Email, DatumZaposlenja,TipID, TimID)
   values(@ime, @prezime, @Email, @datumZaposlenja, @tip, @tim)
  end
go
alter proc GetDjelatnik
 @id int
as 
  begin
   select * from Djelatnik
   where Djelatnik.IDDjelatnik = @id 
  end
go
alter proc UpdateDjelatnik
@IDDjelatnik int, 
@TipID int,
@Ime nvarchar(50),
@Prezime nvarchar(50),
@Email nvarchar(50),
@DatumZaposlenja date,
@TimID int
as 
 begin
	update Djelatnik
	set TipID=@TipID, Ime=@Ime, Prezime=@Prezime, Email=@Email, DatumZaposlenja=@DatumZaposlenja,
	TimID = @TimID
	where IDDjelatnik = @IDDjelatnik
 end
go
alter proc GetProjekteDjelatnika
@IDDjelatnika int
as
  begin
    select Naziv
	from Projekt
	inner join Projekt_Djelatnik 
	ON DjelatnikID = @IDDjelatnika
	where ProjektID = IDProjekt
  end
go
create proc ActivityChange
(
@objekt nvarchar(25),
@id int,
@aktivnost int
)
as
begin
    if(@objekt='djelatnik')
	  begin
	    update Djelatnik 
		set Aktivnost = @aktivnost
		where IDDjelatnik = @id
      end
	 else if(@objekt = 'projekt')
	  begin
	    update Projekt
		set Aktivnost = @aktivnost
		where IDProjekt = @id
      end
	else if(@objekt = 'tim')
	  begin
	    update Tim
		set Aktivnost = @aktivnost
	    where IDTim = @id
	  end
end
go
alter proc GetKlijent
@id int
as
begin 
  select * from Klijent
  where IDKlijent = @id
end
go
create proc GetVoditelji
as
  select * from Djelatnik
  where TipID = 2
go 
create proc GetKlijenti
as
  select * from Klijent
go
 alter proc GetDjelatnikeNaProjektu
 @IDProjekt int
 as
   begin
     select IDDjelatnik, Ime, Prezime, TipID
	 from Djelatnik
	 inner join Projekt_Djelatnik
	 on ProjektID = @IDProjekt
	 where DjelatnikID = IDDjelatnik and TipID != 2
   end
go
 create proc GetTimoveNaProjektu
 @IDProjekt int
 as
   begin
     select *
	 from Tim
	 inner join Projekt_Tim
	 on ProjektID = @IDProjekt
	 where TimID = IDTim
   end
go
  alter proc GetDjelatnici
   as
   begin
   select * from Djelatnik
   where TipID not like '2'
   end
go
create proc GetTimovi
as
select * from Tim
go
alter proc InsertProject
@naziv nvarchar(50),
@datumOtvaranja date,
@idVoditelj int,
@idKlijent int
as
 insert into Projekt
 (Naziv,DatumOtvaranja,VoditeljID,KlijentID,Aktivnost)
 values(@naziv, @datumOtvaranja, @idVoditelj,@idKlijent, 1)
 go
create proc InsertDjelatnikNaProjekt
@idDjelatnik int,
@idProjekt int
as
insert into Projekt_Djelatnik (ProjektID, DjelatnikID)
values (@idProjekt,@idDjelatnik)
go
create proc GetProjectId
@naziv nvarchar(25)
as
 select Projekt.IDProjekt
 from Projekt
 where Projekt.Naziv = @naziv
go
 create proc InsertTimNaProjekt
@idTim int,
@idProjekt int
as
  insert into Projekt_Tim
  values (@idProjekt, @idTim)
go
alter proc GetProjekt
@id int
as
 begin
  select * from Projekt
  where IDProjekt = @id
 end
 go
 create proc UpdateProject
   @id int, @naziv nvarchar(50),
   @datumOtvaranja date, @idVoditelj int,
   @idKlijent int
   as
   update Projekt
   set Naziv = @naziv, DatumOtvaranja=@datumOtvaranja,
   VoditeljID=@idVoditelj, KlijentID=@idKlijent
   where IDProjekt = @id
go
   create proc InsertTeam
   @naziv nvarchar(50),
   @VoditeljID int,
   @DatumKreiranja date
   as
   begin
     insert into Tim
	 values(@naziv, @VoditeljID, 1, @DatumKreiranja)
   end
go
create proc UpdateTim
@id int,
@naziv nvarchar(50),
@voditeljID int,
@DatumKreiranja date
as
update Tim
set Naziv=@naziv, VoditeljID=@voditeljID, DatumKreiranja=@DatumKreiranja
where IDTim=@id
go
create proc GetTim
@id int
as
select * from Tim
where IDTim=@id
go
alter proc GetIzvjestajZaKlijenta
@KlijentID int,
@DatumPocetak date,
@DatumKraj date
as
 select distinct * from SatiProjekt
 inner join Projekt on Projekt.IDProjekt = SatiProjekt.ProjektID
 inner join Klijent on Projekt.KlijentID = Klijent.IDKlijent
 where IDKlijent=@KlijentID and Datum between @DatumPocetak and @DatumKraj
 go
alter proc GetIzvjestajPoTimu
@timID int,
@DatumPocetak date,
@DatumKraj date
as
 select * from SatiProjekt
 inner join Djelatnik on IDDjelatnik = SatiProjekt.DjelatnikID
 inner join Tim on IDTim = Djelatnik.TimID
 where IDTim=@timID and Datum between @DatumPocetak and @DatumKraj
go
create proc InsertKlijent
@ime nvarchar(50),
@email nvarchar(50)
as
insert into Klijent
values(@ime, @email)
go
create proc UpdateKlijent
@id int,
@ime nvarchar(50),
@email nvarchar(50)
as
update Klijent
set Ime = @ime, Email=@email
where IDKlijent=@id
go
 create proc IzbaciDjelatnikaSProjekta
 @projektID int,
 @djelatnikID int
 as
 delete from Projekt_Djelatnik
 where ProjektID = @projektID and DjelatnikID=@djelatnikID
 go
 create proc IzbaciTimSProjekta
 @projektID int,
 @timID int
 as
 delete from Projekt_Tim
 where ProjektID = @projektID and TimID=@timID
 go
create proc DjelatnikIDLogin
@username nvarchar(50),
@password nvarchar(50)
as
select DjelatnikID
from LoginDjelatnik
where LoginDjelatnik.Username=@username and LoginDjelatnik.Password=@password
go
create proc VratiIDpoUsernameu
@username nvarchar
as
select DjelatnikID
from LoginDjelatnik
where Username = @username
