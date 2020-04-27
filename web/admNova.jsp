<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Noticia"%>
<%@page import="modelo.NoticiaDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Nova Postagem</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body  style="background-color: green;">

        <div class="container" style="background-color: white">
            <div class="row">
                <img class="mx-auto" style="height: 130px" src="images/top.png">
            </div>            
            <hr />
            <div class="row">
                <div class="mx-auto" style="width: 90%">
                    <h2 class="text-center">Nova postagem!</h2>
                    <hr>

                    <!-- Formulario -->
                    <form action="novoPost" method="post">

                        <div class="form-group row">
                            <label class="col-sm-1 col-form-label">Titulo:</label>
                            <div class="col-sm-11">
                                <input name="titulo" type="text" class="form-control" style="border: 1px solid">
                            </div>
                        </div>
                        <br>                    
                        <div class="form-group row">
                            <label class="col-sm-1 col-form-label">Corpo:</label>
                            <div class="col-sm-11">
                                <textarea name="corpo" type="text" class="form-control" rows="10" style="border: 1px solid"></textarea>
                            </div>
                        </div>                    
                        <br>                    
                        <div class="form-group row">
                            <label class="col-sm-1 col-form-label">Url Imagem:</label>
                            <div class="col-sm-11">
                                <input name="urlImg" type="text" class="form-control" style="border: 1px solid" data-mask="(00) 0000-0000" data-mask-selectonfocus="true">
                            </div>
                        </div>                    
                        <br>                    
                        <input type="submit" class="btn btn-primary" value="Salvar">
                    </form>
                </div>
            </div>
            <br><br><br>
        </div>
    </body>
</html>
