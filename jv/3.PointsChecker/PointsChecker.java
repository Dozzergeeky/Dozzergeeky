import java.util.*;

public class PointsChecker 
{
    public static void main(String[] args) 
    {
        Scanner sc=new Scanner(System.in);
        System.out.println("Main method inside PointsChecker class is executed.");
        System.out.println("Enter the coordinates of First point:");
        double x=sc.nextDouble();
        double y=sc.nextDouble();
        System.out.println("Enter the coordinates of Second point:");
        double v=sc.nextDouble();
        double w=sc.nextDouble();
        System.out.println("Enter the coordinates of Third point:");
        double m=sc.nextDouble();
        double n=sc.nextDouble();
        Point p1=new Point(x, y);
        Point p2=new Point(v, w);
        Point point=new Point(m, n);
        Point p3=p1.add(p2);
        Point p4=p1.subtract(p2);
        System.out.println("Addition gives");
        p3.show();
        System.out.println("Subtraction gives");
        p4.show();
        if(point.equals(p3))
            System.out.println("The first two points add up to give the third point.");
        else
            System.out.println("The first two points do not add up to give the third point.");
        sc.close();        
    }
}
