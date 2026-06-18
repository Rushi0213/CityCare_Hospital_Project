<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePatientList.aspx.cs" Inherits="Hospital_Management_System.UpdatePatientList" %>
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

      string x, a, b, c,e,f ,d;
      x = Request.Params["id"];
      a = Request.Params["name"];
      e = Request.Params["email"];
      b = Request.Params["age"];
      c = Request.Params["gender"];
      d = Request.Params["doctor"];
       f = Request.Params["password"];

     

      string update = "update Patient set  Name='" + a + "',Age='" + b + "',Gender='" + c + "',Doctor='" + d + "',Password='"+f+"',Email='"+e+"' where PatientId='"+x+"'" ;
      SqlCommand scom = new SqlCommand(update, sc);
      scom.ExecuteNonQuery();

      Response.Redirect("PatientList.aspx");
        
        
        %>
</body>
</html>
