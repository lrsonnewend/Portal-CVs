<%-- 
    Document   : mostraInfo
    Created on : 26/07/2019, 09:48:13
    Author     : lucas
--%>

<%@page import="java.net.InetAddress"%>
<%@page import="java.awt.Window"%>
<%@page import="java.io.*"%>
<%@page import=" static java.lang.System.out"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>"
<%@page import="java.util.List"%>

<jsp:useBean id="myBean" scope="application" class="scanCSV.leObj"/>

<%@page language="Java" import="scanCSV.leObj" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <title>portal-cv</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                <h1 class="documentFirstHeading">Results</h1>
                                <fieldset>
                                    <form>
                                        <br>
                                        <%
                                            
                                            ServletContext context = getServletConfig().getServletContext();
                                            String ip = InetAddress.getLocalHost().getHostAddress();
                                            
                                            String path = ip+context.getContextPath() + "/data/AllObjects.csv";
                                            String name = request.getAttribute("name").toString();
                                            //out.print(myBean.searchObj(name, "coord1", "coord2"));
                                            //out.print(path);
                                            //String ipMaq = InetAddress.getLocalHost().getHostAddress();
                                            BufferedReader contentCSV = null;
                                            String linha = "";
                                            String separa = ",";
                                            List<List<String>> csvData = new ArrayList<List<String>>();

                                            List<String> nomeObj = new ArrayList();
                                            List<String> raObj = new ArrayList();
                                            List<String> decObj = new ArrayList();
                                            List<String> nomeObj2 = new ArrayList();
                                            List<String> raObj2 = new ArrayList();
                                            List<String> decObj2 = new ArrayList();
                                            List<String> typeObj = new ArrayList();
                                            List<String> magObj = new ArrayList();
                                            List<String> otherName = new ArrayList();
                                            List<String> period = new ArrayList();
                                            List<String> periodRK = new ArrayList();
                                            List<String> outburst = new ArrayList();
                                            List<String> glat = new ArrayList();
                                            List<String> glong = new ArrayList();
                                            List<String> typeRK = new ArrayList();
                                            List<String> resultsRK = new ArrayList();

                                            List<String> copyNameObj2 = new ArrayList();
                                            List<String> copyNameObj = new ArrayList();
                                            ArrayList<String> resultsDS = new ArrayList();

                                            //String csvFile = dataPath + "AllObjects.csv";

                                            try {

                                                contentCSV = new BufferedReader(new FileReader(path));
                                                while ((linha = contentCSV.readLine()) != null) {
                                                    String[] separado = linha.split(",");
                                                    List<String> dataLine = new ArrayList<String>(separado.length);

                                                    for (String data : separado) {
                                                        dataLine.add(data);
                                                    }

                                                    csvData.add(dataLine);
                                                    nomeObj.add(dataLine.get(0).trim().toLowerCase());
                                                    copyNameObj.add(dataLine.get(0).trim());

                                                    raObj.add(dataLine.get(1).trim());
                                                    decObj.add(dataLine.get(2).trim());
                                                    typeRK.add(dataLine.get(3).trim());
                                                    periodRK.add(dataLine.get(6).trim());

                                                    nomeObj2.add(dataLine.get(10).trim().toLowerCase());
                                                    copyNameObj2.add(dataLine.get(10).trim());

                                                    raObj2.add(dataLine.get(11).trim());
                                                    decObj2.add(dataLine.get(12).trim());

                                                    typeObj.add(dataLine.get(20).trim());
                                                    magObj.add(dataLine.get(5).trim());
                                                    otherName.add(dataLine.get(31).trim());
                                                    period.add(dataLine.get(21).trim());
                                                    outburst.add(dataLine.get(22).trim());
                                                    glong.add(dataLine.get(18).trim());
                                                    glat.add(dataLine.get(19).trim());

                                                }

                                            } catch (FileNotFoundException e) {
                                                System.out.println("Arquivo não encontrado:\n" + e.getMessage());

                                            } catch (ArrayIndexOutOfBoundsException e) {
                                                System.out.println("IndexOutOfBounds erro:\n" + e.getMessage());

                                            } catch (IOException e) {
                                                System.out.println("IO erro:\n" + e.getMessage());

                                            } finally {
                                                if (contentCSV != null) {
                                                    try {
                                                        contentCSV.close();
                                                    } catch (IOException e) {
                                                        System.out.println("IO erro:\n" + e.getMessage());
                                                    }
                                                }
                                            }
                                            resultsDS.removeAll(resultsDS);

                                            for (int i = 0; i < nomeObj2.size(); i++) {
                                                if (nomeObj2.get(i).equals(name)) {
                                                    resultsDS.add("<label><font face='Arial' size='3'>"
                                                        + i + "<br>encontrado em ds<br>Name: </font></label>" + copyNameObj2.get(nomeObj2.indexOf(name))
                                                        + "<label><font face='Arial' size='3'>"
                                                        + "<br>Other Name: </font></label>" + otherName.get(i)
                                                        + "<label><font face='Arial' size='3'>"
                                                        + "<br>RAJ2000: </font></label>" + raObj2.get(i)
                                                        + "<label><font face='Arial' size='3'>"
                                                        + "<br>DECJ2000: </font></label>" + decObj2.get(i)
                                                        + "<label><font face='Arial' size='3'>"
                                                        + "<br>Type: </font></label>" + typeObj.get(i)
                                                        + "<label><font face='Arial' size='3'>"
                                                        + "<br>Outburst: </font></label>" + outburst.get(i)
                                                        + "<label><font face='Arial' size='3'>"
                                                        + "<br>Period: </font></label>" + period.get(i)
                                                        + "<label><font face='Arial' size='3'>"
                                                        + "<br>Galatic Longitude: </font></label>" + glong.get(i)
                                                        + "<label><font face='Arial' size='3'>"
                                                        + "<br>Galatic Latitude: </font></label>" + glat.get(i)
                                                        + "<br><br><a href=\"http://simbad.u-strasbg.fr/simbad/sim-id?Ident=\n"
                                                        + otherName.get(i) + "\n"
                                                        + "&NbIdent=1&Radius=2&Radius.unit=arcmin&submit=submit+id\" target=\"_blank\">\n"
                                                        + "<font color=\"blue\">View object in SIMBAD\n"
                                                        + "</font></a><br><br>");
                                                }
                                            }

                                            String aux = "";
                                            int tamAux = 0;
                                            aux = resultsDS.toString();
                                            tamAux = resultsDS.size();

                                            out.print(path);

                                        

                                        %>


                                        <br><br>

                                        <strong><a href="searchObject.jsp">Voltar</a></strong>

                                        <!--RA do objeto
                                        <input type="text" value="<%=request.getAttribute("ra")%>"<br>
                            
                                        DEC do objeto
                                        <input type="text" value="<%=request.getAttribute("dec")%>"<br>
                            
                                        <input type="button" value="Voltar" onclick="history.back()">
                                        <br><br>
                                        <button><a href="searchObject.jsp">Voltar</a></button>-->
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
        <jsp:include page="views/rodape.jsp" />
        <!-- /Footer-->
    </body>
</html>
