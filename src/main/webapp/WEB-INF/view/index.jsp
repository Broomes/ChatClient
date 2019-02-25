<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Broomes Chat</title>
  <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico" />" />
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
            <h1 class="display-3"><img src="<c:url value="/resources/img/logo.svg" />" height="300" class="align-center"></h1>
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

    <!-- MARKETING -->
    <div class="container marketing">

      <hr class="feature-divider">

      <div class="row">
        <div class="col-md-7">
          <h2 class="feature-heading">First feature heading. <span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod
            semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
            commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="feature-image img-fluid mx-auto" alt="Coder's monitor"
            src="<c:url value='/resources/img/java-image.png' />">
        </div>
      </div>

      <hr class="feature-divider">

      <div class="row">
        <div class="col-md-7 order-md-2">
          <h2 class="feature-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod
            semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
            commodo.</p>
        </div>
        <div class="col-md-5 order-md-1">
          <img class="feature-image img-fluid mx-auto" alt="Networking image"
            src="<c:url value='/resources/img/network-image.png' />">
        </div>
      </div>

      <hr class="feature-divider">

      <div class="row">
        <div class="col-md-7">
          <h2 class="feature-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod
            semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
            commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="feature-image img-fluid mx-auto" alt="AWS diagram"
            src="<c:url value='/resources/img/aws-image.png' />">
        </div>
      </div>

      <hr class="feature-divider">

    </div><!-- /MARKETING -->


    <!-- FOOTER -->
    <footer class="container">
      <p class="float-right"><a href="#">Back to top</a></p>
      <p>©2019 broomes.net</p>
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
            <img class="mb-4" src="<c:url value='/resources/img/logo.png'/>" alt="Broomes Chat Logo" height="72" style="max-width: 300px;">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>

          <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="post" class="form-signin">
            <c:if test = "${param.error != null}">
              <div class="alert alert-danger" role="alert">
                Invalid username/password.
              </div>
            </c:if>

            <c:if test = "${param.logout != null}">
              <div class="alert alert-success" role="alert">
                Logged out
              </div>
            </c:if>

            <label class="sr-only">Username</label>
            <input type="text" name="username" class="form-control" placeholder="Username" required="" autofocus="">
            <br>
            <label class="sr-only">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Password" required="">
            <br>
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
            <form>
                <div class="form-group">
                  <label class="form-text text-muted">Username</label>
                  <input type="text" name="username" placeholder="username" class="form-control form-control-lg" autofocus="" />
                </div>
                <div class="form-group">
                  <label class="form-text text-muted">Password</label>
                  <input type="password" name="password" placeholder="password" class="form-control form-control-lg" />
                </div>
                <div class="form-group">
                    <label class="form-text text-muted">Confirm Password</label>
                    <input type="password" name="password" placeholder="confirm password" class="form-control form-control-lg" />
                  </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">SIGN UP</button>
                </div>
              </form>
        </div>
      </div>
    </div>
  </div>
  <!--========== End Modals ===============-->

  <!-- Bootstrap core JavaScript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
    crossorigin="anonymous"></script>
  <%-- Script needed to get autofocus to work with bootstrap modal --%>
  <script>
    $('.modal').on('shown.bs.modal', function() {
      $(this).find('[autofocus]').focus();
    });
  </script>

</body>

</html>