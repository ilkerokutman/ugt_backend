
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ilker
-- Create date: 2021-04-12
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE spSignin
	@username nvarchar(max),
	@password nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM [Users] WHERE [email]=@username AND [password]=@password)
	BEGIN
		DECLARE @userId uniqueIdentifier = ISNULL((SELECT TOP 1 u.id FROM [Users] u INNER JOIN [UserRoles] ur ON u.[role]=ur.id WHERE  u.[email]=@username AND u.[password]=@password),NEWID())
		DECLARE @roleEnum nvarchar(3) = ISNULL((SELECT TOP 1 ur.[enumCode] FROM [Users] u INNER JOIN [UserRoles] ur ON u.[role]=ur.id WHERE  u.[email]=@username AND u.[password]=@password),'GUE')
		
		DECLARE @accessToken VARCHAR(255) = left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)+left(NEWID(),5)
		UPDATE [UserTokens] SET [isValid]=0 WHERE [userId]=@userId
		
		INSERT INTO [UserTokens] ([userId], [accessToken], isValid, validUntil) VALUES (@userId, @accessToken, 1, DATEADD(Day, 1, GETDATE()))

		IF @roleEnum = 'LEC' OR @roleEnum = 'ADM' 
		BEGIN
			SELECT TOP 1
				CAST(1 AS BIT) AS success,
				CONVERT(VARCHAR, ut.validUntil, 126) AS validUntil,
				@accessToken AS accessToken,
				'Giris Basarili' AS [message],
				ld.id AS profileId,
				@roleEnum AS 'role',
				@userId AS userId
				FROM [UserTokens] ut
				INNER JOIN [Users] u ON ut.userId=u.id
				INNER JOIN [LecturerDetails] ld ON u.id=ld.userId
				WHERE ut.isValid = 1 AND ut.accessToken=@accessToken AND DATEDIFF(MINUTE, GETDATE(), ut.validUntil) > 0
				AND ld.status > 0 AND u.[status] > 0
				ORDER BY ut.createdOn DESC
		END
		ELSE IF @roleEnum = 'STU'
		BEGIN
			SELECT TOP 1
				CAST(1 AS BIT) AS success,
				CONVERT(VARCHAR, ut.validUntil, 126) AS validUntil,
				@accessToken AS accessToken,
				'Giris Basarili' AS [message],
				sd.id AS profileId,
				@roleEnum AS 'role',
				@userId AS userId
				FROM [UserTokens] ut
				INNER JOIN [Users] u ON ut.userId=u.id
				INNER JOIN [StudentDetails] sd ON u.id=sd.userId
				WHERE ut.isValid = 1 AND ut.accessToken=@accessToken AND DATEDIFF(MINUTE, GETDATE(), ut.validUntil) > 0
				AND sd.status > 0 AND u.[status] > 0
				ORDER BY ut.createdOn DESC
		END
		ELSE 
		BEGIN 
			SELECT CAST(0 AS bit) AS success, CAST(1 AS bit) AS error, 'Yetkisiz kullanici' AS [message]
		END


	END
	ELSE
	BEGIN
		SELECT CAST(0 AS bit) AS success, CAST(1 AS bit) AS error, 'Hatali kullanici adi ve/veya sifre' AS [message]
	END
END
GO
