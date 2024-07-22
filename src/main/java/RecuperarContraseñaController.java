import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RecuperarContraseñaController", urlPatterns = {"/RecuperarContraseñaController"})
public class RecuperarContraseñaController extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3307/almacen";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        if (email != null && !email.isEmpty()) {
            String token = UUID.randomUUID().toString();
            Timestamp expiration = new Timestamp(System.currentTimeMillis() + 3600000); // 1 hora de expiración

            try (Connection conn = DriverManager.getConnection(URL, DB_USERNAME, DB_PASSWORD)) {
                // Actualizar el token y la fecha de expiración en la base de datos
                String updateSQL = "UPDATE usuarios SET token = ?, token_expiration = ? WHERE correo = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(updateSQL)) {
                    pstmt.setString(1, token);
                    pstmt.setTimestamp(2, expiration);
                    pstmt.setString(3, email);
                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        // Enviar el correo electrónico
                        String resetLink = "http://localhost:8080/miaplicacion/RestablecerContraseña.jsp?token=" + token;
                        sendEmail(email, resetLink);
                        response.getWriter().println("Se ha enviado un enlace para recuperar su contraseña a su correo electrónico.");
                    } else {
                        response.getWriter().println("No se encontró un usuario con el correo electrónico proporcionado.");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error al procesar la solicitud.");
            } catch (MessagingException ex) {
                Logger.getLogger(RecuperarContraseñaController.class.getName()).log(Level.SEVERE, null, ex);
                response.getWriter().println("Error al enviar el correo electrónico.");
            }
        } else {
            response.getWriter().println("Por favor, ingrese un correo electrónico válido.");
        }
    }

    private void sendEmail(String to, String resetLink) throws MessagingException {
        final String from = "pierrehc2004@gmail.com"; // Tu correo electrónico
        final String password = "Alianzalima2020"; // Tu contraseña de correo electrónico

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject("Recuperación de Contraseña");
        message.setText("Haz clic en el siguiente enlace para restablecer tu contraseña:\n" + resetLink);

        Transport.send(message);
    }
}
