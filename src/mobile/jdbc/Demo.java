package mobile.jdbc;

public class Demo {
	public static void main(String[] args) {
		MobileDAO dao = new MobileDAO();
		
		dao.register("hakan.hyusein@abv.bg", "1234", "Hakan", "Hyusein", "Shumen");
		dao.register("hakan.hyusein94@abv.bg", "1234", "’акан", "’юсеин", "Ўумен");

		dao.login("hakan.hyusein@abv.bg", "null");
	}
}
