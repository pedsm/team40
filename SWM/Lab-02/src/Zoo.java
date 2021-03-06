import java.util.ArrayList;

public class Zoo {

	// Constructors
	public Zoo() {
		this("Unknown", 30);
	}

	public Zoo(String location, int numEnclosures) {
		this.location = location;
		this.numEnclosures = numEnclosures;
		numberOfZoos++;
		setZooID(numberOfZoos);
		enclosures = new ArrayList<Enclosure>();
		for (int i = 0; i < numEnclosures; i++) {
			addEnclosure(new Enclosure());
		}
	}

	private void addEnclosure(Enclosure enclosure) {
		this.enclosures.add(enclosure);
	}

	// Field declarations
	private String location;
	private int numEnclosures = 0;
	private int zooID;
	public static int numberOfZoos; // Static so all objects of the same type
									// can access

	// Initialise ArrayList
	private ArrayList<Enclosure> enclosures;

	// Methods
	public void buildNewEnclosure() {
		int numEnclosures;
		numEnclosures = getNumEnclosures();
		numEnclosures++;
		setNumEnclosures(numEnclosures);
	}

	public void printInfo() {
		System.out.println("Location: " + getLocation());
		System.out.println("Number of Enclosures " + getNumEnclosures() + "\n");
	}

	// Accessor Methods

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

	public int getZooID() {
		return zooID;
	}

	public void setZooID(int zooID) {
		this.zooID = zooID;
	}
}
