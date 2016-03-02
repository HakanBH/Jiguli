package mobile.model;

public class Motorcycle extends MotorVehicle {
	
	private Integer cubage;
	private Integer engineTacts;
	private String coolingType;

	public Motorcycle(String cond, String brand, String model, String currency, String color, Integer price,
			String engine, String gearbox, String category, Integer mileage, Integer power, Integer year,
			Integer cubage, Integer tacts, String cooling)
	{
		super(cond, brand, model, currency, color, price, engine, gearbox, category, mileage, power, year);
		setCubage(cubage);
		setEngineTacts(tacts);
		setCoolingType(cooling);
	}

	public Integer getCubage() {
		return cubage;
	}
	
	public Integer getEngineTacts(){
		return engineTacts;
	}
	
	public String coolingType(){
		return coolingType;
	}
	
	public void setCubage(Integer cubage) {
		if (cubage > 0) {
			this.cubage = cubage;
		}
	}
	
	public void setEngineTacts(Integer engineTacts) {
		if (engineTacts > 0) {
			this.engineTacts = engineTacts;
		}
	}
	
	public void setCoolingType(String cooling) {
		if(cooling!=null && !cooling.isEmpty()){
			this.coolingType= cooling;
		}
	}
		
	
}
