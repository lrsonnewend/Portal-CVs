<%-- 
    Document   : tableObj
    Created on : 29/10/2019, 18:55:31
    Author     : lucas
--%>

<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="scanCSV.leObj"%>
<%@page import="model.dao.StarDAO" %>
<%@page import="model.bean.Star" %>
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
<jsp:useBean id="bean" class="model.dao.StarDAO" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Portal-CV</title>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--Bootstrap config-->

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

        <!--INPE site config-->
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


        <!-- mdbootstrap datatables -->
        <!--        <link href="../node_modules/mdbootstrap/css/addons/datatables.min.css" rel="stylesheet">-->

        <!-- mdbootstrap datatables -->
        <!--        <script type="text/javascript" src="../node_modules/mdbootstrap/js/addons/datatables.min.js"></script>-->

        <!-- Bootstrap core CSS -->
        <!--        <link href="../node_modules/mdbootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Material Design Bootstrap -->
        <!--        <link href="../node_modules/mdbootstrap/css/mdb.min.css" rel="stylesheet">-->

        <!-- datatables config -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>


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
                                <h1 class="documentFirstHeading">All objects</h1>
                                <fieldset>
                                    <br>

                                    <div class="table-responsive">

                                        <form method="POST" action="singleObjName.jsp">
                                            <table id="objectsTable" class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" title="Sort name" >
                                                            Object name 
                                                        </th>
                                                        <th scope="col" title="Sort RA" >
                                                            RA 
                                                        </th>                                              
                                                        <th scope="col" title="Sort DEC" >
                                                            DEC 
                                                        </th>
                                                        
                                                        <th scope="col" title="Sort DEC" >
                                                            View 
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <% StarDAO sdao = new StarDAO();
                                                        for (Star s : sdao.getAllObj()) {
                                                    %>
                                                    <tr>

                                                        <td>
                                                            <input type="hidden" name="nameObj" value=" <% s.getNameCat(); %> ">
                                                            <% out.print(s.getNameCat()); %>
                                                        </td>

                                                        <td>
                                                            <% out.print(s.getRaCat()); %>
                                                        </td>

                                                        <td>
                                                            <% out.print(s.getDecCat()); %>
                                                        </td>

                                                        <td>        
                                                            <input class="btn btn-info" type="submit" value="More info">   
                                                        </td>

                                                    </tr> 
                                                    <% }%>  
                                                </tbody>
                                            </table>
                                        </form>

                                    </div> <!-- End of Container -->

                                    <br><br>
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

        <!-- mdbootstrap config table -->
        <!--        <script>
                    $(document).ready(function() {
                        $('#objectsTable').DataTable();
                        $('.dataTables_length').addClass('bs-select');
                    });
                </script>-->

        <script>
            $(document).ready(function() {
                $('#objectsTable').DataTable();
            });

        </script>

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <!--        <script type="text/javascript" src="../node_modules/mdbootstrap/js/jquery-3.4.1.min.js"></script>-->

        <!-- Bootstrap tooltips -->
        <!--        <script type="text/javascript" src="../node_modules/mdbootstrap/js/popper.min.js"></script>-->

        <!-- Bootstrap core JavaScript -->
        <!--        <script type="text/javascript" src="../node_modules/mdbootstrap/js/bootstrap.min.js"></script>-->

        <!-- MDB core JavaScript -->
        <!--        <script type="text/javascript" src="../node_modules/mdbootstrap/js/mdb.min.js"></script>-->

        <!-- MDBootstrap Datatables  -->
        <script type="text/javascript" src="../node_modules/mdbootstrap/js/addons/datatables.min.js"></script>




    </body>
</html>
