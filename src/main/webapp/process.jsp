<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String id = null;
	String password = null;
	String name = null;
	String gender = null;
	String birth = null;
	String mail = null;
	String phone = null;
	String register = "2022/08/25";

	if (request.getParameter("id") != null) {
		id = (String) request.getParameter("id");
	}
	if (request.getParameter("password") != null) {
		password = (String) request.getParameter("password");
	}
	if (request.getParameter("name") != null) {
		name = (String) request.getParameter("name");
	}
	if (request.getParameter("gender") != null) {
		gender = (String) request.getParameter("gender");
	}
	if (request.getParameter("birth") != null) {
		birth = (String) request.getParameter("birth");
	}
	if (request.getParameter("mail") != null) {
		mail = (String) request.getParameter("mail");
	}
	if (request.getParameter("phone") != null) {
		phone = (String) request.getParameter("phone");
	}

	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(id, password, name, gender, birth, mail, phone, register);
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>