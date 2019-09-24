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
                        <li><input type="text" class="login" name="userName" placeholder="username" required="true"></li>
                        <li><input type="password" class="login" name="userPass" placeholder="password" required="true"></li>
                        <input type="submit" class="send" value="Login">
                        </li>      
                    </ul>
                </form>
            </div>
        </div>  
    </body>