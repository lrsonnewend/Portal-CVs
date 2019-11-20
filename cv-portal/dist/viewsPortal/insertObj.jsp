<%-- 
    Document   : insertObj
    Created on : 04/11/2019, 17:12:16
    Author     : lucas
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Portal-CV</title>
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
                    <!-- Column 1 - MENU --> 
                    <jsp:include page="../views/menu.jsp"/>
                    <!-- Conteudo -->
                    <div id="portal-column-content" class="cell width-3:4 position-1:4">
                        <div id="main-content">    
                            <div id="content">
                                <h1 class="documentFirstHeading">Cataclysmic register</h1>
                                <form method="POST" action="./feedbackCreate.jsp">      
                                    <fieldset>
                                        <p class="mt-4">
                                            In this page, any user can submit one or more objects to the CV Portal.
                                            The object(s) will be added to the catalog after approval of the portal managers.
                                        </p>
                                        <p>
                                            The submission can be done by filling a form for each object or by submitting a csv in this format:
                                            <b>Columns</b>
                                        </p>

                                        <ul>
                                            <li>
                                                Object Name 
                                            </li>

                                            <li>
                                                RA (J2000) 
                                            </li>

                                            <li>
                                                DEC (J2000) 
                                            </li>
                                        </ul>
                                        <br>

                                        <h3 style="color: #9aa6a6">-- User --</h3>


                                        <div class="form-group mt-4">
                                            <label for="ra">Name</label>
                                            <input type="text" name="nameUser" class="form-control col-md-4"required>                            
                                        </div>


                                        <div class="form-group mt-4">
                                            <label for="ra">Email</label>
                                            <input type="text" name="emailUser" class="form-control col-md-4" placeholder="" required>                            
                                        </div>
                                        <div class="mt-4"></div>
                                        <hr> 

                                        <h3 class="mt-4" style="color: #9aa6a6">-- Object --</h3>

                                        <div class="form-group mt-4">
                                            <label for="ra">Name</label>
                                            <input type="text" name="nameObj" class="form-control col-md-4"required>                            
                                        </div>


                                        <div class="form-group mt-3">
                                            <label for="ra">RA</label>
                                            <input type="text" name="raObj" class="form-control col-md-4" placeholder="hh mm ss.ss" required>                            
                                        </div>

                                        <div class="form-group mt-4">
                                            <label for="dec">DEC</label>
                                            <input type="text" name="decObj" class="form-control col-md-4" placeholder="+/-dd mm ss.ss" required>                            
                                        </div>


                                        <button type="submit" class="btn btn-success mt-2">Submit</button>   
                                        <button type="reset" class="btn btn-primary mt-2 ml-3">Reset values</button>
                                        <br><br>                                        
                                    </fieldset>
                                </form>
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

