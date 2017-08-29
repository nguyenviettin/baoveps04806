
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
        <DIV style="margin-top: 50pxpx;padding: 10px;font-size: 20px;font-family: inherit">
    <CENTER>
        <jsp:include page="../menu.jsp"/>
        <h1>Phòng Ban</h1>

        <form:form action="home.html" modelAttribute="pb">
           
            <div>ID</div>
            <form:input path="id" readonly="true"/>

            <div>Phong Ban</div>
            <form:input path="name" />

            <div>

                <button name="btnIn">Thêm</button>            
                <button name="btnUp">Cập nhật</button>

            </div>

        </form:form>

        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>ID</th>
                <th>Name</th>
            </tr>

            <c:forEach var="rows" items="${departs}">
                <form:form action="del.html" >
                    <tr>
                        <td>${rows.id}</td>
                        <td>${rows.name}</td>
                        
                        <c:url var="del" value="edit.html">
                            <c:param name="txtID" value="${rows.id}"/>
                            <c:param name="txtName" value="${rows.name}"/>

                        </c:url>
                        <td><a href="${del}">Edit</a></td>
                        <td>
                            <input type="hidden" name="txtID" value="${rows.id}"/>
                            <input type="submit" name="action" value="Delete"/>
                        </td>

                    </tr>
                </form:form>
            </c:forEach>  

        </table>
    </CENTER>
        </div>
</body>
</html>
