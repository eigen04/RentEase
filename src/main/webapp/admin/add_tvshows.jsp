<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Movie</title>
    <%@include file="../component/allcss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="container mt-4">
    <h2 class="text-center">Add New TvShow</h2>
    <form action="addtvshow" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>Title:</label>
            <input type="text" name="title" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Language:</label>
            <input type="text" name="language" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Rating:</label>
            <input type="text" name="rating" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Image:</label>
            <input type="file" name="image" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add TvShow</button>
    </form>
</div>

<%@include file="../component/footer.jsp"%>

</body>
</html>
