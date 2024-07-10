<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exportar a Excel</title>
</head>
<body>

<h2>Exportar datos a Excel</h2>


<form action="exportar.jsp" method="post">
    <input type="submit" value="Exportar a Excel">
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String url = "jdbc:mysql://localhost:3307/almacen";
        String user = "root";
        String password = "";

        String sql = "SELECT * FROM productos WHERE codigo LIKE 'TEC%';";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            File tempFile = File.createTempFile("Tecnologia", ".xls");
            PrintWriter pw = new PrintWriter(new FileWriter(tempFile));

            pw.println("id\tcodigo\tnombre\tprecio\texistencia\tfecha"); // Encabezados de columnas
            while (rs.next()) {
                pw.println(rs.getInt("id") + "\t" + 
                           rs.getString("codigo") + "\t" + 
                           rs.getString("nombre") + "\t" + 
                           rs.getDouble("precio") + "\t" + 
                           rs.getInt("existencia") + "\t" + 
                           rs.getString("fecha"));
            }

            rs.close();
            stmt.close();
            conn.close();
            
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename=Tecnologia.xls");
            FileInputStream fis = new FileInputStream(tempFile);
            OutputStream os = response.getOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            fis.close();
            os.flush();
            os.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

</body>
</html>
