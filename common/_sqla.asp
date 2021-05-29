<%
Dim ba, baServer, baDB, baUser, baPass
baServer = "vts1.vdrsoft.com,1500"
baDB = "ULUDAG_ASSIGNMENT"
baUser = "uludagdb"
baPass = "b3wnbDf6CjnxvHS"
Set ba = Server.Createobject("Adodb.Connection")
ba.Open "Provider=SQLNCLI11;Server=" & baServer & ";Database=" & baDB & ";Uid=" & baUser & ";Pwd=" & baPass & ";"
%>
