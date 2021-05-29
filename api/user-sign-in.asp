<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit
Response.Buffer = True
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 2
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "No-Store"
Session.LCID = 1055
Response.ContentType = "application/json"
Response.Charset = "utf-8"
%>
<!--#include file = "../common/_sqla.asp"-->
<!--#include file = "../common/_func.asp"-->
<!--#include file = "../common/_JSON.asp"-->
<!--#include file = "../common/_vbsJson.asp"-->
<!--#include file = "../common/_classes.asp"-->
<%
Dim lngBytesCount
Dim jsonString
Dim ob
Dim j2
Dim rs
Dim data

If Request.TotalBytes > 0 Then
    lngBytesCount = Request.TotalBytes
    jsonString = BytesToStr(Request.BinaryRead(lngBytesCount))
    Set j2 = new VbsJson
    Set ob = j2.Decode(jsonString)
End if

Set data = Server.CreateObject("Scripting.Dictionary")
Dim jStatus : jStatus = 200
Dim jSuccess : jSuccess = True
Dim jMessage : jMessage = ""
Dim Results
Set Results = Server.CreateObject("Scripting.Dictionary")

if IsEmpty(ob("email")) Or IsEmpty(ob("password")) Or Len(ob("email")) < 1 Or Len(ob("password")) < 1 Then
    jSuccess =  false
    jMessage = "Lütfen tüm alanları doldurunuz"
    jStatus = 201
Else 
    On Error resume Next
    Dim sqll : sqll = "EXEC [spSignin] @username='" & ob("email") & "', @password='" & ob("password") & "'"
    Set rs = ba.Execute(sqll)
        if Not rs.eof Then
            if rs("success") = True Then
                Results.add "validUntil", rs("validUntil").value
                Results.add "accessToken", rs("accessToken").value
                Results.add "message", rs("message").value
                Results.add "userId", cleanGuid(rs("userId").value)
                Results.add "profileId", cleanGuid(rs("profileId").value)
                Results.add "fullName", rs("firstName").value & " " & rs("lastName").value
                
                Results.add "role", rs("role").value
                if role = "STU" Then
                    Results.add "profile", ba.Execute("SELECT TOP 1 * FROM [StudentDetails] WHERE id='" & cleanGuid(rs("profileId").value) & "' ")
                Elseif role = "ADM" Or role = "LEC" Then
                    Results.add "profile", ba.Execute("SELECT TOP 1 * FROM [LecturerDetails] WHERE id='" & cleanGuid(rs("profileId").value) & "' ")
                End if
            Else 
                jSuccess =  false
                jMessage = rs("message").value
                jStatus = 203
            End if
        Else
            jSuccess =  false
            jMessage =  "Hatalı şifre veya Eposta adresi" 
            jStatus = 202
        End if
    Set rs = Nothing

End if



data.add "data", Results
data.add "success", jSuccess
data.add "statusCode", jStatus
data.add "processTime", dbDateTime(Now())
data.add "message", Replace(jMessage, """", "\""")
Response.Write((new JSON).toJSON(empty, data, false))
%>
<!--#include file = "../common/_sqlk.asp"-->