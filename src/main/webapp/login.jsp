<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://database1.c3qvj4speosp.ap-south-1.rds.amazonaws.com:3306/test",
            "admin", "database123");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from USER where username='"+userName+"' and password='"+password+"'");
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
