<%@page import="modelo.Funcionario"%>
<%@page import="java.sql.Array"%>
<%@page import="modelo.FabricaConexao"%>
<%@ page import="java.sql.PreparedStatement"  %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FaleConosco"%>
<%@page import="modelo.FaleConoscoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Schueda Contabilidade</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body  style="background-color: green;">

        <div class="container" style="background-color: white">
            <div class="row">
                <img class="col-4 p-3 " style="height: 130px" src="images/top.png" class="imgTop">
                <h2 class="col-8 p-3 text-center">Todas as postagens</h2>
            </div>

            <!-- Barra de Navegação -->
            <nav class="navbar navbar-expand-lg navbar navbar-dark navBarV">
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="admLogado.jsp">Postagens</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link">Fale conosco<span class="sr-only">(Página atual)</span></a>
                        </li>
                    </ul>
                </div>
            </nav>            

            <hr />

            <div class="row">
                <div class="list-group mx-auto" style="width: 90%">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col-4" class="font-weight-bold">Nome</th>
                                <th scope="col-5" class="font-weight-bold">Mensagem</th>
                                <th scope="col-3"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%ArrayList<FaleConosco> faleconosco = FaleConoscoDAO.listar();
                            for (FaleConosco fale : faleconosco) {%>
                            <tr>                                
                                <td><%=fale.getNome()%></td>
                                <td><%=fale.getTelefone()%></td>
                                <td><a href="admFaleCompleto.jsp?faleConosco=<%=fale.getId()%>" class="btn btn-primary" style="float: right; color: white">Visualizar</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <br><br><br>
        </div>
    </body>
</html>
