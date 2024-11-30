<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Report</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
<style>
    body {
        background-image: url('${pageContext.request.contextPath}/images/bgihome.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        color: #fff;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .header-content {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: rgba(52, 58, 64, 0.8);
        color: #fff;
        padding: 15px;
    }

    .header-content h1 {
        font-size: 28px;
        font-weight: bold;
        text-transform: uppercase;
        margin: 0;
    }

    .main-container {
        padding: 20px;
    }

    .table-container {
        padding: 20px;
        background-color: rgba(249, 249, 249, 0.9);
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        font-size: 16px;
        text-align: left;
        color: #333;
    }

    .table-header th {
        background-color: #007bff;
        color: #fff;
        padding: 12px;
        border: 1px solid #ddd;
    }

    .table-row td {
        padding: 10px;
        border: 1px solid #ddd;
    }

    .table-row:nth-child(even) {
        background-color: #f2f2f2;
    }

    .inner-table {
        width: 100%;
        margin-top: 5px;
        font-size: 14px;
        border: 1px solid #ddd;
    }

    .inner-table th {
        background-color: #6c757d;
        color: #fff;
        padding: 8px;
    }

    .inner-table td {
        padding: 8px;
        border: 1px solid #ddd;
    }

    .return-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .return-link {
        display: inline-block;
        padding: 10px 20px;
        font-size: 18px;
        color: #fff;
        background-color: #007bff;
        text-decoration: none;
        border-radius: 8px;
        transition: background-color 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .return-link:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>Car Report</h1>
        </div>
    </header>
    <div class="main-container">
        <div class="table-container">
            <table class="table">
                <tr class="table-header">
                    <th>Car Number</th>
                    <th>Car Name</th>
                    <th>Car Color</th>
                    <th>Manufacturer</th>
                    <th>MFG Year</th>
                    <th>Variant Details</th>
                    <th>Rent/Hour</th>
                    <th>Available</th>
                </tr>
                <c:forEach items="${carList}" var="car">
                    <tr class="table-row">
                        <td>${car.carNumber}</td>
                        <td>${car.carName}</td>
                        <td>${car.carColor}</td>
                        <td>${car.manufacturer}</td>
                        <td>${car.yearOfMfg}</td>
                        <td>
                            <table class="inner-table">
                                <c:forEach items="${variantMap}" var="cmp">
                                    <c:if test="${car.variantId==cmp.key}">
                                        <tr>
                                            <th>Variant Name</th>
                                            <td>${cmp.value.variantName}</td>
                                        </tr>
                                        <tr>
                                            <th>Number of Seats</th>
                                            <td>${cmp.value.numberOfSeat}</td>
                                        </tr>
                                        <tr>
                                            <th>Fuel</th>
                                            <td>${cmp.value.fuel}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </td>
                        <td>₹${car.rentRate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${car.available == true}">Available</c:when>
                                <c:otherwise>Not Available</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="return-container">
            <a class="return-link" href="/index">Return</a>
        </div>
    </div>
</body>
</html>
