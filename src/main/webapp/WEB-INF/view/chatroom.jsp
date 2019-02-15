<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Broomes Chat</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="<c:url value="/resources/css/chatroom_style.css" />" rel="stylesheet">
        <script>
            var sender = '${sender}';
            var room = '${room}';
        </script>
</head>
<body>
    <div class="container">

        <div class="head">
            <a class="navbar-brand" href="#">Broomes Chat</a>
            <div id="status">Connecting...</div>
        </div>

        <div class="content-left">
            <div class="p-3 mb-2 bg-light">
                <ul class="list-group list-unstyled" id="messages"></ul>
            </div>
        </div>
        <div class="content-right">
            <ul class="list-group list-unstyled" id="participants"></ul>
        </div>

        <div class="foot">
            <form id="message-form" action="#" method="post">
                <div class="row">
                    <div class="col-12">
                        <textarea class="form-control input-sm " type="textarea" id="message" placeholder="Write your message here..." maxlength="500" rows="3"></textarea>
                        <span class="help-block"><p id="characterLeft" class="help-block ">You have reached the limit</p></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">SEND</button>
                        <button type="button" id="close" class="btn btn-danger">CLOSE</button>
                    </div>
                </div>
            </form>
        </div>


<script src="<c:url value="/resources/js/websocket.js" />" type = "text/javascript"></script>
    <script src="<c:url value="/resources/js/chatroom.js" />" type = "text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js" integrity="sha384-7aThvCh9TypR7fIc2HV4O/nFMVCBwyIUKL8XCtKE+8xgCgl/PQGuFsvShjr74PBp" crossorigin="anonymous"></script>

</body>
</html>
