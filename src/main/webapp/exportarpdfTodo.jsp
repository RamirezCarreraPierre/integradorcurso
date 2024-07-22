<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exportar a PDF</title>
</head>
<body>

<h2>Exportar datos a PDF</h2>



<form action="exportar.jsp" method="post">
    <input type="submit" value="Exportar a PDF">
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String url = "jdbc:mysql://localhost:3306/almacen";
        String user = "root";
        String password = "";

        String sql = "SELECT * FROM productos;";

try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);
            document.open();

            PdfPTable table = new PdfPTable(6); 
            table.addCell("ID");
            table.addCell("Código");
            table.addCell("Nombre");
            table.addCell("Precio");
            table.addCell("Existencia");
            table.addCell("Fecha");
            while (rs.next()) {
                table.addCell(String.valueOf(rs.getInt("id")));
                table.addCell(rs.getString("codigo"));
                table.addCell(rs.getString("nombre"));
                table.addCell(String.valueOf(rs.getDouble("precio")));
                table.addCell(String.valueOf(rs.getInt("existencia")));
                table.addCell(rs.getString("fecha"));
            }
            document.add(table);

            rs.close();
            stmt.close();
            conn.close();
            
            document.close();

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=Todo.pdf");
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

</body>
</html>
