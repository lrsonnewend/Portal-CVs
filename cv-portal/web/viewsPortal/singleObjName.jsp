<%-- 
    Document   : singleObjName
    Created on : 10/09/2019, 15:01:42
    Author     : lucas
--%>

<!-- página que retorna um objeto que é selecionado por meio de um click na tabela 
    quando há mais de um objeto pesquisado com nome igual -->

<%@page import="model.bean.Star"%>
<%@page import="model.dao.StarDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="bean" class="scanCSV.leObj" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>portal-cv</title>

        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

        <link media="screen" href="../css/plone.css" type="text/css" rel="stylesheet" id="plone-css" />    
        <link media="all" href="../css/main.css" type="text/css" rel="stylesheet" id="main-css" />  

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
                                <h1 class="documentFirstHeading">Search results by name</h1>
                                <fieldset>
                                    <form>
                                        <br>
                                        <%
                                            Star objStar = Star.newStar();
                                            StarDAO sdao = new StarDAO();

                                            //recebendo o atributo nome da classe searchObject.jsp
                                            objStar.setNameCat(request.getParameter("nameObj").toString());

                                            for (Star s : sdao.SearchNameObject(objStar)) {
                                        %>

                                        <div class= "form-group">
                                            <div>
                                                <b scope="row">Name: </b>
                                                <% out.print(s.getNameCat()); %>
                                            </div>

                                            <div class="mt-3">
                                                <b scope="row">RA (J2000): </b>
                                                <% out.print(s.getRaCat()); %>
                                            </div>

                                            <div class="mt-3">
                                                <b scope="row">DEC (J2000): </b>
                                                <% out.print(s.getDecCat()); %>
                                            </div>

                                            <div class="mt-4">
                                                <a href="http://simbad.u-strasbg.fr/simbad/sim-id?Ident=<% out.print(s.getNameCat()); %>
                                                   &NbIdent=1&Radius=2&Radius.unit=arcmin&submit=submit+id" target="_blank">View object in SIMBAD</a>
                                            </div>

                                            <div class="mt-3">
                                                <a href='https://ui.adsabs.harvard.edu/search/q=object:"<% out.print(s.getNameCat().toLowerCase()); %>"' target="_blank">View object in ADS</a>                                            
                                            </div>


                                        </div>

                                        <% }%>

                                        <br><br>
                                    </form>

                                    <br><br>
                                    <a href="./viewsPortal/searchObject.jsp"><button class="btn btn-info">Search another object</button></a>
                                    <br>
                                </fieldset>
                                <br><br><br><br>
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