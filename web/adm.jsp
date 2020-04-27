<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <title>Schueda Contabilidade</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
</head>
<body>
    <!-- Header -->
    <header id="header" class="alt tamNav">
        <div class="inner">
            <img src="images/top.png" class="imgTop">
        </div>
    </header>

    <div class="container">
        <br>
        <div class="row">
            <h3 class="text-center mx-auto">Faça seu login<br>para acessar a página</h3>
        </div>
        <br>
        <div class="row">
            <form class="mx-auto" style="width: 400px" action ="logado" method="post">
                Email:<input type="email" name="email">
                <br>
                Senha:<input type="password" name="senha">
                <br>
                <input class="btn btn-primary" type="submit" value="Entrar">
            </form>    
        </div>
    </div>
    
    <p class="text-center" style="color: red;">${erro}</p>
    
    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>
