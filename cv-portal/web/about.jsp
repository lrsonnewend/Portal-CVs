<%-- 
    Document   : about
    Created on : 16/10/2019, 17:31:40
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Portal-CV</title>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link media="screen" href="./css/plone.css" type="text/css" rel="stylesheet" id="plone-css" />    
        <link media="all" href="./css/main.css" type="text/css" rel="stylesheet" id="main-css" />  
        <link media="all" href="./css/style.css" type="text/css" rel="stylesheet" id="style-css" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <link media="all" href="./css/css-intranet-inpe.css" rel="stylesheet" id="intranet-css" /> 
        <link media="all" href="./css/css-menu.css" rel="stylesheet" id="menu-css" /> 
        <link media="all" href="./css/css-home.css" rel="stylesheet"/>
        <link media="all" rel="stylesheet" type="text/css" href="./css/css-servico-inpe.css"/>
        <link media="all" href="./css/css-branco-inpe.css" rel="stylesheet">

        <link media="all" href="./css/css-intranet-inpe-contraste.css" rel="stylesheet" id="intranet-css-contraste" /> 
        <link media="all" href="./css/css-menu-contraste.css" rel="stylesheet" id="menu-css-contraste" />   

        <script src="./js/jquery/jquery-1.9.1.js" type="application/javascript"></script>  
        <script src="./js/jquery/jquery.cookie.js" type="application/javascript"></script>  
        <script src="./js/functions.js" type="application/javascript"></script>
    </head>
    <body>
        <jsp:include page="views/topo.jsp" />
        <div id="main" role="main">
            <div id="plone-content">
                <div id="portal-columns" class="row">
                    <!-- Column 1 - MENU --> 
                    <jsp:include page="views/menu.jsp"/>
                    <!-- Conteudo -->
                    <div id="portal-column-content" class="cell width-3:4 position-1:4">
                        <div id="main-content">    
                            <div id="content">
                                <h1 class="documentFirstHeading">About</h1>

                                <p class="mt-2">
                                    CV Portal was developed at the National Institute for Space Research (INPE) by Lucas Sonnewend.
                                    This project was created with web development languages: JSP, Java, HTML, CSS and JavaScript.
                                    HTML, CSS, JavaScript, and JSP are used to form the scope and style of the system. The Java
                                    language is used for methods of searching for objects by name and coordinates.
                                    The <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a> framework is also used for system front end styles.
                                </p>
                                <p>
                                    The code is available on <a href="https://github.com/lrsonnewend/Portal-CVs" target="_blank">GitHub</a>. We are open to opinions on system development.                                
                                </p>
                                <br><br>

                                <div>
                                    <p>
                                        <strong>Desenvolvido por <a href="http://www.cea.inpe.br/" title="Acesse COCTI/INPE" target="_blank">CEA/INPE</a></strong>
                                    </p>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <!-- Fim do Conteudo -->      
                    <div class="clear"><!-- --></div>
                    <div id="voltar-topo"><a href="#topo" title="Acesse Voltar para o topo">Voltar para o topo</a></div>
                </div>
            </div>
        </div>
        <div class="clear"><!-- --></div>

        <!-- Footer -->
        <jsp:include page="views/rodape.jsp" />
        <!-- /Footer-->
    </body>
</html>