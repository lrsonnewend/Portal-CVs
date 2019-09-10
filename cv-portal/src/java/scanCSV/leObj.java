package scanCSV;

import com.sun.corba.se.spi.presentation.rmi.StubAdapter;
import java.io.*;
import static java.lang.System.out;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletContext;
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
    //List<String> resultsNameRK = new ArrayList();
    //List<String> resultsNameDS = new ArrayList();
    List<String> resultsName = new ArrayList();
    List<String> copyResultsDS = new ArrayList();
    List<String> copyResultsRK = new ArrayList();
    List<String> resultsCoord = new ArrayList();
    List<String> singleObjC = new ArrayList();

    public void readCSV() throws MalformedURLException, UnknownHostException {
        String ip = InetAddress.getLocalHost().getHostAddress();
        URL caminho = new URL("http://" + ip + ":8080/cv-portal/data/AllObjects.csv");

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
                nomeObj.add(dataLine.get(0).trim().toLowerCase().replaceAll("  ", " "));
                copyNameObj.add(dataLine.get(0).trim().replaceAll("  ", " "));

                raObj.add(dataLine.get(1).trim());
                decObj.add(dataLine.get(2).trim());
                typeRK.add(dataLine.get(3).trim());
                typeRK2.add(dataLine.get(4).trim());
                magObj.add(dataLine.get(5).trim());
                periodRK.add(dataLine.get(6).trim());
                distanceRK.add(dataLine.get(7).trim());
                fivePer.add(dataLine.get(8).trim());
                ninePer.add(dataLine.get(9).trim());

                nomeObj2.add(dataLine.get(10).trim().toLowerCase().replaceAll("  ", " "));
                copyNameObj2.add(dataLine.get(10).trim().replaceAll("  ", " "));

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
                otherName.add(dataLine.get(31).trim().replaceAll("  ", " "));
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
    }

    public List<String> pesquisaNomeDS(String name) throws MalformedURLException, UnknownHostException {
        readCSV();

        if (name.equals("") == false) {
            for (int i = 0; i < nomeObj2.size(); i++) {
                if (nomeObj2.get(i).equals(name) && nomeObj.get(i).equals(name)) {
                    resultsName.add("<label><font face='Lucida' size='4'>"
                            + copyNameObj2.get(nomeObj2.indexOf(name))
                            + "</font></label>"
                            + "<label><font face='Arial' size='3'>"
                            + "<br><br>Other Name: </font></label>" + otherName.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>RA (J2000): </font></label>" + raObj2.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>DEC (J2000): </font></label>" + decObj2.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>Proper motion (RAJ2000): </font></label>" + pMotionRA1.get(i) + "/" + pMotionRA2.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>Proper motion (DECJ2000): </font></label>" + pMotionDEC1.get(i) + "/" + pMotionDEC2.get(i)
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
                            + "<br><br><a href=\"http://simbad.u-strasbg.fr/simbad/sim-coo?Coord=\n"
                            + raObj2.get(i) + " " + decObj2.get(i) + "&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none\n"
                            + "&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=\" target=\"_blank\">\n"
                            + "<font color=\"blue\">View object in SIMBAD\n" + "</font></a>"
                            + "<br><br><a href=https://ui.adsabs.harvard.edu/search/q=" + nomeObj2.get(i) + "&sort=date%20desc%2C%20bibcode%20desc&p_=0\" target=\"_blank\">\n"
                            + "<font color=\"blue\">View object in ADS\n" + "</font></a><br><br>");

                    copyResultsDS.add(copyNameObj2.get(nomeObj2.indexOf(name)) + "<br>" + raObj2.get(i) + "<br>" + decObj2.get(i) + "<br>" + otherName.get(i));
                }
                
                else if (nomeObj.get(i).equals(name)) {
                    resultsName.add("<label><font face='Lucida' size='4'>"
                            + copyNameObj.get(nomeObj.indexOf(name))
                            + "</font></label>"
                            + "<label><font face='Arial' size='3'>"
                            + "<br><br>RA (J2000): </font></label>" + raObj.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>DEC (J2000): </font></label>" + decObj.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>Obj. type: </font></label>" + typeRK.get(i) + " " + typeRK2.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>Magnitude: </font></label>" + magObj.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>Orb. Period: </font></label>" + periodRK.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>Distance: </font></label>" + distanceRK.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>5%: </font></label>" + fivePer.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>95%: </font></label>" + ninePer.get(i)
                            + "<br><br><a href=\"http://simbad.u-strasbg.fr/simbad/sim-coo?Coord=\n"
                            + raObj.get(i) + " " + decObj.get(i) + "&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none\n"
                            + "&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=\" target=\"_blank\">\n"
                            + "<font color=\"blue\">View object in SIMBAD\n" + "</font></a>"
                            + "<br><br><a href=\"https://ui.adsabs.harvard.edu/search/q=" + nomeObj.get(i) + "&sort=date%20desc%2C%20bibcode%20desc&p_=0\" target=\"_blank\">\n"
                            + "<font color=\"blue\">View object in ADS\n" + "</font></a><br><br>");

                } else if (nomeObj2.get(i).equals(name)) {
                    resultsName.add("<label><font face='Lucida' size='4'>"
                            + copyNameObj2.get(nomeObj2.indexOf(name))
                            + "</font></label>"
                            + "<label><font face='Arial' size='3'>"
                            + "<br><br>Other Name: </font></label>" + otherName.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>RA (J2000): </font></label>" + raObj2.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>DEC (J2000): </font></label>" + decObj2.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>Proper motion RA(J2000): </font></label>" + pMotionRA1.get(i) + "/" + pMotionRA2.get(i)
                            + "<label><font face='Arial' size='3'>"
                            + "<br>Proper motion DEC(J2000): </font></label>" + pMotionDEC1.get(i) + "/" + pMotionDEC2.get(i)
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
                            + "<br><br><a href=\"http://simbad.u-strasbg.fr/simbad/sim-coo?Coord=\n"
                            + raObj2.get(i) + " " + decObj2.get(i) + "&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none\n"
                            + "&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=\" target=\"_blank\">\n"
                            + "<font color=\"blue\">View object in SIMBAD\n" + "</font></a>"
                            + "<br><br><a href=https://ui.adsabs.harvard.edu/search/q=" + nomeObj2.get(i) + "&sort=date%20desc%2C%20bibcode%20desc&p_=0\" target=\"_blank\">\n"
                            + "<font color=\"blue\">View object in ADS\n" + "</font></a><br><br>");
                            
                    copyResultsDS.add(copyNameObj2.get(nomeObj2.indexOf(name)) + "<br>" + raObj2.get(i) + "<br>" + decObj2.get(i) + "<br>" + otherName.get(i));
                }
            }
        }
        if(resultsName.size() == 1)
            return resultsName;
        
        else
            return copyResultsDS;
    }

    public List<String> leCoord(String ra, String dec, int segArco) throws MalformedURLException, UnknownHostException {
        readCSV();

        if (ra.equals("") == false && dec.equals("") == false) {
            double difCoordRA1 = 0;
            double difCoordRA2 = 0;
            double difCoordDEC1 = 0;
            double difCoordDEC2 = 0;
            double difRK, difDS;

            for (int i = 0; i < raObj2.size(); i++) {

                String sepRA1[] = raObj.get(i).split(" ");
                String sepDEC1[] = decObj.get(i).split(" ");

                String sepRA2[] = raObj2.get(i).split(" ");
                String sepDEC2[] = decObj2.get(i).split(" ");

                String sepRAuser[] = ra.split(" ");
                String sepDECuser[] = dec.split(" ");

                if (sepRA1.length > 2 && sepDEC1.length > 2) {
                    difCoordRA1 = Math.abs(15 * (3600 * Integer.parseInt(sepRAuser[0])
                            + 60 * Integer.parseInt(sepRAuser[1]) + Double.parseDouble(sepRAuser[2]))
                            - 15 * (3600 * Integer.parseInt(sepRA1[0])
                            + 60 * Integer.parseInt(sepRA1[1]) + Double.parseDouble(sepRA1[2])));

                    difCoordDEC1 = Math.abs((3600 * Integer.parseInt(sepDECuser[0])
                            + 60 * Integer.parseInt(sepDECuser[1]) + Double.parseDouble(sepDECuser[2]))
                            - (3600 * Integer.parseInt(sepDEC1[0])
                            + 60 * Integer.parseInt(sepDEC1[1]) + Double.parseDouble(sepDEC1[2])));
                }

                if (sepRA2.length > 2 && sepDEC2.length > 2) {
                    difCoordRA2 = Math.abs(15 * (3600 * Integer.parseInt(sepRA2[0])
                            + 60 * Integer.parseInt(sepRA2[1]) + Double.parseDouble(sepRA2[2]))
                            - 15 * (3600 * Integer.parseInt(sepRAuser[0])
                            + 60 * Integer.parseInt(sepRAuser[1]) + Double.parseDouble(sepRAuser[2])));

                    difCoordDEC2 = Math.abs((3600 * Integer.parseInt(sepDECuser[0])
                            + 60 * Integer.parseInt(sepDECuser[1]) + Double.parseDouble(sepDECuser[2]))
                            - (3600 * Integer.parseInt(sepDEC2[0])
                            + 60 * Double.parseDouble(sepDEC2[1]) + Double.parseDouble(sepDEC2[2])));
                }

                difRK = Math.sqrt(Math.pow(difCoordRA1, 2) + Math.pow(difCoordDEC1, 2));
                difDS = Math.sqrt(Math.pow(difCoordRA2, 2) + Math.pow(difCoordDEC2, 2));

                if (segArco >= difRK) {
                    resultsCoord.add(copyNameObj.get(i) + "<br>" + difRK
                            + "<br>" + "Ritter & Kolb");

                }

                if (segArco >= difDS) {
                    resultsCoord.add(copyNameObj2.get(i) + "<br>" + difDS
                            + "<br>" + "Downes & Shara");
                }
            }
        }
        return resultsCoord;
    }

    public List<String> uniqueObjCoord(String objName, String referenceObj) throws MalformedURLException, UnknownHostException {
        readCSV();

        if (nomeObj2.contains(objName)) {
            singleObjC.add("<label><font face='Lucida' size='4'>"
                    + copyNameObj2.get(nomeObj2.indexOf(objName))
                    + "</font></label>"
                    + "<label><font face='Arial' size='3'>"
                    + "<br><br>Other Name: </font></label>" + otherName.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>RAJ2000: </font></label>" + raObj2.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>DECJ2000: </font></label>" + decObj2.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Proper motion (RAJ2000) </font></label>" + pMotionRA1.get(nomeObj2.indexOf(objName)) + "/" + pMotionRA2.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Proper motion (DECJ2000) </font></label>" + pMotionDEC1.get(nomeObj2.indexOf(objName)) + "/" + pMotionDEC2.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Outburst: </font></label>" + outburst.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Period: </font></label>" + period.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Galatic Longitude: </font></label>" + glong.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Galatic Latitude: </font></label>" + glat.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Epoch: </font></label>" + epoch.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Object type: </font></label>" + typeObj.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br><br>Coordinate reference:</font></label>" + coordRef.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Proper motion reference:</font></label>" + pMotionRef.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Chart reference: </font></label>" + chartRef.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Type reference: </font></label>" + typeRef.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Period reference: </font></label>" + periodRef.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Spectrum reference:</font></label>" + spectRef.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br><br><i>Space-Based Observations: </i></font></label>"
                    + "<label><font face='Arial' size='3'>"
                    + "<br>IUE: </font></label>" + iueDS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "&nbsp;&nbsp;&nbsp;EXOSAT: </font></label>" + exosatDS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>HST: </font></label>" + hstDS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "&nbsp;&nbsp;&nbsp;ROSAT: </font></label>" + rosatDS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>HEAO1: </font></label>" + heao1DS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "&nbsp;&nbsp;&nbsp;GINGA: </font></label>" + gingaDS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>HEAO2 </font></label>" + heao2DS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "&nbsp;&nbsp;&nbsp;Ariel 5: </font></label>" + arielDS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>EUVE: </font></label>" + euveDS.get(nomeObj2.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "&nbsp;&nbsp;&nbsp;ASCA: </font></label>" + ascaDS.get(nomeObj2.indexOf(objName))
                    + "<br><br><a href=\"http://simbad.u-strasbg.fr/simbad/sim-coo?Coord=\n"
                    + raObj2.get(nomeObj2.indexOf(objName)) + " " + decObj2.get(nomeObj2.indexOf(objName)) + "&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none\n"
                    + "&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=\" target=\"_blank\">\n"
                    + "<font color=\"blue\">View object in SIMBAD\n" + "</font></a>");

        } else if (nomeObj.contains(objName)) {
            singleObjC.add("<label><font face='Lucida' size='4'>"
                    + copyNameObj.get(nomeObj.indexOf(2))
                    + "</font></label>"
                    + "<label><font face='Arial' size='3'>"
                    + "<br><br>RAJ(2000): </font></label>" + raObj.get(nomeObj.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>DEJ(2000): </font></label>" + decObj.get(nomeObj.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Obj. type: </font></label>" + typeRK.get(nomeObj.indexOf(objName)) + " " + typeRK2.get(nomeObj.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Magnitude: </font></label>" + magObj.get(nomeObj.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Orb. Period: </font></label>" + periodRK.get(nomeObj.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>Distance: </font></label>" + distanceRK.get(nomeObj.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>5%: </font></label>" + fivePer.get(nomeObj.indexOf(objName))
                    + "<label><font face='Arial' size='3'>"
                    + "<br>95%: </font></label>" + ninePer.get(nomeObj.indexOf(objName))
                    + "<br><br><a href=\"http://simbad.u-strasbg.fr/simbad/sim-coo?Coord=\n"
                    + raObj.get(nomeObj.indexOf(objName)) + " " + decObj.get(nomeObj.indexOf(objName)) + "&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none\n"
                    + "&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=\" target=\"_blank\">\n"
                    + "<font color=\"blue\">View object in SIMBAD\n" + "</font></a>");

        }

        return singleObjC;
    }
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
