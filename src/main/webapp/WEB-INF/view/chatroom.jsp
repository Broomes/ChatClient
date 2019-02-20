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
            <div class="row h-100">
                <div class="col-4 h-100">
                    <img  class="logo" src='<c:url value="/resources/img/logo.png" />' alt='Broomes Chat Logo' />
                </div>
                <div class="col-6 text-center h-100">
                    <div id="status" class="text-muted h-100">Connecting...</div>
                </div>
                <div class="col-2 h-100">
                    <button type="button" id="close" class="btn btn-danger btn-block close-button">CLOSE</button>
                </div>
            </div>
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
                    <div class="col-10" style="padding-right: 0px;">
                        <p id="characterLeft" class="help-block ">You have reached the limit</p>
                        <input class="form-control input-sm " id="message" placeholder="Write your message here..." maxlength="500" rows="3" />
                    </div>
                    <div class="col-2">
                        <button id="submit-button" type="submit" class="btn btn-primary btn-block">SEND</button>
                    </div>
                </div>
            </form>
        </div>


<script src="<c:url value="/resources/js/websocket.js" />" type = "text/javascript"></script>
    <script src="<c:url value="/resources/js/chatroom.js" />" type = "text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js" integrity="sha384-7aThvCh9TypR7fIc2HV4O/nFMVCBwyIUKL8XCtKE+8xgCgl/PQGuFsvShjr74PBp" crossorigin="anonymous"></script>

</body>
</html>
