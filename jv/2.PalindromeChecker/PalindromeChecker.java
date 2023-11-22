class Palindrome 
{
    String st;
    
    Palindrome(String st)
    {
        this.st=st;
    }

    boolean palindrome()
    {
        for (int i = 0; i < st.length(); i++) 
        {
            if (st.charAt(i)!=st.charAt(st.length()-i-1))
                return false;
            else if (Character.isDigit(st.charAt(i)) && i==st.length()-1)
                return palindrome(convertToNum(st));
        }
        return true;
    }

    boolean palindrome(int num)
    {
        int new_num=0, copy=num;
        while (num>0) 
        {
            new_num=new_num * 10 + num % 10;
            num = num/10;
        }
        return new_num==copy ? true : false;
    }

    int convertToNum(String st)
    {
        return Integer.parseInt(st);
    }
}

public class PalindromeChecker
{
    public static void main(String[] args) 
    {
        Palindrome palindrome= new Palindrome(args[0]);
        if(palindrome.palindrome())
            System.out.println("Yes");
        else
            System.out.println("No");
    }
}
