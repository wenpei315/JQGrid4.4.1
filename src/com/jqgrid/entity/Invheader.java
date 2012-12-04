package com.jqgrid.entity;

import java.sql.Timestamp;

public class Invheader implements java.io.Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private Integer invid;
	private Timestamp invdate;
	private Double tax;
	private Double total;
	private String note;
	private Double amount;

	public Invheader() {
	}

	public Invheader(Timestamp invdate, Double tax, Double total, String note,
			Double amount) {
		this.invdate = invdate;
		this.tax = tax;
		this.total = total;
		this.note = note;
		this.amount = amount;
	}

	public Integer getInvid() {
		return this.invid;
	}

	public void setInvid(Integer invid) {
		this.invid = invid;
	}

	public Timestamp getInvdate() {
		return this.invdate;
	}

	public void setInvdate(Timestamp invdate) {
		this.invdate = invdate;
	}

	public Double getTax() {
		return this.tax;
	}

	public void setTax(Double tax) {
		this.tax = tax;
	}

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
}