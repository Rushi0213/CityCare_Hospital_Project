<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditStaffList.aspx.cs" Inherits="Hospital_Management_System.UpdateStaffList" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Staff</title>

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
    background: url('https://images.unsplash.com/photo-1586773860418-d37222d8fce3') no-repeat center center/cover;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Container */
.container {
    background: rgba(255, 255, 255, 0.95);
    padding: 30px;
    width: 380px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.3);
}

/* Heading */
.container h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
}

/* Inputs */
.input-box {
    margin-bottom: 15px;
}

.input-box label {
    font-weight: bold;
    font-size: 14px;
}

.input-box input,
.input-box textarea {
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
    background: #27ae60;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    background: #1e8449;
}
</style>

</head>

<body>

    <%
        string path = "Data Source=hp\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=true";

        SqlConnection sc = new SqlConnection(path);
        sc.Open();

        string id = Request.Params["a"];

        string select="select * from Staff where StaffId='"+id+"'";
        SqlCommand scom = new SqlCommand(select, sc);
        SqlDataReader sr = scom.ExecuteReader();

        sr.Read();

     %>


<div class="container">
    <h2>Update Staff Details</h2>

    <form action="UpdateStaffList.aspx" method="post">
        <div class="input-box">
            <label>Staff ID</label>
            <input type="text" name="staffid" value="<%=sr["StaffId"] %>" placeholder="Enter Staff ID" required  readonly>
        </div>

        <div class="input-box">
            <label>Name</label>
            <input type="text" name="name"  value="<%=sr["Staff_Name"] %>" placeholder="Enter Name" required>
        </div>

        <div class="input-box">
            <label>Email</label>
            <input type="email" name="email" value="<%=sr["Email"] %>" placeholder="Enter Email" required>
        </div>

        <div class="input-box">
            <label>Mobile No</label>
            <input type="text" name="phone" value="<%=sr["Phone"] %>" placeholder="Enter Mobile Number" required>
        </div>

        <div class="input-box">
            <label>Address</label>
            <textarea name="address" placeholder="Enter Address"  required"><%=sr["Address"] %></textarea>
        </div>

        <button type="submit" class="btn">Update</button>
    </form>
</div>

</body>
</html>
