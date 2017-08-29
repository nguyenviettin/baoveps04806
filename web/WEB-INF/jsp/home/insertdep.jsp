

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    </head>
    <body>
        </CENTER>
        <jsp:include page="../menu.jsp"/>
        <h1>Hello World!</h1>
       <form:form action="home.html" modelAttribute="pb">
            <div>ID</div>
            <form:input path="id" />

            <div>Phong Ban</div>
            <form:input path="name" />

            <div>
                <button name="btnadd">Add</button>      
            </div>
        </form:form>
            </CENTER>
    </body>
</html>
