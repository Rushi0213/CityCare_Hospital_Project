<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staffreg.aspx.cs" Inherits="Hospital_Management_System.Staff" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Staff Registration</title>

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
    background: url('https://images.unsplash.com/photo-1579684385127-1ef15d508118') no-repeat center center/cover;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Form Container */
.container {
    background: rgba(255, 255, 255, 0.9);
    padding: 30px;
    width: 350px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.3);
}

/* Heading */
.container h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
}

/* Input Fields */
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
    background: #3498db;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    background: #2980b9;
}
</style>

</head>

<body>

<div class="container">
    <h2>Staff Registration</h2>

    <form action="StaffDatabase.aspx" method="post">
        <div class="input-box">
            <label>Staff ID</label>
            <input type="text" name= "id" placeholder="Enter Staff ID" required>
        </div>

        <div class="input-box">
            <label>Staff_Name</label>
            <input type="text" name="name" placeholder="Enter Name" required>
        </div>

        <div class="input-box">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter Email" required>
        </div>

        <div class="input-box">
            <label>Mobile No</label>
            <input type="text" name="phone" placeholder="Enter Mobile Number" required>
        </div>


        <div class="input-box">
            <label>Address</label>
            <textarea name="address" placeholder="Enter Address" required></textarea>
        </div>

        
        <div class="input-box">
           <label>Role</label>
               <select name="role" required>
                  <option value="">Select Role</option>
                   <option value="Doctor">Doctor</option>
                   <option value="Nurse">Nurse</option>
                   <option value="Receptionist">Receptionist</option>
                   <option value="Ward Boy">Ward Boy</option>
                </select>
         </div>

        <button type="submit" class="btn">Register</button>
    </form>

</div>
   

</body>
</html>
