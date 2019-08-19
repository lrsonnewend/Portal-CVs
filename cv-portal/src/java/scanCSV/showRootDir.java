package scanCSV;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lucas
 */
import java.io.*;
import java.net.InetAddress;
import java.net.UnknownHostException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import org.apache.catalina.connector.Request;

public class showRootDir {

    public static void main(String[] args) throws UnknownHostException {
        /*File[] roots = File.listRoots();
        System.out.println("Root directories in your system are:");

        for (int i = 0; i < roots.length; i++) {
            System.out.println(roots[i].toString());
        }
        String cwd = System.getProperty("user.dir");
        System.out.println("Current working directory : " + cwd);*/
        String ipMaq = InetAddress.getLocalHost().getHostAddress();
       
        System.out.println(ipMaq);
    }
}
