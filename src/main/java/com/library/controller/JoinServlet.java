package com.library.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/memebr/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/member/join.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String memberPhone = request.getParameter("memberPhone");
		String memberGender = request.getParameter("memberGender");
		int memberAge = Integer.parseInt(request.getParameter("memberAge"));
		
		String adminYN = request.getParameter("adminYN");
		
		Member member = new Member(memberName, memberId, memberPw, memberPhone, memberGender,memberAge ,adminYN);
		System.out.println(member.toString());
		MemberService mService = new MemberService();
		
		int result = mService.insertMember(member);
		if(result > 0) {
			response.sendRedirect("/");
		}}
	}

}
