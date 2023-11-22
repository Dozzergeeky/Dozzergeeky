class Prime
{
    int x, y;
    Prime(int x, int y)
    {
        this.x=x;
        this.y=y;
    }

    boolean isprime(int num)
    {
        if (num<=1) 
            return false;
        for (int i = 2; i <= Math.sqrt(num); i++)
            if (num % i == 0)
                return false;
        return true;
    }

    void printPrimes()
    {
        for (int i = x; i < y; i++) 
            if (isprime(i)) 
                    System.out.println(i);
    }
}

public class ListPrimes
{
    public static void main(String[] args) 
    {
        Prime prime=new Prime(Integer.parseInt(args[0]),Integer.parseInt(args[1]));
        prime.printPrimes();    
    }
}