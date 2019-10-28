<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div class="container jumbotron vertical-center bg-white">

    <div class="align-items-center bg-white">
        <div class="row ">
            <div class= " col col-md-6 offset-md-3 col-lg-6 offset-lg-3">
                <img   class="img-fluid rounded img-thumbnail mx-auto d-block" src="../../static/${path}" alt=""/>
            </div>
        </div>

        <div class="row ">
            <div class= "col col-md-6 offset-md-3 col-lg-6 offset-lg-3">
                <a class="btn btn-primary btn-block " role="button" href="../../static/${path}" download="${path}">Download</a>
            </div>
        </div>
    </div>

</div>
</body>
</html>
