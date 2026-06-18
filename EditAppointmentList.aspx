<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAppointmentList.aspx.cs" Inherits="Hospital_Management_System.EditAppointmentList" %>
<%@ Import Namespace="System.Data.SqlClient"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <style>
     body {
         font-family: Arial;
         background: #ecf0f1;
         display: flex;
         justify-content: center;
         align-items: center;
         height: 100vh;
     }

     .form-box {
         background: #fff;
         padding: 25px;
         width: 350px;
         border-radius: 10px;
         box-shadow: 0 4px 10px rgba(0,0,0,0.2);
     }

     h2 {
         text-align: center;
         margin-bottom: 15px;
         color: #2c3e50;
     }

     input, textarea {
         width: 100%;
         padding: 10px;
         margin: 8px 0;
         border-radius: 5px;
         border: 1px solid #ccc;
         font-size: 14px;
     }

     textarea {
         resize: none;
         height: 80px;
     }

     button {
         width: 100%;
         padding: 12px;
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
   string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

   SqlConnection sc = new SqlConnection(path);
   sc.Open();

   string id = Request.Params["a"];

   string select="select * from Appointment where AppointmentId='"+id+"'";
   SqlCommand scom = new SqlCommand(select, sc);
   SqlDataReader sr = scom.ExecuteReader();

   sr.Read();

%>
   <div class="form-box">
    <h2>Appointment Form</h2>

    <form  action="UpdateAppointmentList.aspx" method="post">

        
         <input type="text" name="id" value="<%=sr["AppointmentID"] %>"   placeholder="appointment Id" >

        <input type="text" name="first" value="<%=sr["FirstName"] %>"  placeholder="First Name" required>

        <input type="text" name="second" value="<%=sr["LastName"] %>"  placeholder="Last Name" required>

        <input type="tel" name="phone" value="<%=sr["Phone"] %>"  placeholder="Phone Number" required>

        <input type="email" name="email" value="<%=sr["Email"] %>"  placeholder="Email ID" required>

        <textarea type="text" name="message"   placeholder=" Enter Message" required> <%=sr["Message"] %></textarea>

        

        <button type="submit">Update</button>

    </form>
</div>
</body>
</html>
