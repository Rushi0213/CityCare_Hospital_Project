<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminloginDatabase.aspx.cs" Inherits="Hospital_Management_System.Login" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <%
       string username = Request.Params["admin"];
       string password = Request.Params["pass"];

       string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

       SqlConnection sc = new SqlConnection(path);
       sc.Open();

       string query ="SELECT * FROM AdminLogin WHERE AdminId='"+username+"' AND Password='"+password+"'";
       // string query = "SELECT COUNT(*) FROM AdminLogin WHERE AdminId=@id AND Password=@pass";
       SqlCommand cmd = new SqlCommand(query, sc);

       SqlDataReader sr = cmd.ExecuteReader();
       // cmd.Parameters.AddWithValue("@id", username);
       //cmd.Parameters.AddWithValue("@pass", password);

   
      // int count = (int)cmd.ExecuteScalar();

       //if(username=="AdminId" && password=="Password")
       //if(count > 0)
       if(sr.Read())
       {
           Session["admin"] = username;
           Response.Redirect("Admindashbord.aspx");
       }
       else
       {
           Response.Write("<script>alert('Invalid Login'); window.location='AdminLogin.aspx';</script>");
       }
       sr.Close();
       sc.Close();
%>
   
</body>
</html>
