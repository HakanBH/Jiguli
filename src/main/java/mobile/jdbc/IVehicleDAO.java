package mobile.jdbc;

import mobile.model.*;

public interface IVehicleDAO {
	public int addVehicle(Vehicle v);
	
	public Vehicle getVehicleByID(int vehicleID);
	
}
