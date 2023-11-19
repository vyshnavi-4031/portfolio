<%-- 
    Document   : register
    Created on : Sep 1, 2023, 9:51:19?AM
    Author     : lenovo
--%>

<%@ page import = "java.sql.*" %>
<%
String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");
String confirm_password = request.getParameter("confim_password");




try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:/register", "root", "pr@n@thi");
    PreparedStatement ps = conn.prepareStatement("insert into signup(username,email,password,confirm_password) values (?, ?, ?, ?)");
    ps.setString(1, username);
    ps.setString(2, email);
    ps.setString(3, password);
    ps.setString(4,confirm_password);
    int x = ps.executeUpdate();
    if (x > 0) {
        out.print("<html><body>");
                out.println("<script>");
                out.println("alert('Registration successful!!')"); 
                out.print("window.location.href = 'index.html';");
                out.println("</script>");
                out.println("</body></html>");
    }
    else {
        out.println("Registration failed");
    }

}
catch(Exception e) {
    out.println(e);
}
%>
