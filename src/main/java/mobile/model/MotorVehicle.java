package mobile.model;

public abstract class MotorVehicle extends Vehicle{
	
	public MotorVehicle(String cond, String brand, String model, String currency, String color, Integer price, 
			String engine, String gearbox, String category, Integer mileage, Integer power , Integer year)
	{
		super(cond, brand, model, currency, color, price);
		setEngineType(engine);
		setGearboxType(gearbox);
		setCategory(category);
		setMileage(mileage);
		setPower(power);
		setYear(year);
	}
	
	private String engineType;
	private String gearboxType;
	private String category;
	private Integer mileage;
	private Integer power;
	private Integer year;
	
	public String getEngineType() {
		return engineType;
	}
	public String getGearboxType() {
		return gearboxType;
	}
	public String getCategory() {
		return category;
	}
	public Integer getMileage() {
		return mileage;
	}
	public Integer getPower() {
		return power;
	}
	public Integer getYear() {
		return year;
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
	public void setCategory(String category) {
		if(category!=null && !category.isEmpty()){
			this.category = category;
		}
	}
	
	public void setMileage(Integer mileage) {
		if(power.intValue() > 0){
			this.mileage = mileage;
		}
	}
	
	public void setPower(Integer power) {
		if(power.intValue()>0){
			this.power = power;
		}
	}
	
	public void setYear(Integer year) {
		//���� ����� �� ��������, �.�. ����������� ���� �� ������ ���� �� ������
		this.year = year;
	}
}
