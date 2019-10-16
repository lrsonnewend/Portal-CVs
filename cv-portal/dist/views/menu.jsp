<%-- 
    Document   : menu
    Created on : 24/07/2019, 11:42:42
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        
        <style>

            .login {
                width: 83%;
                padding: 12px;
                height: 11px;
                margin: 5px 0 6px 0;
                display: inline-block;
                border-radius: 4px;
                background: #f1f1f1;

            }

            .send{
                width: 53%;
                padding: 5px;
                margin: 5px 0 7px 0;
                border-radius: 2px;
                background: #f1f1f1;
                cursor: pointer;
            }


        </style>
    </head>
    <body>

        <div id="navigation">                                            
            <div id="portal-column-one" class="cell width-1:4 position-0">      

                <ul class="menu-info">
                    <li><a href="http://www.inpe.br/acessoainformacao/" title="Saiba sobre o Acesso à Informação" target="_blank">Acesso à Informação</a></li>
                    <li><a href="/" title="Acesse INPE"><img src="../img/logoinpe-azul-menor.png" alt="Imagem do INPE" /><span class="none">INPE</span></a></li>
                </ul>


                <input type="checkbox" id="menu-mobile" class="trigger" />              
                <label for="menu-mobile">Menu <img src="../img/menu.png" alt="Menu" /><span class="clear"><!-- --></span></label>

                <form method="POST" action="teste.jsp">
                    <ul class="cd-accordion-menu">
                        <li>
                            <label for="1" title="Acesse os subitens de Modelo Padrão" class="titulo">Login as administrator</label>
                        </li>
                        <li><input type="text" class="form-control" name="userName" placeholder="username" required></li>
                        <li><input type="password" class="form-control mt-2" name="userPass" placeholder="password" required></li>
                        <li>
                        <button type="submit" class="btn btn-info btn-block mt-2">Login</button>
                        </li>      
                    </ul>
                </form>
            </div>
        </div>  
    </body>