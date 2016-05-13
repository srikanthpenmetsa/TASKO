---------------------------------------------------------------------------------------------------------- 
--------------------------- All Copy Rights are reserved to Tasko.in-------------------------------------- 
USE [Tasko] 
GO 
---------------------------------------------------------------------------------------------------------- 
    
-------- Services TestData --------------
INSERT INTO [dbo].[Services] values(NEWID(),'Electrician',null)
INSERT INTO [dbo].[Services] values(NEWID(),'Plumber',null)
INSERT INTO [dbo].[Services] values(NEWID(),'Carpenter',null)
--- Sub services of Electrician Service
INSERT INTO [dbo].[Services] values(NEWID(),'AC',(SELECT SERVICE_ID FROM [dbo].[Services] WHERE NAME ='Electrician'))
INSERT INTO [dbo].[Services] values(NEWID(),'FAN and Cooler',(SELECT SERVICE_ID FROM [dbo].[Services] WHERE NAME ='Electrician'))
INSERT INTO [dbo].[Services] values(NEWID(),'Tube Lights',(SELECT SERVICE_ID FROM [dbo].[Services] WHERE NAME ='Electrician'))  
SELECT * FROM [dbo].[Services]
  
------------ ID Proof TestData -----------
INSERT INTO [dbo].[ID_PROOFS] values(NEWID(),'PAN Card')
INSERT INTO [dbo].[ID_PROOFS] values(NEWID(),'Passport')
INSERT INTO [dbo].[ID_PROOFS] values(NEWID(),'Aadhar Card')
INSERT INTO [dbo].[ID_PROOFS] values(NEWID(),'Voter Id')
SELECT * FROM [dbo].[ID_PROOFS]

----- Order Status TestData-----
INSERT INTO [dbo].[ORDER_STATUS] values(newid(), 'Requested')
INSERT INTO [dbo].[ORDER_STATUS] values(newid(), 'Pending')
INSERT INTO [dbo].[ORDER_STATUS] values(newid(), 'Accepted')
INSERT INTO [dbo].[ORDER_STATUS] values(newid(), 'Confirmed')
INSERT INTO [dbo].[ORDER_STATUS] values(newid(), 'Cancelled')
INSERT INTO [dbo].[ORDER_STATUS] values(newid(), 'Completed')
SELECT * FROM [dbo].[ORDER_STATUS]

  
