<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppointmentLists.aspx.cs" Inherits="Hospital_Management_System.AppointmentLists" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%
    
if(Session["admin"] == null)
{
    Response.Redirect("AdminLogin.aspx");
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

/* Table */
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
tr:first-child {
    background: #3498db;
    color: white;
    font-weight: bold;
}

/* Cells */
td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* Alternate rows */
tr:nth-child(even) {
    background: #f2f2f2;
}



/* Heading */
h2 {
    text-align: center;
    color: #2c3e50;
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
    
     <h2>Patient Appointment List</h2>
 <a href="Admindashbord.aspx" class="goBack" >Go Back</a>

 <table>
      
     <tr>
         <td>AppointmentID</td> 
         <td>First Name</td>
         <td> Last Name</td>
         <td> Phone</td>
         <td> Email</td>
         <td>Message</td>
         <td>Action</td>

     </tr>

 <%
     string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

     SqlConnection sc = new SqlConnection(path);
     sc.Open();

     string select = "select * from Appointment";
     SqlCommand scom = new SqlCommand(select, sc);
     SqlDataReader sr = scom.ExecuteReader();

     while(  sr.Read())
         {
         %>
           <tr>
                <td><%=sr["AppointmentId"] %></td>
               <td><%=sr["FirstName"] %></td>
               <td><%=sr["LastName"] %></td>
               <td><%=sr["Phone"] %></td>
               <td><%=sr["Email"] %></td>
               <td><%=sr["Message"] %></td>

               <td>
                     <a class="edit" href="EditAppointmentList.aspx?a=<%=sr["appointmentid"] %>"">Edit</a>

                    <a class="delete" href="DeleteAppointment.aspx?b=<%=sr["email"] %>" 
                    onclick="return confirm('⚠️ Are you sure you want to delete this record?');">
                        Delete </a>


               </td>

           </tr>


       <%  }


  %>

</table>
</body>
</html>
