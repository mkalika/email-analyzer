<%--
  Created by IntelliJ IDEA.
  User: Dinkla
  Date: 13.05.2016
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- %@ taglib prefix="spring" uri="http://www.springframework.org/tags" %-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Import emails into Elasticsearch</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" media="all" type="text/css" />

</head>

<body>

<!-- ------------------------------------- -->
<h1>Import emails into Elasticsearch</h1>

<form:form action="import" method="post" modelAttribute="emailServerProperties">

    <h3>Connection to Elasticsearch</h3>

    <div class="box">

        <p>
           The configuration is defined in the file <code>application.properties</code>.
        </p>

        <table>
            <tr>
                <td>nodes</td>
                <td>${esNodes}</td>
            </tr>
            <tr>
                <td>index</td>
                <td>${esIndex}</td>
            </tr>
            <tr>
                <td>type</td>
                <td>${esType}</td>
            </tr>
        </table>

    </div>


    <h3>Connection to the IMAP/POP3 email provider</h3>

    <div class="box">

        <p>
            <strong>Warning:</strong> the password is transported unencrypted to the web server.
            Use only in a private and secure subnet.
        </p>

        <table>
            <tr>
                <td>protocol</td>
                <td><form:input type="text" path="protocol" /></td>
                <td class="validation-error"><form:errors path="protocol" cssClass="validation-error" /></td>
            </tr>
            <tr>
                <td>host</td>
                <td><form:input type="text" path="host" /></td>
                <td class="validation-error"><form:errors path="host" cssClass="validation-error" /></td>
            </tr>
            <tr>
                <td>user</td>
                <td><form:input type="text" path="user" /></td>
                <td class="validation-error"><form:errors path="user" cssClass="validation-error" /></td>
            </tr>
            <tr>
                <td>password</td>
                <td><form:input type="password" path="password" /></td>
                <td class="validation-error"><form:errors path="password" cssClass="validation-error" /></td>
            </tr>
            <tr>
                <td>folder</td>
                <td><form:input type="text" path="folder" /></td>
                <td class="validation-error"><form:errors path="folder" cssClass="validation-error" /></td>
            </tr>
        </table>

    </div>

    <button class="btn btn-primary" type="submit">Import emails from mail server</button>

</form:form>

<!-- ------------------------------------- -->

<c:if test="${exception}">
    <div class="padded_vert">
        <div class="alert alert-danger">
            <p>
                An exception occurred during the import '${exceptionText}'.
            </p>
        </div>
    </div>
</c:if>

<!-- ------------------------------------- -->
<div class="centered">
    <p>
        Copyright © 2016 Jörn Dinkla, <a href="http://www.dinkla.com">www.dinkla.com</a>
    </p>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>
