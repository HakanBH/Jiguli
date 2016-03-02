package mobile.model;

public class Advert {
	private Vehicle vehicle;
	private String phoneNumber;
	private String region;
	private String city;
	private Integer expirationTime;
	private String extraInfo;
	
	public Advert(Vehicle vehicle, String phoneNumber, String region, String city, Integer expirtionTime) {
		setCity(city);
		setExpirationTime(expirtionTime);
		setPhoneNumber(phoneNumber);
		setRegion(region);
		setCity(city);
		
		setVehicle(vehicle);
	}
	
// GETTERS	
	public Vehicle getVehicle() {
		return vehicle;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public String getRegion() {
		return region;
	}
	public String getCity() {
		return city;
	}
	public Integer getExpirationTime() {
		return expirationTime;
	}
	public String getExtraInfo() {
		return extraInfo;
	}

//	SETTERS
	public void setVehicle(Vehicle vehicle) {
		if(vehicle!=null){
			this.vehicle = vehicle;
		}
	}
	
	public void setPhoneNumber(String phoneNumber) {
		if(phoneNumber!=null && !phoneNumber.isEmpty()){
			this.phoneNumber = phoneNumber;
		}
	}
	public void setRegion(String region) {	
		if(region!=null && !region.isEmpty()){
			this.region = region;
		}	
	}
	
	public void setCity(String city) {
		if(city!=null && !city.isEmpty()){
			this.city = city;
		}
	}
	public void setExpirationTime(Integer expirationTime) {
		if(expirationTime > 0){
			this.expirationTime = expirationTime;
		}
	}
	public void setExtraInfo(String extraInfo) {
		if(extraInfo!=null && !extraInfo.isEmpty()){
			this.extraInfo = extraInfo;
		}}
	
}
