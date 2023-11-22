import java.util.*;

class Encryption 
{
    String input;
    Encryption(String input)
    {
        this.input=input;
    }
    String generateRandomKey(int length) {
        Random random = new Random();
        StringBuilder key = new StringBuilder();
        for (int i = 0; i < length; i++) {
            key.append((char) (random.nextInt(26) + 'a')); 
        }
        return key.toString();
    }

    String encrypt(String input, String key) {
        StringBuilder encrypted = new StringBuilder();
        for (int i = 0; i < input.length(); i++) {
            char c = (char) (input.charAt(i) ^ key.charAt(i % key.length()));
            encrypted.append(c);
        }
        return encrypted.toString();
    }

    String decrypt(String input, String key) {
        return encrypt(input, key); 
    }
}

public class DataEncryption
{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Enter the plain text: ");
        String plainText = scanner.nextLine();

        Encryption encryption=new Encryption(plainText);
        
        String randomKey = encryption.generateRandomKey(plainText.length());
        System.out.println("Random Key: " + randomKey);

        
        String encryptedText = encryption.encrypt(plainText, randomKey);
        System.out.println("Encrypted Text: " + encryptedText);

        System.out.print("Do you have a decryption key? (yes/no): ");
        String response = scanner.nextLine();

        if (response.equalsIgnoreCase("yes")) {
            System.out.print("Enter the decryption key: ");
            String decryptionKey = scanner.nextLine();

            
            String decryptedText = encryption.decrypt(encryptedText, decryptionKey);
            System.out.println("Decrypted Text: " + decryptedText);
        } else {
            System.out.println("Decryption not possible without the key.");
        }

        scanner.close();
    }
}
