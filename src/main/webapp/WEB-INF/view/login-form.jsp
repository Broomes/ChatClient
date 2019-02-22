<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Broomes Chat</title>
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico" />" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/login-form.css' />">
</head>
<body class="text-center">

    <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="post" class="form-signin">

        <img class="mb-4" src="<c:url value='/resources/img/logo.png'/>" alt="Broomes Chat Logo" height="72" style="max-width: 300px;">

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
        <label class="sr-only">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" required="">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <div class="alert alert-light" role="alert">
            <a href="#" class="alert-link">New user? Click here to register.</a>
        </div>
    </form:form>

</body>
</html>
