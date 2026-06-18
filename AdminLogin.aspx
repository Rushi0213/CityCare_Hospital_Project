<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Hospital_Management_System.AdminLogin" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hospital Admin Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            height: 100vh;
            background: url('https://images.unsplash.com/photo-1586773860418-d37222d8fce3') no-repeat center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            width: 350px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .input-box {
            margin-bottom: 15px;
            text-align: left;
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

        .login-btn {
            width: 100%;
            padding: 10px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-btn:hover {
            background: #2980b9;
        }

        .footer-text {
            margin-top: 15px;
            font-size: 13px;
        }

        .footer-text a {
            text-decoration: none;
            color: #3498db;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Hospital Admin Login</h2>
        
        <form action="AdminloginDatabase.aspx" method="post">
            <div class="input-box">
                <label>Admin ID</label>
                <input type="text" name="admin" placeholder="Enter Admin ID" required>
            </div>

            <div class="input-box">
                <label>Password</label>
                <input type="password" name="pass" placeholder="Enter Password" required>
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>
        <br />

        <a href="ForgotPassword.aspx"> Forget Password</a>

       
    </div>
 
    
        



     

</body>
</html>