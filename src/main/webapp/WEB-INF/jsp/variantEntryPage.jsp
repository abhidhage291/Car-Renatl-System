<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Variant Entry Page</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: url('/images/bgihome.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #333;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        .navbar .navbar-title {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            padding: 10px 15px;
            border: 1px solid #ff7300;
            border-radius: 4px;
            background-color: #ff7300;
            transition: background-color 0.3s;
        }

        .navbar a:hover {
            background-color: #e66000;
        }

        /* Form Container */
        .form-container {
            background-color: rgba(255, 255, 255, 0.95);
            width: 100%;
            max-width: 500px;
            margin: 50px auto;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            color: #333;
            overflow: hidden;
        }

        .form-header {
            background-color: #ff7300;
            color: #fff;
            padding: 15px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .form-content {
            padding: 20px;
        }

        .form-content label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #555;
        }

        .form-content .input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-footer {
            background-color: #f4f4f9;
            display: flex;
            justify-content: space-between;
            padding: 15px 20px;
            border-top: 1px solid #ddd;
        }

        .form-footer button {
            width: 48%;
            padding: 10px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-footer .submit-button {
            background-color: #ff7300;
            color: #fff;
        }

        .form-footer .submit-button:hover {
            background-color: #e66000;
        }

        .form-footer .reset-button {
            background-color: #ddd;
            color: #333;
        }

        .form-footer .reset-button:hover {
            background-color: #bbb;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }

            .navbar {
                flex-direction: column;
                height: auto;
                padding: 15px;
            }

            .navbar a {
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navbar-title">Car Rental System</div>
        <a href="/index" class="home-button">Home</a>
    </nav>

    <div class="form-container">
        <div class="form-header">Car Variant Entry Page</div>
        <form:form action="/variantAdd" method="post" modelAttribute="variantRecord">
            <div class="form-content">
                <form:hidden path="variantId" />

                <label for="variantId">Variant Id:</label>
                <form:input path="variantId" id="variantId" class="input" disabled="true" />

                <label for="variantName">Enter Variant Name:</label>
                <form:input path="variantName" id="variantName" class="input" placeholder="Variant name" />

                <label for="numberOfSeat">Enter Number of Seats:</label>
                <form:input path="numberOfSeat" id="numberOfSeat" class="input" placeholder="Number of seats" />

                <label for="fuel">Enter Type of Fuel:</label>
                <form:input path="fuel" id="fuel" class="input" placeholder="Type of fuel" />
            </div>

            <div class="form-footer">
                <button type="submit" class="submit-button">Submit</button>
                <button type="reset" class="reset-button">Reset</button>
            </div>
        </form:form>
    </div>
</body>
</html>
