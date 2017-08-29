<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Tích hợp Hibernate</title>
        <base href="${pageContext.servletContext.contextPath}/">
   <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    </head>

    <body class="container">
    <CENTER>
           <DIV style="margin-top: 50pxpx;padding: 10px;font-size: 20px;font-family: inherit">
        <jsp:include page="../menu.jsp"/>
        <h2>THÔNG TIN CHI TIẾT</h2>
        <ul>
            <li>Username: ${user.id}</li>
            <li>Password: ${user.name}</li>
            <li>Fullname: ${user.gender}</li>
            <li>Email: ${user.salary}</li>
            <li>Photo: ${user.phone}</li>
        </ul>
           </div>
    </CENTER>
</body>
</html>
