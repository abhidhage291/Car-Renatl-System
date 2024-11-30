<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
	    margin-top: 150px !important;
	    width: 24% !important;
	    background-color: white !important;
	    padding: 50px;
	}
	.signUp{
		padding-left:105px;
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
	 .signIn{
	 	margin-bottom:20px;
	 }
	 
	 .text-center2{
	    margin-left:100px;
	 }
</style>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
			<form action="/login" method="post" class="mx-auto">
			<h4 class="text-center">Login</h4>
			<div class="mb-3 mt-5">
                  <label for="exampleInputEmail1" class="form-label">User Name</label>
                  <input class="form-control" id="exampleInputEmail1" type="text" name="username">
             </div>
            <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" name="password">
            </div>
			 
			<input  type="submit" class="btn btn-primary mt-2 signIn" value="Sign In"/>
			<a href="/register"class="alert-link text-center2">Sign Up</a>
			</form>
	</div>
	
	
	
</body>
</html>