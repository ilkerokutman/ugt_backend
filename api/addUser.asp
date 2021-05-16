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

if IsEmpty(ob("email")) Or IsEmpty(ob("role")) Or IsEmpty(ob("firstName")) Or IsEmpty(ob("lastName")) Then
    Results.add "success", false
    Results.add "error", true
    Results.add "message", "Lütfen tüm alanları doldurunuz"
    Results.add "statusCode", 201
Else
    Dim sqll : sqll = "EXEC [spAddUser] @firstName='" & ob("firstName") & "', @lastName='" & ob("lastName") & "', @email='" & ob("email") & "', @role='" & ob("role") & "' "
    Set rs = ba.Execute(sqll)
        if Not rs.eof Then
            if rs("success") = True Then
                Results.add "success", true
                if (ob("role") = "STD" Then
                    Results.add "user", ba.Execute("SELECT TOP 1 * FROM [vStudent] WHERE userId='" & rs("userId") & "' ")
                Else
                    Results.add "user", ba.Execute("SELECT TOP 1 * FROM [vLecturers] WHERE userId='" & rs("userId") & "' ")
                End if
            Else 

            End if
        Else

        End if
    Set rs = Nothing
End if



data.add "data", Results
data.add "success", jSuccess
data.add "statusCode", jStatus
data.add "processTime", dbDateTime(Now())
data.add "message", Replace(jMessage, """", "\""")
Response.Write((new JSON).toJSON("responseData", data, false))
%>
<!--#include file = "../common/_sqlk.asp"-->