package com.test;

import com.dao.SmsService;
import com.dao.SmsServiceDao;

public class Test {
public static void main(String[] args) {
	SmsService service=new SmsServiceDao();
	long tyrodigital=service.getTyrodigital();
	System.out.println(tyrodigital);
	long tyro=service.getTyro_t();
	System.out.println(tyro);
	long tyro_t2=service.getTyro_t2();
	System.out.println(tyro_t2);
}
}
