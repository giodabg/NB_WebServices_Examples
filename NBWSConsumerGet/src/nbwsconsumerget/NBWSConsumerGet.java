/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nb_https_getlower;

import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Prof
 */
public class NB_HTTPS_GETlower {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

            WSConsumer webService;
            // webService = new WSConsumer("https://www.gerriquez.com/comuni/ws.php");
            
            // webService.AddParameter("dencomune", "Mariano Comense");
            // webService.get("www.gerriquez.com");
            // webService.printResult();
            
            // webService.AddParameter("regione", "lombardia");
            // webService.get("www.gerriquez.com");
            // webService.printResult();
            
            webService = new WSConsumer("https://www.ismonnet.gov.it/public/circolari/Circolari_3764B_2019-2020.pdf");
            webService.get("www.ismonnet.gov.it");
            webService.printResult();
            
        // try {
            // webService = new WSConsumer("https://it.wikipedia.org/w/index.php");
            // webService.AddParameter("title", "Client-server");
            // webService.get("it.wikipedia.org");        
            // webService.printResult();
        // } catch (UnsupportedEncodingException ex) {
        //    Logger.getLogger(NB_HTTPS_GETlower.class.getName()).log(Level.SEVERE, null, ex);
        // }
        }
}
