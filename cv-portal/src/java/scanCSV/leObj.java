/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scanCSV;

import com.sun.corba.se.spi.presentation.rmi.StubAdapter;
import java.io.*;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author lucas
 */
public class leObj {

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

    int count = 0;

    public String searchObj(String name, String coord1, String coord2) {
         
        
        name = name.toLowerCase();
        String dataPath = "/home/lucas/cv-portal/web/data/"; //caminho local
        //dataPath = "/home/cv-portal/data/"; //caminho servidor
        String csvFile = dataPath + "AllObjects.csv";

        try {

            contentCSV = new BufferedReader(new FileReader(csvFile));
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

        return resultsDS + "total de objetos: " + tamAux;

    }

    /*else if (nomeObj.get(i).equals(name)) {
     resultsRK.add("<label><font face='Arial' size='3'>"
     + "encontrado em rk<br>Name: </font></label>" + copyNameObj.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>Other Name: </font></label>" + otherName.get(i)
     + "<label><font face='Arial' size='3'>"
     + "<br>RAJ2000: </font></label>" + raObj.get(i)
     + "<label><font face='Arial' size='3'>"
     + "<br>DECJ2000: </font></label>" + decObj.get(i)
     + "<label><font face='Arial' size='3'>"
     + "<br>Type: </font></label>" + typeRK.get(i)
     + "<label><font face='Arial' size='3'>"
     + "<br>Outburst: </font></label>" + outburst.get(i)
     + "<label><font face='Arial' size='3'>"
     + "<br>Period: </font></label>" + periodRK.get(i)
     + "<label><font face='Arial' size='3'>"
     + "<br>Galatic Longitude: </font></label>" + glong.get(i)
     + "<label><font face='Arial' size='3'>"
     + "<br>Galatic Latitude: </font></label>" + glat.get(i)
     + "<br><br><a href=\"http://simbad.u-strasbg.fr/simbad/sim-id?Ident=\n"
     + nomeObj.get(i) + "\n"
     + "&NbIdent=1&Radius=2&Radius.unit=arcmin&submit=submit+id\" target=\"_blank\">\n"
     + "<font color=\"blue\">View object in SIMBAD\n"
     + "</font></a><br><br>");
     }*/
    /*if (nomeObj.contains(name)) {
     return "<label><font face='Arial' size='3'>"
     + "Name: </font></label>" + copyNameObj.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>Other Name: </font></label>" + otherName.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>RAJ2000: </font></label>" + raObj.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>DECJ2000: </font></label>" + decObj.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>Type: </font></label>" + typeRK.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>Outburst: </font></label>" + outburst.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>Period: </font></label>" + period.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>Galatic Longitude: </font></label>" + glong.get(nomeObj.indexOf(name))
     + "<label><font face='Arial' size='3'>"
     + "<br>Galatic Latitude: </font></label>" + glat.get(nomeObj.indexOf(name));
     }
     if (resultsDS.size() == 0 && resultsRK.size() == 0) {
     return "not found";
     }

     if (resultsDS.isEmpty() == false || resultsRK.isEmpty() == false) {
     return resultsDS.toString();
     } 
        
     else if (resultsDS.isEmpty()) {
     return resultsRK.toString();
     } 
        
     else {
     return null;
     }
    
     public String moreInfo(String name) {
     if (nomeObj.contains(name)) {
     return "<label><font face='Arial' size='4'>"
     + "Object Name: </font></label>" + name.toUpperCase()
     + "<label><font face='Arial' size='4'>"
     + "<br> Other Name</font></label>" + otherName.get(nomeObj.indexOf(name));

     } else {
     return "nao encontrado";
     }
     }*/
}
