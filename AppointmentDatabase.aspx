<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppointmentDatabase.aspx.cs" Inherits="Hospital_Management_System.ppointmentDatabase" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <%

        string a, b, c, d,e;
        //f = Request.Params["id"];

        a = Request.Params["first"];
        b = Request.Params["second"];
        c = Request.Params["phone"];
        d = Request.Params["email"];
        e = Request.Params["message"];


        string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

        SqlConnection sc = new SqlConnection(path);
        sc.Open();

        string insert = "insert into Appointment values('" + a + "','" + b + "','" + c + "','" + d + "','"+e+"')";
        SqlCommand scom = new SqlCommand(insert, sc);
        scom.ExecuteNonQuery();
   
   
          Response.Redirect("Admindashbord.aspx");
      %>
</body>
</html>
