<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Restablecer Contraseña</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>Restablecer Contraseña</h2>
        <%
            String token = request.getParameter("token");
            boolean validToken = false;

            if (token != null && !token.isEmpty()) {
                String URL = "jdbc:mysql://localhost:3306/almacen";
                String DB_USERNAME = "root";
                String DB_PASSWORD = "";

                try (Connection conn = DriverManager.getConnection(URL, DB_USERNAME, DB_PASSWORD)) {
                    String querySQL = "SELECT * FROM usuarios WHERE token = ? AND token_expiration > ?";
                    try (PreparedStatement pstmt = conn.prepareStatement(querySQL)) {
                        pstmt.setString(1, token);
                        pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
                        try (ResultSet rs = pstmt.executeQuery()) {
                            if (rs.next()) {
                                validToken = true;
                            }
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (validToken) {
        %>
        <form action="ActualizarContraseñaController" method="post">
            <input type="hidden" name="token" value="<%= token %>">
            <div class="form-group">
                <label for="newPassword">Nueva Contraseña:</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <button type="submit" class="btn btn-primary">Actualizar Contraseña</button>
        </form>
        <% } else { %>
        <p>El enlace de recuperación de contraseña es inválido o ha expirado.</p>
        <% } %>
    </div>
</body>
</html>
