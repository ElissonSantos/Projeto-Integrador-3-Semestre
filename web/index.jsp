<%@page import="java.sql.Array"%>
<%@page import="modelo.FabricaConexao"%>
<%@ page import="java.sql.PreparedStatement"  %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> Inicio <span class="sr-only">(Página atual)</span></a>
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
        
        <!-- Codigo Pag -->
        <% Connection con = FabricaConexao.getConnection();

            ResultSet arrayNoticias = null;
            ResultSet rsRwCn = null;
            PreparedStatement psPgintn = null;
            PreparedStatement psRwCn = null;

            // Numero de noticias por pg 
            int notPorPag = 10;
            // Numero de opções disponiveis 
            int opcPag = 4;

            int iTotRslts = Converter(request.getParameter("iTotRslts"));
            int iTotPags = Converter(request.getParameter("iTotPags"));
            int pagNot = Converter(request.getParameter("iPagNo"));
            int cPagNo = Converter(request.getParameter("cPagNo"));

            int iStRsNo = 0;
            int iEnRsNo = 0;

            if (pagNot == 0) {
                pagNot = 0;
            } else {
                pagNot = Math.abs((pagNot - 1) * notPorPag);
            }

            String sqlPgintn = "SELECT SQL_CALC_FOUND_ROWS * FROM noticias order by idnoticias DESC limit " + pagNot + "," + notPorPag + "";
            psPgintn = con.prepareStatement(sqlPgintn);
            arrayNoticias = psPgintn.executeQuery();
            // Conta o numero de linhas 
            String sqlRwCnt = "SELECT FOUND_ROWS() as cnt";
            psRwCn = con.prepareStatement(sqlRwCnt);
            rsRwCn = psRwCn.executeQuery();

            if (rsRwCn.next()) {
                iTotRslts = rsRwCn.getInt("cnt");
            }
        %>  

        <!-- Codigo pagina -->
        <div class="container">

            <!-- Wrapper -->
            <div id="wrapper">

                <section class="main items">
                    <!-- Chamada Noticia -->
                    <% while (arrayNoticias.next()) {%>
                    <article class="item">
                        <!-- Imagem da noticia -->
                        <header>
                            <a href="leiaMais.jsp?noticia=<%=arrayNoticias.getString("idnoticias")%>"><img src="images/<%=arrayNoticias.getString("img_noticia")%>.jpg" alt="" /></a>
                        </header>
                        <!-- Titulo da noticia -->
                        <h4><%=arrayNoticias.getString("titulo_noticia")%></h4>
                        <br>
                        <!-- Botao Ler mais -->
                        <a type="button" href="leiaMais.jsp?noticia=<%=arrayNoticias.getString("idnoticias")%>" class="btn btn-primary">Ler Mais</a>
                    </article>
                    <% }%>
                </section>

                <nav class="nav justify-content-center">
                    <% // Calcular a próxima posição inicial e final do registro  
                        try {
                            if (iTotRslts < (pagNot + notPorPag)) {
                                iEnRsNo = iTotRslts;
                            } else {
                                iEnRsNo = (pagNot + notPorPag);
                            }
                            iStRsNo = (pagNot + 1);
                            iTotPags = ((int) (Math.ceil((double) iTotRslts / notPorPag)));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    <ul class="pagination">
                        <% // Create index of pages  
                            int i = 0;
                            int cPge = 0;
                            if (iTotRslts != 0) {
                                cPge = ((int) (Math.ceil((double) iEnRsNo / (opcPag * notPorPag))));
                                int prePageNo = (cPge * opcPag) - ((opcPag - 1) + opcPag);
                                if ((cPge * opcPag) - (opcPag) > 0) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="index.jsp?iPagNo=<%=prePageNo%>&cPagNo=<%=prePageNo%>"><< Previous</a>
                        </li>
                        <%
                            }

                            for (i = ((cPge * opcPag) - (opcPag - 1));
                                    i <= (cPge * opcPag); i++) {
                                if (i == ((pagNot / notPorPag) + 1)) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="index.jsp?iPagNo=<%=i%>" style="cursor:pointer;color:red"><b><%=i%></b></a>
                        </li>
                        <%
                        } else if (i <= iTotPags) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="index.jsp?iPagNo=<%=i%>"><%=i%></a>
                        </li>
                        <%
                                }
                            }

                            if (iTotPags > opcPag && i < iTotPags) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="index.jsp?iPagNo=<%=i%>&cPagNo=<%=i%>">>> Next</a>
                        </li>
                        <%
                                }
                            }
                        %>

                    </ul>
                </nav>
                
                <!-- Footer -->
                <footer id="footer">
                    <ul class="icons">
                        <li><a class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                        <li><a class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
                        <li><a class="icon fa-envelope"><span class="label">Email</span></a></li>
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

<% try {
        if (psPgintn != null) {
            psPgintn.close();
        }
        if (arrayNoticias != null) {
            arrayNoticias.close();
        }
        if (psRwCn != null) {
            psRwCn.close();
        }
        if (rsRwCn != null) {
            rsRwCn.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%> 
<%! public int Converter(String str) {
        int convrtr = 0;
        if (str == null) {
            str = "0";
        } else if ((str.trim()).equals("null")) {
            str = "0";
        } else if (str.equals("")) {
            str = "0";
        }
        try {
            convrtr = Integer.parseInt(str);
        } catch (Exception e) {
        }
        return convrtr;
    }%> 