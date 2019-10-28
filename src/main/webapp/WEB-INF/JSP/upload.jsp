<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Picture resize</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

<div class="container jumbotron vertical-center bg-white ">
<form:form method="POST" action="uploadFile" enctype="multipart/form-data" commandName="profileForm">

    <div class="form-row">
        <div class= "form-group col col-md-6 offset-md-3 col-lg-4 offset-lg-4">
            <img id="output" class="img-fluid rounded"/>
        </div>
    </div>

    <div class="form-row">
        <div class= " form-group col col-md-6 offset-md-3">
            <input type="file" class="custom-file-input" name="file" accept="image/*" id="exampleInputFile" onchange="loadFile(event)">
            <label class="custom-file-label form-control-file" for="exampleInputFile">Choose file</label>
        </div>
    </div>

    <div class="form-row ">
        <div class="form-group col col-md-4 offset-md-4 proportion d-none" id="height">
            <label for="height1" class="text-center">Height px</label>
            <input type="range" class="form-control-range" id="height1" name="height" min="100" max="1000" value="500" oninput="heightout.value = height1.value ">
            <output id="heightout">500</output>
        </div>
    </div>

    <div class="form-row  ">
        <div class="form-group col col-md-4 offset-md-4 proportion d-none" id="width">
            <label for="width1" value="500">Width px</label>
            <input type="range" class="form-control-range" id="width1" name="width" min="100" max="1000" value="500" oninput="widthout.value = width1.value">
            <output id="widthout" value="500">500</output>
        </div>
    </div>

    <div class="form-row  ">
        <div class="form-group col col-md-4 offset-md-4 " id="size">
            <label for="size1" value="500">Size px</label>
            <input type="range" class="form-control-range" id="size1" name="size" min="100" max="1000" value="500" oninput="sizeout.value = size1.value">
            <output id="sizeout" value="500">500</output>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="form-group">
            <input class="form-check-input" type="checkbox" name="check" checked="checked" id="defaultCheck1" >
            <label class="form-check-label" for="defaultCheck1"> keep proportions</label>
        </div>
    </div>

    <div class="form-row ">
        <div class="form-group col col-md-4 offset-md-4">
            <p class="text-center">Select format</p>
            <select class="form-control" name="format">
                <option class="dropdown-item" name="format" value="jpg">jpg</option>
                <option class="dropdown-item" name="format" value="bmp">bmp</option>
                <option class="dropdown-item" name="format" value="png">png</option>
            </select>
        </div>
    </div>

    <div class="form-row  ">
        <div class="form-group col col-md-4 offset-md-4">
            <input type="submit" class="btn btn-primary btn-block inline-block" value="Upload">
        </div>
    </div>

</form:form>
</div>

<script>
var loadFile = function(event) {
var output = document.getElementById('output');
output.src = URL.createObjectURL(event.target.files[0]);};
</script>

<script>
$('.form-check-input').on('change',function(){
if($("#defaultCheck1").is(":checked")) {
    $('.proportion').css('display','none');
    $("#size").css('display','block');
}else {
    $('.proportion').css('display','block').removeClass('d-none');
    $("#size").css('display','none');
}});
</script>

<script>
$('.custom-file-input').on('change',function(){
var fileName = document.getElementById("exampleInputFile").files[0].name;
$('.form-control-file').addClass("selected").html(fileName);
});
</script>

</body>
</html>
