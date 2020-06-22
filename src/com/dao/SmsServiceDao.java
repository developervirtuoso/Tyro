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

}
