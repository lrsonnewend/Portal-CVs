<%-- 
    Document   : feedbackCreate
    Created on : 04/11/2019, 18:18:50
    Author     : lucas
--%>

<%@page import="model.dao.SubUserDAO"%>
<%@page import="model.bean.SubmitUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.dao.StarDAO" %>
<%@page import="model.bean.Star" %>

<!-- página que irá exibir uma mensagem para o usuário após ele submeter um novo objeto.-->
<!DOCTYPE html>
<html>
    <head>
        <title>Portal-CV</title>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

        <link media="screen" href="../css/plone.css" type="text/css" rel="stylesheet" id="plone-css" />    
        <link media="all" href="../css/main.css" type="text/css" rel="stylesheet" id="main-css" />  
        <!--        <link media="all" href="./css/style.css" type="text/css" rel="stylesheet" id="style-css" /> -->

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
                    <!-- Column 1 - MENU --> 
                    <jsp:include page="../views/menu.jsp"/>
                    <!-- Conteudo -->
                    <div id="portal-column-content" class="cell width-3:4 position-1:4">
                        <div id="main-content">    
                            <div id="content">
                                <p class="mt-2">
                                    <% 
                                        SubUserDAO dao = new SubUserDAO();
                                        SubmitUser sub = SubmitUser.newSubmit();
                                        
                                        sub.setNomeUser(request.getParameter("nameUser").toString());
                                        sub.setEmailUser(request.getParameter("emailUser").toString());
                                        sub.setObjSubmit(request.getParameter("nameObj").toString());
                                        sub.setRaSubmit(request.getParameter("raObj").toString());
                                        sub.setDecSubmit(request.getParameter("decObj").toString());
                                        
                                        if(dao.createSub(sub))
                                            out.print("The data relating to the object for registration were sent to the page administrator"
                                                    + "for review and may soon be available in our catalog. Thank you for contributing to CV Portal");
                                        
                                    %>
                                </p>
                                <br><br class="mt-4">
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
        <jsp:include page="../views/rodape.jsp" />
        <!-- /Footer-->


    </body>
</html>
