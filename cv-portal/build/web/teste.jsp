<%-- 
    Document   : teste
    Created on : 18/09/2019, 14:37:06
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String user = request.getParameter("uname");
            String pass = request.getParameter("pass"); 
            
            out.print(user+" "+pass);
        
        %>
    </body>
</html>
