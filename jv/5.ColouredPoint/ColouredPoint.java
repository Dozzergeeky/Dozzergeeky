import java.util.*;

class Points
{
    int x,y;
    Points(int x2, int y2)
    {
        this.x=x2;
        this.y=y2;
    }
    void show()
    {
        System.out.println("(" + x + "," + y +")");
    }  
}

public class ColouredPoint extends Points
{
    String colour;
    ColouredPoint(String colour)
    {
        super((int)(Math.random()*100),(int)(Math.random()*100));
        this.colour=colour;
    }
    void show()
    {
    super.show();
    System.out.println("Colour:"+ colour);
    }
    public static void main(String[] args)
    {
        Scanner sc=new Scanner(System.in);
        System.out.print("Enter the color of the point: ");
        String colour=sc.nextLine();
        ColouredPoint colouredpoint=new ColouredPoint(colour);
        System.out.print("The point is ");
        colouredpoint.show();
        sc.close();
    }
}
