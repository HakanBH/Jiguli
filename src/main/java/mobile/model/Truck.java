package mobile.model;

public class Truck extends MotorVehicle {
	private Integer numberOfSeats;
	private Integer numberOfAxels;
	private Integer loadCapacity;
	
	public Truck(String cond, String brand, String model, String currency, String color, Integer price, String engine,
			String gearbox, String category, Integer mileage, Integer power, Integer year,
			Integer seats, Integer axels, Integer load) {
		super(cond, brand, model, currency, color, price, engine, gearbox, category, mileage, power, year);

		setNumberOfSeats(seats);
		setNumberOfAxels(axels);
		setLoadCapacity(load);
	}

	
	public Integer getNumberOfSeats() {
		return numberOfSeats;
	}

	public Integer getNumberOfAxels() {
		return numberOfAxels;
	}

	public Integer getLoadCapacity() {
		return loadCapacity;
	}

	public void setNumberOfSeats(Integer numberOfSeats) {
		if (numberOfSeats > 0) {
			this.numberOfSeats = numberOfSeats;
		}
	}
	
	public void setNumberOfAxels(Integer numberOfAxels) {
		if (numberOfAxels > 0) {
			this.numberOfAxels = numberOfAxels;
		}
	}
	
	public void setLoadCapacity(Integer loadCapacity) {
		if (loadCapacity > 0) {
			this.loadCapacity = loadCapacity;
		}
	}
}
