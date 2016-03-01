package mobile.jdbc;

import java.sql.*;

import mobile.vehicles.Vehicle;

public class MobileDAO implements IMobileDAO {
	private static final String db_url = "jdbc:mysql://localhost:3306/mobile?user=root?autoReconnect=true&useSSL=false";

	private static final String user = "root";
	private static final String pass = "asd";

	@Override
	public boolean hasEmail(String email) {
		Connection connection = null;
		boolean hasEmail = false;

		try {
			connection = DriverManager.getConnection(db_url, user, pass);

			PreparedStatement checkEmail = connection.prepareStatement("select email from users where email like ?");
			checkEmail.setString(1, email);
			ResultSet res = checkEmail.executeQuery();
			if (res.next()) {
				hasEmail = true;
				System.out.println("Регистрация с този Е-мейл вече съществува!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return hasEmail;
	}

	public void register(String email, String password, String firstName, String lastName, String location) {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(db_url, user, pass);
			// проверка дали email е регистрира
			if (!hasEmail(email)) {
				// добавя нов потребител в базата данни
				PreparedStatement register = connection.prepareStatement("insert into users values(null, ?,?,?,?,?);");
				register.setString(1, email);
				register.setString(2, password);
				register.setString(3, firstName);
				register.setString(4, lastName);
				register.setString(5, location);
				register.executeUpdate();
				System.out.println("Registration succesful.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void login(String email, String password) {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(db_url, user, pass);
			PreparedStatement login = connection
					.prepareStatement("select email from users where email like ? and password like ?");
			login.setString(1, email);
			login.setString(2, password);
			ResultSet res = login.executeQuery();
			if (res.next()) {
				System.out.println("Вие се вписахте успешно.");
			} else {
				System.out.println("Грешен Е-мейл или парола!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	 @Override
	 public void searchVehicle() {

	 }
	
	 @Override
	 public void insertVehicle() {
	
	 }
}
