<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <%@include file="component/allcss.jsp"%>
</head>
<body>
<%@include file="component/navbar.jsp"%>
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="3000">
      <img src="img/m1.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="img/m2.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
    <div class="carousel-item" data-bs-interval="3000">
      <img src="img/m3.png" class="d-block w-100" alt="..." height="500px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<nav>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center">
        <h3>Popular Events</h3>
        <a href="events.jsp" class="text-danger text-decoration-none fw-bold">See All &gt;</a>
    </div>
    
    <div class="d-flex flex-row overflow-auto">
        <!-- Event 1 -->
        <div class="card me-3" style="width: 18rem;">
            <img src="img/event1.jpg" class="card-img-top" alt="Event 1">
            <div class="card-body">
                <p class="text-muted">Sun, 9 Mar onwards</p>
                <h6 class="card-title">Kisi Ko Batana Mat Ft. Anubhav Singh Bassi</h6>
                <p class="card-text text-muted">Sri Shanmukhananda Fine Arts & Sangeetha, Mumbai</p>
            </div>
        </div>

        <!-- Event 2 -->
        <div class="card me-3" style="width: 18rem;">
            <img src="img/event2.jpg" class="card-img-top" alt="Event 2">
            <div class="card-body">
                <p class="text-muted">Thu, 27 Feb onwards</p>
                <h6 class="card-title">Da Vinci Genius - Interactive Show</h6>
                <p class="card-text text-muted">Nesco Center, Goregaon, Mumbai</p>
            </div>
        </div>

        <!-- Event 3 -->
        <div class="card me-3" style="width: 18rem;">
            <img src="img/event3.jpg" class="card-img-top" alt="Event 3">
            <div class="card-body">
                <p class="text-muted">Sat, 1 Mar</p>
                <h6 class="card-title">Autocar India Modern Classic Car Show 2025</h6>
                <p class="card-text text-muted">Grand Hyatt Mumbai Hotel & Residences</p>
            </div>
        </div>

        <!-- Event 4 -->
        <div class="card me-3" style="width: 18rem;">
            <img src="img/event4.jpg" class="card-img-top" alt="Event 4">
            <div class="card-body">
                <p class="text-muted">Sat, 1 Mar</p>
                <h6 class="card-title">NCPA@thePark - Bandra Fort Amphitheatre</h6>
                <p class="card-text text-muted">Bandra Fort Amphitheatre, Mumbai</p>
            </div>
        </div>

        <!-- Event 5 -->
        <div class="card me-3" style="width: 18rem;">
            <img src="img/event5.jpg" class="card-img-top" alt="Event 5">
            <div class="card-body">
                <p class="text-muted">Thu, 27 Feb onwards</p>
                <h6 class="card-title">Light into Space - Dia Art Foundation</h6>
                <p class="card-text text-muted">Art House, Nita Mukesh Ambani Cultural Centre</p>
            </div>
        </div>
    </div>
</div>
</nav>

  
  <%@include file="component/footer.jsp" %>
</body>
</html>