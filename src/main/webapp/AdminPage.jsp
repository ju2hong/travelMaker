<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.java.user.UserDao" %>
<%@ page import="com.java.user.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
     #nav-container {
            width: 700px; /* 큰 네모 크기 설정 */
            height: 300px;
            border: 2px solid #ccc; /* 테두리 설정 */
            padding: 10px; /* 안쪽 여백 설정 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            position: absolute;
            top: 150px;
            left: 150px;
     }
    
    
    </style>
</head>
<body>
<div class="container containerSize" style="padding:0;">
	<jsp:include page="module/header.jsp"/>
	<h2 style="text-align: center;">Admin Page</h2>
</div>
<div id="nav-container">


<h3>이메일로 검색하기</h3>
<form method="post" action="/TravelMaker/search.do">
    <input type="text" id="searchEmail" name="searchEmail" placeholder="검색어 입력">
    <button type="submit">검색</button>
</form>
 
<%
    // DAO 클래스 및 메서드 호출
    UserDao userDao = new UserDao();
    ArrayList<UserDTO> userList = userDao.getAllUsers();
%>


<h2 style="text-align: center;">Travel Maker 회원명단</h2>
<table border="1" >
    <thead>
        <tr>
            <th>UserEmail</th>
            <th>UserPwd</th>
            <th>UserNName</th>
            <th>UserEName</th>
            <th>UserCountry</th>
            <th>UserBirth</th>
            <th>UserDelete</th>
        </tr>
    </thead>
    <tbody>
        <% for (UserDTO user : userList) { %>
            <tr>
                <td><%= user.getUserEmail() %></td>
                <td><%= user.getUserPwd() %></td>
                <td><%= user.getUserNName() %></td>
                <td><%= user.getUserEName() %></td>
                <td><%= user.getUserCountry() %></td>
                <td><%= user.getUserBirth() %></td>
                <td><button onclick="" style="background-color: red; width: 80px;">계정 삭제</button></td>
            </tr>
        <% } %>
    </tbody>
</table>
</div>
</body>
</html>
    