<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }
    .list-area{
        width: 760px;
        margin: auto;
    }
    .thumbnail{
        border: 1px solid white;
        width: 220px;
        display: inline-block;
        margin: 14px;
    }
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">사진게시판</h2>
        <br>

		<% if(loginUser != null){ %>
	        <!-- 로그인한 회원만 보여짐 -->
	        <div align="right" style="width: 850px;">
	            <a href="<%= contextPath %>/enrollForm.th" class="btn btn-sm btn-secondary">글작성</a>
	        </div>
	    <% } %>    

        <div class="list-area">
            <!-- 썸네일 한개  -->
            <div class="thumbnail" align="center">
                <img src="<%= contextPath %>/resources/thumbnail_upfiles/" width="200" height="150">
                <p>
                    No.20 제목입니다 <br>
                    조회수 : 230
                </p>
            </div>

            <!-- 썸네일 한개  -->
            <div class="thumbnail" align="center">
                <img src="대표이미지 경로" width="200" height="150">
                <p>
                    No.20 제목입니다 <br>
                    조회수 : 230
                </p>
            </div>

            <!-- 썸네일 한개  -->
            <div class="thumbnail" align="center">
                <img src="대표이미지 경로" width="200" height="150">
                <p>
                    No.20 제목입니다 <br>
                    조회수 : 230
                </p>
            </div>

            <!-- 썸네일 한개  -->
            <div class="thumbnail" align="center">
                <img src="대표이미지 경로" width="200" height="150">
                <p>
                    No.20 제목입니다 <br>
                    조회수 : 230
                </p>
            </div>

            <!-- 썸네일 한개  -->
            <div class="thumbnail" align="center">
                <img src="대표이미지 경로" width="200" height="150">
                <p>
                    No.20 제목입니다 <br>
                    조회수 : 230
                </p>
            </div>


        </div>
    </div>
</body>
</html>