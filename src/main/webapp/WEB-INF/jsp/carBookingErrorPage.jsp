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

        /* Page Content */
        .content-container {
            width: 100%;
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            color: #333;
        }

        .content-header {
            background-color: #ff7300;
            color: #fff;
            padding: 15px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .content-body {
            padding: 20px;
        }

        .content-footer {
            background-color: #f4f4f9;
            display: flex;
            justify-content: space-between;
            padding: 15px 20px;
            border-top: 1px solid #ddd;
        }

        .content-footer button {
            width: 48%;
            padding: 10px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .content-footer .submit-button {
            background-color: #ff7300;
            color: #fff;
        }

        .content-footer .submit-button:hover {
            background-color: #e66000;
        }

        .content-footer .reset-button {
            background-color: #ddd;
            color: #333;
        }

        .content-footer .reset-button:hover {
            background-color: #bbb;
        }

        /* Error Message Styling */
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
            padding: 15px;
            margin: 20px 0;
            font-size: 18px;
            text-align: center;
            animation: slideIn 1s ease-out;
        }

        @keyframes slideIn {
            0% {
                transform: translateY(-50px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content-container {
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
        
    </nav>

    <div class="container">
        <div class="error-message">
            <h1>${errorMessage }</h1>
        </div>
        <br>
        <h3><a href="/index">Return</a></h3>
    </div>
</body>
</html>
