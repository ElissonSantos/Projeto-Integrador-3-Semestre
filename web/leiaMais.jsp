<%@page import="java.sql.Array"%>
<%@page import="modelo.FabricaConexao"%>
<%@ page import="java.sql.PreparedStatement"  %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Noticia"%>
<%@page import="modelo.NoticiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Schueda Contabilidade</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="images/icon.png" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>

        <!-- Header -->
        <header id="header" class="alt tamNav">
            <div class="inner">
                <img src="images/top.png" class="imgTop">
            </div>
        </header>

        <!-- Barra de Navegação -->
        <nav class="navbar navbar-expand-lg navbar navbar-dark navBarV">
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp"> Inicio <span class="sr-only">(Página atual)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="quemSomos.jsp">Quem somos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="faleConosco.jsp">Fale conosco</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Codigo pagina -->
        <div class="container">

            <% ArrayList<Noticia> noticias = NoticiaDAO.listar();
                int id = Integer.parseInt(request.getParameter("noticia"));
                Noticia editado = null;
                for (Noticia alu : noticias) {
                    if (alu.getId() == id) {
                        editado = alu;
                    }
                }%>

            <!-- Wrapper -->
            <div id="wrapper">

                <!-- Titulo da noticia -->
                <h3 class="text-center font-weight-bold"><b><%=editado.getTitulo()%></b></h3>
                <br><br>

                <!-- Imagem da noticia -->
                <div clas="row">
                    <img src="images/<%=editado.getUrlImg()%>.jpg" class="img-fluid rounded mx-auto d-block" alt="Imagem responsiva">
                </div>
                <br><br>

                <!-- Corpo da noticia -->
                <p class="text-justify"><%=editado.getCorpo()%><%=editado.getCorpo()%></p>
                <br><br>

                <!-- Botao Ler mais -->
                <a type="button" href="index.jsp" class="btn btn-secondary">Voltar</a>

                <!-- Footer -->
                <footer id="footer">
                    <ul class="icons">
                        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
                        <li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
                    </ul>
                    <p class="copyright">&copy; Untitled. Design: ELISSON, RODRIGO, CAIO.</p>
                </footer>
            </div>
        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
