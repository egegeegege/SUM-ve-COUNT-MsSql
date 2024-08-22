USE HastaneDB

SELECT * FROM Poliklinikler
SELECT * FROM Doktorlar

SELECT * FROM Poliklinikler
WHERE ID in( SELECT Poliklinik_ID FROM Doktorlar WHERE Adi ='Orhan' and Soyadi ='��nar')

select * from Randevular
select * from Doktorlar

--Orhan ��nara ait aktif randevu say�s�n� bulunuz
select COUNT(ID) as 'Orhan ��nara ait aktif randevu say�s�' from Randevular
where Doktor_ID in(select ID from Doktorlar where Adi = 'Orhan' and Soyadi = '��nar') and Randevu_Durumu = 'Aktif'

-- Hatanedeki Toplam Personel Say�s�n� Bulumuz
select sum(Personel_Sayisi) as 'Personel Say�s�' from Bolumler

--Fatih eraslana ait sonucu ��km�� tahlil say�s�n� bulunuz
select COUNT(ID) as '��kan Tahlil Say�s�' from Tahliller
where Doktor_ID in(select ID from Doktorlar where Adi = 'Fatih' and Soyadi = 'Eraslan') and Tahlil_Sonuc = '��kt�'

--ssk'l� hasta say�s�n� bulunuz
select COUNT(ID) as 'SSK l� hasta Say�s�' from Hastalar where Sigorta_Turu = 'SSK'

--Ad� A ile ba�layan ssk'l� hasta say�s�n� bulunuz
select COUNT(ID)as'Ad� A ile Ba�layan SSK l� hasta say�s�' from Hastalar where Adi like 'A%' and Sigorta_Turu = 'SSK'
select * from Hastalar

-- TC numaras� 5 ile ba�layan hastalar� bulunuz
select COUNT(ID)as'TC si 5 ile Ba�layan SSK l� hasta say�s�' from Hastalar where TC like '5%' and Sigorta_Turu = 'SSK'
select * from Hastalar

use Northwind
	-- Davolio Nancy adl� �al��an�n Almanyada teslim etti�i sipari�ler
	select COUNT(EmployeeID) from Orders
    where EmployeeID in(select EmployeeID from Employees where LastName = 'Davolio' and FirstName = 'Nancy') and ShipCountry ='Germany'

	-- Chai adl� �r�n�n  miktarı 30 dan az verilen siperişleri sıralar
	select * from [Order Details]
	where ProductID in (select ProductID from Products where ProductName = 'Chai') and Quantity < 30

use Northwind

select CategoryID,CategoryName, Description from Categories
where CategoryID in (select CategoryID from Products where ProductName = 'Teatime Chocolate Biscuits')

-- New Orleans Cajun Delights adlı şirketin kaç farklı ürün tedarik attiğinin sayısın bulunuz

select COUNT(ProductID) as 'tedarik edilen ürün sayısı' from Products
where SupplierID in( select SupplierID from Suppliers where CompanyName = 'New Orleans Cajun Delights')
