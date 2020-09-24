package com.dao;

public class SmsServiceDao implements SmsService {
	Smpp_DaoImpl daoImpl=new Smpp_DaoImpl();
	@Override
	public long getTyrodigital() {
		String url="http://49.50.86.152:6005/api/v2/Balance?ApiKey=%2B4AdgYzYn4hNstEwpgl%2BjcB7qD6uKx8%2B9TagkLfd9T8%3D&ClientId=0ef79732-f3c8-4110-bc2d-5e84e57fffbe";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyro_t() {
		String url="http://49.50.86.152:6005/api/v2/Balance?ApiKey=cU0OhqbPqP97WH%2FIVqw3sXL2vicCaLFo6%2BtRFvv11is%3D&ClientId=2be82871-4fa6-4e8a-a656-9845855405a2";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyro_t2() {
		String url="http://49.50.86.152:6005/api/v2/Balance?ApiKey=0glYiB7qz3KjwOmausR%2FHRbDeP92z%2By8FplKzvqi7VA%3D&ClientId=4773fc23-0ec8-4cd1-823d-8f5c4d01843f";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long gettyro_t3() {
		String url="http://49.50.86.152:6005/api/v2/Balance?ApiKey=jzF%2BU16VKpkWxNuQ0xRkVBs2LwqKdFX0AbhuEtK6%2BoU%3D&ClientId=4e2d4c08-4e68-420c-8213-ca03e9821ce6";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyro_trs() {
		String url="http://49.50.86.152:6005/api/v2/Balance?ApiKey=iBYnz1%2Fmo8RotnBJSF3riP1pVP7S1j6TjQHWLumOhqs%3D&ClientId=70320e5e-70cb-4b75-8bc3-6d9d6fc6f607";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyro_trs2() {
		String url="http://49.50.86.152:6005/api/v2/Balance?ApiKey=RWxhhcTqb8BY%2Fq7w1%2BuqMKUZL5XwWpA%2BdpEFgo29bEc%3D&ClientId=dadf979c-aacb-4b80-94b6-7dbc0e4b96a0";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyrodigital2() {
		String url="http://49.50.86.152:6005/api/v2/Balance?ApiKey=2BULkuLuUg5pgr%2F8kt2H44IZWU5OAF9Jrziv45a4Rsg%3D&ClientId=e4626a2a-ff18-4238-9c88-fc89a6449978%20";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}
	
	
}
