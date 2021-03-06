package mobile.jdbc;

import mobile.model.*;

public interface IUserDAO {
	
	public User getUserByID(int userID) throws Exception;
	
	public void register(User u) throws Exception;	
	
	public int login(String email, String password) throws Exception;
} 
