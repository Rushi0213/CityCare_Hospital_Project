<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateStaffList.aspx.cs" Inherits="Hospital_Management_System.UpdateStaffList1" %>
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

        string a, b, c, d, e;
        a = Request.Params["staffid"];
        b = Request.Params["name"];
        c = Request.Params["email"];
        d = Request.Params["phone"];
        e = Request.Params["address"];

        string update = "update Staff set StaffId='" + a + "',Staff_Name='" + b + "',Email='" + c + "',Phone='" + d + "',Address='" + e + "' where StaffId='"+a+"'" ;
        SqlCommand scom = new SqlCommand(update, sc);
        scom.ExecuteNonQuery();

        Response.Redirect("StaffList.aspx");



    %>
</body>
</html>
