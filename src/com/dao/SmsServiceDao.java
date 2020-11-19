package com.dao;

public class SmsServiceDao implements SmsService {
	Smpp_DaoImpl daoImpl=new Smpp_DaoImpl();
	
	
	
	@Override
	public long getNimbusitsol() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=%2FFM6Jd4UeZhDILHYKtPFPYS8LxW92ATvx9tS994%2FZx0%3D&ClientId=c2ab4755-0b60-40a7-92ff-3f5505a41295";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getNimbus_t1() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=ge2TrHHynds6D9vIIZZSTzVx7shZd%2FtJkE7FUCOGcLg%3D&ClientId=419b667a-a175-40b9-8137-bb7547570d97";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyrodigital() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=HN%2FfP3AdgcFKHI9HHwzgBACFxkQT3dCP63u2rBEh8sU%3D&ClientId=f3b70db7-844c-4266-aab0-56c5eb9830f8";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyro_t() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=ElpeCh1v42Ha6Rhe3S22x18vRVh8uWg5%2Bs%2Beolb16%2Fo%3D&ClientId=e4d8c7c4-aea0-4c39-8fcb-d8263b1e762a";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyro_t2() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=%2FZUUiOqKNg6hEqkfiT6gqfwd1r5%2Bi%2Fm4Q5SYKqDs6Cw%3D&ClientId=b131f85d-0e31-4be4-8974-574e1fa77921";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long gettyro_t3() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=%2B%2F2WFQddcS9F67fIqnNhgNKsG35yuCdWYoQGrN%2Fi3Fo%3D&ClientId=99a5271b-12d6-46f2-bc61-27947adf2270";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyro_trs() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=Tdb8EUgjV8FzEa4ftXGIFyMw1QpUmRQnpWmjmP77kL0%3D&ClientId=0ae07ac8-2cc9-4dd3-8d44-7af6673dd477";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyro_trs2() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=4jVTWoXh%2BklQbElkU%2FRSoI4hGaS7Nf6P1yGlTM7zf28%3D&ClientId=5ed7dc29-bf68-43e0-962b-e0925f474b78";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}

	@Override
	public long getTyrodigital2() {
		String url="http://182.18.144.234:6005/api/v2/Balance?ApiKey=nMS9jAlIeHVCX2WhTWR%2BLSbjRyRfr%2BLM5L%2F35dgjMjY%3D&ClientId=6b4d4ed9-1867-4f7b-bc8a-af27ad0552da";
		long balance=daoImpl.getTyroDigitalBalance(url);
		return balance;
	}
	
	
	
}
