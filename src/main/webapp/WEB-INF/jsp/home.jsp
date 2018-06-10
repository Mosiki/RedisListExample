<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2>Hello World!</h2>
<table >
    <th>序号</th>
    <th>名称</th>
    <c:forEach items="${phones}" var="b">
    <tr>
        <td>${b.id}</td>
        <td>${b.name}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
