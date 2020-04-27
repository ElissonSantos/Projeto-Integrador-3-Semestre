<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Fale Conosco</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
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

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar navbar-dark navBarV">
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp"> Inicio </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="quemSomos.jsp">Quem somos</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Fale conosco <span class="sr-only">(Página atual)</span></a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <br><br>
            <h4 class="text-center" style="color: red;">${result}</h4>
            
            <!-- Formulario -->
            <section id="intro" class="main">

                <h2>Fale conosco!</h2>
                
                <br>
                
                <form class="col-8 mx-auto" action="faleConosco" method="post">
                    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Nome:</label>
                        <div class="col-sm-10">
                            <input name="nome_contato" type="text" class="form-control" placeholder="Digite seu nome." style="border: 1px solid">
                        </div>
                    </div>
                    <br>                    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Email:</label>
                        <div class="col-sm-10">
                            <input name="email_contato" type="email" class="form-control" placeholder="Digite seu email." style="border: 1px solid">
                        </div>
                    </div>                    
                    <br>                    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Telefone:</label>
                        <div class="col-sm-10">
                            <input name="telefone_contato" type="text" class="form-control" placeholder="Digite seu telefone." style="border: 1px solid" data-mask="(00) 0000-0000" data-mask-selectonfocus="true">
                        </div>
                    </div>                    
                    <br>                    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Mensagem:</label>
                        <div class="col-sm-10">
                            <textarea name="mensagem" type="text" class="form-control" rows="3" placeholder="Digite a sua mensagem para nós." style="border: 1px solid"></textarea>
                        </div>
                    </div>                    
                    <br>                    
                    <input type="submit" class="btn btn-primary" value="Enviar">
                </form>
            </section>

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

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>