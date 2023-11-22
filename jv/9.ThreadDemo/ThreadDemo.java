class MyThread extends Thread {
    public MyThread(String name) {
        super(name);
    }

    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(getName() + " - Output: " + (int) (Math.random() * 100));

            if ( getName().equals("Thread 1") && i == 2) {
                try {
                    System.out.println(getName() + " is pausing for 3 seconds.");
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    System.out.println(getName() + " interrupted.");
                    return;
                }
            }
        }
    }
}

public class ThreadDemo {
    public static void main(String[] args) {
        MyThread thread1 = new MyThread("Thread 1");
        MyThread thread2 = new MyThread("Thread 2");
        MyThread thread3 = new MyThread("Thread 3");

        thread1.setPriority(Thread.MAX_PRIORITY);
        thread2.setPriority(Thread.MIN_PRIORITY);
        thread3.setPriority(Thread.NORM_PRIORITY);

        thread1.start();
        thread2.start();
        thread3.start();
    }
}
