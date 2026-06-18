<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffDashboard.aspx.cs" Inherits="Hospital_Management_System.StaffDashboard" %>

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
    
        <a href="patientDashboard">Dashboard</a>
        <a href="staffTable.aspx">Staff Details</a>
        <a href="Appointment.aspx">Appointment</a>
        <a href="staffLogout.aspx">Logout</a>
    
</div>

<!-- Main Content -->
<div class="main">

    <!-- Navbar -->
    <center>
         <div class="navbar">
             CityCare Hospital  
         </div>
    </center>

    <!-- ✅ ADD HERE -->
  <!--  <div class="dashboard">

        <div class="card">
            <h3>Total Staff</h3>
           <p class="count"></p>
        </div>

        <div class="card">
            <h3>Total Patients</h3>
            <p class="count"></p>
        </div>

        <div class="card">
            <h3>Appointments</h3>
              <p class="count"></p>
        </div>

        <div class="card">
            <h3>Doctors</h3>
            <p class="count"></p>
        </div>

    </div>-->

</div>



</body>
</html>