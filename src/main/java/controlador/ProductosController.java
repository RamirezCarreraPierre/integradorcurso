package controlador;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Productos;
import modelo.ProductosDAO;
import java.sql.Date;

@WebServlet(name = "ProductosController", urlPatterns = {"/ProductosController"})
public class ProductosController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Método procesar petición no usado
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductosDAO productosDAO = new ProductosDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        if (accion == null || accion.isEmpty()) {
            dispatcher = request.getRequestDispatcher("Productos/index_productos.jsp");
            List<Productos> listaProductos = productosDAO.listarProductos();
            request.setAttribute("lista", listaProductos);
        } else if (accion.equals("ExportarReporte")) {
            exportarReporteProductos(request, response);
            return;
        } else if (accion.equals("listar_eventos")) {
            dispatcher = request.getRequestDispatcher("Productos/index_productos_eventos.jsp");
            List<Productos> listaProductos_eventos = productosDAO.listarProductos_eventos();
            request.setAttribute("lista_Eventos", listaProductos_eventos);
        } else if (accion.equals("listar_cursos")) {
            dispatcher = request.getRequestDispatcher("Productos/index_productos_cursos.jsp");
            List<Productos> listaProductos_cursos = productosDAO.listarProductos_cursos();
            request.setAttribute("lista_Cursos", listaProductos_cursos);
        } else if (accion.equals("listar_comidas")) {
            dispatcher = request.getRequestDispatcher("Productos/index_productos_comidas.jsp");
            List<Productos> listaProductos_comidas = productosDAO.listarProductos_comidas();
            request.setAttribute("lista_Comidas", listaProductos_comidas);
        } else if (accion.equals("listar_calendario")) {
            dispatcher = request.getRequestDispatcher("Productos/index_calendario.jsp");
            List<Productos> listaProductos_calendario = productosDAO.listarCalendario();
            request.setAttribute("lista_Calendario", listaProductos_calendario);
        } else if (accion.equals("nuevo")) {
            dispatcher = request.getRequestDispatcher("Productos/nuevo_productos.jsp");
        } else if (accion.equals("insertar")) {
            insertarProducto(request, response, productosDAO);
            dispatcher = request.getRequestDispatcher("Productos/index_productos.jsp");
            List<Productos> listaProductos = productosDAO.listarProductos();
            request.setAttribute("lista", listaProductos);
        } else if (accion.equals("modificar")) {
            dispatcher = request.getRequestDispatcher("Productos/modificar_productos.jsp");
            int id = Integer.parseInt(request.getParameter("id"));
            Productos producto = productosDAO.mostrarProducto(id);
            request.setAttribute("producto", producto);
        } else if (accion.equals("actualizar")) {
            actualizarProducto(request, response, productosDAO);
            dispatcher = request.getRequestDispatcher("inicio.jsp");
            List<Productos> listaProductos = productosDAO.listarProductos();
            request.setAttribute("lista", listaProductos);
        } else if (accion.equals("eliminar")) {
            eliminarProducto(request, response, productosDAO);
            dispatcher = request.getRequestDispatcher("Productos/index_productos.jsp");
            List<Productos> listaProductos = productosDAO.listarProductos();
            request.setAttribute("lista", listaProductos);
        } else if (accion.equals("eliminar_comidas")) {
            eliminarProducto(request, response, productosDAO);
            dispatcher = request.getRequestDispatcher("Productos/index_productos_comidas.jsp");
            List<Productos> listaProductos_comidas = productosDAO.listarProductos_comidas();
            request.setAttribute("lista_Comidas", listaProductos_comidas);
        } else if (accion.equals("eliminar_eventos")) {
            eliminarProducto(request, response, productosDAO);
            dispatcher = request.getRequestDispatcher("Productos/index_productos_eventos.jsp");
            List<Productos> listaProductos_eventos = productosDAO.listarProductos_eventos();
            request.setAttribute("lista_Eventos", listaProductos_eventos);
        } else if (accion.equals("eliminar_cursos")) {
            eliminarProducto(request, response, productosDAO);
            dispatcher = request.getRequestDispatcher("Productos/index_productos_cursos.jsp");
            List<Productos> listaProductos_cursos = productosDAO.listarProductos_cursos();
            request.setAttribute("lista_Cursos", listaProductos_cursos);
        } else if (accion.equals("calendario")) {
            dispatcher = request.getRequestDispatcher("Productos/index_calendario.jsp");
        } else {
            dispatcher = request.getRequestDispatcher("Productos/index_productos.jsp");
            List<Productos> listaProductos = productosDAO.listarProductos();
            request.setAttribute("lista", listaProductos);
        }

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void exportarReporteProductos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletOutputStream out = response.getOutputStream();
        try {
            InputStream logoEmpresa = this.getServletConfig().getServletContext().getResourceAsStream("ReportesJasper/img/logoempresa.jpg");
            InputStream logoFooter = this.getServletConfig().getServletContext().getResourceAsStream("ReportesJasper/img/check.jpg");
            InputStream reporteProducto = this.getServletConfig().getServletContext().getResourceAsStream("ReportesJasper/ReporteProducto.jasper");

            if (logoEmpresa != null && logoFooter != null && reporteProducto != null) {
                String jsonProductos = request.getParameter("lista");
                Gson gson = new Gson();
                List<Productos> reportesProductos = new ArrayList<>();
                List<Productos> reportesProductos2;

                reportesProductos.add(new Productos());
                reportesProductos2 = gson.fromJson(jsonProductos, new TypeToken<List<Productos>>() {
                }.getType());
                reportesProductos.addAll(reportesProductos2);

                JasperReport report = (JasperReport) JRLoader.loadObject(reporteProducto);
                JRBeanArrayDataSource ds = new JRBeanArrayDataSource(reportesProductos.toArray());

                Map<String, Object> parameters = new HashMap<>();
                parameters.put("ds", ds);
                parameters.put("logoEmpresa", logoEmpresa);
                parameters.put("imagenAlternativa", logoFooter);

                response.setContentType("application/pdf");
                response.addHeader("Content-disposition", "inline; filename=ReporteProductos.pdf");
                JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameters, ds);
                JasperExportManager.exportReportToPdfStream(jasperPrint, out);
                out.flush();
            } else {
                response.setContentType("text/plain");
                out.println("No se pudo generar el reporte");
                out.println("Esto puede deberse a que la lista de datos no fue recibida o el archivo plantilla del reporte no se ha encontrado");
                out.println("Contacte a soporte");
            }
        } catch (Exception e) {
            response.setContentType("text/plain");
            out.print("Ocurrió un error al intentar generar el reporte: " + e.getMessage());
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    private void insertarProducto(HttpServletRequest request, HttpServletResponse response, ProductosDAO productosDAO) {
        String tipoCodigo = request.getParameter("tipoCodigo");
        String numeroCodigo = request.getParameter("numeroCodigo");
        String codigo = tipoCodigo + numeroCodigo;
        String nombre = request.getParameter("nombre");
        Double precio = Double.parseDouble(request.getParameter("precio"));
        int existencia = Integer.parseInt(request.getParameter("existencia"));
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        Productos producto = new Productos(0, codigo, nombre, precio, existencia, fecha);
        productosDAO.insertar(producto);
    }

    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response, ProductosDAO productosDAO) {
        int id = Integer.parseInt(request.getParameter("id"));
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        Double precio = Double.parseDouble(request.getParameter("precio"));
        int existencia = Integer.parseInt(request.getParameter("existencia"));
        Date fecha = null;
        try {
            fecha = Date.valueOf(request.getParameter("fecha"));
        } catch (IllegalArgumentException e) {
            System.out.println("Error al convertir la fecha: " + e.toString());
        }
        Productos producto = new Productos(id, codigo, nombre, precio, existencia, fecha);
        productosDAO.actualizar(producto);
    }

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response, ProductosDAO productosDAO) {
        int id = Integer.parseInt(request.getParameter("id"));
        productosDAO.eliminar(id);
    }
}
