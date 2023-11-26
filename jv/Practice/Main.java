//  Declare an abstract class
abstract class Animal {
    // Declare an abstract method
    abstract void makeSound();

    // Declare a non-abstract method
    void eat() {
        System.out.println("The animal eats");
    }
}

// Declare a class that extends the abstract class
class Dog extends Animal {
    // Provide an implementation for the abstract method
    void makeSound() {
        System.out.println("The dog barks");
    }
}

public class Main{
    public static void main(String[] args) {
        // Create an instance of the Dog class (which is a subclass of Animal)
        Dog myDog = new Dog();

        // Call the method from the abstract class
        myDog.makeSound();
        myDog.eat();
    }
}

