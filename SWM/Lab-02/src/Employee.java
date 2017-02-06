
public abstract class Employee implements Employable {

	private String name;
	private int ID;
	private int salary;
	
	@Override
	public void setEmployeeName(String name) {
		name = this.name;
	}

	@Override
	public void setEmployeeID(int number) {
		ID = number;
	}

	@Override
	public int getEmployeeID() {
		return ID;
	}

	@Override
	public void setSalary(int salary) {
		salary = this.salary;
	}

	@Override
	public int getSalary() {
		return salary;
	}

	@Override
	public String getEmployeeName() {
		return name;
	}
}
