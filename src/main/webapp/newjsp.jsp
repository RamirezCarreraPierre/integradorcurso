<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard de Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-3 mb-5">Dashboard de Productos</h1>

            <div class="row">
                <div class="col-md-6">
                    <canvas id="graficoBarras" width="400" height="400"></canvas>
                </div>
            </div>
        </div>

        <%
            String url = "jdbc:mysql://localhost:3307/almacen";
            String user = "root";
            String password = "";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String sql = "SELECT nombre, precio FROM productos";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                ArrayList<String> nombres = new ArrayList<>();
                ArrayList<Double> precios = new ArrayList<>();

                while (rs.next()) {
                    nombres.add(rs.getString("nombre"));
                    precios.add(rs.getDouble("precio"));
                }
        %>

        <script>
            var ctx = document.getElementById('graficoBarras').getContext('2d');

            var chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: <%= new Gson().toJson(nombres)%>,
                    datasets: [{
                            label: 'Precio',
                            data: <%= new Gson().toJson(precios)%>,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        </script>

        <%
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
