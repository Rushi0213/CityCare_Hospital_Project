<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientDatabase.aspx.cs" Inherits="Hospital_Management_System.PatientDatabase" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   
    <%


        string x, a, b, c,f, e,d;
        x= Request.Params["id"];
        a = Request.Params["name"];
        f = Request.Params["email"];
        b = Request.Params["age"];
        c = Request.Params["gender"];
        e = Request.Params["ppass"];
        d = Request.Params["doctor"];



        string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

        SqlConnection sc = new SqlConnection(path);
        sc.Open();

        string insert = "insert into Patient (Name,Email,Age,Gender,Doctor,Password)"+" values( '" + a + "','"+f+"','" + b + "','" + c + "','" + d + "','"+e+"')";
        SqlCommand scom = new SqlCommand(insert, sc);
        scom.ExecuteNonQuery();

        Response.Redirect("PatientLogin.aspx");



      %>
</body>
</html>
