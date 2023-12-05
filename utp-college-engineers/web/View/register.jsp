<%@page import="ModelDAO.PersonasDAO"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String pass = request.getParameter("pass");
        PersonasDAO per = new PersonasDAO();
        pass = per.getMD5(pass);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/utp_database", "root", "");
            Statement statement = connection.createStatement();

            // Verificar si el correo ya está en uso
            String checkQuery = "SELECT correo FROM user WHERE correo = '" + address + "'";
            ResultSet resultSet = statement.executeQuery(checkQuery);

            if (resultSet.next()) {
                // El correo ya está en uso, mostrar un mensaje o redirigir a una página de error
                response.sendRedirect("../index.jsp?message=Correo ya esta siendo usado por otro Usuario");
            } else {
                // El correo no está en uso, proceder con la inserción
                String insertQuery = "INSERT INTO user (nombres, correo, password) VALUES ('" + name + "', '" + address + "', '" + pass + "')";
                statement.executeUpdate(insertQuery);
                response.sendRedirect("../index.jsp");
            }

            out.println("Conexión exitosa");
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    %>
</body>
</html>
