
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
   <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    </head>
    <body>
         <DIV style="margin-top: 50pxpx;padding: 10px;font-size: 20px;font-family: inherit">
             <CENTER>
        <jsp:include page="../menu.jsp"/>
        <form:form action="home/result.html" modelAttribute="res" method="post" > 
            <div >
                <div >
                 
                    <table >
                        <tr> 
                            <th>Mã PB</th>
                            <th>Tổng thành tích</th> 
                            <th>Tổng kỷ luật</th>
                            <th>Tổng kết</th>
                        </tr> 
                        <c:forEach var="a" items="${arrays}"> 
                            <tr>  
                                <td>${a[0]}</td>  
                                <td>${a[1] }</td> 
                                <td>${a[2]}</td>  
                                <td>${a[1] - a[2]}</td>

                                <c:set var="u" value="${a[0]}" />
                                <td>${u}</td>
                                <td>
                                    <a href="home/report/${u}.html"> detail</a>
                                </td>
                            </tr> 
                        </c:forEach> 
                    </table>
                </div>
            </div>

        </form:form>
        </CENTER>
         </div>
    </body>
</html>
