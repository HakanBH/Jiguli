package mobile.jdbc;

import java.sql.*;
import mobile.model.*;

public class VehicleDAO implements IVehicleDAO{

	@Override
	public int addVehicle(Vehicle v) {
		
		return 0;
	}

	@Override
	public Vehicle getVehicleByID(int vehicleID) {
		Connection connection = DBConnection.getInstance().getConnection();
		Vehicle v = null;
		try {
			PreparedStatement ps = connection.prepareStatement("select * from vehicles ");
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		
		return null;
	}
	
}
