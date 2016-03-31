package com.kaishengit.util;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;


import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class HttpClientUtil {

    public static String getStringByUrl(String url){
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        try {
            HttpResponse httpResponse = httpClient.execute(httpGet);
            if(httpResponse.getStatusLine().getStatusCode() == 200){
                InputStream inputStream = httpResponse.getEntity().getContent();
                String msg = IOUtils.toString(inputStream);
                inputStream.close();
                return msg;
            }
        } catch (IOException e) {
            e.printStackTrace();

        }
        return  null;
    }
    public String getStringByPostUrl(String url,String username,String password){
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost();
        List<NameValuePair> list = new ArrayList<NameValuePair>();
        list.add(new BasicNameValuePair("username",username));
        list.add(new BasicNameValuePair("passowrd",password));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(list));
            HttpResponse httpResponse = httpClient.execute(httpPost);
            if(httpResponse.getStatusLine().getStatusCode() == 200){
                InputStream inputStream = httpResponse.getEntity().getContent();
                String msg = IOUtils.toString(inputStream);
                inputStream.close();
                return msg;
            }
        } catch (IOException e) {
            e.printStackTrace();

        }
        return  null;
    }

}
