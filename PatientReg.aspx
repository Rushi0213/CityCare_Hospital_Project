<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientReg.aspx.cs" Inherits="Hospital_Management_System.PatientReg" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Registration</title>

    <style>
        body {
            font-family: Arial;
            margin: 0;
            padding: 0;

            /* 🔷 Background Image */
            background: url('https://images.unsplash.com/photo-1586773860418-d37222d8fce3') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            width: 400px;
            background: rgba(255, 255, 255, 0.9); /* transparent white */
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background: #2980b9;
        }
    </style>
</head>

<body>

<div class="form-container">
    <h2>Patient Registration</h2>

    <form action="PatientDatabase.aspx" method="post">
       
         <label>Patient Id:</label>
       <input type="text" name="id" placeholder="Enter Patient Id" readonly >

        <label>Patient Name:</label>
        <input type="text" name="name" placeholder="Enter Patient Name" required>

        <label>Patient Email:</label>
       <input type="text" name="email" placeholder="Enter Patient Email " required>

        <label>Patient Age</label>
        <input type="number" name="age" placeholder="Enter Age" required>

        <select required name="gender">
            <option value="">Select Gender</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
        </select>

      
                <div class="form-group">
         <label >Select Doctor</label>
     <select  name="doctor">
        

         <%
             string path = "Data Source=hp\\SQLEXPRESS; Initial Catalog=Hospital;Integrated Security=true";

             SqlConnection sc = new SqlConnection(path);
             sc.Open();

             SqlCommand featch = new SqlCommand("Select Staff_Name from Staff where Role= 'Doctor'", sc);

             SqlDataReader sr = featch.ExecuteReader();

             while(sr.Read())
            {%>

         <option ><%=sr["Staff_Name"] %></option>

           <% }

           %>


    
      
       
    </select>
    <div class="error"></div>

          <div class="input-box">
<label>Password</label>
<input type="password" name="ppass" placeholder="Enter Password" required>
</div>


</div>

         

        <input type="submit" value="Register" class="btn">

    </form>
    <center>
    <p  style="font-size:14px; " >
    Already have an account?
    <a href="PatientLogin.aspx" style="color: blue; font-weight: bold; text-decoration: none;">
        Login
    </a>
</p>
    </center>

</div>

</body>
</html>