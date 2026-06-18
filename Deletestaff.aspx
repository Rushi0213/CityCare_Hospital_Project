<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deletestaff.aspx.cs" Inherits="Hospital_Management_System.Deletestaff" %>
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

         string id = Request.Params["b"];

         string delete = " delete from Staff where StaffId='"+id+"'";
         SqlCommand scom = new SqlCommand(delete, sc);
         scom.ExecuteNonQuery();

         Response.Redirect("StaffList.aspx");


      %>
</body>
</html>
