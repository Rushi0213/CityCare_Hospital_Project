<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffList.aspx.cs" Inherits="Hospital_Management_System.StaffList" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%
    
if(Session["admin"] == null)
{
    Response.Redirect("AdminLogin.aspx");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Staff Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
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

<h2 style="text-align:center;">Hospital Staff Details</h2>

 <a href="Admindashbord.aspx" class="goBack" >Go Back</a>

<table border="1">
    <tr style="text-align:center;">
        <th>Staff ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Mobile No</th>
        <th>Address</th>
         <th>Role</th>
        <th>Action</th>
    </tr>

    <%
        string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

        SqlConnection sc = new SqlConnection(path);
        sc.Open();

       // string feach = "select * from Staff  ";
       // SqlCommand scom = new SqlCommand(feach,sc);
       // SqlDataReader sr = scom.ExecuteReader();

        // this is thelogic for preivoius and next page
       int pageSize = 10; // how many records per page

int page = Request.QueryString["page"] != null 
    ? Convert.ToInt32(Request.QueryString["page"]) 
    : 1;

int offset = (page - 1) * pageSize;

// total records count
string countQuery = "SELECT COUNT(*) FROM Staff";
SqlCommand cmdCount = new SqlCommand(countQuery, sc);
int totalRecords = (int)cmdCount.ExecuteScalar();

int totalPages = (int)Math.Ceiling((double)totalRecords / pageSize);

// fetch records with pagination
string feach = "SELECT * FROM Staff ORDER BY StaffId OFFSET " + offset + 
               " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";

SqlCommand scom = new SqlCommand(feach, sc);
SqlDataReader sr = scom.ExecuteReader();

        while(sr.Read())
            {%>
             
         <tr>
                 <td><%=sr["StaffId"] %></td>
                 <td><%=sr["Staff_Name"] %></td> 
                 <td><%=sr["Email"] %></td>
                 <td><%=sr["Phone"] %></td>
                 <td><%= sr["Address"] %></td>
                 <td><%=sr["Role"] %></td>

             <td >
                   <a class="edit" href="EditStaffList.aspx?a=<%=sr["staffid"] %>">Edit</a>

                 <a class="delete" href="Deletestaff.aspx?b=<%=sr["staffid"] %>" 
                  onclick="return confirm('⚠️ Are you sure you want to delete this record?');">
                   Delete
                  </a>

             </td>
             
        </tr>

           <% }

           %>


      

    

</table>

    <!-- this is used for go to prevois page and go to next page-->
    <div style="text-align:center; margin-top:20px; font-size:18px;">

    <% if(page > 1) { %>
        <a href="StaffList.aspx?page=<%=page-1 %>">⬅ Previous</a>
    <% } %>

    &nbsp;&nbsp;

    Page <%=page %> of <%=totalPages %>

    &nbsp;&nbsp;

    <% if(page < totalPages) { %>
        <a href="StaffList.aspx?page=<%=page+1 %>">Next ➡</a>
    <% } %>

</div>

</body>
</html>