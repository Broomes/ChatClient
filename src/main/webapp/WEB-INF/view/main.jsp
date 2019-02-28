<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Broomes Chat</title>
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico" />" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
    <script>
        var sender = '<security:authentication property="principal.username" />';
        var admin_avatar = '<c:url value="/resources/img/admin_avatar.png" />';
    </script>
</head>
<body>
    <!--========== Header ============-->
    <header>
        <nav class="navbar navbar-expand-md fixed-top navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="https://broomes.net">
                <img src="<c:url value="/resources/img/logo.png" />" height="30" class="d-inline-block align-top">
            </a>
            <ul class="nav navbar-nav ml-auto">
            <form:form action="${pageContext.request.contextPath}/logout" method="post">
                <button type="submit" class="btn btn-md btn-outline-primary" data-toggle="modal" data-target="#loginModal">
                    LOGOUT
                </button>
            </form:form>
            </ul>
        </nav>
    </header>

    <div class="create-button text-center">
        <div class="row" style="width:100%;">
            <div class="col">
                <button type="button" class="btn btn-lg btn-outline-dark" data-toggle="modal"
                        data-target="#createRoomModal">CREATE
                    ROOM</button>
            </div>
        </div>
    </div>

    <hr class="divider">

    <div id="serverMessage"></div>

    <main role="main">

        <!-- ROOM CARDS -->
        <div class="container text-center">
            <div class="row">
                <ul class="list-inline" id="rooms">
                </ul>
            </div>
        </div>
        <!-- /ROOM -->

        <hr class="divider">

        <!-- FOOTER -->
        <footer class="container">
            <p class="float-right"><a href="#">Back to top</a></p>
            <p>©2019 broomes.net</p>
        </footer>
        <!-- /FOOTER -->

    </main>


    <!--========== Start Modals ===============-->
    <!-- Modal (Create Room) -->
    <div class="modal fade" id="createRoomModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h3 class="modal-title w-100">Create a new chatroom</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form:form id="createRoomForm" method="post" class="form-createRoom">
                        <span id="roomCreatedResponse"></span>

                        <div class="form-group">
                            <label class="sr-only">Room Name</label>
                            <input type="text" id="roomName" name="roomName" placeholder="room name" class="form-control form-control-lg" required="" autofocus="" />
                            <label class="sr-only">Description</label>
                            <input type="text" id="roomDesc" name="roomDesc" placeholder="room description" class="form-control form-control-lg"  required="" />
                        </div>
                        <div class="text-center">
                            <button id="submit" type="submit" class="btn btn-block btn-primary">CREATE</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal (Chat Room) -->
    <div class="modal fade" id="chatRoomModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="overflow-y: scroll; max-height:85vh;  margin-top: 30px; margin-bottom:30px;">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h3 id="status" class="modal-title w-100">Connecting...</h3>
                    <button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="message-area">
                    <div class="content-left p-3 bg-light">
                        <ul class="list-group list-unstyled" id="messages" style="padding-bottom: 0.5rem"></ul>
                    </div>
                    <div class="content-right">
                        <ul class="list-group list-unstyled" id="participants"></ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <form:form id="message-form" class="w-100" action="#" method="post">
                    <table class="w-100">
                        <tr class="w-100">
                            <td class="w-80">
                                <small id="characterLeft" class="form-text text-muted">You have reached the limit</small>
                                <input class="form-control form-control-lg" id="message" placeholder="Write your message here..." maxlength="500" autofocus="" />
                            </td>
                            <td class="w-20">
                                <button type="submit" class="btn btn-primary btn-block btn-lg">SEND</button>
                            </td>
                        </tr>
                    </table>
                    </form:form>
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
    <script src="<c:url value="/resources/js/chatroom.js" />" type = "text/javascript"></script>

    <script src="<c:url value="/resources/js/websocket.js" />" type = "text/javascript"></script>

    <%-- Script needed to get autofocus to work with bootstrap modal --%>
    <script>
        $('.modal').on('shown.bs.modal', function() {
            $(this).find('[autofocus]').focus();
        });
    </script>

</body>
</html>