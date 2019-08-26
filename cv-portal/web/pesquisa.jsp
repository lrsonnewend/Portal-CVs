<%-- 
    Document   : mostraInfo
    Created on : 26/07/2019, 09:48:13
    Author     : lucas
--%>

<%@page import="java.lang.Math.*"%>
<%@page import="java.net.*"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.awt.Window"%>
<%@page import="java.io.*"%>
<%@page import="static java.lang.System.out"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>"
<%@page import="java.util.List"%>

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
                                            URL caminho = new URL("http://" + ip + ":8080/" + context.getContextPath() + "/data/AllObjects.csv");

                                            String name = request.getAttribute("name").toString().trim().toLowerCase();
                                            String dec = request.getAttribute("dec").toString().trim();
                                            String ra = request.getAttribute("ra").toString().trim();
                                            //String arcsec = request.getAttribute("arcsec").toString().trim();
                                            //int segArco = Integer.parseInt(arcsec);
                                            //out.print(myBean.searchObj(name, "coord1", "coord2"));
                                            //out.print(path);
                                            //String caminho = new File("data/AllObjects.csv").getPath();
                                            BufferedReader contentCSV = null;
                                            String linha = "";
                                            String separa = ",";
                                            List<List<String>> csvData = new ArrayList<List<String>>();

                                            List<String> nomeObj = new ArrayList();
                                            List<String> raObj = new ArrayList();
                                            List<String> decObj = new ArrayList();
                                            List<String> periodRK = new ArrayList();
                                            List<String> typeRK = new ArrayList();
                                            List<String> typeRK2 = new ArrayList();
                                            List<String> copyNameObj = new ArrayList();
                                            List<String> magObj = new ArrayList();
                                            List<String> distanceRK = new ArrayList();
                                            List<String> fivePer = new ArrayList();
                                            List<String> ninePer = new ArrayList();

                                            List<String> nomeObj2 = new ArrayList();
                                            List<String> raObj2 = new ArrayList();
                                            List<String> decObj2 = new ArrayList();
                                            List<String> typeObj = new ArrayList();
                                            List<String> otherName = new ArrayList();
                                            List<String> period = new ArrayList();
                                            List<String> outburst = new ArrayList();
                                            List<String> glat = new ArrayList();
                                            List<String> glong = new ArrayList();
                                            List<String> pMotionRA1 = new ArrayList();
                                            List<String> pMotionRA2 = new ArrayList();
                                            List<String> pMotionDEC1 = new ArrayList();
                                            List<String> pMotionDEC2 = new ArrayList();
                                            List<String> epoch = new ArrayList();
                                            List<String> cluster = new ArrayList();
                                            List<String> coordRef = new ArrayList();     
                                            List<String> pMotionRef = new ArrayList();
                                            List<String> typeRef = new ArrayList();
                                            List<String> chartRef = new ArrayList();
                                            List<String> spectRef = new ArrayList();
                                            List<String> periodRef = new ArrayList();
                                            List<String> iueDS = new ArrayList();
                                            List<String> hstDS = new ArrayList();
                                            List<String> arielDS = new ArrayList();
                                            List<String> heao1DS = new ArrayList();
                                            List<String> heao2DS = new ArrayList();
                                            List<String> exosatDS = new ArrayList();
                                            List<String> rosatDS = new ArrayList();
                                            List<String> gingaDS = new ArrayList();
                                            List<String> ascaDS = new ArrayList();
                                            List<String> euveDS = new ArrayList();

                                            

                                            List<String> copyNameObj2 = new ArrayList();
                                            List<String> magObjDS = new ArrayList();
                                            List<String> resultsNameRK = new ArrayList();
                                            List<String> resultsNameDS = new ArrayList();

                                            List<String> resultsCoord = new ArrayList();

                                            //String csvFile = dataPath + "AllObjects.csv";
                                            try {
                                                BufferedReader in = new BufferedReader(new InputStreamReader(caminho.openStream()));
                                                String saidaTexto;
                                                while ((saidaTexto = in.readLine()) != null) {
                                                    String[] separado = saidaTexto.split(",");
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
                                                    typeRK2.add(dataLine.get(4).trim());
                                                    magObj.add(dataLine.get(5).trim());
                                                    periodRK.add(dataLine.get(6).trim());
                                                    distanceRK.add(dataLine.get(7).trim());
                                                    fivePer.add(dataLine.get(8).trim());
                                                    ninePer.add(dataLine.get(9).trim());

                                                    nomeObj2.add(dataLine.get(10).trim().toLowerCase());
                                                    copyNameObj2.add(dataLine.get(10).trim());

                                                    raObj2.add(dataLine.get(11).trim());
                                                    decObj2.add(dataLine.get(12).trim());
                                                    pMotionRA1.add(dataLine.get(13).trim());
                                                    pMotionRA2.add(dataLine.get(14).trim());
                                                    pMotionDEC1.add(dataLine.get(15).trim());
                                                    pMotionDEC2.add(dataLine.get(16).trim());
                                                    epoch.add(dataLine.get(17).trim());
                                                    glong.add(dataLine.get(18).trim());
                                                    glat.add(dataLine.get(19).trim());
                                                    typeObj.add(dataLine.get(20).trim());
                                                    period.add(dataLine.get(21).trim());
                                                    outburst.add(dataLine.get(22).trim());
                                                    cluster.add(dataLine.get(23).trim());
                                                    magObjDS.add(dataLine.get(24).trim());
                                                    coordRef.add(dataLine.get(25).trim());
                                                    pMotionRef.add(dataLine.get(26).trim());
                                                    typeRef.add(dataLine.get(27).trim());
                                                    chartRef.add(dataLine.get(28).trim());
                                                    spectRef.add(dataLine.get(29).trim());
                                                    periodRef.add(dataLine.get(30).trim());
                                                    otherName.add(dataLine.get(31).trim());
                                                    iueDS.add(dataLine.get(32).trim());
                                                    hstDS.add(dataLine.get(33).trim());
                                                    arielDS.add(dataLine.get(34).trim());
                                                    heao1DS.add(dataLine.get(35).trim());
                                                    heao2DS.add(dataLine.get(36).trim());
                                                    exosatDS.add(dataLine.get(37).trim());
                                                    rosatDS.add(dataLine.get(38).trim());
                                                    gingaDS.add(dataLine.get(39).trim());
                                                    ascaDS.add(dataLine.get(40).trim());
                                                    euveDS.add(dataLine.get(41).trim());
                                                    

                                                }
                                                in.close();

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

                                            float difCoordRA1 = 0;
                                            float difCoordRA2 = 0;
                                            float difCoordDEC1 = 0;
                                            float difCoordDEC2 = 0;
                                            double difRK, difDS;

                                            for (int i = 0; i < nomeObj2.size(); i++) {
                                                if (name.equals("") == false) {
                                                    if (nomeObj2.get(i).equals(name)) {
                                                        resultsNameDS.add(copyNameObj2.get(nomeObj2.indexOf(name))
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Other Name: </font></label>" + otherName.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>RAJ2000: </font></label>" + raObj2.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>DECJ2000: </font></label>" + decObj2.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Proper motion (RAJ2000) </font></label>" + pMotionRA1.get(i)+"/"+pMotionRA2.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Proper motion (DECJ2000) </font></label>" + pMotionDEC1.get(i)+"/"+pMotionDEC2.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Outburst: </font></label>" + outburst.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Period: </font></label>" + period.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Galatic Longitude: </font></label>" + glong.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Galatic Latitude: </font></label>" + glat.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Epoch: </font></label>" + epoch.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Object type: </font></label>" + typeObj.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                
                                                                + "<br><br>Coordinate reference:</font></label>" + coordRef.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Proper motion reference:</font></label>" + pMotionRef.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Chart reference: </font></label>" + chartRef.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Type reference: </font></label>" + typeRef.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Period reference: </font></label>" + periodRef.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Spectrum reference:</font></label>" + spectRef.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br><br><i>Space-Based Observations: </i></font></label>"
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>IUE: </font></label>" + iueDS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "&nbsp;&nbsp;&nbsp;EXOSAT: </font></label>" + exosatDS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>HST: </font></label>" + hstDS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "&nbsp;&nbsp;&nbsp;ROSAT: </font></label>" + rosatDS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>HEAO1: </font></label>" + heao1DS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "&nbsp;&nbsp;&nbsp;GINGA: </font></label>" + gingaDS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>HEAO2 </font></label>" + heao2DS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "&nbsp;&nbsp;&nbsp;Ariel 5: </font></label>" + arielDS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>EUVE: </font></label>" + euveDS.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "&nbsp;&nbsp;&nbsp;ASCA: </font></label>" + ascaDS.get(i)
                                                                + "<br><br><a href=https://ui.adsabs.harvard.edu/search/q=" + nomeObj2.get(i) + "&sort=date%20desc%2C%20bibcode%20desc&p_=0\" target=\"_blank\">\n"
                                                                + "<font color=\"blue\">View object in ADS\n" + "</font></a><br><br>");
                                                    }

                                                    if (nomeObj.get(i).equals(name)) {
                                                        resultsNameRK.add("<label><font face='Arial' size='4'>"
                                                                + "<br>Encontrado em Ritter & Kolb<br>Name: </font></label>" + copyNameObj.get(nomeObj.indexOf(name))
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>RAJ(2000): </font></label>" + raObj.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>DEJ(2000) </font></label>" + decObj.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Obj. type: </font></label>" + typeRK.get(i) + " " + typeRK2.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Magnitude: </font></label>" + magObj.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>Period: </font></label>" + periodRK.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>5%: </font></label>" + fivePer.get(i)
                                                                + "<label><font face='Arial' size='3'>"
                                                                + "<br>95%: </font></label>" + ninePer.get(i)
                                                                + "<br><br><a href=\"http://simbad.u-strasbg.fr/simbad/sim-id?Ident=\n"
                                                                + nomeObj.get(i) + "\n"
                                                                + "&NbIdent=1&Radius=2&Radius.unit=arcmin&submit=submit+id\" target=\"_blank\">\n"
                                                                + "<font color=\"blue\">View object in SIMBAD\n"
                                                                + "</font></a>"
                                                                + "<br><br><a href=\"https://ui.adsabs.harvard.edu/search/q=" + nomeObj.get(i) + "&sort=date%20desc%2C%20bibcode%20desc&p_=0\" target=\"_blank\">\n"
                                                                + "<font color=\"blue\">View object in ADS\n" + "</font></a><br><br>");
                                                    }
                                                } else if (ra.equals("") == false && dec.equals("") == false) {
                                                    out.print("entrou<br><br>");
                                                    String sepRA1[] = raObj.get(i).split(" ");
                                                    String sepDEC1[] = decObj.get(i).split(" ");

                                                    String sepRA2[] = raObj2.get(i).split(" ");
                                                    String sepDEC2[] = decObj2.get(i).split(" ");

                                                    String sepRAuser[] = ra.split(" ");
                                                    String sepDECuser[] = dec.split(" ");

                                                    if (sepRA1.length > 2 && sepDEC1.length > 2) {
                                                        difCoordRA1 = Math.abs(15 * (3600 * Float.parseFloat(sepRAuser[0])
                                                                + 60 * Float.parseFloat(sepRAuser[1]) + Float.parseFloat(sepRAuser[2]))
                                                                - 15 * (3600 * Float.parseFloat(sepRA1[0])
                                                                + 60 * Float.parseFloat(sepRA1[1]) + Float.parseFloat(sepRA1[2])));

                                                        difCoordDEC1 = Math.abs((3600 * Float.parseFloat(sepDECuser[0])
                                                                + 60 * Float.parseFloat(sepDECuser[1]) + Float.parseFloat(sepDECuser[2]))
                                                                - (3600 * Float.parseFloat(sepDEC1[0])
                                                                + 60 * Float.parseFloat(sepDEC1[1]) + Float.parseFloat(sepDEC1[2])));

                                                        if (sepRA2.length > 2 && sepDEC2.length > 2) {

                                                            difCoordRA2 = Math.abs(15 * (3600 * Float.parseFloat(sepRA2[0])
                                                                    + 60 * Float.parseFloat(sepRA2[1]) + Float.parseFloat(sepRA2[2]))
                                                                    - 15 * (3600 * Float.parseFloat(sepRAuser[0])
                                                                    + 60 * Float.parseFloat(sepRAuser[1]) + Float.parseFloat(sepRAuser[2])));

                                                            difCoordDEC2 = Math.abs((3600 * Float.parseFloat(sepDECuser[0])
                                                                    + 60 * Float.parseFloat(sepDECuser[1]) + Float.parseFloat(sepDECuser[2]))
                                                                    - (3600 * Float.parseFloat(sepDEC2[0])
                                                                    + 60 * Float.parseFloat(sepDEC2[1]) + Float.parseFloat(sepDEC2[2])));
                                                        }

                                                        difRK = Math.sqrt(Math.pow(difCoordRA1, 2) + Math.pow(difCoordDEC1, 2));
                                                        difDS = Math.sqrt(Math.pow(difCoordRA2, 2) + Math.pow(difCoordDEC2, 2));

                                                        if (difRK < 1) {
                                                            resultsCoord.add("<label><font face='Arial' size='3'>"
                                                                    + i + "<br><br>Object</font></label>" + copyNameObj.get(raObj.indexOf(ra))
                                                                    + "<label><font face='Arial' size='3'>"
                                                                    + "&nbsp;<br>Dif: </font></label>" + difRK);

                                                        }

                                                        if (difDS < 1) {
                                                            resultsCoord.add("<label><font face='Arial' size='3'>"
                                                                    + "<br>Encontrado em Downes & Shara<br>Name: </font></label>" + copyNameObj2.get(i)
                                                                    + "<label><font face='Arial' size='3'>"
                                                                    + "<br>Other Name: </font></label>" + otherName.get(i)
                                                                    + "<label><font face='Arial' size='3'>"
                                                                    + "<br>RAJ2000: </font></label>" + raObj2.get(i)
                                                                    + "<label><font face='Arial' size='3'>"
                                                                    + "<br>DECJ2000: </font></label>" + decObj2.get(i)
                                                                    + "<label><font face='Arial' size='3'>"
                                                                    + "<br>Type: </font></label>" + typeObj.get(i)
                                                                    + "<label><font face='Arial' size='3'>"
                                                                    + "<br>Magnitude: </font></label>" + magObjDS.get(i)
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
                                                                    + "</font></a>"
                                                                    + "<br><br><a href=\"https://ui.adsabs.harvard.edu/search/q=" + nomeObj2.get(i) + "&sort=date%20desc%2C%20bibcode%20desc&p_=0\" target=\"_blank\">\n"
                                                                    + "<font color=\"blue\">View object in ADS\n" + "</font></a><br><br>");
                                                        }
                                                    }
                                                }
                                            }
                                            
                                            if(resultsNameDS.size() == 1){
                                                for (int i = 0; i < resultsNameDS.size(); i++) {
                                                    out.print(resultsNameDS.get(i));
                                                }
                                            }
                                            
                                            else if(resultsNameDS.size() > 1){
                                                out.print("<label><font face='Arial' size='4'>Search results</font></label>");
                                                for (int i = 0; i < resultsNameDS.size(); i++){
                                                    String splitName[] = resultsNameDS.get(i).split(" ");
                                                    //out.print("<br><br><a href='singleObject.jsp'target='_blank'>oi</a>");
                                                    out.print("<br><br>"+splitName[0]);
                                                    
                                                    
                                                }
                                                    
                                            }

                                            resultsNameRK.clear();
                                            resultsNameDS.clear();

                                            for (int i = 0; i < resultsCoord.size(); i++) {
                                                out.print(resultsCoord.get(i));
                                            }

                                            resultsCoord.clear();


                                        %>


                                        <br><br>

                                        <strong><a href="searchObject.jsp">Search another object</a></strong>

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
