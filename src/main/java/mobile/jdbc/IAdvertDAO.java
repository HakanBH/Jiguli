package mobile.jdbc;
import mobile.model.*;

public interface IAdvertDAO {
	public Advert getAdvertByID(int advertID);
	
	public int createAdvert(Advert a);
	
	
}
