<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="Hospital_Management_System.Appointment" %>

<!DOCTYPE html>
<html>
<head>
    <title>Appointment Form</title>

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

<div class="form-box">
    <h2>Appointment Form</h2>

    <form  action="AppointmentDatabase.aspx" method="post">

        <input type="text" name="first" placeholder="First Name" required>

        <input type="text" name="second" placeholder="Last Name" required>

        <input type="tel" name="phone" placeholder="Phone Number" required>

        <input type="email" name="email" placeholder="Email ID" required>

        <textarea placeholder="Message" name="message" required></textarea>

        <button type="submit">Submit</button>

    </form>
</div>

</body>
</html>