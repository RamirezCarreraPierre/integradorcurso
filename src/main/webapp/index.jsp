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
                String url = "jdbc:mysql://localhost:3307/almacen";
                String username = "root";
                String password = "";

                String email = request.getParameter("email");
                String passwordInput = request.getParameter("password");

                boolean isValidLogin = false;

                if (email != null && passwordInput != null) {
                    try {
                        Connection conn = DriverManager.getConnection(url, username, password);

                        String sql = "SELECT * FROM usuarios WHERE correo = ? AND contraseña = ?";
                        PreparedStatement pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, email);
                        pstmt.setString(2, passwordInput);
                        ResultSet rs = pstmt.executeQuery();

                        if (rs.next()) {
                            isValidLogin = true;
                        }

                        rs.close();
                        pstmt.close();
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                    if (isValidLogin) {
                        response.sendRedirect("inicio.jsp");
                        return; 
                    } else {
                        response.sendRedirect("inicio.jsp");
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
                                <a href="">Olvide mi contraseña</a>
                            </div>                                
                            <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
