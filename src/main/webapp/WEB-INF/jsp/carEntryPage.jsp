<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Car</title>
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

        .form-content .input,
        .form-content .variantId {
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
        <div class="form-header">Add New Car</div>
        <form:form action="/carAdd" method="post" modelAttribute="carRecord">
            <div class="form-content">
                <form:hidden path="available" />

                <label for="carNumber">Car Registration Number:</label>
                <form:input path="carNumber" id="carNumber" class="input" placeholder="Registration number" />

                <label for="carName">Enter Car Name:</label>
                <form:input path="carName" id="carName" class="input" placeholder="Car name" />

                <label for="carColor">Enter Car Color:</label>
                <form:input path="carColor" id="carColor" class="input" placeholder="Car color" />

                <label for="manufacturer">Enter Car Manufacturer Name:</label>
                <form:input path="manufacturer" id="manufacturer" class="input" placeholder="Manufacturer name" />

                <label for="yearOfMfg">Enter Year of Manufacturing:</label>
                <form:input path="yearOfMfg" id="yearOfMfg" class="input" placeholder="Year of manufacturing" />

                <label for="rentRate">Enter Rent Rate Per Hour:</label>
                <form:input path="rentRate" id="rentRate" class="input" placeholder="Rent rate per hour" />

                <label for="variantId">Select Variant:</label>
                <form:select path="variantId" class="input variantId">
                    <form:option value="" label="Select Variant Id" disabled="true" />
                    <c:forEach items="${variantIdList}" var="vids">
                        <form:option value="${vids}">${vids}</form:option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="form-footer">
                <button type="submit" class="submit-button">Submit</button>
                <button type="reset" class="reset-button">Reset</button>
            </div>
        </form:form>
    </div>
</body>
</html>
