<%-- 
    Document   : menu
    Created on : 08-Jun-2017, 10:21:13
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>


 
        <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

        
    
            <c:set var="kt3" value="${userkt}"/>
            <c:if test="${ empty kt3}" >

                <a href="home/students.html"><s:message code="global.menu.management"/></a> |
                <a href="home/login.html"><s:message code="global.login"/></a> |
                <a href="#" data-lang="en">English</a> |
                <a href="#" data-lang="vi">Tiếng Việt</a>
            </c:if>


                <a href="${pageContext.servletContext.contextPath}/home/departs.html"><s:message code="global.company"/></a> |
                <a href="${pageContext.servletContext.contextPath}/home/staffs.html"><s:message code="global.menu.home"/></a> |
                <a href="${pageContext.servletContext.contextPath}/home/result.html"><s:message code="global.menu.about"/></a> |
                <a href="${pageContext.servletContext.contextPath}/home/logout.html"><s:message code="global.logout"/></a> |
                  <a href="#" data-lang="en">English</a> |
                <a href="#" data-lang="vi">Tiếng Việt</a>
  


            <script>
                $(function () {
                    $("a[data-lang]").click(function () {
                        var lang = $(this).attr("data-lang");
                        $.get("<%= request.getAttribute("javax.servlet.forward.request_uri")  %>?language=" + lang, function () {
                            location.reload();
                        });
                        return false;
                    });
                });
            </script>

