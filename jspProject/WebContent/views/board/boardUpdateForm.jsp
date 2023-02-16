<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="com.kh.board.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
	Board b = (Board)request.getAttribute("b");
	// 글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일
	Attachment at = (Attachment)request.getAttribute("at");
	// 첨부파일이 없을 경우 null
	// 첨부파일이 있을 경우 파일번호, 원본명, 수정명, 저장경로
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background-color: black;
        color: white;
        width: 1000px;
        height: 550px;
        margin: auto;
        margin-top: 50px;
    }
   /* #enroll-form table{border: 1px solid white;}*/
    #update-form input, #update-form textarea{
        width: 100%;
        box-sizing: border-box;
    }
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">일반게시판 수정하기</h2>
        <br>

        <form id= "update-form" action="" method="post" enctype="multipart/form-data"> <!--  파일자체를 넘기려면 enctype 필요 -->

            <!-- 카테고리, 제목, 내용, 첨부파일 한 개, 로그인한 회원 번호 (히든) -->
            <table align="center">
                <!-- (tr>th+td)*4 -->
                <tr>
                    <th width="70">카테고리</th>
                    <td width="500">
                        <select name="category">
                            <!-- category 테이블로부터 조회해오기 -->
                            <% for(Category c : list) { %>
                            	<option value="<%= c.getCategoryNo()%>"><%= c.getCategoryName() %></option>
                            <% } %>
                        </select>
                        
                        <script>
                        	$(function(){
                        		$("#update-form option").each(function(){
                        			if($(this).text() == "<%= b.getCategory()%>"){
                        				$(this).attr("selected",true);
                        			}
                        		})
                        	})
                        </script>
                        
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required value="<%=b.getBoardTitle()%>"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea rows="10" name="content" style="resize: none;" required><%= b.getBoardContent() %></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                        <!-- 현재 이 게시글에 붙은 첨부파일이 있을 경우 -->
                        <% if(at != null){ %>
                        	<%= at.getOriginName() %>
                        <% } %>
                        <input type="file" name="upfile"></td>
                </tr>
            </table>
            <br>

            <div align="center">
                <button type="submit">수정하기</button>
                <button type="reset">취소하기</button>
            </div>





        </form>
    </div>
</body>
</html>