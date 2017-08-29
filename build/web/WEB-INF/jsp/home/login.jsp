
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
         <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    </head>
    <body>  <!---->
             
    <CENTER> 
         <h1>Chào Mừng Đến Với Web Quản Lý Nhân Viên</h1>
 
        <DIV style="margin-top: 50pxpx;padding: 10px;font-size: 20px;font-family: inherit">
           
            <jsp:include page="../menu.jsp"/>
          

                <form:form action="home/login.html" modelAttribute="login" >
                  <c:set var="kt1" value="${list}"/>
                          <c:if test="${empty kt1}" >
                        <div style="margin: 20px">Username
                            <input type="text" name="ten" />
                            <form:errors path="username" />
                        </div>
                        <div style="margin: 20px">Password        
                            <input type="text" name="matkhau" />
                            <form:errors path="password" />
                        </div>    
                        <div style="margin-bottom: 20px">Password        
                            <button> Dang Nhap</button> <a href="home/reset.html">Reset password</a>
                        </div>  
                        </c:if>  
               
                    <c:set var="kt" value="${list}"/>
                    <c:if test="${not empty kt}" >
                        Xin chào Administrator : ${list[0].username}
                        <table border="1" >
                            <tr>
                                <td>User</td>
                                <td>Pass</td>
                                <td>FullName</td>
                            </tr>
                            <c:forEach var="rows" items="${list1}">

                                <tr>
                                    <td>${rows.username}</td>
                                    <td>${rows.password}</td>
                                    <td>${rows.fullname}</td>                        
                                </tr>
                                </form>
                            </c:forEach>  
                        </table>
                       
                    </c:if>
                </form:form>
            
    </CENTER>
</body>
</html>
