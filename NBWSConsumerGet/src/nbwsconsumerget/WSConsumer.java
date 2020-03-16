/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nb_https_getlower;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.HttpsURLConnection;

/**
 *
 * @author Prof
 */
class WSConsumer {

    private String result;
    
    private String prefix;
    private String parameters;

    WSConsumer() {
        reset();
    }

    void reset() {
        result = "";
        parameters = "";
        prefix = "";
    }

    WSConsumer(String str) {
        result = "";
        parameters = "";
        prefix = str;
    }
    public String getResult() {
        return result;
    }

    public void AddParameter (String paramater, String value) throws UnsupportedEncodingException {
        if (!paramater.isEmpty() && !value.isEmpty()) {
            if (parameters.isEmpty())
                parameters = URLEncoder.encode(paramater, "UTF-8")+"="+URLEncoder.encode(value, "UTF-8");
            else
                parameters += "&" + URLEncoder.encode(paramater, "UTF-8")+"="+URLEncoder.encode(value, "UTF-8");
        }
    }
    
    public int get(String host) {
        int status = 0;
        result = "";

        try {
            URL serverURL;
            HttpsURLConnection service;
            BufferedReader input;

            String url;
            if (parameters.isEmpty())
                url = prefix;
            else
                url = prefix + "?" + parameters;
            serverURL = new URL(url);
            service = (HttpsURLConnection) serverURL.openConnection();
            // impostazione header richiesta
            service.setRequestProperty("Host", host);
            service.setRequestProperty("Accept", "application/text");   // elenco dati accettabili dal client https://en.wikipedia.org/wiki/Media_type
            service.setRequestProperty("Accept", "application/pdf");
            service.setRequestProperty("Accept-Charset", "UTF-8");
            // impostazione metodo di richiesta GET
            service.setRequestMethod("GET");
            // attivazione ricezione
            service.setDoInput(true);
            // connessione al web-service
            service.connect();
            // verifica stato risposta
            status = service.getResponseCode();
            if (status != 200) {
                return status; // non OK
            }
            // apertura stream di ricezione da risorsa web
            input = new BufferedReader(new InputStreamReader(service.getInputStream(), "UTF-8"));
            // ciclo di lettura da web e scrittura in result
            String line;
            while ((line = input.readLine()) != null) {
                result += line + "\n";
            }
            input.close();

        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(WSConsumer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MalformedURLException ex) {
            Logger.getLogger(WSConsumer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(WSConsumer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    void printResult() {
        String[] arrOfStr = result.split("\",\"");

        for (int i = 0; i < arrOfStr.length; i++) {
            System.out.println(arrOfStr[i]);
        }
    }
    
}
