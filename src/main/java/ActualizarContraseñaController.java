import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ActualizarContraseñaController", urlPatterns = {"/ActualizarContraseñaController"})
public class ActualizarContraseñaController extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3307/almacen";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");

        if (token != null && !token.isEmpty() && newPassword != null && !newPassword.isEmpty()) {
            try (Connection conn = DriverManager.getConnection(URL, DB_USERNAME, DB_PASSWORD)) {
                String updateSQL = "UPDATE usuarios SET contraseña = ?, token = NULL, token_expiration = NULL WHERE token = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(updateSQL)) {
                    pstmt.setString(1, newPassword);
                    pstmt.setString(2, token);
                    int rowsUpdated = pstmt.executeUpdate();

                    if (rowsUpdated > 0) {
                        response.getWriter().println("Contraseña actualizada con éxito.");
                    } else {
                        response.getWriter().println("Error al actualizar la contraseña.");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error al procesar la solicitud.");
            }
        } else {
            response.getWriter().println("Datos de formulario inválidos.");
        }
    }
}
