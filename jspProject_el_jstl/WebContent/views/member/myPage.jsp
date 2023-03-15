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
        margin: auto;
        margin-top: 50px;
    }

    #mypage-form table{margin: auto;}
    #mypage-form input{margin: 5px;}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"></jsp:include>
    

    <div class="outer">

        <br>
        <h2 align = "center">마이페이지</h2>

        <form id="mypage-form" action="update.me" method="post">

            <table>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" maxlength="12" value = "${loginUser.userId }" readonly></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="6" value="${loginUser.userName }" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;전화번호</td>
                    <td><input type="text" name="phone" placeholder="- 포함해서 입력" value="${loginUser.phone }"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email" value="${loginUser.email }"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address" value="${loginUser.address }"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;관심분야</td>
                    <td colspan="2">
                        <input type="checkbox" name="interest" id="sports" value="운동">
                        <label for="sports">운동</label>

                        <input type="checkbox" name="interest" id="hiking" value="등산">
                        <label for="hiking">등산</label>

                        <input type="checkbox" name="interest" id="fishing" value="낚시">
                        <label for="fishing">낚시</label>
                        <br>
                        <input type="checkbox" name="interest" id="cooking" value="요리">
                        <label for="cooking">요리</label>

                        <input type="checkbox" name="interest" id="game" value="게임">
                        <label for="game">게임</label>

                        <input type="checkbox" name="interest" id="movie" value="영화">
                        <label for="movie">영화</label>
                    </td>
                </tr>
            </table>
            
            <script>
            	$(function(){
            		const interest = "${loginUser.interest }";
            		// 현재 로그인한 회원의 관심분야들
            		// "" | "운동,등산,게임"
            		
            		$("input[type=checkbox]").each(function(){
            			// $(this) : 순차적으로 접근되는 체크박스요소
            			// $(this).val() : 해당 체크박스의 value 값
            			if(interest.search($(this).val()) != -1){
            				$(this).attr("checked", true);
            			}
            		})
            	})
            </script>

            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-sm btn-secondary">정보변경</button>
                <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#updatePwdModal">비밀번호변경</button>
                <button type="button" class="btn btn-sm btn-danger"  data-keyboard="false" data-target="#deleteModal">회원탈퇴</button>
            </div>

            <br><br>

        </form>
    </div>
    
	<!-- 비밀번호 변경용 Modal -->
	<div class="modal" id="updatePwdModal" data-toggle="modal" data-backdrop = "static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" align="center">
	       
	       <form action ="updatePwd.me" method="post">
	       <input type="hidden" name = "userId" value = "${loginUser.userId }">
                <table>
                    <tr>
                        <td>현재비밀번호</td>
                        <td><input type="password" name="userPwd" required></td>
                    </tr>
                    <tr>
                        <td>변경할 비밀번호</td>
                        <td><input type="password" name="updatePwd" required></td>
                    </tr>
                    <tr>
                        <td>변경할 비밀번호 확인</td>
                        <td><input type="password" name="checkPwd" required></td>
                    </tr>
                </table>
	       
                <br>

                <button type="submit" class="btn btn-sm btn-secondary" onclick="return validatePwd();">비밀번호 변경</button>
	       
	       		<br><br>
	       </form>

	      </div>
	      
	       <script>
                function validatePwd(){
                    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                        alert("변경할 비밀번호가 일치하지 않습니다.");
                        return false;
                    }
                }
           </script>
	
	    </div>
	  </div>
	</div>

    <!-- 회원탈퇴용 Modal -->
	<div class="modal" id="deleteModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">회원탈퇴</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" align="center">
             
             <form action ="delete.me" method="post">
                <b>탈퇴 후 복구가 불가능 합니다. <br>정말로 탈퇴하시겠습니까? </b> <br><br>
				<input type = "hidden" name="userId" value = "${loginUser.userId }">
				
				
					
                비밀번호 : <input type="password" name="userPwd" required> <br><br>
                <button type="submit" class="btn btn-sm btn-danger">탈퇴하기</button>
             </form>
  
            </div>
            
      
          </div>
        </div>
      </div>

</body>
</html>