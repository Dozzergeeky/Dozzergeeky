import java.io.*;
import java.util.*;

class Person {
    String name;
    int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void displayInfo() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
    }
}

class Employee extends Person {
    int employeeId;
    double salary;

    public Employee(String name, int age, int employeeId, double salary) {
        super(name, age); 
        this.employeeId = employeeId;
        this.salary = salary;
    }

    public void displayEmployeeInfo() {
        super.displayInfo(); 
        System.out.println("Employee ID: " + employeeId);
        System.out.println("Salary: Rs" + salary);
    }
}

public class EmpDemo {
    public static void main(String[] args) throws FileNotFoundException {
        System.out.println("Enter the path of File: ");
        Scanner scanner = new Scanner(System.in);
        File file = new File(scanner.nextLine());
        Scanner sc = new Scanner(file);
        while(sc.hasNextLine())
        {
            String line = sc.nextLine();
            String details[] = line.split(",");
            Employee employee1 = new Employee(details[0].trim(),Integer.parseInt(details[1].trim()), Integer.parseInt(details[2].trim()),Double.parseDouble(details[3].trim()));
            employee1.displayEmployeeInfo();
            System.out.println();
        }
        sc.close();
        scanner.close();
    }
}
