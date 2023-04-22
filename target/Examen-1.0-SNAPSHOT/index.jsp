<%-- 
    Document   : index
    Created on : 11 abr 2023, 20:39:10
    Author     : Say
--%>
<%@page import="com.emergentes.modelo.Calificacion"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Calificacion> lista = (ArrayList<Calificacion>) session.getAttribute("listacal");
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
          
            <h2>Registro de Calificacion</h2>
            <a href="MainController?op=nuevo">Nuevo</a>
            <table border="1">
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>P1(30)</th>
                        <th>P2(30)</th>
                        <th>EF(40)</th>
                        <th>Nota</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <%
                        if(lista != null){
                            for(Calificacion item : lista){
                    %>
                    <tr>
                        <td><%= item.getId() %></td>
                        <td><%= item.getNombre() %></td>
                        <td><%= item.getP1() %></td>
                        <td><%= item.getP2() %></td>
                        <td><%= item.getP3() %></td>
                        <td><%= item.getNota() %></td>
                        <td><a href="MainController?op=editar&id=<%=item.getId() %>">Modificar</a></td>
                        <td><a href="MainController?op=eliminar&id=<%=item.getId() %>" 
                               onclick='return confirm("Estas seguro de eliminar el registro?");'>Eliminar</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
            </table>
        </center>
    </body>
</html>
