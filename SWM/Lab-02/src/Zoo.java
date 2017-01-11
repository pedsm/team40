
public class Zoo {

	// constructors
	public Zoo() {
		this("Unknown", 30);
	}

	public Zoo(String location, int numEnclosures) {
		this.location = location;
		this.numEnclosures = numEnclosures;
	}

	// Prvate Fields
	private String location;
	private int numEnclosures;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getNumEnclosures() {
		return numEnclosures;
	}

	public void setNumEnclosures(int numEnclosures) {
		this.numEnclosures = numEnclosures;
	}

}
