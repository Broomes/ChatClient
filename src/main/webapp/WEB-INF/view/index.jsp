<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Broomes Chat</title>
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico" />"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/index.css' />">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md fixed-top navbar-light" style="background-color: #e3f2fd;">
        <a class="navbar-brand" href="https://broomes.net">
            <img src="<c:url value="/resources/img/logo.png" />" height="30" class="d-inline-block align-top">
        </a>
        <ul class="nav navbar-nav ml-auto">
            <button type="button" class="btn btn-md btn-primary" data-toggle="modal" data-target="#loginModal">
                LOGIN
            </button>
        </ul>

    </nav>

    <div class="banner">
        <div class="overlay"></div>
        <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
            <source src="<c:url value='/resources/img/typing-video.mp4' />" type="video/mp4">
        </video>
        <div class="container h-100">
            <div class="d-flex h-100 text-center align-items-center">
                <div class="w-100 text-white">
                    <h1 class="display-3"><img src="<c:url value="/resources/img/logo.svg" />" height="300"
                                               class="align-center"></h1>
                    <p class="lead mb-0">Create a login today.</p>
                    <br>
                    <button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#signupModal">
                        SIGN UP
                    </button>
                </div>
            </div>
        </div>
    </div>

</header>


<main role="main">

    <!-- Project Content -->
    <div class="container project">

        <hr class="feature-divider">

        <div class="row">
            <div class="col-md-7">
                <h2 class="feature-heading">Created using: <span class="text-muted">JSP, Javascript, Spring Security...</span>
                </h2>
                <p class="lead">This site was created using Java and the Spring MVC framework. Spring Security is used to handle user registration
                    and authentication. JSP pages that utilize CSS and Javascript is used for the frontend view. JQuery used for easier code readability.
                </p>
                <p><a href="https://github.com/Broomes/ChatServer" style="text-decoration: none"><img src="<c:url value="/resources/img/GitHub_image.png" />"> Websocket source code</a></p>
                <p><a href="https://github.com/Broomes/ChatAPI" style="text-decoration: none"><img src="<c:url value="/resources/img/GitHub_image.png" />"> Rest API source code</a></p>
                <p><a href="https://github.com/Broomes/ChatClient" style="text-decoration: none"><img src="<c:url value="/resources/img/GitHub_image.png" />"> Frontend source code</a></p>
            </div>
            <div class="col-md-5">
                <img class="feature-image img-fluid mx-auto" alt="Coder's monitor"
                     src="<c:url value='/resources/img/java-image.png' />">
            </div>
        </div>

        <hr class="feature-divider">

        <div class="row">
            <div class="col-md-7">
                <h2 class="feature-heading">Server setup: <span class="text-muted">Tomcat on AWS EC2 and MySQL AWS RDS</span></h2>
                <p class="lead">The project run on AWS services. The Websocket server resides on one EC2 instance running Apache Tomcat 8. The Rest API and
                frontend reside on a shared EC2 Tomcat instance. Both instances have their own AWS load-balancers supporting HTTPS and TCP/SSL respectively.
                The database is a MySQL AWS RDS.</p>
            </div>
            <div class="col-md-5">
                <img class="feature-image img-fluid mx-auto" alt="AWS diagram"
                     src="<c:url value='/resources/img/aws-image.png' />">
            </div>
        </div>

        <hr class="feature-divider">

    </div><!-- /Project Content -->


    <!-- FOOTER -->
    <footer class="container">
        <div class="row">
            <div class="col-4 text-left">
                <p><a href="#">Back to top</a></p>
            </div>
            <div class="col-4 text-center">
                <a href="https://github.com/Broomes" style="text-decoration: none"><img src="<c:url value='/resources/img/GitHub_bottom.png' />" style="height: 2rem;"></a>
                <a href="https://www.linkedin.com/in/broomes" style="text-decoration: none"><img src="<c:url value='/resources/img/linkedin_bottom.png' />" style="height: 2rem;"></a>
            </div>
            <div class="col-4 text-right">
                <p>©2019 broomes.net</p>
            </div>
        </div>
    </footer>
    <!-- /FOOTER -->

</main>


<!--========== Start Modals ===============-->
<!-- Modal (Login) -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="modal-header">
                    <img class="mb-4" src="<c:url value='/resources/img/logo.png'/>" alt="Broomes Chat Logo" height="72"
                         style="max-width: 300px;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="post"
                           class="form-signin">
                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger" role="alert">
                            Invalid username/password.
                        </div>
                    </c:if>

                    <c:if test="${param.logout != null}">
                        <div class="alert alert-success" role="alert">
                            Logged out
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label class="form-text text-muted">Username</label>
                        <input type="text" name="username" class="form-control form-control-lg" placeholder="Username"
                               required="">
                    </div>
                    <div class="form-group">
                        <label class="form-text text-muted">Password</label>
                        <input type="password" name="password" class="form-control form-control-lg"
                               placeholder="Password" required="">
                    </div>
                    <div class="form-group" style="display: inline-block">
                        <label class="form-check-label">Remember Me?</label>
                        <input id="remember" type="checkbox" name="remember-me" value="true"/>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<!-- Modal (Sign Up) -->
<div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Sign Up</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="loadingAnimation" id="loadingAnimation"></div>
                <div id="registrationFormContainer">
                <div id="registrationAlertMessage">
                </div>
                <form:form id="userRegistrationForm"  method="post" enctype="multipart/form-data">

                    <div class="container text-center">
                        <h5>Set Profile Picture</h5>
                        <div class="avatar-upload">
                            <div class="avatar-edit">
                                <input type='file' id="avatar" name="avatar" accept=".png, .jpg, .jpeg, image/png, image/jpeg" />
                                <label for="avatar"></label>
                            </div>
                            <div class="avatar-preview">
                                <div id="imagePreview" style="background-image: url(<c:url value='/resources/img/basic_avatar.jpg' />);">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-text text-muted">Username</label>
                        <input id="username" name="username" type="text" placeholder="username" class="form-control form-control-lg"/>
                    </div>
                    <div class="form-group">
                        <label class="form-text text-muted">Password</label>
                        <input id="password" name="password" type="password" placeholder="password"
                               class="form-control form-control-lg"/>
                    </div>
                    <div class="form-group">
                        <label class="form-text text-muted">Confirm Password</label>
                        <input type="password" name="confirmPassword" placeholder="confirm password"
                               class="form-control form-control-lg"/>
                    </div>
                    <div class="text-center">
                        <button id="submit" type="submit" class="btn btn-primary">SIGN UP</button>
                    </div>
                </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--========== End Modals ===============-->

<!-- Bootstrap core JavaScript
       ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

<script src="<c:url value="/resources/js/index.js" />" type = "text/javascript"></script>

</body>

</html>