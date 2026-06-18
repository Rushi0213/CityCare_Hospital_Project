<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPatientList.aspx.cs" Inherits="Hospital_Management_System.EditPatientList" %>
<%@ Import  Namespace="System.Data.SqlClient"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
      <%
      string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

      SqlConnection sc = new SqlConnection(path);
      sc.Open();

      string id = Request.Params["a"];

      string select="select * from Patient where PatientId='"+id+"'";
      SqlCommand scom = new SqlCommand(select, sc);
      SqlDataReader sr = scom.ExecuteReader();

      sr.Read();

   %>
   <div class="form-container">
    <h2> Update Patient List</h2>

    <form action="UpdatePatientList.aspx" method="post">
       
          <label>Patient Id:</label>
        <input type="text" name="id" value="<%=sr["PatientId"] %>" placeholder="Enter Patient Id" readonly>

       

        <label>Patient Name:</label>
        <input type="text" name="name" value="<%=sr["Name"] %>" placeholder="Enter Patient Name" required>

          <label>Patient Email:</label>
      <input type="text" name="email" value="<%=sr["Email"] %>" placeholder="Enter Patient Email" required>

        <label>Patient Age</label>
        <input type="number" name="age" value="<%=sr["Age"] %>" placeholder="Enter Age" required>

         <label >Select Gender</label>
        <select required name="gender">
            <option><%=sr["Gender"] %></option>
             <option>Male</option>
             <option>Female</option>
             <option>Other</option>
            
        </select>

      
          <div class="form-group">
        <label >Select Doctor</label>
          <select  name="doctor">
           <option > <%=sr["Doctor"]%></option>
                <%
      string paths = "Data Source=hp\\SQLEXPRESS; Initial Catalog=Hospital;Integrated Security=true";

      SqlConnection st = new SqlConnection(paths);
      st.Open();

      SqlCommand featch = new SqlCommand("Select Staff_Name from Staff where Role= 'Doctor'", st);

      SqlDataReader sd = featch.ExecuteReader();

      while(sd.Read())
     {%>

  <option ><%=sd["Staff_Name"] %></option>

    <% }

    %>


      </select>
    <div class="error"></div>

              <label>Patient password</label>
       <input type="password" name="password" value="<%=sr["Password"] %>" placeholder="Enter password" required>
</div>

        <input type="submit" value="Update" class="btn">

    </form>
</div>

</body>
</html>
