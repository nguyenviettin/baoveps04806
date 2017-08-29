
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
   <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    </head>
    <body>
    <CENTER>
         <DIV style="margin-top: 50pxpx;padding: 10px;font-size: 20px;font-family: inherit">
        <jsp:include page="../menu.jsp"/>
        <div >
            <div>
                <div>
                    <form:form action="home/report.html" modelAttribute="records" method="post"> 

                        <div>   
                            <label>Nhan Vien</label>   

                            <select  name="test" > 
                                <c:forEach var="a" items="${rc}">
                                    <option value="${a.id}"> ${a.name} </option>
                                </c:forEach>
                            </select>
                        </div>  
                        <div>   
                            <label>Loai</label>  
                            <form:radiobutton path="type" value="1" label="Thành tích"/>  
                            <form:radiobutton path="type" value="0" label="Kỷ luật"/>  
                        </div>  
                        <div> 
                            <label>Ly do</label>   
                            <form:textarea path="reason" rows="3" />  
                        </div>  
                        <div>   
                            <button>Insert</button>  
                        </div>

                    </form:form> 
                </div>
            </div>
        </div>
        <CENTER>
            <div>
            </body>
            </html>
