<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffDatabase.aspx.cs" Inherits="Hospital_Management_System.StaffDatabase" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

   <%
       string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

       SqlConnection sc = new SqlConnection(path);
       sc.Open();



       string a, b, c, d, e,f;

       a = Request.Params["id"];
       b = Request.Params["name"];
       c = Request.Params["email"];
       d = Request.Params["phone"];
       e = Request.Params["address"];
       f = Request.Params["role"];



       string insert = "insert into  Staff values('" + a + "','" + b + "','" + c + "','" + d + "','" + e + "','"+f+"')";



       SqlCommand scom = new SqlCommand(insert, sc);
       scom.ExecuteNonQuery();

       Response.Redirect("Admindashbord.aspx");




    %>

</body>

</html>
