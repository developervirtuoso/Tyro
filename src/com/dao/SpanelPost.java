package com.dao;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;





public class SpanelPost {


    private String cookies;
    private HttpClient client = HttpClientBuilder.create().build();
    private final String USER_AGENT = "Mozilla/5.0 Android,6.4 ";
    private static int responseCode = 200;
    //public static String str;

    public static void main(String[] args) {
        try {
      //      str=args[0];
        	int runvalue=0;
        	String reference="remove10";
        	String amount="-10";
        	String username="shivali";
            first_consent("", "",runvalue,reference,amount,username);
        } catch (Exception ex) {
            Logger.getLogger(SpanelPost.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void first_consent(String msisdn, String url1, int runvalue, String reference, String amount, String username) throws Exception {

        String url = url1;
        System.out.println(url);
        String second = "http://182.18.144.234:6001/";
        CookieHandler.setDefault(new CookieManager());
        SpanelPost http = new SpanelPost();
        List<NameValuePair> postParams = new ArrayList<NameValuePair>();
        postParams.add(new BasicNameValuePair("UserName", "Virtuosoft"));
        postParams.add(new BasicNameValuePair("Password", "sing#coun@Virtu2"));

        if (responseCode == 200) {
            http.sendPost(second, postParams, msisdn,runvalue,reference,amount,username);
        } else {
            System.out.println("Already Reg or Invalid");
        }
    }

    private void sendPost(String url, List<NameValuePair> postParams, String msisdn, int runvalue, String reference, String amount, String username)
            throws Exception {

        HttpPost post = new HttpPost(url);

        post.setHeader("User-Agent", USER_AGENT);
        post.setHeader("Accept",
                "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
        post.setHeader("Accept-Language", "en-US,en;q=0.5");
              post.setHeader("Connection", "keep-alive");
        post.setHeader("Content-Type", "application/x-www-form-urlencoded");

        post.setEntity(new UrlEncodedFormEntity(postParams));

        HttpResponse response = client.execute(post);

        int responseCode = response.getStatusLine().getStatusCode();

        System.out.println("Post parameters : " + postParams);
        System.out.println("Response Code : " + responseCode);
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
        BufferedReader rd = new BufferedReader(
                new InputStreamReader(response.getEntity().getContent()));

        StringBuffer result = new StringBuffer();
        String line = "";
        while ((line = rd.readLine()) != null) {
            result.append(line);
        }
        setCookies(response.getFirstHeader("Set-Cookie") == null ? ""
                : response.getFirstHeader("Set-Cookie").toString());
        System.out.println(result.toString());
       
       
        
      
      if(runvalue==0) {
    	  saveCridet("http://182.18.144.234:6001/WebAdmin/Administration/SaveCredit", postParams, msisdn,reference,amount,username);
      }
      
    }

    private void saveCridet(String url, List<NameValuePair> postParams, String msisdn, String reference, String amount, String username)throws Exception{



        HttpPost post = new HttpPost(url);

        SimpleDateFormat formatter = new SimpleDateFormat("d+MMMM+yyyy");  
        SimpleDateFormat formatter1 = new SimpleDateFormat("d MMM, yyyy hh:mm a");  
		Date date = new Date(); 
		String currentdate=formatter.format(date);
		Calendar calendar = Calendar.getInstance(); 
		calendar.add(Calendar.MINUTE, -30);
		Date dateCheck =calendar.getTime();
		String newdate=formatter1.format(dateCheck);
		Date d2 = formatter1.parse(newdate); 
        
        StringEntity entity = new StringEntity("Payment_Reference="+reference+"&Credits="+amount+"&username="+username+"&CreditType=SMS");

        post.setHeader("Host", "182.18.144.234:6001");
        post.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0");
        post.setHeader("Accept", "application/json, text/javascript, */*; q=0.01");
        post.setHeader("Accept-Language", "en-US,en;q=0.5");
        post.setHeader("Accept-Encoding", "gzip, deflate");
        post.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        post.setHeader("X-Requested-With", "XMLHttpRequest");

        post.setHeader("Origin", "http://182.18.144.234:6001");
        post.setHeader("Connection", "keep-alive");
        post.setHeader("Referer", "http://182.18.144.234:6001/WebAdmin/Administration/UserManagement");
        
        post.setHeader("Pragma", "no-cache");
        post.setHeader("Cache-Control", "no-cache");
        post.setHeader("Cookie", getCookies());

        // post.setEntity(new UrlEncodedFormEntity(postParams));
        post.setEntity(entity);
        HttpResponse response = client.execute(post);

        int responseCode = response.getStatusLine().getStatusCode();

//        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + postParams);
        System.out.println("Response Code : " + responseCode);
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
        BufferedReader rd = new BufferedReader(
                new InputStreamReader(response.getEntity().getContent()));

        StringBuffer result = new StringBuffer();
        String line = "";
        while ((line = rd.readLine()) != null) {
            result.append(line);
        }
     System.out.println("Error ==>"+result.toString());
      
     
     

    
		
	
		
	}

	
	
	private boolean checkJSONArrayValid(StringBuffer tcpData) {
		try {
			JSONArray o = new JSONArray(tcpData.toString());
	        return true;
	    } catch (JSONException e) {
	    	//e.printStackTrace();
	       return false;
	    }
	}

	
    
   public static void parse(String json){
       HashMap hm = new HashMap();
     //  send_mail sm = new send_mail();
      // sendMSG sms = new sendMSG();
       try {
			JSONObject jobj = new JSONObject(json);
			JSONArray jarr = jobj.getJSONArray("data");

			for (int i=0;  i <jarr.length();i++ )
			{
				JSONObject valuej = jarr.getJSONObject(i);
				String GatewayName = valuej.getString("GatewayName");
				int Consumers   = valuej.getInt("Consumers");
				int ReadyMessages = valuej.getInt("ReadyMessages");
				hm.put(GatewayName, Consumers+":"+ReadyMessages);
				System.out.println(GatewayName + "==="+Consumers +"==="+ReadyMessages+"/br");
			}
            // String[] arr = str.split("AND"); 
			String[] arr ={"vnsvns3","new_smpp","dlt_vnsoft_tr2"};
                        for(int i =0;i<arr.length;i++){
                            String[] sp = hm.get(arr[i]).toString().split(":");
                        if(sp[0].equalsIgnoreCase("0")){
                            System.out.println("session 0");
                            // sms.hit_msg("Sessions are "+sp[0]+" for account "+arr[i]);
							  String url = "http://122.180.20.234:8081/MIS/alt_obd.php";
         System.out.println("check");

                URL obj = new URL(url);
                HttpURLConnection con = (HttpURLConnection) obj.openConnection();
                con.setRequestMethod("GET");
                // sm.sendmail("neeraj@virtuosonetsoft.in","System-1 Seesion Are down "+arr[i],"Sessions are "+sp[0]+" for account "+arr[i]);
                System.out.println("Sessions are "+sp[0]+" for account "+arr[i]);
                int responseCode = con.getResponseCode(); 
                System.out.println("responseCode="+responseCode);
                        } else if( Integer.parseInt(sp[1])>20000){
                            System.out.println("queue is there");
                            System.out.println("Message QUEUE "+sp[1]+" for account "+arr[i]);
                  //          sm.sendmail("neeraj@virtuosonetsoft.in","System-1 Message QUEUE at "+arr[i],"Message QUEUE "+sp[1]+" for account "+arr[i]);
                        
						}
                            System.out.println(arr[i]+"::"+sp[0]);
                            
                           
                        }
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}
   }

    public String getCookies() {
        return cookies;
    }

    public void setCookies(String cookies) {
        System.out.println(cookies);
        this.cookies = cookies;
    }
}
