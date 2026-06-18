<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Hospital_Management_System.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <%

       Session["Admin"] = null;

       Response.Redirect("AdminLogin.aspx");


    %>
</body>
</html>
