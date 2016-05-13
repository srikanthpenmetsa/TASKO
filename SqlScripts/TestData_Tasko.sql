/****** Script for SelectTopNRows command from SSMS  ******/
    
select * from [Tasko].[dbo].[Services]
select * from [Tasko].[dbo].[IdProofs]
select * from [Tasko].[dbo].OrderStatus

------------ Vendor TestData -----------
--  VendorId Should be binary not int,
--  Name and Number should be unique, 
--  mobile number should not be varchar(max) change it to nVarchar(10)
  
--insert into [Tasko].[dbo].[Vendor] values(NEWID(),'chandra',10,'9985466195','KPHB,VivekanandaNagar',null,10,50.00,1,1,Getdate(),Getdate(),10.00,123)
--insert into [Tasko].[dbo].[Vendor] values(NEWID(),'Srikanth',20,'1234567890','KPHB,HMT Hills',null,10,100.00,1,1,Getdate(),Getdate(),10.00,123)
select * from [Tasko].[dbo].[Vendor]

--Insert into [Tasko].[dbo].VendorServices values(newId(),(select Vendor_Id from [Tasko].[dbo].Vendor where name='chandra'),(select Service_Id from [Tasko].[dbo].[Services] where Name='Electrician'),1)
--INsert into [Tasko].[dbo].VendorServices values(newId(),(select Vendor_Id from [Tasko].[dbo].Vendor where name='Srikanth'),(select Service_Id from [Tasko].[dbo].[Services] where Name='Plumber'),1)
--INsert into [Tasko].[dbo].VendorServices values(newId(),(select Vendor_Id from [Tasko].[dbo].Vendor where name='chandra'),(select Service_Id from [Tasko].[dbo].[Services] where Name='Tube Lights'),1)
select * from [Tasko].[dbo].VendorServices

--insert into [Tasko].[dbo].customer values(newid(),'Shivaji','shivaji@gmail.com','1234567890')
--insert into [Tasko].[dbo].customer values(newid(),'Shivaji123','shivaji123@gmail.com','9999999999')
--insert into [Tasko].[dbo].customer values(newid(),'Shivaji456','shivaji456@gmail.com','9876543210')
select * from [Tasko].[dbo].Customer

--insert into [Tasko].[dbo].[order] values(newid(),(select VendorServices_Id from [Tasko].[dbo].VendorServices where VendorId in (select Vendor_Id from [Tasko].[dbo].Vendor where name='chandra') and ServiceId in (select Service_Id from [Tasko].[dbo].[Services] where Name='Tube Lights')) ,(select Customer_Id from [Tasko].[dbo].Customer where name='Shivaji'),Getdate(),(select OrderStatus_Id from [Tasko].[dbo].OrderStatus where name='Requested'),'kphb')
--insert into [Tasko].[dbo].[order] values(newid(),(select VendorServices_Id from [Tasko].[dbo].VendorServices where VendorId in (select Vendor_Id from [Tasko].[dbo].Vendor where name='Srikanth') and ServiceId in (select Service_Id from [Tasko].[dbo].[Services] where Name='Plumber')) ,(select Customer_Id from [Tasko].[dbo].Customer where name='Shivaji123'),Getdate(),(select OrderStatus_Id from [Tasko].[dbo].OrderStatus where name='Requested'),'kphb')
select * from [Tasko].[dbo].[Order]

--insert into [Tasko].[dbo].VendorRating values((select Vendor_Id from [Tasko].[dbo].Vendor where name='chandra'),
--2,2,3,1,
--getdate(),
--'Service is good', (
--select Order_Id from [Tasko].[dbo].[Order] 
--where vendorServiceId in(select VendorServices_Id from [Tasko].[dbo].VendorServices
--where VendorId in (select Vendor_Id from [Tasko].[dbo].Vendor where name='chandra') 
--and ServiceId in (select Service_Id from [Tasko].[dbo].[Services] where Name='Tube Lights'))))

--insert into [Tasko].[dbo].VendorRating values((select Vendor_Id from [Tasko].[dbo].Vendor where name='Srikanth'),
--1,1,1,1,
--getdate(),
--'Service is not provided in time', (
--select Order_Id from [Tasko].[dbo].[Order] 
--where vendorServiceId in(select VendorServices_Id from [Tasko].[dbo].VendorServices
--where VendorId in (select Vendor_Id from [Tasko].[dbo].Vendor where name='Srikanth') 
--and ServiceId in (select Service_Id from [Tasko].[dbo].[Services] where Name='Plumber'))))
select * from [Tasko].[dbo].VendorRating

--Insert into [Tasko].[dbo].CustomerRating values((select CustomerId from [Tasko].[dbo].[order] where CustomerId in (select Customer_Id from [Tasko].[dbo].Customer where name='Shivaji')),(select Order_Id from [Tasko].[dbo].[order] where CustomerId in(select Customer_Id from [Tasko].[dbo].Customer where name='Shivaji')),4,'Good Customer')
select * from [Tasko].[dbo].CustomerRating
