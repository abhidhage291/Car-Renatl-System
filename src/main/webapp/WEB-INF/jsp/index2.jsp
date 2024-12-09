<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Car Rental System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Navbar styling */
        .navbar {
            background-color: #333;
        }
        
        .navbar-brand img {
            width: 80px;  /* Adjusted logo size to 80px */
            height: auto;  /* Maintain aspect ratio */
        }

        .navbar-nav .nav-link {
            color: white !important;
            font-weight: bold;
        }

        .navbar-nav .nav-link:hover {
            color: #f7ca18 !important;
        }

        /* Hero section */
        .hero-section {
            background: url('/images/bgihome.jpg') no-repeat center center/cover;
            height: calc(100vh - 80px);  /* Adjusted to cover full viewport height minus navbar height */
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            position: relative;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-content h1 {
            font-size: 48px;
            font-weight: bold;
        }

        .hero-content p {
            font-size: 18px;
        }

        /* Main content styling */
        .main-content {
            padding: 40px 20px;
            text-align: center;
        }

        .main-content h2 {
            font-weight: bold;
        }

        .btn-login {
            background-color: red;
            color: white;
            font-weight: bold;
        }

        .btn-login:hover {
            background-color: #ff6666;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#"><img src="/images/logo.jpg" alt="Online Car Rental Logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
            	<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="carDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Customer</a>
                    <div class="dropdown-menu" aria-labelledby="carDropdown">
                        <a class="dropdown-item" href="/customerAdd">Customer Addition</a>

                        <a class="dropdown-item" href="/singleCustomerReport">Customer Report</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="carDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Car</a>
                    <div class="dropdown-menu" aria-labelledby="carDropdown">
                        <a class="dropdown-item" href="/customerCarReport">Car Report</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="bookingDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Booking</a>
                    <div class="dropdown-menu" aria-labelledby="bookingDropdown">
                        <a href="/customerCarReport">New Booking</a>
                        <a href="/bookingReport">Booking Reports</a>
                    </div>
                </li>
            </ul>
            <a class="btn btn-login ml-auto" href="/logout">Logout</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1>Find the Ideal Car for You</h1>
            <p>We have more cars for you to choose.</p>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
