<%-- 
    Document   : login
    Created on : Sep 1, 2023, 9:20:47?AM
    Author     : lenovo
--%>



<%@ page import="java.sql.*" %>
    <% 
        String enteredUsername=request.getParameter("username"); 
        String enteredPassword=request.getParameter("create_password");
        try { Class.forName("com.mysql.jdbc.Driver"); 
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root" , "Pr@n@th1" );
            PreparedStatement ps=conn.prepareStatement("select * from login where username=? and create_password=?");
            ps.setString(1, enteredUsername);
            ps.setString(2, enteredPassword); 
            ResultSet rs=ps.executeQuery(); 
            if (rs.next()) { 
                // User found, authentication success
                   //out.println("Logged in successfully");
                out.print("<html><body>");
                out.println("<script>");
                out.println("alert('Logged in successfully!!')"); 
                out.print("window.location.href = 'index.html';");
                out.println("</script>");
                out.println("</body></html>");
        } 
            else { 
                // User not found or authentication failed
                out.print("<html><body>");
                out.println("<script>");
                out.println("alert('Authentication failed. Username or password may be wrong!!')"); 
                out.print("window.location.href = 'loginpage.html';");
                out.println("</script>");
                out.println("</body></html>");
                
            } 
        } catch (Exception e) { 
            out.println(e); 
        } 
    %>
