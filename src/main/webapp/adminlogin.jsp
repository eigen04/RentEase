	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
body {
    background: url('<%= request.getContextPath() %>/img/img26.jpg') no-repeat center center fixed;
    background-size: cover;
}
.paint-card {
    background: rgba(10, 25, 50, 0.75) !important; /* Ensure transparency */
    backdrop-filter: blur(15px) !important;
    -webkit-backdrop-filter: blur(15px) !important;
    border-radius: 15px !important; 
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4) !important; 
    padding: 30px !important;  
    color: white !important;
    border: 1px solid rgba(255, 255, 255, 0.2) !important;
}

.paint-card h2 {
    text-align: center !important;
    font-weight: bold !important;
}

.paint-card input {
    border-radius: 8px !important;
    padding: 12px !important;
    border: none !important;
    background: rgba(255, 255, 255, 0.1) !important; /* Light transparent field */
    color: white !important;
}

.paint-card input:focus {
    outline: none !important;
    border: 2px solid rgba(255, 255, 255, 0.5) !important;
    background: rgba(255, 255, 255, 0.15) !important;
}

.paint-card button {
    width: 100% !important;
    background: #198754 !important; 
    border-radius: 8px !important;
    padding: 12px !important;
    transition: all 0.3s ease-in-out !important;
    font-size: 16px !important;
    color: white !important;
}

.paint-card button:hover {
    background: #157347 !important;
}

.paint-card a {
    color: #1abc9c !important;
    text-decoration: none !important;
    transition: 0.3s !important;
}

.paint-card a:hover {
    text-decoration: underline !important;
}

</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Admin Login</p>
						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="adminlogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>