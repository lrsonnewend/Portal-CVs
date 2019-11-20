<%-- 
    Document   : singleObjCoord
    Created on : 30/08/2019, 15:27:33
    Author     : lucas
--%>

<!-- página que retorna um objeto que é selecionado por meio de um click na tabela 
    quando há mais de um objeto achado na pesquisa por coordenada -->

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.lang.Math.*"%>
<%@page import="java.net.*"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.awt.Window"%>
<%@page import="java.io.*"%>
<%@page import="static java.lang.System.out"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<jsp:useBean id="beanC" class="scanCSV.leObj" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>portal-cv</title>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link media="screen" href="../css/plone.css" type="text/css" rel="stylesheet" id="plone-css" />    
        <link media="all" href="../css/main.css" type="text/css" rel="stylesheet" id="main-css" />  
        <link media="all" href="../css/style.css" type="text/css" rel="stylesheet" id="style-css" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <link media="all" href="../css/css-intranet-inpe.css" rel="stylesheet" id="intranet-css" /> 
        <link media="all" href="../css/css-menu.css" rel="stylesheet" id="menu-css" /> 
        <link media="all" href="../css/css-home.css" rel="stylesheet"/>
        <link media="all" rel="stylesheet" type="text/css" href="../css/css-servico-inpe.css"/>
        <link media="all" href="../css/css-branco-inpe.css" rel="stylesheet">

        <link media="all" href="../css/css-intranet-inpe-contraste.css" rel="stylesheet" id="intranet-css-contraste" /> 
        <link media="all" href="../css/css-menu-contraste.css" rel="stylesheet" id="menu-css-contraste" />   

        <script src="../js/jquery/jquery-1.9.1.js" type="application/javascript"></script>  
        <script src="../js/jquery/jquery.cookie.js" type="application/javascript"></script>  
        <script src="../js/functions.js" type="application/javascript"></script>

    </head>
    <body>
        <jsp:include page="../views/topo.jsp" />
        <div id="main" role="main">
            <div id="plone-content">
                <div id="portal-columns" class="row">
                    <jsp:include page="../views/menu.jsp" />
                    <!-- Column 1 - MENU --> 
                    <!-- Conteudo -->
                    <div id="portal-column-content" class="cell width-3:4 position-1:4">
                        <div id="main-content">    
                            <div id="content">
                                <h1 class="documentFirstHeading">Search results by coordinates</h1>
                                <fieldset>
                                    <form>
                                        <br>
                                        <%
                                            String objName = request.getAttribute("name").toString().trim().toLowerCase(); //recebendo o atributo objName do servlet singleCoordinate.java
                                            String referenceObj = request.getAttribute("ref").toString().trim();//recebendo o atributo referenceObj do servlet singleCoordinate.java
                                            String ra = request.getAttribute("ra").toString().trim(); //recebendo o atributo ra do servlet singleCoordinate.java
                                            String dec = request.getAttribute("dec").toString().trim(); //recebendo o atributo dec do servlet singleCoordinate.java

                                            List<String> resultsFinal = new ArrayList();

                                            resultsFinal = beanC.uniqueObjCoord(objName, ra, dec); // a lista recebe como conteúdo o retorno da função na classe leObj.java

                                            for (int i = 0; i < resultsFinal.size(); i++) {
                                                out.print(resultsFinal.get(i));
                                            }
                                        %>                                
                                        <br><br>

                                        <strong><a href="searchObjectCoord.jsp">Search another object</a></strong>                                       
                                    </form>
                                </fieldset>
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
        <jsp:include page="../views/rodape.jsp" />
        <!-- /Footer-->
    </body>
</html>
