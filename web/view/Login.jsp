<%-- 
    Document   : Login
    Created on : 16-Jul-2022, 19:49:56
    Author     : duyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </head>
    <body>
        <div style="margin-top: 200px">
            <form action="login" method="POST">
                <table style="margin-left: auto; margin-right: auto">
                    <tr>
                        <td>Username</td>
                        <td>
                            <input type="text" name="username">
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <input type="password" name="password">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <input type="submit" value="Login">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
