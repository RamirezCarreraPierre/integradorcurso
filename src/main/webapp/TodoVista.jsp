<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.itextpdf.kernel.pdf.PdfDocument"%>
<%@page import="com.itextpdf.kernel.pdf.PdfWriter"%>
<%@page import="com.itextpdf.layout.Document"%>
<%@page import="com.itextpdf.layout.element.Paragraph"%>
<%@ page contentType="application/pdf" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Productos</title>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost:3306/almacen";
    String username = "root";
    String password = "";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    response.setContentType("application/pdf");
    PdfWriter writer = new PdfWriter(response.getOutputStream());
    PdfDocument pdf = new PdfDocument(writer);
    Document document = new Document(pdf);

    document.getPdfDocument().setDefaultPageSize(new com.itextpdf.kernel.geom.PageSize(200, 10000)); // Ancho de 20 y alto grande

    document.add(new Paragraph("Lista de Productos").setFontSize(14).setBold());

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(url, username, password);

    stmt = conn.createStatement();

    String sql = "SELECT id, codigo, nombre, fecha, existencia, precio FROM productos ";
    rs = stmt.executeQuery(sql);

    while (rs.next()) {
        Paragraph paragraph = new Paragraph()
            .add("ID: ").add(rs.getString("id")).add("\n")
            .add("Código: ").add(rs.getString("codigo")).add("\n")
            .add("Nombre: ").add(rs.getString("nombre")).add("\n")
            .add("Fecha: ").add(rs.getString("fecha")).add("\n")
            .add("Existencia: ").add(rs.getString("existencia")).add("\n")
            .add("Precio: ").add(rs.getString("precio")).add("\n\n");

        document.add(paragraph);
    }

    document.close();

    rs.close();
    stmt.close();
    conn.close();
%>
</body>
</html>
