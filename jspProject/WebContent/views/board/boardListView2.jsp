<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="resources/css/paginate.css">
 <link rel="stylesheet" href="resources/css/ligne.css">
    <script type="text/javascript" src="resources/js/paginate.js"></script>
<style>
    
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
    
    <div class="outer">
        <br>
        <h2 align="center">일반게시판</h2>
        <br>


        <!-- 로그인한 회원만 보여지는 div -->
        <div align="right" style="width:860px">
            <button>글작성</button>
            <br><br>
        </div>

       <div class="container">
    <div class="panel">
        <div class="body">
            <div class="input-group">
                <label for="searchBox">Filtrar</label>
                <input type="search" id="searchBox" placeholder="Filtrar...">
            </div>
        </div>
    </div>
    <table align="center" class="list-area myTable table hover">
        <thead>
            <tr>
                <th width="70">글번호</th>
                <th width="80">카테고리</th>
                <th width="300">제목</th>
                <th width="100">작성자</th>
                <th width="50">조회수</th>
                <th width="100">작성일</th>
            </tr>
        </thead>
        <tbody>
            <% if(list.isEmpty()){ %>
                <!-- case1. 게시글이 없을 경우 -->
                <tr>
                    <td colspan="6">조회된 게시글이 없습니다.</td>
                </tr>
                <%}else{ %>

                <!-- case2. 게시글이 있을 경우 -->
	                <% for(Board b : list){ %>
	                <tr>
	                    <td><%=b.getBoardNo() %></td>
	                    <td><%=b.getCategory() %></td>
	                    <td><%= b.getBoardTitle() %></td>
	                    <td><%= b.getBoardWriter() %></td>
	                    <td><%= b.getCount() %></td>
	                    <td><%= b.getCreateDate() %></td>
	                </tr>
	                <%} %>
                <%} %>
        </tbody>
    </table>
</div>
<script>

    let options = {
        numberPerPage:10, //Cantidad de datos por pagina
        goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
        pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
    };

    let filterOptions = {
        el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
    };

    paginate.init('.myTable',options,filterOptions);
</script>
    </div>

</body>
</html>