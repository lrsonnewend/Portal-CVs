<%-- 
    Document   : searchObject
    Created on : 26/07/2019, 09:48:51
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>portalCV</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link media="screen" href="./css/plone.css" type="text/css" rel="stylesheet" id="plone-css" />    
        <link media="all" href="./css/main.css" type="text/css" rel="stylesheet" id="main-css" />  
        <link media="all" href="./css/style.css" type="text/css" rel="stylesheet" id="style-css" />

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
                                <h1 class="documentFirstHeading">Object search</h1>
                                <form method="POST" action="pesquisa">
                                    <td colspan="7">
                                        <em>Search for objects with only one or all fields</em>
                                    </td>
                                    <fieldset><br>
                                        <p>                                   
                                            <label for="sName">
                                                <font size="4.5" face="Arial">Object name</font></label>
                                            <input type="text" name="name" id="sName">

                                        </p>
                                        <br><br>
                                        <p>
                                            <label for="sCoord">
                                                <font size="4.5" face="Arial">Coordinates</font></label>
                                            <br>

                                            <font size="4" face="Arial">RA </font>
                                            <input type="text" name="ra" id="sCoord"> hh mm ss.ss                                    
                                            
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <font size="4" face="Arial">DEC</font>
                                            <input type="text" name="dec" id="sCoord"> +/-dd mm ss.ss
                                            
                                            <br><br>
                                            
                                            <font size="3" face="Arial">radius</font>
                                            <input type="text" name="arcsec" id="sCoord" size="10" value="5"> arc sec
                                        </p>
                                        <br>
                                        <input type="submit" value="Search object" >                                
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="reset" name="breset" value="Reset values">
                                        <br><br><br><br><strong><a href="index.jsp">Home</a></strong>
                                    </fieldset>
                                    <br>                                    
                                </form>
                                <p>
                                    <strong>Desenvolvido por <a href="http://www.cea.inpe.br/" title="Acesse COCTI/INPE" target="_blank">CEA/INPE</a></strong>
                                </p>


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

