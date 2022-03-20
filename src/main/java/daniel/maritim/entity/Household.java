package daniel.maritim.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "households")
public class Household {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "household_id", nullable = false)
	private int householdId;
	
	@Column(name = "household_code", nullable = false)
	private String householdCode;
	
	@Column(name = "estate")
	private String estate;
	
	@Column(name = "cathedral_zone_id")
	private int cathedralZoneId;
	
	@Column(name = "postal_address")
	private String postalAddress;

	
	@Column(name = "active")
	private int active;
	
	@Column(name = "street")
	private String street;
	
	public Household() {
	}

	public int getHouseholdId() {
		return householdId;
	}

	public String getHouseholdCode() {
		return householdCode;
	}

	public String getEstate() {
		return estate;
	}

	public int getCathedralZoneId() {
		return cathedralZoneId;
	}

	public String getPostalAddress() {
		return postalAddress;
	}

	public int getActive() {
		return active;
	}

	public String getStreet() {
		return street;
	}

	public void setHouseholdId(int householdId) {
		this.householdId = householdId;
	}

	public void setHouseholdCode(String householdCode) {
		this.householdCode = householdCode;
	}

	public void setEstate(String estate) {
		this.estate = estate;
	}

	public void setCathedralZoneId(int cathedralZoneId) {
		this.cathedralZoneId = cathedralZoneId;
	}

	public void setPostalAddress(String postalAddress) {
		this.postalAddress = postalAddress;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public void setStreet(String street) {
		this.street = street;
	}

}
