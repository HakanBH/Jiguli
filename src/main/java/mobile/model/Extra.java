package mobile.model;

public class Extra {
	private String name;
	private String category;
	
	public Extra(String name,String category){
		setExtra(name.toLowerCase());
		setCategory(category.toLowerCase());
	}
	
	public String getExtra(){
		return name;
	}
	
	public String getExtraCategory(){
		return category;
	}
	
	public void setExtra(String name) {
		if(name!=null && !name.isEmpty()){
			this.name = name;
		}
	}
	
	public void setCategory(String category) {
		if(category!=null && !category.isEmpty()){
			this.category = category;
		}
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Extra){
			Extra e = (Extra)(obj);
			return this.name.equals(e.name);
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return name.hashCode();
	}
}
