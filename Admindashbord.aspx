<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admindashbord.aspx.cs" Inherits="Hospital_Management_System.Admindashbord" %>


<%if (Session["admin"]==null)
    {
        Response.Redirect("AdminLogin.aspx");
    }
  %>

<%@ Import Namespace="System.Data.SqlClient" %>

<%
    string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

    SqlConnection sc = new SqlConnection(path);
    sc.Open();

    // Total Staff
    string q1 = "SELECT COUNT(*) FROM Staff";
    SqlCommand cmd1 = new SqlCommand(q1, sc);
    int totalStaff = (int)cmd1.ExecuteScalar();
    //SqlDataReader totalStaff = cmd1.ExecuteReader();
    //totalStaff.Read();
    // Total Patients
    string q2 = "SELECT COUNT(*) FROM Patient";
    SqlCommand cmd2 = new SqlCommand(q2, sc);
    int totalPatients = (int)cmd2.ExecuteScalar();

    // Total Appointments
    string q3 = "SELECT COUNT(*) FROM Appointment";
    SqlCommand cmd3 = new SqlCommand(q3, sc);
    int totalAppointments = (int)cmd3.ExecuteScalar();

    // Total Doctors (Role wise)
    string q4 = "SELECT COUNT(*) FROM Staff WHERE Role='Doctor'";
    SqlCommand cmd4 = new SqlCommand(q4, sc);
    int totalDoctors = (int)cmd4.ExecuteScalar();

    sc.Close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Hospital Admin Dashboard</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}


/* Layout */
body {
    display: flex;
}

/* Sidebar */
/* Sidebar */
.sidebar {
    width: 230px;
    height: 100vh;
    background: linear-gradient(180deg, #2c3e50, #1a252f);
    color: #fff;
    padding: 20px;
    position: fixed;
    top: 0;
    left: 0;
}

/* Title */
.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 24px;
    letter-spacing: 1px;
}

/* Links */
.sidebar a {
    display: block;
    color: #ecf0f1;
    text-decoration: none;
    padding: 12px 15px;
    margin: 8px 0;
    border-radius: 6px;
    transition: all 0.3s ease;
    font-size: 15px;
}

/* Hover Effect */
.sidebar a:hover {
    background: #3498db;
    transform: translateX(5px);
}

/* Active Link (optional) */
.sidebar a.active {
    background: #2980b9;
}

/* Logout special style */
.sidebar a:last-child {
    margin-top: 30px;
    background: #e74c3c;
    text-align: center;
}

.sidebar a:last-child:hover {
    background: #c0392b;
}

/* Main Content */
.main {
    flex: 1;
    background: #ecf0f1;
}

/* Top Navbar */
.navbar {
    background: #3498db;
    color: white;
    padding: 15px;
    font-size: 18px;
}
/* Navbar Styling */
.navbar {
    width: 60%;
    background: linear-gradient(90deg, #3498db, #2c3e50);
    color: white;
    padding: 15px;
    font-size: 22px;
    font-weight: bold;
    border-radius: 8px;
    text-align: center;
    letter-spacing: 1px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    margin-top: 20px;
    margin-left:100px;
}

.dashboard {
    margin-left: 250px; /* because sidebar is fixed */
    margin-top: 30px;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    padding: 20px;
}

.card {
    background: white;
    padding: 25px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
}

.card h3 {
    margin-bottom: 10px;
    color: #2c3e50;
}

.count {
    font-size: 30px;
    font-weight: bold;
    color: #3498db;
}


</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Hospital</h2>
    
        <a href="#">Dashboard</a>
        <a href="StaffList.aspx">Staff List</a>
        <a href="Staffreg.aspx">Register Staff</a>
        <a href="PatientList.aspx">Patient List</a>
        <a href="PatientReg.aspx">Patient Register</a>
        <a href="AppointmentLists.aspx">AppointmentLists</a>
        <a href="Appointment.aspx">Appointments</a>
        <a href="Logout.aspx">Logout</a>
    
</div>

<!-- Main Content -->
<div class="main">

    <!-- Navbar -->
    <center>
         <div class="navbar">
             CityCare Hospital <%=Session["admin"]%> 
         </div>
    </center>

    <!-- ✅ ADD HERE -->
    <div class="dashboard">

        <div class="card">
            <h3>Total Staff</h3>
           <p class="count"><%= totalStaff %></p>
        </div>

        <div class="card">
            <h3>Total Patients</h3>
            <p class="count"><%= totalPatients %></p>
        </div>

        <div class="card">
            <h3>Appointments</h3>
              <p class="count"><%= totalAppointments %></p>
        </div>

        <div class="card">
            <h3>Doctors</h3>
            <p class="count"><%= totalDoctors %></p>
        </div>

    </div>

</div>
    

  </body>
</html>
    
  
   
       
 





