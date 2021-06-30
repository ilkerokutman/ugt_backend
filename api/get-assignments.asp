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

Dim isPool : isPool = ob("isPool")
if isPool <> 1 Then isPool = 0
Dim sqll : sqll = "EXEC [spGetAssignments] @accessToken='" & accessToken & "', @isPool='" & isPool & "' "

if Not IsNull(ob("id")) And Not IsEmpty(ob("id")) And Len(ob("id"))>0 Then
    sqll = sqll & ", @id='" & cleanGuid(ob("id")) & "' "
End if

if Not IsNull(ob("lecturerId")) And Not IsEmpty(ob("lecturerId")) And Len(ob("lecturerId"))>0 Then
    sqll = sqll & ", @lecturerId='" & cleanGuid(ob("lecturerId")) & "' "
End if

if Not IsNull(ob("studentId")) And Not IsEmpty(ob("studentId")) And Len(ob("studentId"))>0 Then
    sqll = sqll & ", @studentId='" & cleanGuid(ob("studentId")) & "' "
End if



data.add "data", ba.Execute(sqll)    





data.add "success", jSuccess
data.add "statusCode", jStatus
data.add "processTime", dbDateTime(Now())
data.add "message", Replace(jMessage, """", "\""")
Response.Write((new JSON).toJSON(empty, data, false))
%>
<!--#include file = "../common/_sqlk.asp"-->