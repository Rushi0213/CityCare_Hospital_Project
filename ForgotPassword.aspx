<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Hospital_Management_System.ForgotPassword" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Background */
body {
    height: 100vh;
/*    background: url('https://images.unsplash.com/photo-1586773860418-d37222d8fce3') no-repeat center center/cover;*/
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Form Container */
form {
    background: rgba(255, 255, 255, 0.9);
    padding: 30px;
    width: 350px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.3);
}

/* Heading */
form h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
}

/* Labels */
label {
    font-weight: bold;
    font-size: 14px;
}

/* Input Fields */
input {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Button */
button {
    width: 100%;
    padding: 10px;
    background: #3498db;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #2980b9;
}
</style>

</head>
<body>

   <%
       string mail = Request.Params["email"];

       if(mail != null)
       {
           string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

           SqlConnection sc = new SqlConnection(path);
           sc.Open();

           string query = "SELECT * FROM AdminLogin WHERE Email='"+mail+"'";
           SqlCommand cmd = new SqlCommand(query, sc);

           SqlDataReader sr = cmd.ExecuteReader();
           // cmd.Parameters.AddWithValue("@mail", mail);

           // int count = (int)cmd.ExecuteScalar();

           //if(count > 0)
           if(sr.Read())
           {
              Response.Redirect("UpdatePassword.aspx?email=" + mail);
           }
                else
           {
               Response.Write("<script>alert('Email not found');</script>");
           }

           sc.Close();
       }
              %>


  <form method="post" action="ForgotPassword.aspx">
    <h2>Find By Email</h2>

    
    <label> Enter Email</label><br>
    <input type="email" name="email" placeholder="Enter Email" required><br><br>


    <button type="submit">Search</button>
   </form>


     
</body>
</html>
