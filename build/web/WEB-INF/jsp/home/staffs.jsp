
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
         <DIV style="margin-top: 50pxpx;padding: 10px;font-size: 20px;font-family: inherit">
    <CENTER>
        <jsp:include page="../menu.jsp"/>
   
             <div>
                    <form:form action="home/insert.html" modelAttribute="edit" method="post"> 
                        <div>   
                            <label>ID</label>   
                            <input type="text"  name="id" /> 
                        </div> 
                        <div>   
                            <label>name</label>   
                           <input type="text"  name="name" /> 
                        </div>
                     
                        <div>   
                            <label>email</label>   
                            <input type="text"  name="email" /> 
                        </div>
                        <div>   
                            <label>phone</label>   
                            <input type="text"  name="phone" /> 
                        </div>
                      
                        <div>   
                            <label>Loai</label>  
                            <input type="radio" value="1" name="gender" /> Nam 
                            <input type="radio" value="0" name="gender" /> Nu 
                        </div> 
                        <div>   
                            <label>ngay thang</label>  
                            <input type="date"  name="aa" /> 
                        </div>
                        <div>   
                            <button>Insert</button>  
                        </div>

                    </form:form> 
                </div>
        <table >
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
               
                <th>gender</th>
     
                <th>birthday</th>
                <th></th>
            </tr>
            <c:forEach var="u" items="${staffs}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                    <td>${u.email}</td>
                    <td>${u.phone}</td>
                    <td>
                        <c:choose>
                            <c:when test="${u.gender==true}">Nam</c:when>
                            <c:otherwise>Nu</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${u.birthday}</td>
                    <td><a href="home/delete/${u.id}.html">Delete</a></td>
                    <td><a href="home/edit/${u.id}.html">Edit</a></td>
                </tr>
            </c:forEach>
        </table>
        <form:form action="home/insert.html" modelAttribute="edit"  method="GET">
            <button>Them Nhan Vien</button>
        </form:form>
           
</CENTER>
         </div>
          ${message}+123
    </body>
</html>
