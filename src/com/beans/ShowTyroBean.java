package com.beans;

public class ShowTyroBean {
	private String name;
	private String showName;
	private long credit;
	private String ciwValue;
	private String totalCiwValue;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}
	public long getCredit() {
		return credit;
	}
	public void setCredit(long credit) {
		this.credit = credit;
	}
	public String getCiwValue() {
		return ciwValue;
	}
	public void setCiwValue(String ciwValue) {
		this.ciwValue = ciwValue;
	}
	public String getTotalCiwValue() {
		return totalCiwValue;
	}
	public void setTotalCiwValue(String totalCiwValue) {
		this.totalCiwValue = totalCiwValue;
	}
	@Override
	public String toString() {
		return "ShowTyroBean [name=" + name + ", showName=" + showName + ", credit=" + credit + ", ciwValue=" + ciwValue
				+ ", totalCiwValue=" + totalCiwValue + "]";
	}
	
	
}
