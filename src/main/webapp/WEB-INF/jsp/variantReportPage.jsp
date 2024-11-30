<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Variants</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
    <style>
        /* Background image and page styling */
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

        .delete-link {
            color: #ff4d4d;
            text-decoration: none;
            font-weight: bold;
        }

        .delete-link:hover {
            text-decoration: underline;
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
          <h1>Car Variant Report</h1>
      </div>
  </header>
  <div class="main-container">
      <div class="table-container">
        <table class="table">
          <tr class="table-header">
            <th>Variant Id</th>
            <th>Variant Name</th>
            <th>Number of Seats</th>
            <th>Fuel</th>
            <th>Delete</th>
          </tr>

          <c:forEach items="${variantList }" var="variant">
            <tr class="table-row">
              <td>${variant.variantId}</td>
              <td>${variant.variantName}</td>
              <td>${variant.numberOfSeat}</td>
              <td>${variant.fuel}</td>
              <td><a class="delete-link" href="/variantDeletion/${variant.variantId}">Delete</a></td>
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
