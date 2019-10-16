<%-- 
    Document   : index
    Created on : 01/08/2019, 10:06:38
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

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

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

        <style>

        </style>
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
                                <h1 class="documentFirstHeading">Cataclysmic Variables Portal</h1>
                                <fieldset>
                                    <!--                                    <ul class="nav">
                                                                            <li class="nav-item">
                                                                                <a class="nav-link active" href="#">Active</a>
                                                                            </li>
                                                                            <li class="nav-item">
                                                                                <a class="nav-link" href="#">Link</a>
                                                                            </li>
                                                                            <li class="nav-item">
                                                                                <a class="nav-link" href="#">Link</a>
                                                                            </li>
                                                                            <li class="nav-item">
                                                                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                                                                            </li>
                                                                        </ul>
                                                                    </fieldset>-->
                                    <strong><a href="table.html" target="_blank">
                                            <font size="4.5" face="Arial">
                                            View catalog 
                                            </font></a></strong>
                                    <font size="4" face="Arial">
                                    &nbsp;see all objects and their attributes in the table.
                                    </font>

                                    <br><br>

                                    <div class="dropdown">

                                        <button class="dropbtn">
                                            <b><font size="4" face="Arial">Search object</font></b>

                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="searchObject.jsp" target="_blank">By name</a>
                                            <a href="searchObjectCoord.jsp" target="_blank">By coordinates</a>
                                        </div>
                                    </div>
                                    <font size="4.5" face="Arial">
                                    &nbsp;&nbsp;search for a specific object in the catalog.
                                    </font>
                                </fieldset>
                                <br><br>
                                <div>
                                    <br>
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