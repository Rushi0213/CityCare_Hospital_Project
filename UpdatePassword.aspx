<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="Hospital_Management_System.UpdatePassword" %>
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
    background: url('https://images.unsplash.com/photo-1588776814546-ec7e6b16b2b6') no-repeat center center/cover;
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
form::before {
    content: "Update Password";
    display: block;
    text-align: center;
    font-size: 22px;
    margin-bottom: 20px;
    color: #2c3e50;
    font-weight: bold;
}

/* Input Box */
.input-box {
    margin-bottom: 15px;
}

.input-box label {
    font-weight: bold;
    font-size: 14px;
}

.input-box input {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Button */
.btn {
    width: 100%;
    padding: 10px;
    background: #3498db;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    background: #2980b9;
}

/* Message */
.msg {
    text-align: center;
    margin-top: 10px;
    color: red;
    font-size: 14px;
}
</style>
</head>
<body>
   
    <form method="post">
    
      <!--  <div class="input-box">
        <label>Email ID</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>
    </div> 
        -->

     <div class="input-box">
            <label>New Password</label>
            <input type="password" id="newpass" name="newpass" placeholder="Enter New Password" required>
        </div>

        <div class="input-box">
            <label>Confirm Password</label>
            <input type="password" id="confirmpass" name="confirmpass" placeholder="Confirm Password" required>
        </div>

        <button type="submit" class="btn">Update Password</button>

        <div id="msg" class="msg"></div>



    </form>

   <%
       string mail = Request.Params["email"];

       string newpass = Request.Params["newpass"];

       string confirmpass = Request.Params["confirmpass"];

       if(newpass != null && confirmpass != null)
       {
           if(newpass == confirmpass)
           {
               string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

               SqlConnection sc = new SqlConnection(path);
               sc.Open();

               string update = "UPDATE AdminLogin SET Password='"+newpass+"' WHERE Email='"+mail+"'";
               SqlCommand cmd = new SqlCommand(update, sc);


               //cmd.Parameters.AddWithValue("@pass", newpass);
               //cmd.Parameters.AddWithValue("@mail", email);

               cmd.ExecuteNonQuery();

               sc.Close();

               Response.Write("<script>alert('Password Updated Successfully'); window.location='AdminLogin.aspx';</script>");
           }
           else
           {
               Response.Write("<script>alert('Password Not Match');</script>");
           }
       }
       else
       {
          Response.Write("<script>alert('Enter new password');</script>");
       }
%>


</body>
</html>
