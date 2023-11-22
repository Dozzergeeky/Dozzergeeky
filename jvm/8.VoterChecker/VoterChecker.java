import java.util.*;

class Person {
    private int id;
    private String name;
    private String gender;
    private String dateOfBirth;

    public Person(int id, String name, String gender, String dateOfBirth) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }
}

class InvalidVoterException extends Exception {
    public InvalidVoterException(String message) {
        super(message);
    }
}

class Voter {
    private Person person;

    public Voter(Person person) {
        this.person = person;
    }

    public void registerAsVoter() throws InvalidVoterException {
        String dob = person.getDateOfBirth();
        String[] dobParts = dob.split("/");
        int yearOfBirth = Integer.parseInt(dobParts[2]);
        int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
        int age = currentYear - yearOfBirth;

        if (age < 18) {
            throw new InvalidVoterException("Invalid voter registration: Age of " + person.getName() + " is less than 18.");
        }

        System.out.println(person.getName() + " has been registered as a voter.");
    }

    public Person getPerson() {
        return person;
    }
}

public class VoterChecker {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the number of people: ");
        int n = sc.nextInt();
        Person persons[] = new Person[n];
        System.out.println("Enter ID, Name, Gender, DOB (comma-separated):");
        sc.nextLine();
        for (int i = 0; i < n; i++) {
            String details[] = sc.nextLine().split(",");
            persons[i] = new Person(Integer.parseInt(details[0].trim()), details[1].trim(), details[2].trim(), details[3].trim());
        }
        System.out.println();
        ArrayList<Voter> validVoters = new ArrayList<>();

        for (Person person : persons) {
            try {
                Voter voter = new Voter(person);
                voter.registerAsVoter();
                validVoters.add(voter);
            } catch (InvalidVoterException e) {
                System.out.println(e.getMessage());
            }
        }

        System.out.println("\nRegistered Voters:");
        for (Voter voter : validVoters) {
            System.out.println(voter.getPerson().getName());
        }

        System.out.println("\nInvalid Voters:");
        for (Person person : persons) {
            boolean isValidVoter = false;
            for (Voter voter : validVoters) {
                if (voter.getPerson().getId() == person.getId()) {
                    isValidVoter = true;
                    break;
                }
            }
            if (!isValidVoter) {
                System.out.println(person.getName());
            }
        }
        sc.close();
    }
}
