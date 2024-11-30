package com.infosys.carRentalSystem.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class CarBooking {
	@Id
	private long bookingId;
	private String username;
	private String carNumber;
	private String variantId;
	private String fromDate;
	private String toDate;
	private Double totalPayment;
	private Double advancePayment;
	private Double pendingPayment;
	private Boolean status;
	
	
}
