

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
                            <label>photo</label>   
                            <input type="text"  name="photo" /> 
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
                            <label>notes</label>   
                           <input type="text"  name="notes" /> 
                        </div>
                        <div>   
                            <label>salary</label>   
                            <input type="text"  name="salary" /> 
                        </div>
                        <div>   
                            <label>departsID</label>   
                             <form:select path="depart.Id" items="${depart}" itemValue="id" itemLabel="name"/> 
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
            </div>
        </div>
        </DIV>
        </CENTER>
    </body>
</html>
