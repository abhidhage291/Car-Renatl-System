<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Car</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: url('/images/bgihome.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navbar styling */
        .navbar {
            background-color: #333;
            height: 70px;
            display: flex;
            align-items: center;
            padding: 0 20px;
        }

        .navbar .logo {
            flex-grow: 1;
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            text-align: center;
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

        .navbar .logout-btn {
            background-color: #e66000;
            margin-left: auto;
            padding: 10px 15px;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.92);
            width: 450px;
            height: 80%;
            margin: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            color: #333;
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .form-header {
            background-color: #ff7300;
            color: #fff;
            padding: 10px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .form-content {
            padding: 20px;
            overflow-y: auto;
            flex-grow: 1;
        }

        .form-footer {
            background-color: #f4f4f9;
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            border-top: 1px solid #ddd;
            position: sticky;
            bottom: 0;
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

        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #555;
        }

        .form-container .input,
        .form-container .variantId {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">rent&drive</div>
        <a href="/index" class="home-button">Home</a>
    </nav>

    <div class="form-container">
        <div class="form-header">Update Car</div>
        <div class="form-content">
            <form:form action="/carUpdate" method="post" modelAttribute="carRecord">
                <form:hidden path="carNumber" />
                <form:hidden path="carName" />
                <form:hidden path="carColor" />
                <form:hidden path="manufacturer" />
                <form:hidden path="yearOfMfg" />
                <form:hidden path="variantId" />

                <label for="carNumber">Car Registration Number:</label>
                <form:input path="carNumber" id="carNumber" class="input" placeholder="Registration number" disabled="true" />

                <label for="carName">Car Name:</label>
                <form:input path="carName" id="carName" class="input" placeholder="Car name" disabled="true"/>

                <label for="carColor">Car Color:</label>
                <form:input path="carColor" id="carColor" class="input" placeholder="Car color" disabled="true"/>

                <label for="manufacturer">Car Manufacturer Name:</label>
                <form:input path="manufacturer" id="manufacturer" class="input" placeholder="Manufacturer name" disabled="true"/>

                <label for="yearOfMfg">Year of Manufacturing:</label>
                <form:input path="yearOfMfg" id="yearOfMfg" class="input" placeholder="Year of manufacturing" disabled="true"/>

                <label for="rentRate">Enter New Rent Rate Per Hour:</label>
                <form:input path="rentRate" id="rentRate" class="input" placeholder="Rent rate per hour" />

                <label for="available">Enter New Availability Status:</label>
                <form:select path="available" id="available" class="input">
                    <option value="true">True</option>
                    <option value="false">False</option>
                </form:select>

                <label for="variantId">Variant Id:</label>
                <form:input path="variantId" id="variantId" class="input" placeholder="Variant Id" disabled="true"/>

                <!-- Submit button should be inside the form -->
                <div class="form-footer">
                    <button type="submit" class="submit-button">Submit</button>
                    <button type="reset" class="reset-button">Reset</button>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>
