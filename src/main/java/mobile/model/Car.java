package mobile.model;

public class Car extends MotorVehicle {
	
	public Car(String cond, String brand, String model, String currency, String color, 
			int price, String engine, String gearbox, String category, 
			int mileage, int power, int year, String month) 
	{
		super(cond, brand, model, currency, color, price, engine, gearbox, category, 
				mileage, power, year, month);
	}
	
	@Override
	public String getCategory() {
		return "cars";
	}
}

	


