
public class ZooApp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Zoo londonZoo = new Zoo("London", 100);
		Zoo tokyoZoo = new Zoo("Tokyo", 30);
		Zoo newYorkZoo = new Zoo("New York", 50);
		Zoo beestonZoo = new Zoo("Beeston", 10);
		Zoo parisZoo = new Zoo("Paris", 20);

		londonZoo.printInfo();
		tokyoZoo.printInfo();
		newYorkZoo.printInfo();
		beestonZoo.printInfo();
		parisZoo.printInfo();
		
		System.out.println("Number of zoos = " + Zoo.numberOfZoos);
		
	}

}
