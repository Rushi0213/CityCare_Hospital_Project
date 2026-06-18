<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeletePatient.aspx.cs" Inherits="Hospital_Management_System.DeletePatient" %>
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

      string delete = " delete from Patient where PatientId='"+id+"'";
      SqlCommand scom = new SqlCommand(delete, sc);
      scom.ExecuteNonQuery();

      Response.Redirect("PatientList.aspx");


   %>
</body>
</html>
