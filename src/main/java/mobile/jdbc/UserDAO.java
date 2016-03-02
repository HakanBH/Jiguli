package mobile.jdbc;

import java.sql.*;
import mobile.model.*;

public class UserDAO implements IUserDAO {

	@Override
	public boolean hasEmail(String email) {
		Connection connection = DBConnection.getInstance().getConnection();
		boolean hasEmail = false;

		PreparedStatement checkEmail;
		try {
			checkEmail = connection.prepareStatement("select email from users where email like ?");
			checkEmail.setString(1, email);
			ResultSet res = checkEmail.executeQuery();
			if (res.next()) {
				hasEmail = true;
				System.out.println("Регистрация с този Е-мейл вече съществува!");
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hasEmail;
	}

	@Override
	public User getUserByID(int userID) throws Exception {
		Connection connection = DBConnection.getInstance().getConnection();
		try {
			PreparedStatement searchByID = connection.prepareStatement(
					"select * from users where user_id = ?");
			searchByID.setInt(1, userID);
			ResultSet result = searchByID.executeQuery();
			result.next();
			
			return new User(result.getString(1),result.getString(2),result.getString(3),
					result.getString(4),result.getString(5));
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("User with that id cannot be found.", e);
		}
	}

	public int register(User u) throws Exception {
		if (u != null || hasEmail(u.getEmail())) {
			Connection connection = DBConnection.getInstance().getConnection();
			try {
				PreparedStatement register = connection.prepareStatement("insert into users values(null, ?,?,?,?,?);",
						PreparedStatement.RETURN_GENERATED_KEYS);
				register.setString(1, u.getEmail());
				register.setString(2, u.getPassword());
				register.setString(3, u.getFirstName());
				register.setString(4, u.getLastName());
				register.setString(5, u.getLocation());
				register.executeUpdate();

				ResultSet res = register.getGeneratedKeys();
				res.next();
				return res.getInt(1);

			} catch (SQLException e) {
				e.printStackTrace();
				throw new Exception("Error. Please try again", e);
			}
		} else {
			throw new Exception("That email is already taken");
		}
	}

	@Override
	public int login(String email, String password) throws Exception {
		Connection connection = DBConnection.getInstance().getConnection();
		try {
			PreparedStatement login = connection.prepareStatement(
					"select email from users where email like ? and password like ?", PreparedStatement.RETURN_GENERATED_KEYS);
			login.setString(1, email);
			login.setString(2, password);
			
			ResultSet res = login.getGeneratedKeys();
			res.next();
			return res.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("Въвели сте невалиден Е-мейл или парола!", e);
		}
	}
}
