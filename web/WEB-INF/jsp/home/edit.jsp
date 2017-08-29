
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
    <jsp:include page="../menu.jsp"/>
        <h2>THÔNG TIN CHI TIẾT</h2>
        <ul>
            <li>ID: ${user1.id}</li>
            <li>Ten: ${user1.name}</li>
            <li>Photo: ${user1.photo}</li>
            <li>Email: ${user1.email}</li>
            <li>Phone: ${user1.phone}</li>
            <li>Notes: ${user1.notes}</li>

            <li>Salary: ${user1.salary}</li>
            <li>Gender: ${user1.gender}</li>
            <li>Birthday: ${user1.birthday}</li>
        </ul>
        <div >
            <div>
                <div>
                    <form:form action="home/edit/${user.id}.html" modelAttribute="edit" method="post"> 

                        <div>   
                            <label>Ma Nhan vien</label>   
                            <input name="id"  value="${user1.id}" readonly="true"/> 
                        </div>
                        <div>   
                            <label>Ten Nhan vien</label>   
                            <input name="name" value="${user1.name}" /> 
                        </div> 
                        <div>   
                            <label>Hinh Anh</label>   
                            <input name="photo" value="${user1.photo}" /> 
                        </div> 
                        <div>   
                            <label>Email</label>   
                            <input name="email" value="${user1.email}"/> 
                        </div> 
                        <div>   
                            <label>Phone</label>   
                            <input name="phone" value="${user1.phone}"/> 
                        </div> 

                        <div>   
                            <label>Notes</label>   
                            <input name="notes" value="${user1.notes}"/> 
                        </div>
                        <div>   
                            <label>departsID</label>   
                            <form:select path="depart.Id" items="${depart}" itemValue="id" itemLabel="name" id="cuong" /> 

                        </div>
                        <div>   
                            <label>Salary</label>   
                            <input name="salary" value="${user1.salary}" /> 
                        </div> 
                        <div>   
                            <label>Gender</label> 

                            <c:choose>
                                <c:when test="${user1.gender==true}">
                                    <input type="radio" name="gender" value="true" label="Nam" checked="checked" />Nam
                                    <input type="radio" name="gender" value="false" label="Nu"  />Nu
                                </c:when>
                                <c:otherwise>
                                    <input type="radio" name="gender" value="true" label="Nam"  />Nam
                                    <input type="radio" name="gender" value="false" label="Nu" checked="checked"  />Nu

                                </c:otherwise>
                            </c:choose>




                        </div> 
                        <div>   
                            <label>Birthday</label>   
                            <input type="date" name="day" value="${user1.birthday}"/> 
                        </div> 


                        <div>   
                            <button>Update</button>  
                        </div>

                    </form:form> 
                </div>
            </div>
        </div>
        </CENTER>
    </body>
</html>
