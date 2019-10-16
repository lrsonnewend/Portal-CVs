<%-- 
    Document   : mostraInfo
    Created on : 26/07/2019, 09:48:13
    Author     : lucas
--%>

<%@page import="scanCSV.leObj"%>
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
<jsp:useBean id="bean1" class="scanCSV.leObj" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Portal-CV</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>

    </head>
    <body>
        <jsp:include page="views/topo.jsp" />
        <div id="main" role="main">
            <div id="plone-content">
                <div id="portal-columns" class="row">
                    <jsp:include page="views/menu.jsp" />
                    <!-- Column 1 - MENU --> 
                    <!-- Conteudo -->
                    <div id="portal-column-content" class="cell width-3:4 position-1:4">
                        <div id="main-content">    
                            <div id="content">
                                <h1 class="documentFirstHeading">Search results by name</h1>
                                <fieldset>
                                    <br>
                                    <%

                                        String name = request.getAttribute("name").toString().trim().toLowerCase().replaceAll("  ", " "); //recebendo o atributo nome da classe searchObject.jsp
                                        List<String> nomesDS = new ArrayList();
                                        nomesDS = bean1.pesquisaNomeDS(name); // a lista recebe como conteúdo o retorno da função na classe leObj.java
                                        
                                        if(nomesDS.size() == 0)
                                            out.print("Object not found");
                                        
                                        else if (nomesDS.size() == 1) {
                                            for (int i = 0; i < nomesDS.size(); i++) {
                                                out.println(nomesDS.get(i));
                                            }
                                        } else if (nomesDS.size() > 1) {
                                    %>
                                    <form method="POST" action="singleName">
                                        <table>
                                            <tr>
                                                <th>Objects</th>
                                                <th>Coordinates</th>
                                                <th>Informations</th>
                                            </tr>
                                            <%for (int i = 0; i < nomesDS.size(); i++) {
                                                    String objSplit[] = nomesDS.get(i).split("<br>");%>
                                            <tr>
                                                <td> <%= objSplit[0]%></td>
                                                <td> <input type="hidden" name="ra" value="<%= objSplit[1]%>">
                                                    <input type="hidden" name="dec" value="<%= objSplit[2]%>">
                                                    <% out.print(objSplit[1] + " " + objSplit[2]); %> </td>

                                                <td> <input type="submit" value="Info"> </td>
                                            </tr>
                                            <% }
                                                }%>
                                        </table>
                                    </form>
                                    <br><br>
                                    <a href="searchObject.jsp"><button class="btn btn-info">Search another object</button></a>
                                    <br>
                                    <a href="index.jsp"><button class="btn btn-primary mt-4">Home</button></a>
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
        <jsp:include page="views/rodape.jsp" />
        <!-- /Footer-->
    </body>
</html>
