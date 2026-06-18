<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientTable.aspx.cs" Inherits="Hospital_Management_System.PatientTable" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%
    if(Session["patient"] == null)
{
    Response.Redirect("PatientLogin.aspx");
}
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <style>
body {
    font-family: Arial, sans-serif;
    background: #ecf0f1;
    margin: 0;
    padding: 20px;
}

/* Heading */
h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 20px;
}

/* Table Styling */
table {
    width: 80%;
    margin: auto;
    border-collapse: collapse;
    background: #ffffff;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
    border-radius: 8px;
    overflow: hidden;
}

/* Header */
th {
    background: #3498db;
    color: white;
    padding: 12px;
    text-transform: uppercase;
}

/* Cells */
td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* Alternate Row */
tr:nth-child(even) {
    background: #f2f2f2;
}

/* Hover Effect */
tr:hover {
    background: #dfe6e9;
}

/* Remove default border */
table, th, td {
    border: none;
}

.goBack
 {
    display: inline-block;
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    transition: 0.3s;
    margin-left:82%;
    margin-bottom:20px;
}
.goBack:hover
{
    background-color:green;
}


</style>

</head>
<body>
   
    <h2 style="text-align:center;">Login Patient details</h2>

 <a href="PatientDashboard.aspx" class="goBack" >Go Back</a>
     <table>
      
     <tr>
         <td>Patient Id</td>
         <td> Name</td>
         <td>Email</td>
         <td> Age</td>
         <td> Gender</td>
         <td>Doctor</td>
         <td>Password</td>
         <td>Action</td>

     </tr>

 <%
     string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

     SqlConnection sc = new SqlConnection(path);
     sc.Open();

     string select = "select * from Patient where Email='" + Session["patient"] +"'";
     SqlCommand scom = new SqlCommand(select, sc);
     SqlDataReader sr = scom.ExecuteReader();

     while(  sr.Read())
         {
         %>
           <tr>
               <td><%=sr["PatientId"] %></td>
              
               <td><%=sr["Name"] %></td>
                <td><%=sr["Email"] %></td>
               <td><%=sr["Age"] %></td>
               <td><%=sr["Gender"] %></td>
              
               <td><%=sr["Doctor"] %></td>
                <td><%=sr["Password"] %></td>

            <!--   <td>
                     <a class="edit" href="EditPatientList.aspx?a=<%=sr["patientid"] %>">Edit</a>

                    <a class="delete" href="DeletePatient.aspx?b=<%=sr["patientid"] %>" 
                    onclick="return confirm('⚠️ Are you sure you want to delete this record?');">
                        Delete </a>


               </td> -->

           </tr>


       <%  }


  %>

</table>

</body>
</html>
