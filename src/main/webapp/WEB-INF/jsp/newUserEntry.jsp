<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <script type="text/javascript">
            function passwordCheck(){
                 var pass1=document.getElementById("pass1").value;
                 var pass2=document.getElementById("pass2").value;
                 if(pass1===pass2)
                     document.getElementById("registrationForm").submit();
                  else
                     alert("Passwords are not matched");
            }
        </script>
    <title>Register new user</title>
    <style>
    		@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap');
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
  
}

body{
    background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(75,14,154,1) 35%, rgba(0,212,255,1) 100%);
    font-family: 'Poppins', sans-serif;

}
form{
    border-radius: 20px;
    margin: 35px !important;
    width: 24% !important;
    background-color: white !important;
    padding: 50px;
}

.btn-primary{
    width: 100%;
    border: none;
    border-radius: 50px;
    background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(75,14,154,1) 35%, rgba(0,212,255,1) 100%);
    
}

.form-control{
    color: rgba(0,0,0,.87);
    border-bottom-color: rgba(0,0,0,.42);
    box-shadow: none !important;
    border: none;
    border-bottom: 1px solid;
    border-radius: 4px 4px 0 0;
    }
 h4{
    font-size: 2rem !important;
    font-weight: 700;
 }  
 .form-label{
    font-weight: 800 !important;
 }
@media only screen and (max-width: 600px) {
    form {
        width: 100% !important;
    }
  }
 .sub{
 	margin-bottom:20px;
 	margin-top:20px;
 }
 .text-center{
 	margin-bottom:25px;
 }
    </style>
</head>
<body>
    
   
     <div class="container-fluid container">   
        <form:form id="registrationForm" method="post" action="/register" modelAttribute="userRecord" class="mx-auto">
        <div >
        	<h4 class="text-center">Register User</h4>
             <div class="mb-2">
                  <label for="exampleInputEmail1" class="form-label">Enter User Id</label>
                  <input class="form-control" id="exampleInputEmail1" type="text" name="username" path="username">
             </div>
             
             <div class="mb-2">
                  <label for="pass1" class="form-label">Enter Password</label>
             	  <form:input type="password" path="password" id="pass1" class="form-control"/>
           	 </div>
           	 
            <div class="mb-2">
                  <label for="pass1" class="form-label">Re-Enter Password</label>
                  <input type="password" id="pass2" class="form-control"/>
           	 </div>
           	 
            <div class="mb-2">
                  <label for="Email" class="form-label">Enter email</label>
                  <form:input path="email" class="form-control"/>
             </div>
                         
            <div class="mb-2">
                  <label class="form-label">Select User Type:</label>
                  <form:input list="types" name="type" id="type" path="role" class="form-control"/>
		            <datalist id="types">
		                <option value="Customer"/>
		                <option value="Admin"/>
		            </datalist>
             </div>             
             
            <button type="button" class="btn btn-primary sub" onclick="passwordCheck();">Submit</button>
            <button type="reset" class="btn btn-primary">Reset</button>
        </form:form>
    </div>
</body>
</html>
