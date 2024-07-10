<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                <!-- Navbar Start -->
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
                                <a href="InicioController?accion=inicio" class="dropdown-item">Cerrar Sesión</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="h-100 bg-light rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Filtrar Productos por Fecha</h6>
                                </div>
                                <form id="filtrarForm">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="date" id="fechaInput" class="form-control" required>
                                        </div>
                                        <div class="col-md-6">
                                            <button type="submit" class="btn btn-primary">Buscar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="bg-light rounded h-100 p-4">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h6 class="mb-0">Tabla Productos</h6>
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <form action="ExportarDatosProductos.jsp" method="post">
                                        <label for="formatoExportacion">Formato de Exportación:</label>
                                        <select id="formatoExportacion" name="formatoExportacion">
                                            <option value="excel">Excel</option>
                                            <option value="pdf">PDF</option>
                                        </select>                                           
                                        <input type="submit" value="Exportar Datos">
                                    </form>
                                    <form method="post">
                                        <button onclick="openPdf()" type="submit" class="btn btn-danger"> 
                                            <i class="fas fa-file-pdf"></i> Vista
                                        </button>                           
                                    </form>
                                    <form action="exportarTodo.jsp" method="post">
                                        <button type="submit" class="btn btn-success"> <!-- Cambiar clase a btn-success para color verde -->
                                            <i class="fas fa-file-excel"></i> Excel
                                        </button>                                
                                    </form>
                                    <form action="exportarpdfTodo.jsp" method="post">
                                        <button type="submit" class="btn btn-danger"> <!-- Cambiar clase a btn-danger para color rojo -->
                                            <i class="fas fa-file-pdf"></i> PDF
                                        </button>                           
                                    </form>
                                </div>
                                <a href="https://wa.me/51922640415?text=Hola,%20quiero%20más%20información%20sobre%20sus%20servicios" class="btn btn-lg btn-primary rounded-circle back-to-top" 
                                   style="width: 60px; height: 60px; line-height: 70px; display: flex; justify-content: center; align-items: center; margin-bottom: 70px;">
                                    <i class="fab fa-whatsapp" style="font-size: 40px;"></i>
                                </a>        <!-- Chatbot HTML code here -->
                                <div id="chatbot">
                                    <div id="chatbot-header">Chatbot</div>
                                    <div id="chatbot-messages"></div>
                                    <div id="chatbot-input">
                                        <input type="text" id="chatbot-input-text" placeholder="Escribe un mensaje...">
                                        <button onclick="sendMessage()">Enviar</button>
                                    </div>
                                </div>
                            </div>


                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Código</th>
                                            <th>Nombre</th>
                                            <th>Precio</th>
                                            <th>Existencia</th>
                                            <th>Fecha a Impartir</th>
                                            <th>Modificar Registro</th>
                                            <th>Eliminar Registro</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <c:forEach var="producto" items="${lista_Calendario}">
                                            <tr>
                                                <td><c:out value="${producto.codigo}" /></td>
                                                <td><c:out value="${producto.nombre}" /></td>
                                                <td><c:out value="${producto.precio}" /></td>
                                                <td><c:out value="${producto.existencia}" /></td>
                                                <td><c:out value="${producto.fecha}" /></td>
                                                <td><a href="ProductosController?accion=modificar&id=<c:out value="${producto.id}" />">Modificar</a></td>
                                                <td><a href="ProductosController?accion=eliminar_cursos&id=<c:out value="${producto.id}" />">Eliminar</a></td>
                                            </tr>
                                        </c:forEach>                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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
        <script src="js/main.js"></script>
        <!-- Chatbot JavaScript code here -->
        <script>
                                            function sendMessage() {
                                                var input = document.getElementById('chatbot-input-text');
                                                var message = input.value;
                                                if (message.trim() !== "") {
                                                    displayMessage('user', message);
                                                    input.value = '';
                                                    setTimeout(function () {
                                                        displayMessage('bot', 'Hola en que te puedo ayudar.');
                                                    }, 1000);
                                                }
                                            }

                                            function displayMessage(sender, message) {
                                                var messageContainer = document.createElement('div');
                                                messageContainer.textContent = message;
                                                messageContainer.style.padding = '10px';
                                                messageContainer.style.margin = '10px 0';
                                                messageContainer.style.borderRadius = '5px';
                                                if (sender === 'user') {
                                                    messageContainer.style.background = '#007bff';
                                                    messageContainer.style.color = 'white';
                                                    messageContainer.style.alignSelf = 'flex-end';
                                                } else {
                                                    messageContainer.style.background = '#f5f5f5';
                                                    messageContainer.style.border = '1px solid #ddd';
                                                    messageContainer.style.alignSelf = 'flex-start';
                                                }
                                                document.getElementById('chatbot-messages').appendChild(messageContainer);
                                                document.getElementById('chatbot-messages').scrollTop = document.getElementById('chatbot-messages').scrollHeight;
                                            }
        </script>
        <script type="text/javascript">
            function openPdf() {
                window.open('TodoVista.jsp?generatePdf=true', '_blank');
            }
        </script>
        <script>
            function reporte(accion) {
                $.get('../ProductosController?accion=listar', function (r) {
                    if (r) {
                        $('#accion').val(accion);
                        $('#lista').val(JSON.stringify(r));
                        $('#frmReporte').submit();
                    } else {
                        alert('El reporte nose pudo generar debido a un error!!!' + r);
                    }
                }
                );
        </script>
    </body>
</html>
