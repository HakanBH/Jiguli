package mobile.jdbc;

public interface IMobileDAO {
	boolean hasEmail(String email);
	void register(String email, String password, String firstName, String lastName, String location);
	void login (String email, String password);
	
	void searchVehicle(); 	
	void insertVehicle();
} 
