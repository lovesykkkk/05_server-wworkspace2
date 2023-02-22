package com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.model.vo.Member;

/**
 * Servlet implementation class JqAjaxController3
 */
@WebServlet("/jqAjax3.do")
public class JqAjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("no"));
		
		// Member m = new MemberSerivice().selectMember(userNo);
		// 위의 Member 객체에 각 필드에 조회된 데이터들이 담겨 있을 것
		
		Member m = new Member(1, "차은우", 20, "남"); // 조회된 데이터가 다음과 같다는 가정하에
		
		//response.getWriter().print(m); // vo 객체를 곧바로 응답시 .toString()의 문자열이 응답
		
		
		/*
		// JSONObject {key:value, key:value, ..} 에 직접담기
		JSONObject jObj = new JSONObject(); 	// {}
		jObj.put("userNo", m.getUserNo());  	// {userNo:1}
		jObj.put("userName", m.getUserName());  // {userNo:1, userName:"차은우"}
		jObj.put("age", m.getAge());			// {userNo:1, userName:"차은우", age:20}
		jObj.put("gender", m.getGender());      // {userNo:1, userName:"차은우", age:20, gender:"남"}
		
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj);
		*/
		
		// 더 더 간단한 방법 : 위의 과정을 알아서 해주는 GSON 라이브러리 사용
		// GSON : Google JSON => mvnrepository
		
		response.setContentType("application/json; charset=utf-8");
		
		//Gson gson = new Gson(); // Gson객체.toJson(응답할 자바객체, 응답할 스트림);
		//gson.toJson(m,response.getWriter());
		
		// 위의 두줄을 한줄로
		new Gson().toJson(m,response.getWriter());
		
		// Gson을 이용해서 vo 객체 하나만 응답시 JSONObject {key:value, key:value, ..} 형태로 만들어져서 응답
		// 이때 key는 해당 vo 객체의 필드명으로 알아서 셋팅됨
		
		// Gson을 이용해서 자바배열 또는 ArrayList 응답시 JSONArray [value, value, ..] 형태로 만들어져서 응답
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}









