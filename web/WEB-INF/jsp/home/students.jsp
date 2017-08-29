

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/" >
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    </head>
    <body>
        <div style="margin-top: 50pxpx;padding: 10px;font-size: 20px;font-family: inherit">
        <CENTER>
               <% session.setAttribute("userkt", null);%>
        <jsp:include page="../menu.jsp"/>
        <form:form action="home/students.html" > 
            <div>Top Sinh Vien :
                <a href="../../web.xml"></a>
            </div>
            <table >
                <tr>
                    <th>Ma Sinh Vien</th>
                    <th>Ten Nhan Vien</th>
                    <th>Diem</th>
                    <th>Chuc Vu</th>
                </tr>
                <c:forEach var="a" items="${arrays}">
                    <tr>
                        <td>${a[0]}</td>
                        <td>${a[1]}</td>
                        <td>${a[3]}</td>
                        <td>${a[2]}</td>
                    </tr>
                </c:forEach>
            </table>
        </form:form>
        </CENTER>
        </div>
    </body>
</html>
