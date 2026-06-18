<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateAppointmentList.aspx.cs" Inherits="Hospital_Management_System.UpdateAppointmentList" %>
<%@ Import Namespace="System.Data.SqlClient"%>
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

   string x, a, b, c, d,e;
   x = Request.Params["id"];
   a = Request.Params["first"];
   b = Request.Params["second"];
   c = Request.Params["phone"];
   d = Request.Params["email"];
   e= Request.Params["message"];


   string update = "update Appointment set  FirstName='" + a + "',LastName='" + b + "',Phone='" + c + "',Email='" + d + "',Message='"+e+"' where AppointmentId='"+x+"'" ;
   SqlCommand scom = new SqlCommand(update, sc);
   scom.ExecuteNonQuery();

   Response.Redirect("AppointmentLists.aspx");
     
     
     %>
</body>
</html>
