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


Dim sqll
    sqll = "EXEC [spGetAssignmentsAndDetails] @accessToken='" & accessToken & "' "
if Not IsEmpty(ob("id")) Or Len(ob("id")) > 0 Then sqll = sqll & " , @id='" & cleanGuid(ob("id")) &  "' " 
if Not IsEmpty(ob("studentId")) Or Len(ob("studentId")) > 0 Then sqll = sqll & " , @studentId='" & cleanGuid(ob("studentId")) &  "' " 
if Not IsEmpty(ob("lectureId")) Or Len(ob("lectureId")) > 0 Then sqll = sqll & " , @lectureId='" & cleanGuid(ob("lectureId")) &  "' " 
if Not IsEmpty(ob("lecturerId")) Or Len(ob("lecturerId")) > 0 Then sqll = sqll & " , @lecturerId='" & cleanGuid(ob("lecturerId")) &  "' " 
if Not IsEmpty(ob("statusId")) Or Len(ob("statusId")) > 0 Then sqll = sqll & " , @statusId='" & (ob("statusId")) &  "' " 
if Not IsEmpty(ob("isPool")) Or Len(ob("isPool")) > 0 Then sqll = sqll & " , @isPool='" & (ob("isPool")) &  "' " 


data.add "data", ba.Execute(sqll)    





data.add "success", jSuccess
data.add "statusCode", jStatus
data.add "processTime", dbDateTime(Now())
data.add "message", Replace(jMessage, """", "\""")
Response.Write((new JSON).toJSON(empty, data, false))
%>
<!--#include file = "../common/_sqlk.asp"-->