<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Broomes Chat</title>
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico" />" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
</head>
<body>

    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <button type="submit" class="btn btn-danger btn-lg">Logout</button>
    </form:form>

    <div class="login-form">
        <form:form action="chatroom" method="get">
            <h2 class="text-center">Join a chatroom</h2>
            <div class="form-group">
                <input type="text" class="form-control" name="room" placeholder="Chatroom" required="required">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-lg btn-block">Join</button>
            </div>
        </form:form>
    </div>

</body>
</html>