package com.kh.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.model.vo.Member;

/**
 * Servlet implementation class JqAjaxController4
 */
@WebServlet("/jqAjax4.do")
public class JqAjaxController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ArrayList<Member> list = new MemberService().selectMemberList();
		ArrayList<Member> list = new ArrayList<Member>();
		
		list.add(new Member(1, "문동은", 20, "여")); // JSONObject {}
		list.add(new Member(2, "박연진", 21, "여")); // JSONObject {}
		list.add(new Member(3, "전재준", 22, "남")); // JSONObject {}
		
		// JSONArray [{}, {}, {}]
		
		/*
		JSONArray jArr = new JSONArray(); // []
		for(Member m :list) {
			JsonObject jObj = new JsonObject();
			jObj.put("userNo",m.getUserNo());
			jObj.put("userName",m.getUserName());
			jObj.put("age",m.getAge());
			jObj.put("gender",m.getGender());
			
			jArr.add(jObj);
			
		}
		*/
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list,response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
