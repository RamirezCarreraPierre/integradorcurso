<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Campus Services</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <div class="container-fluid position-relative bg-white d-flex p-0">
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="inicio.jsp" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>C-Services</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="img/Perfil.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Pierre Ramos</h6>
                            <span>Administrador</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="inicio.jsp" class="nav-item nav-link"><i class="fa fa-chart-line me-2"></i>Estadisticas</a>
                        <a href="ProductosController?accion=nuevo" class="nav-item nav-link"><i class="fa fa-plus-circle me-2"></i>Registrar Servicios</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Productos</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="ProductosController" class="dropdown-item"><i class="fa fa-list me-2"></i>Lista de Servicios</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-book me-2"></i>Cursos</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="ProductosController?accion=listar_cursos" class="dropdown-item"><i class="fa fa-list me-2"></i>Lista Cursos</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-utensils me-2"></i>Comidas</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="ProductosController?accion=listar_comidas" class="dropdown-item"><i class="fa fa-list me-2"></i>Lista Comida</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-calendar-alt me-2"></i>Eventos</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="ProductosController?accion=listar_eventos" class="dropdown-item"><i class="fa fa-list me-2"></i>Lista Eventos</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-users me-2"></i>Usuarios</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="UsuariosController" class="dropdown-item"><i class="fa fa-list me-2"></i>Lista de Usuarios</a>
                                <a href="UsuariosController?accion=nuevo_usuarios" class="dropdown-item"><i class="fa fa-user-plus me-2"></i>Registro</a>
                            </div>
                        </div>
                        <a href="ProductosController?accion=listar_calendario" class="nav-item nav-link"><i class="fa fa-calendar me-2"></i>Calendario</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-comments me-2"></i>Opiniones</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="#" class="dropdown-item"><i class="fa fa-list me-2"></i>Lista de Opiniones</a>
                                <a href="#" class="dropdown-item"><i class="fa fa-edit me-2"></i>Registrar Opiniones</a>
                                <a href="#" class="dropdown-item"><i class="fa fa-list-alt me-2"></i>Opiniones por cursos</a>
                            </div>
                        </div>
                        <a href="#" class="nav-item nav-link"><i class="fa fa-bullhorn me-2"></i>Anuncios</a>
                        <a href="#" class="nav-item nav-link"><i class="fa fa-envelope me-2"></i>Mensajes</a>
                    </div>
                </nav>
            </div>
            <div class="content">
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="inicio.jsp" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Buscar">
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Mensajes</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="https://via.placeholder.com/40" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Juan te ha enviado un mensaje</h6>
                                            <small>Hace 15 minutos</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="https://via.placeholder.com/40" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Ana te ha enviado un mensaje</h6>
                                            <small>Hace 1 hora</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="https://via.placeholder.com/40" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Pedro te ha enviado un mensaje</h6>
                                            <small>Hace 2 días</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">Ver todos los mensajes</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notificaciones</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Nuevo curso disponible: "Programación Avanzada"</h6>
                                    <small>Hace 15 minutos</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Nuevos materiales agregados al curso "Diseño Gráfico"</h6>
                                    <small>Hace 1 hora</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Próximo evento: "Charla sobre Tecnología e Innovación"</h6>
                                    <small>Hace 2 días</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">Ver todas las notificaciones</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="img/Perfil.jpg" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">Pierre Ramos</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">Mi Perfil</a>
                                <a href="#" class="dropdown-item">Configuración</a>
                                <a href="index.jsp" class="dropdown-item">Cerrar Sesión</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12">
                            <div class="bg-light text-center rounded p-4">
                                <h5 class="mt-1 mb-1">5 Productos Con Mayor Precio</h5>
                                <canvas id="graficoBarrasPrecios" style="max-height: 400px;"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="bg-light text-center rounded p-4">
                                <h5 class="mt-1 mb-1">5 Eventos Con Mayor Precio</h5>
                                <canvas id="graficoBarrasPreciosevt" style="max-height: 400px;"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="bg-light text-center rounded p-4">
                                <h5 class="mt-1 mb-1">5 Comidas Con Mayor Precio</h5>
                                <canvas id="graficoBarrasPrecioscom" style="max-height: 400px;"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="bg-light text-center rounded p-4">
                                <h5 class="mt-1 mb-1">5 Cursos Con Mayor Precio</h5>
                                <canvas id="graficoBarrasPrecioscur" style="max-height: 400px;"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="bg-light text-center rounded p-4">
                                <h5 class="mt-1 mb-1">5 Tecnologia Con Mayor Precio</h5>
                                <canvas id="graficoBarrasPreciostec" style="max-height: 400px;"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="bg-light text-center rounded p-4">
                                <h5 class="mt-1 mb-1">Cantidad de Productos Por Categoria</h5>
                                <canvas id="graficoPastelCategorias" style="max-height: 400px;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <%
            String url = "jdbc:mysql://localhost:3306/almacen";
            String user = "root";
            String password = "";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                // Consulta para obtener los precios de los productos
                String sqlPreciostec = "SELECT nombre, precio FROM productos WHERE codigo LIKE 'TEC%' ORDER BY nombre LIMIT 5;";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sqlPreciostec);

                ArrayList<String> nombresPreciostec = new ArrayList<>();
                ArrayList<Double> preciostec = new ArrayList<>();

                while (rs.next()) {
                    nombresPreciostec.add(rs.getString("nombre"));
                    preciostec.add(rs.getDouble("precio"));
                }
                
                // Consulta para obtener los precios de los productos
                String sqlPrecioscur = "SELECT nombre, precio FROM productos WHERE codigo LIKE 'CUR%' ORDER BY nombre LIMIT 5;";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sqlPrecioscur);

                ArrayList<String> nombresPrecioscur = new ArrayList<>();
                ArrayList<Double> precioscur = new ArrayList<>();

                while (rs.next()) {
                    nombresPrecioscur.add(rs.getString("nombre"));
                    precioscur.add(rs.getDouble("precio"));
                }
                
                
                // Consulta para obtener los precios de los productos
                String sqlPrecioscom = "SELECT nombre, precio FROM productos WHERE codigo LIKE 'COM%' ORDER BY nombre LIMIT 5;";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sqlPrecioscom);

                ArrayList<String> nombresPrecioscom = new ArrayList<>();
                ArrayList<Double> precioscom = new ArrayList<>();

                while (rs.next()) {
                    nombresPrecioscom.add(rs.getString("nombre"));
                    precioscom.add(rs.getDouble("precio"));
                }
                
                // Consulta para obtener los precios de los productos
                String sqlPrecios = "SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 5;";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sqlPrecios);

                ArrayList<String> nombresPrecios = new ArrayList<>();
                ArrayList<Double> precios = new ArrayList<>();

                while (rs.next()) {
                    nombresPrecios.add(rs.getString("nombre"));
                    precios.add(rs.getDouble("precio"));
                }

                // Consulta para obtener la distribución de productos por categoría
                String sqlCategorias = "SELECT SUBSTRING(codigo, 1, 3) AS categoria, COUNT(*) AS cantidad FROM productos WHERE codigo LIKE 'EVT%' OR codigo LIKE 'CUR%' OR codigo LIKE 'COM%' OR codigo LIKE 'TEC%' GROUP BY SUBSTRING(codigo, 1, 3)";
                rs = stmt.executeQuery(sqlCategorias);

                ArrayList<String> categorias = new ArrayList<>();
                ArrayList<Integer> cantidades = new ArrayList<>();

                while (rs.next()) {
                    categorias.add(rs.getString("categoria"));
                    cantidades.add(rs.getInt("cantidad"));
                }
                
// Consulta para obtener los precios de los productos evt
                String sqlPreciosevt = "SELECT nombre, precio FROM productos WHERE codigo LIKE 'EVT%' ORDER BY nombre LIMIT 5;";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sqlPreciosevt);

                ArrayList<String> nombresPreciosevt = new ArrayList<>();
                ArrayList<Double> preciosevt = new ArrayList<>();

                while (rs.next()) {
                    nombresPreciosevt.add(rs.getString("nombre"));
                    preciosevt.add(rs.getDouble("precio"));
                }


        %>

        <script>
            // Gráfico de barras para precios de productos
            var ctxPrecios = document.getElementById('graficoBarrasPrecioscom').getContext('2d');
            var chartPrecios = new Chart(ctxPrecios, {
                type: 'bar',
                data: {
                    labels: <%= new Gson().toJson(nombresPrecioscom)%>,
                    datasets: [{
                            label: 'Precio',
                            data: <%= new Gson().toJson(precioscom)%>,
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
            // Gráfico de barras para precios de productos
            var ctxPrecios = document.getElementById('graficoBarrasPrecioscur').getContext('2d');
            var chartPrecios = new Chart(ctxPrecios, {
                type: 'bar',
                data: {
                    labels: <%= new Gson().toJson(nombresPrecioscur)%>,
                    datasets: [{
                            label: 'Precio',
                            data: <%= new Gson().toJson(precioscur)%>,
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
            // Gráfico de barras para precios de productos
            var ctxPrecios = document.getElementById('graficoBarrasPreciostec').getContext('2d');
            var chartPrecios = new Chart(ctxPrecios, {
                type: 'bar',
                data: {
                    labels: <%= new Gson().toJson(nombresPreciostec)%>,
                    datasets: [{
                            label: 'Precio',
                            data: <%= new Gson().toJson(preciostec)%>,
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
            // Gráfico de barras para precios de productos
            var ctxPrecios = document.getElementById('graficoBarrasPreciosevt').getContext('2d');
            var chartPrecios = new Chart(ctxPrecios, {
                type: 'bar',
                data: {
                    labels: <%= new Gson().toJson(nombresPreciosevt)%>,
                    datasets: [{
                            label: 'Precio',
                            data: <%= new Gson().toJson(preciosevt)%>,
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
            // Gráfico de barras para precios de productos
            var ctxPrecios = document.getElementById('graficoBarrasPrecios').getContext('2d');
            var chartPrecios = new Chart(ctxPrecios, {
                type: 'bar',
                data: {
                    labels: <%= new Gson().toJson(nombresPrecios)%>,
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

            // Gráfico de pastel para distribución por categoría
            var ctxCategorias = document.getElementById('graficoPastelCategorias').getContext('2d');
            var chartCategorias = new Chart(ctxCategorias, {
                type: 'pie',
                data: {
                    labels: <%= new Gson().toJson(categorias)%>,
                    datasets: [{
                            data: <%= new Gson().toJson(cantidades)%>,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: true
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