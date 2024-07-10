<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String formato = request.getParameter("formatoExportacion");
    if ("excel".equalsIgnoreCase(formato)) {
        response.sendRedirect("ReporteProductosExcel.jsp");
    } else if ("pdf".equalsIgnoreCase(formato)) {
        response.sendRedirect("ReporteProductosPdf.jsp");
    } else {
        out.println("Formato no soportado");
    }
%>
