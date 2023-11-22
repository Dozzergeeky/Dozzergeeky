class MyRunnable implements Runnable {
    private String name;

    public MyRunnable(String name) {
        this.name = name;
    }

    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(name + " - Output: " + i);
            try {
                if (name.equals("Thread 1") && i == 2) {
                    System.out.println(name + " is pausing for 3 second.");
                    Thread.sleep(3000); 
                }
            } catch (InterruptedException e) {
                System.out.println(name + " interrupted.");
                return;
            }
        }
    }
}

public class RunnableDemo {
    public static void main(String[] args) {
        Thread thread1 = new Thread(new MyRunnable("Thread 1"));
        Thread thread2 = new Thread(new MyRunnable("Thread 2"));
        Thread thread3 = new Thread(new MyRunnable("Thread 3"));

        thread1.setPriority(Thread.MAX_PRIORITY);
        thread2.setPriority(Thread.MIN_PRIORITY);
        thread3.setPriority(Thread.NORM_PRIORITY);

        thread1.start();
        thread2.start();
        thread3.start();
    }
}
