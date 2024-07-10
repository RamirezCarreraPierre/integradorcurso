<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.itextpdf.kernel.pdf.PdfDocument"%>
<%@page import="com.itextpdf.kernel.pdf.PdfWriter"%>
<%@page import="com.itextpdf.layout.Document"%>
<%@page import="com.itextpdf.layout.element.Paragraph"%>
<%@page import="com.itextpdf.layout.element.Table"%>
<%@page import="com.itextpdf.layout.element.Cell"%>
<%@page import="com.itextpdf.layout.property.UnitValue"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tabla de Productos</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h2>Lista de Productos</h2>

<%
    // Variables de conexión
    String url = "jdbc:mysql://localhost:3307/almacen";
    String username = "root";
    String password = "";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    boolean generatePdf = request.getParameter("generatePdf") != null;

    if (generatePdf) {
        response.setContentType("application/pdf");
        try {
            PdfWriter writer = new PdfWriter(response.getOutputStream());
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            document.add(new Paragraph("Lista de Cursos").setFontSize(18).setBold());

            Table table = new Table(new float[]{0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f}); // Ancho de las columnas en porcentaje
            table.setWidth(UnitValue.createPercentValue(100)); // Ancho de la tabla
            table.addHeaderCell(new Cell().add(new Paragraph("ID").setFontSize(12).setBold()));
            table.addHeaderCell(new Cell().add(new Paragraph("Código").setFontSize(12).setBold()));
            table.addHeaderCell(new Cell().add(new Paragraph("Nombre").setFontSize(12).setBold()));
            table.addHeaderCell(new Cell().add(new Paragraph("Fecha").setFontSize(12).setBold()));
            table.addHeaderCell(new Cell().add(new Paragraph("Existencia").setFontSize(12).setBold()));
            table.addHeaderCell(new Cell().add(new Paragraph("Precio").setFontSize(12).setBold()));

            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(url, username, password);

            stmt = conn.createStatement();

            String sql = "SELECT id, codigo, nombre, fecha, existencia, precio FROM productos WHERE codigo LIKE 'CUR%';";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                table.addCell(new Cell().add(new Paragraph(rs.getString("id"))));
                table.addCell(new Cell().add(new Paragraph(rs.getString("codigo"))));
                table.addCell(new Cell().add(new Paragraph(rs.getString("nombre"))));
                table.addCell(new Cell().add(new Paragraph(rs.getString("fecha"))));
                table.addCell(new Cell().add(new Paragraph(rs.getString("existencia"))));
                table.addCell(new Cell().add(new Paragraph(rs.getString("precio"))));
            }

            document.add(table);

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return;
    }
%>
</body>
</html>
