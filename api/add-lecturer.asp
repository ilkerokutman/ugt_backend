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


Dim accessToken : accessToken = Replace(Request.ServerVariables("HTTP_Authorization"), "Bearer ", "")


Set data = Server.CreateObject("Scripting.Dictionary")
Dim jStatus : jStatus = 200
Dim jSuccess : jSuccess = True
Dim jMessage : jMessage = ""
Dim Results
Set Results = Server.CreateObject("Scripting.Dictionary")

if IsEmpty(ob("userId")) Then
    jSuccess = false
    jMessage = "Lütfen tüm alanları doldurunuz"
    jStatus =  201
Else
    Dim sqll : sqll = "EXEC [spAddLecturer] @accessToken='" & accessToken & "', @userId='" & ob("userId") & "', @title='" & ob("title") & "', @faculty='" & ob("faculty") & "', @department='" & ob("department") & "', @program='" & ob("program") & "' "
    Set rs = ba.Execute(sqll)
        if Not rs.eof Then
            if rs("success") = True Then
                Results.add "id", Replace(Replace(rs("data").value, "{", ""), "}", "")
            Else 
                jSuccess = false
                jMessage = "Kayıt başarısız"
                jStatus =  203
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
Response.Write((new JSON).toJSON(empty, data, false))
%>
<!--#include file = "../common/_sqlk.asp"-->