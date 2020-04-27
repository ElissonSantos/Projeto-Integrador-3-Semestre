<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.FaleConosco"%>
<%@page import="modelo.FaleConoscoDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>FaleConosco</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body  style="background-color: green;">

        <% ArrayList<FaleConosco> faleConosco = FaleConoscoDAO.listar();
            int id = Integer.parseInt(request.getParameter("faleConosco"));
            FaleConosco exibir = null;
            for (FaleConosco fale : faleConosco) {
                if (fale.getId() == id) {
                    exibir = fale;
                }
            }%>

        <div class="container" style="background-color: white">
            <div class="row">
                <img class="mx-auto" style="height: 130px" src="images/top.png">
            </div>            
            <hr />
            <div class="row">
                <div class="mx-auto" style="width: 90%">
                    <h2 class="text-center">Fale Conosco!</h2>
                    <hr>

                    <div class="row">
                        <label class="col-sm-1 col-form-label">Nome:</label>
                        <div class="col-sm-11">
                            <h3><%=exibir.getNome()%></h3>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <label class="col-sm-1 col-form-label">Email:</label>
                        <div class="col-sm-11">
                            <h3><%=exibir.getEmail()%></h3>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <label class="col-sm-1 col-form-label">Telefone:</label>
                        <div class="col-sm-11">
                            <h3><%=exibir.getMensagem()%></h3>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <label class="col-sm-1 col-form-label">Mensagem:</label>
                        <div class="col-sm-11">
                            <h3><%=exibir.getTelefone()%></h3>
                        </div>
                    </div>
                    <br><br>
                    
                    <!-- Botao Ler mais -->
                    <a type="button" href="admFaleConosco.jsp" class="btn btn-secondary">Voltar</a>
                </div>
            </div>
            <br><br><br>
        </div>
    </body>
</html>