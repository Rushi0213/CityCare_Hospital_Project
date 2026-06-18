<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientLogout.aspx.cs" Inherits="Hospital_Management_System.PatientLogout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <%

      Session["patient"] = null;

      Response.Redirect("PatientLogin.aspx");


   %>
</body>
</html>
