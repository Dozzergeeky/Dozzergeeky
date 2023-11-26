import java.util.*;

public class Point
{
    double x, y;
    Point(double x, double y)
    {
        this.x=x;
        this.y=y;
    }

    Point add(Point p)
    {
        return new Point(this.x + p.x, this.y + p.y);
    }

    Point subtract(Point p)
    {
        return new Point(this.x - p.x, this.y - p.y);
    }

    boolean equals(Point p)
    {
        if(this==p)
        return true;
        return Double.compare(x, p.x)==0 && Double.compare(y, p.y)==0;
    }
    void show()
    {
        System.out.println("(" + x + "," + y + ")");
    }

    public static void main(String[] args) 
    {
        Scanner sc=new Scanner(System.in);
        System.out.println("Main method inside Point class is executed.");
        System.out.println("Enter the coordinates of First point:");
        double x=sc.nextDouble();
        double y=sc.nextDouble();
        System.out.println("Enter the coordinates of Second point:");
        double v=sc.nextDouble();
        double w=sc.nextDouble();
        Point p1=new Point(x, y);
        Point p2=new Point(v, w);
        Point p3=p1.add(p2);
        Point p4=p1.subtract(p2);
        System.out.println("Addition gives");
        p3.show();
        System.out.println("Subtraction gives");
        p4.show();
        sc.close();        
    }
}