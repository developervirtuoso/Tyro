package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import com.beans.PaymentBeans;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.beans.Admin;
import common.database.DbConnection;

public class Smpp_DaoImpl {
		public static void main(String[] args) {
			Smpp_DaoImpl daoImpl=new Smpp_DaoImpl();
		//	long value=994546212;
		//	System.out.println(daoImpl.convertNumberToWords(value));
			long myvakue=999999999+999999999;
			System.out.println(daoImpl.numToString(myvakue));
			String strvalue=daoImpl.numToString(myvakue);
			int lenght=strvalue.length();
			System.out.println("lenght"+lenght);
			//System.out.println("last value"+strvalue.substring(7, lenght));
			String myvalue="";
			if(lenght==2) {
				String CIW=daoImpl.myCIW(myvakue);
				myvalue=CIW;
				System.out.println(CIW);
			}else {
			int i=lenght;
			boolean check=false;
			int count=1;
			while (i>0) {
				if(lenght>=3 && check==false) {
					int firstindex=lenght-3;
					String hvalue=strvalue.substring(firstindex, lenght);
					long firstvalue=(long)Integer.parseInt(hvalue.substring(0, 1));
					long lastvalue=(long)Integer.parseInt(hvalue.substring((hvalue.length()-2), hvalue.length()));
					String CIW="";
					if(firstvalue==0) {
						
					}else {
						CIW=daoImpl.myCIW(firstvalue)+maxs2[count];	
					}
					CIW=CIW+daoImpl.myCIW(lastvalue);
					System.out.println("last value"+strvalue.substring(firstindex, lenght));
					System.out.println(CIW);
					myvalue=CIW+myvalue;
					lenght=firstindex;
					count=count+1;
					check=true;
				}else {
					if(lenght>=2) {
					int firstindex=lenght-2;
					System.out.println("last value"+strvalue.substring(firstindex, lenght));
					long longval=(long)Integer.parseInt(strvalue.substring(firstindex, lenght));
					if(longval==00) {
						
					}else {
					String CIW=daoImpl.myCIW(longval)+maxs2[count];
					System.out.println(CIW);
					myvalue=CIW+myvalue;
					}
					count=count+1;
					lenght=firstindex;
					}else if(lenght==1){
						System.out.println("last value"+strvalue.substring(0, 1));
						long longval=(long)Integer.parseInt(strvalue.substring(0, 1));
						if(longval==00) {
							
						}else {
						String CIW=daoImpl.myCIW(longval)+maxs2[count];
						System.out.println(CIW);
						myvalue=CIW+myvalue;
						}
						count=count+1;
						lenght=0;
					}else {
						break;
				}
				}
			}
			}
			System.out.println("myvalue= "+myvalue);
			
		}
		public Boolean checkAdmin(Admin admin){ 
//			TrippleDes td= new TrippleDes();
			
			 String password;
			 String email;
			 Boolean status =false;
			 int count=0;
			 int id=0;
			 Connection conn=DbConnection.getInstance().getConnection();
			 Statement stmt=null;
			 Statement stmt1=null;
			 ResultSet rs = null;
			 ResultSet rs1 = null;
			 
		   	  email = admin.getEmail();
		   	  password =admin.getPassword();
//		   	password=td.encrypt(password);
		   	 
		   	  try {
		         	
		         	stmt=conn.createStatement();
		         	String query = "select count(*) from admin where email='"+email+"' and password='"+password+"'";
		         	System.out.println("query="+query);
		         	rs = stmt.executeQuery(query);
		         	 while (rs.next()) {
		         		 count=rs.getInt(1);
		         	 }
		         		 if(count!=0){
		         			stmt1=conn.createStatement();
		         			String query1 = "SELECT * FROM admin where email='"+email+"' and password='"+password+"'";
		         			rs1 = stmt1.executeQuery(query1);
		                	 while (rs1.next()) {
		                		 
		                		 id=rs1.getInt("id");
		                		 email=rs1.getString("email");
		                		 password=rs1.getString("password");
		                		 admin.setId(id);
		                		 admin.setEmail(email);
		                		 admin.setPassword(password);
		         		 
		         		 status=true;
		         		 
		                	 }
		         		 }else{
		         			 status=false;
		         		 }
		    			conn.close();

		         } catch (Exception e) {
		             e.printStackTrace();
		         }finally
		         {
		        	 try {
		        	         if (conn != null)
		        	      	conn.close();
		        	      } catch (SQLException ignore) {} // no point handling

		        	      try {
		        	         if (stmt != null)
		        	             stmt.close();
		        	      } catch (SQLException ignore) {} // no point handling

		        	   try {
		        	         if (stmt1 != null)
		        	        	 stmt1.close();
		        	      } catch (SQLException ignore) {} // no point handling
		        	   try {
		        	         if (rs != null)
		        	        	 rs.close();
		        	      } catch (SQLException ignore) {} // no point handling
		        	   try {
		        	         if (rs1 != null)
		        	        	 rs1.close();
		        	      } catch (SQLException ignore) {} // no point handling
		        	 }
		   	  
		   	  
		     return status; 
		   }
		public ArrayList<PaymentBeans> getPaymentHistory(String sql){
			ArrayList<PaymentBeans> paymentBeans=new ArrayList<PaymentBeans>();
			Connection connection=DbConnection.getInstance().getConnection();
			Statement st=null;
	        ResultSet rs=null;
	        try {
				st=connection.createStatement();
				rs = st.executeQuery(sql);
				 while(rs.next())
		      	 {
					PaymentBeans paymentBean=new PaymentBeans();
					paymentBean.setId(rs.getInt("id"));
					paymentBean.setPayment_id(rs.getString("payment_id"));
					paymentBean.setTransfer_date(rs.getString("transfer_date"));
					paymentBean.setTransffered_by(rs.getString("transffered_by"));
					paymentBean.setPayment_ref(rs.getString("payment_ref"));
					paymentBean.setCredit_transfer(rs.getString("credit_transfer"));
					paymentBean.setCredit_after(rs.getString("credit_after"));
					paymentBean.setCredit_before(rs.getString("credit_before"));
					paymentBean.setName(rs.getString("name"));
					paymentBeans.add(paymentBean);
		      	 }
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(connection!=null) {
						connection.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				try {
					if(st!=null) {
						st.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				try {
					if(rs!=null) {
						rs.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return paymentBeans;
		}
		private String myCIW(long myvakue) {
			String CNTW="";
			if(myvakue<=99) {
				if(myvakue<=19) {
					int index=(int)myvakue;	
						CNTW=unitto19[index];
					}else {
						
						int index=(int)myvakue;	
						int firstdigit=(index / 10);
						int lastdigit=(index % 10);
						if(lastdigit==0) {
							CNTW=tens2[firstdigit];
						}else {
							CNTW=tens2[firstdigit]+""+unitto19[lastdigit];
						}
					}
			}
			return CNTW;
			
		}
		private static String[] unitto19=
			   {"",
			    " One",
			    " Two",
			    " Three",
			    " Four",
			    " Five",
			    " Six",
			    " Seven",
			    " Eight",
			    " Nine",
			    " Ten",
			    " Eleven",
			    " Twelve",
			    " Thirteen",
			    " Fourteen",
			    " Fifteen",
			    " Sixteen",
			    " Seventeen",
			    " Eighteen",
			    " Nineteen"
			   };
		 private static String[] tens2=
			 { 	"",
				"",
				" Twenty",
				" Thirty",
				" Forty",
				" Fifty",
				" Sixty",
				" Seventy",
				" Eighty",
				" Ninety"
			 };

		 private static String[] maxs2=
				{"",
				 " Hundred",
				 " Thousand",
				 " Lakh",
				 " Crore",
				 "One arab",
				 "Ten arab",
				 "One kharab",
				 "Ten kharab",
				 "One nil",
				 "Ten nil",
				 "One padma",
				 "Ten padma",
				 "One shankh",
				 "Ten shankh"
				};

		 public String convertNumberToWords(long n)
	   {
		   String input="";
	       input=numToString(n);
	      
	       String converted=""; 
	       int pos=1; 
	       boolean hun=false;
	       while(input.length()> 0)
	       {
	           if(pos==1) // TENS AND UNIT POSITION
	           {   if(input.length()>= 2) // TWO DIGIT NUMBERS
	               {   
	                String temp=input.substring(input.length()-2,input.length());
	                input=input.substring(0,input.length()-2);
	                converted+=digits(temp);
	               }
	               else if(input.length()==1) // 1 DIGIT NUMBER
	               {
	                converted+=digits(input); 
	                input="";
	               }
	               pos++;
	           }
	           else if(pos==2) // HUNDRED POSITION
	           { 
	               String temp=input.substring(input.length()-1,input.length());
	               input=input.substring(0,input.length()-1);
	               if(converted.length()> 0&&digits(temp)!="")
	               {
	                   converted=(digits(temp)+maxs[pos]+" and")+converted;
	                   hun=true;
	               }
	               else
	               {
	                   if
	                   (digits(temp)=="");
	                   else
	                   converted=(digits(temp)+maxs[pos])+converted;hun=true;
	               }
	               pos++;
	           }
	           else if(pos > 2) // REMAINING NUMBERS PAIRED BY TWO
	           {
	               if(input.length()>= 2) // EXTRACT 2 DIGITS
	               {  
	                String temp=input.substring(input.length()-2,input.length());
	                input=input.substring(0,input.length()-2);
	                  if(!hun&&converted.length()> 0)
	                       converted=digits(temp)+maxs[pos]+" and"+converted;
	                   else
	                   {
	                       if(digits(temp)=="")  ;
	                       else
	                       converted=digits(temp)+maxs[pos]+converted;
	                   }
	                }
	                else if(input.length()==1) // EXTRACT 1 DIGIT
	                {
	                  if(!hun&&converted.length()> 0)
	                   converted=digits(input)+maxs[pos]+" and"+converted;
	                   else
	                   {
	                       if(digits(input)=="")  ;
	                       else
	                       converted=digits(input)+maxs[pos]+converted;
	                       input="";
	                   }
	                }
	                pos++; 
	            }
	       }
	       return converted;
	   }
	  public String numToString(long n) // CONVERT THE NUMBER TO STRING
	   {
	       String num="";
	       while(n!=0)
	       {
	           num=((char)((n%10)+48))+num;
	           n/=10;
	       }
	       return num;
	   }
	  private String digits(String temp) // TO RETURN SELECTED NUMBERS IN WORDS
	   {
	       String converted="";
	       for(int i=temp.length()-1;i >= 0;i--)
	       {   int ch=temp.charAt(i)-48;
	           if(i==0&&ch>1 && temp.length()> 1)
	           converted=tens[ch-2]+converted; // IF TENS DIGIT STARTS WITH 2 OR MORE IT FALLS UNDER TENS
	           else if(i==0&&ch==1&&temp.length()==2) // IF TENS DIGIT STARTS WITH 1 IT FALLS UNDER TEENS
	           {
	               int sum=0;
	               for(int j=0;j < 2;j++)
	               sum=(sum*10)+(temp.charAt(j)-48);
	               return teen[sum-10];
	           }
	           else
	           {
	               if(ch > 0)
	               converted=units[ch]+converted;
	           } // IF SINGLE DIGIT PROVIDED
	       }
	       return converted;
	   }
	  private static String[] units=
		   {"",
		    " One",
		    " Two",
		    " Three",
		    " Four",
		    " Five",
		    " Six",
		    " Seven",
		    " Eight",
		    " Nine"
		   };
		   private static String[] teen=
		  {" Ten",
		   " Eleven",
		   " Twelve",
		   " Thirteen",
		   " Fourteen",
		   " Fifteen",
		   " Sixteen",
		   " Seventeen",
		   " Eighteen",
		   " Nineteen"
		  };
		  private static String[] tens=
		 { " Twenty",
		   " Thirty",
		   " Forty",
		   " Fifty",
		   " Sixty",
		   " Seventy",
		   " Eighty",
		   " Ninety"
		 };
		 private static String[] maxs=
		{"",
		 "",
		 " Hundred",
		 " Thousand",
		 " Lakh",
		 " Crore"
		};

		 public void fetchAllDataCount(String sql,JSONObject jsonObject) {
				
			 Connection conn=DbConnection.getInstance().getConnection();
	   	Statement st=null;
	   	ResultSet rs=null;
	   	try
	   	{
	   	   st=conn.createStatement();
	   	  rs=st.executeQuery(sql);
	   	  while (rs.next()) {
			jsonObject.put("count", rs.getInt(1));
		}
	   	}
	   	catch(Exception e)
	   	{
	   		e.printStackTrace();
	   	}finally {
				try {
					if(conn!=null) {
						conn.close();
					}
				} catch (Exception e2) {
					// TODO: handle exception
				}
				try {
					if(st!=null) {
						st.close();
					}
				} catch (Exception e2) {
					// TODO: handle exception
				}
				try {
					if(rs!=null) {
						rs.close();
					}
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}

		}
		public int addPaymentByAdmin(PaymentBeans paymentBean) {
			int i=0;
			Connection connection=DbConnection.getInstance().getConnection();
			PreparedStatement ps=null;
			try {
				ps=connection.prepareStatement("insert into payment (transfer_date,credit_transfer,transffered_by,payment_ref,credit_before,credit_after,name) values(?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, paymentBean.getTransfer_date());
				ps.setString(2, paymentBean.getCredit_transfer());
				ps.setString(3, paymentBean.getTransffered_by());
				ps.setString(4, paymentBean.getPayment_ref());
				ps.setString(5, paymentBean.getCredit_before());
				ps.setString(6, paymentBean.getCredit_after());
				ps.setString(7, paymentBean.getName());
				ps.executeUpdate();
				ResultSet rs=ps.getGeneratedKeys();
				if(rs.next()) {
					i=rs.getInt(1);
				}
				if(rs!=null) {
					rs.close();
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return i;
		}
		public Long getTyroDigitalBalance(String url) {
			
			long total=0;
			try{
				HttpResponse<JsonNode> response2=Unirest.get(url).asJson();	
				String jsonData=response2.getBody().toString();
				JSONObject jsonObject=new JSONObject(jsonData);
				JSONArray data=jsonObject.getJSONArray("Data");
				for(int u=0;u<data.length();u++){
					JSONObject jo=data.getJSONObject(u);
					String sum1=jo.getString("Credits").substring(3);
					String rstype=jo.getString("Credits").substring(0,3);
					double sum11=Double.parseDouble(sum1);
					float sum2long=Float.parseFloat(sum1);
					long aValue = (long) sum2long*10;
					total=total+aValue;
				}
			
		}catch(Exception e){
			e.printStackTrace();
		}
			return total;
		}
}
