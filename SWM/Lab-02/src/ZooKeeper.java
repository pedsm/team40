
public class ZooKeeper extends Employee {

	private int bonus;
	
	@Override
	public int calculateChristmasBonus() {
	bonus = (int) (getSalary() * 0.05 + 100);
		return bonus;
	}

	public int getBonus() {
		return bonus;
	}

	public void setBonus(int bonus) {
		this.bonus = bonus;
	}

}
