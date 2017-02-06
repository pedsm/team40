import java.util.ArrayList;

public class Enclosure {
	
	private int numAnimals;
	private ArrayList <Animal> animals;
	
	public Enclosure() {
		setNumAnimals(0);
	}
	
	public Enclosure(int numAnimals) {
		this.setNumAnimals(numAnimals);
		
		for (int i = 0; i < numAnimals; i++) {
			addAnimal(new Animal());
		}
	}
	
	public void addAnimal(Animal animal) {
		animals.add(animal);
	}

	public int getNumAnimals() {
		return numAnimals;
	}

	public void setNumAnimals(int numAnimals) {
		this.numAnimals = numAnimals;
	}
}
