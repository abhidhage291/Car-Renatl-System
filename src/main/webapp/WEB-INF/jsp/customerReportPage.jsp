<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Report</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
    <style>
        /* Set background image for the entire page */
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
            background-color: rgba(52, 58, 64, 0.8); /* Semi-transparent background */
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
            background-color: rgba(249, 249, 249, 0.9); /* Semi-transparent background */
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

        .action-cell .action-btn {
            display: inline-block;
            margin: 0 5px;
            padding: 5px 10px;
            color: #fff;
            border-radius: 4px;
            text-decoration: none;
        }

        .update-btn {
            background-color: #28a745;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        /* Styling for centered Return button */
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
          <h1>Customer Report</h1>
      </div>
  </header>
  <div class="main-container" id="customerReportMainContainer">
      <div class="table-container">
        <table class="table">
            <tr class="table-header">
                <th>User Name</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>License Number</th>
                <th>License Expiry Date</th>
                <th>Status</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <c:forEach items="${customerList}" var="cus">
                <tr class="table-row">
                    <td>${cus.username}</td>
                    <td>${cus.firstName}</td>
                    <td>${cus.lastName}</td>
                    <td>${cus.address}</td>
                    <td>${cus.email}</td>
                    <td>${cus.mobile}</td>
                    <td>${cus.license}</td>
                    <td>${cus.expiryDate}</td>
                    <td>${cus.status}</td>
                    <td class="action-cell">
                        <a href="/customerUpdate/${cus.username}" class="action-btn update-btn">Update</a>
                    </td>
                    <td class="action-cell">
                        <a href="/customerDelete/${cus.username}" class="action-btn delete-btn">Delete</a>
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
