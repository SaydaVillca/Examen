<%@page import="com.emergentes.modelo.Calificacion"%>
<%
    Calificacion item = (Calificacion) request.getAttribute("miCalificacion");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        
        <p style="border-style: dotted; border-color: violet; border-width: 5px 5px 5px 5px;">
                PRIMER PARCIAL TEM-742 <br>
                Nombre: Sayda Villca Apaza<br>
                Carnet: 12572762LP <br>
        </p>
        <h1><%= (item.getId()== 0) ? "Registro de Calificacion": "Editar Calificacion"%></h1>
        <form action="MainController" method='post'>
            <input type="hidden" name="id" value='<%= item.getId()%>'>
            <table border='0'>
                <tr>
                    <td>Nombre del Estudiante</td>
                    <td><input type="text" name="nombres" value="<%= item.getNombre()%>"></td>
                </tr>
                <tr>
                    <td>Primer Parcial(sobre 30 pts)</td>
                    <td><input type="text" name="p1" value="<%= item.getP1()%>"></td>
                </tr>
                <tr>
                    <td>Segundo Parcial(sobre 30 pts)</td>
                    <td><input type="text" name="p2" value="<%= item.getP2()%>"></td>
                </tr>
                <tr>
                    <td>Examen Final(sobre 40 pts)</td>
                    <td><input type="text" name="p3" value="<%= item.getP3()%>"></td>
                </tr>
            </table>
            <input type="submit"  value="Enviar">
        </form>
    </center>
    </body>
</html>
