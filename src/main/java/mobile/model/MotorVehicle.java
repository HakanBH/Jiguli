package mobile.model;

public abstract class MotorVehicle extends Vehicle{
	private String engineType;
	private String gearboxType;
	private String subcategory;
	private int mileage;
	private int power;

	public MotorVehicle(String cond, String brand, String model, String currency, String color, Integer price, 
			String engine, String gearbox, String subcategory, int mileage, int power , int year, String month)
	{
		super(cond, brand, model, currency, color, price, year, month);
		setEngineType(engine);
		setGearboxType(gearbox);
		setSubcategory(subcategory);
		setMileage(mileage);
		setPower(power);
	}
	
	public String getEngineType() {
		return engineType;
	}
	public String getGearboxType() {
		return gearboxType;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public int getMileage() {
		return mileage;
	}
	public int getPower() {
		return power;
	}

	
	public void setEngineType(String engineType) {
		if(engineType != null && !engineType.isEmpty()){
			this.engineType = engineType;
		}
	}
	
	public void setGearboxType(String gearboxType) {
		if(gearboxType!=null && !gearboxType.isEmpty()){
			this.gearboxType = gearboxType;
		}
	}
	public void setSubcategory(String subcategory) {
		if(subcategory!=null && !subcategory.isEmpty()){
			this.subcategory = subcategory;
		}
	}
	
	public void setMileage(int mileage) {
		if(mileage > 0){
			this.mileage = mileage;
		}
	}
	
	public void setPower(int power) {
		if(power >0){
			this.power = power;
		}
	}

}
