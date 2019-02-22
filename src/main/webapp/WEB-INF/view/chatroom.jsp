<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Broomes Chat</title>
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico" />" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link  type="text/css" href="<c:url value="/resources/css/chatroom_style.css" />" rel="stylesheet">

        <%--Internal script below needed to access user and room info needed in external .js --%>
        <script>
            var sender = '<security:authentication property="principal.username" />';
            var room = '${room}';
        </script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img  height="30" class="d-inline-block align-top"  src='<c:url value="/resources/img/logo.png" />' alt='Broomes Chat Logo' />
            </a>
            <div id="status" class="narbar-text">Connecting...</div>
            <button type="button" class="btn btn-danger navbar-btn navbar-right" id="close">Close</button>
        </div>
    </nav>


    <div class="container">

        <div class="row">
            <div class="col-10">
                <div class="content-left">
                    <div class="p-3 mb-2 bg-light">
                        <ul class="list-group list-unstyled" id="messages"></ul>
                    </div>
                </div>
            </div>
            <div class="col-2 .d-sm-none .d-md-block">
                <div class="content-right">
                    <ul class="list-group list-unstyled" id="participants"></ul>
                </div>
            </div>
        </div>

        <div class="foot text-center">
                <form:form id="message-form" action="#" method="post">
                    <table class="w-100">
                        <tr class="h-100">
                            <td>
                                <small id="characterLeft" class="form-text text-muted">You have reached the limit</small>
                            </td>
                        </tr>
                        <tr class="h-100">
                            <td class="w-80">
                                <input class="form-control form-control-lg" id="message" placeholder="Write your message here..." maxlength="500" />
                            </td>
                            <td class="w-20">
                                <button type="submit" class="btn btn-primary btn-block btn-lg">SEND</button>
                            </td>
                        </tr>
                    </table>
                </form:form>
        </div>

    </div>


    <script src="<c:url value="/resources/js/websocket.js" />" type = "text/javascript"></script>
    <script src="<c:url value="/resources/js/chatroom.js" />" type = "text/javascript"></script>
</body>
</html>
