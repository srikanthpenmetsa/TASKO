/****** Script for SelectTopNRows command from SSMS  ******/
    
-------- Services TestData --------------
insert into [Tasko].[dbo].[Services] values(NEWID(),'Electrician',null)
insert into [Tasko].[dbo].[Services] values(NEWID(),'Plumber',null)
insert into [Tasko].[dbo].[Services] values(NEWID(),'Carpenter',null)
--- Sub services of Electrician Service
insert into [Tasko].[dbo].[Services] values(NEWID(),'AC',(select Service_Id from [Tasko].[dbo].[Services] where Name ='Electrician'))
insert into [Tasko].[dbo].[Services] values(NEWID(),'FAN and Cooler',(select Service_Id from [Tasko].[dbo].[Services] where Name ='Electrician'))
insert into [Tasko].[dbo].[Services] values(NEWID(),'Tube Lights',(select Service_Id from [Tasko].[dbo].[Services] where Name ='Electrician'))  
select * from [Tasko].[dbo].[Services]
  
------------ ID Proof TestData -----------
insert into [Tasko].[dbo].[IdProofs] values(NEWID(),'PAN Card')
insert into [Tasko].[dbo].[IdProofs] values(NEWID(),'Passport')
insert into [Tasko].[dbo].[IdProofs] values(NEWID(),'Aadhar Card')
insert into [Tasko].[dbo].[IdProofs] values(NEWID(),'Voter Id')
select * from [Tasko].[dbo].[IdProofs]

----- Order Status TestData-----
insert into [Tasko].[dbo].[OrderStatus] values(newid(), 'Requested')
insert into [Tasko].[dbo].[OrderStatus] values(newid(), 'Pending')
insert into [Tasko].[dbo].[OrderStatus] values(newid(), 'Accepted')
insert into [Tasko].[dbo].[OrderStatus] values(newid(), 'Confirmed')
insert into [Tasko].[dbo].[OrderStatus] values(newid(), 'Cancelled')
insert into [Tasko].[dbo].[OrderStatus] values(newid(), 'Completed')
select * from [Tasko].[dbo].[OrderStatus]

  
