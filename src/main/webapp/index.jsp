<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Campus Services</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="js/main.js" type="text/javascript"></script>
        <link href="img/Logo_Unico.ico" rel="icon">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <%
                String url = "jdbc:mysql://localhost:3306/almacen";
                String dbUsername = "root";
                String dbPassword = "";

                String email = request.getParameter("email");
                String passwordInput = request.getParameter("password");

                boolean isValidLogin = false;
                String message = "";

                if (email != null && passwordInput != null) {
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        // Cargar el driver JDBC
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        // Conectar a la base de datos
                        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                        // Preparar la consulta SQL
                        String sql = "SELECT * FROM usuarios WHERE correo = ? AND contraseña = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, email);
                        pstmt.setString(2, passwordInput);
                        
                        // Ejecutar la consulta
                        rs = pstmt.executeQuery();

                        // Verificar si se encontró el usuario
                        if (rs.next()) {
                            isValidLogin = true;
                        } else {
                            message = "Correo o contraseña incorrectos.";
                        }
                    } catch (SQLException | ClassNotFoundException e) {
                        e.printStackTrace();
                        message = "Error en la base de datos: " + e.getMessage();
                    } finally {
                        // Cerrar recursos
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    // Redirigir al usuario según el resultado del login
                    if (isValidLogin) {
                        response.sendRedirect("inicio.jsp");
                        return;
                    }
                }
            %>
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>C-Services</h3>
                            </a>
                            <h3>Iniciar</h3>
                        </div>
                        <form action="" method="post">
                            <div class="form-group">
                                <label for="email">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Contraseña:</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <a href="OlvideContraseña.jsp">Olvidé mi contraseña</a>
                            </div>                              
                            <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                        </form>
                        <% if (!message.isEmpty()) { %>
                            <div class="alert alert-danger mt-3" role="alert">
                                <%= message %>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
