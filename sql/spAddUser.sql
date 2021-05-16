
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ilker
-- Create date: 2021-05-17
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE spAddUser
	@email nvarchar(max),
	@role nvarchar(10),
	@firstname nvarchar(max),
	@lastname nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM [Users] WHERE [email]=@email)
	BEGIN
		SELECT CAST(0 AS bit) AS success, CAST(1 as bit) AS error, 'Eposta zaten kayıtlı' AS [message]
	END
	ELSE
	BEGIN 
		DECLARE @roleEnum uniqueIdentifier = ISNULL((SELECT TOP 1 ur.id FROM [UserRoles] ur WHERE ur.enumCode = @role),(SELECT TOP 1 ur.id FROM [UserRoles] ur WHERE ur.enumCode = 'GUE'))
		DECLARE @passwordKey VARCHAR(255) = left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)

		INSERT INTO [Users] (firstName, lastName, email, [password], [role], passwordKey)
		VALUES (@firstname, @lastname, @email, 'changeThis', @roleEnum, @passwordKey)

		DECLARE @id uniqueIdentifier =( SELECT TOP 1 id FROM [Users] WHERE email=@email ORDER BY createdOn DESC)
		SELECT CAST(1 AS bit) AS success, @id AS [data], 'Kayıt oluşturuldu' AS [message]
		
	END
END
GO
