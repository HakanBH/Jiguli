package mobile.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import mobile.model.*;

public class AdvertDAO implements IAdvertDAO {	
	private static final String INSERT_ADVERT_QUERY = "insert into adverts values(null, ?, ?, ?, ?, ?, ?, null, null);";
	Connection connection = DBConnection.getInstance().getConnection();
	/**
	 * Inserts the given {@link Advert} into the database and returns the id of
	 * the advert.
	 * @throws Exception 
	 */
	@Override
	public int insertAdvert(Advert advert) throws SQLException {
		try(PreparedStatement insertAdvert = connection.prepareStatement(INSERT_ADVERT_QUERY,
				PreparedStatement.RETURN_GENERATED_KEYS);) {
			insertAdvert.setString(1, advert.getPhoneNumber());
			insertAdvert.setString(2, advert.getEmail());
			insertAdvert.setString(3, advert.getRegion());
			insertAdvert.setString(4, advert.getCity());
			insertAdvert.setInt(5, advert.getExpirationTime());
			insertAdvert.setString(6, advert.getExtraInfo());
			insertAdvert.executeUpdate();
			ResultSet res = insertAdvert.getGeneratedKeys();
			res.next();
			return res.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException(e);
		}
	}

	@Override
	public void addExtras(List<Extra> extras, Vehicle v) {

	}

	/**
	 * Inserts the given {@link Vehicle} into the database. Vehicle's id is
	 * equal to the advert id returned by {@link #insertAdvert(Advert)} due to
	 * the fact that every add refers to only one vehicle.
	 * @throws Exception 
	 */
	@Override
	public void insertVehicle(Advert advert, Vehicle vehicle) throws SQLException {
		connection.setAutoCommit(false);
		int advertID = insertAdvert(advert);
		
		PreparedStatement insertVehicle = connection
				.prepareStatement("insert into vehicles values(?, ?, ?, ?, ?, ?, ?, ?);");
		insertVehicle.setInt(1, advertID);
		insertVehicle.setString(2, vehicle.getCondition());
		insertVehicle.setString(3, vehicle.getBrand());
		insertVehicle.setString(4, vehicle.getModel());
		insertVehicle.setInt(5, vehicle.getPrice());
		insertVehicle.setString(6, vehicle.getCurrency());
		insertVehicle.setInt(7, vehicle.getYear());
		insertVehicle.setString(8, vehicle.getMonth());
		insertVehicle.executeUpdate();

		if (vehicle instanceof MotorVehicle) {
			MotorVehicle mv = (MotorVehicle) (vehicle);
			PreparedStatement insertMotorVehicle = connection
					.prepareStatement("insert into motor_vehicles values(?, ?, ?, ?, ?, ?);");
			insertMotorVehicle.setInt(1, advertID);
			insertMotorVehicle.setString(2, mv.getEngineType());
			insertMotorVehicle.setString(3, mv.getGearboxType());
			insertMotorVehicle.setString(4, mv.getColor());
			insertMotorVehicle.setString(5, mv.getCategory());
			insertMotorVehicle.setInt(6, mv.getMileage());
			insertMotorVehicle.executeUpdate();

			if (vehicle instanceof Car) {
				PreparedStatement insertCar = connection.prepareStatement("insert into cars values(?);");
				insertCar.setInt(1, advertID);
				insertCar.executeUpdate();
				connection.commit();
			} 
			if (vehicle instanceof Jeep) {
				PreparedStatement insertJeep = connection.prepareStatement("insert into jeeps values(?);");
				insertJeep.setInt(1, advertID);
				insertJeep.executeUpdate();
				connection.commit();
			}
		}
		connection.setAutoCommit(true);
	}
}
