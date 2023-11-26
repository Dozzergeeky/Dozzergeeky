import java.util.*;

class Stack 
{
    public static final int OVERFLOW = 9999;
    public static final int UNDERFLOW = -9999;

    int[] data;
    int top;
    int size;

    Stack(int size) 
    {
        this.size = size;
        this.data = new int[size];
        this.top = -1;
    }

    int push(int value) 
    {
        if (top >= size - 1) 
            return OVERFLOW;
        data[++top] = value;
        return 1;
    }

    int pop() 
    {
        if (top < 0) 
            return UNDERFLOW;
        return data[top--];
    }

    int size() 
    {
        return top + 1;
    }
}

public class PostfixEvaluation 
{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the postfix expression: ");
        String postfixExpression = scanner.nextLine();
        scanner.close();

        int result = evaluatePostfix(postfixExpression);
        if (result == Stack.OVERFLOW) {
            System.out.println("Invalid input expression");
        } else if (result == Stack.UNDERFLOW) {
            System.out.println("Invalid input expression");
        } else {
            System.out.println("Output: " + result);
        }
    }

    public static int evaluatePostfix(String postfixExpression) {
        Stack stack = new Stack(postfixExpression.length());

        for (int i = 0; i < postfixExpression.length(); i++) {
            char ch = postfixExpression.charAt(i);

            if (Character.isDigit(ch)) {
                int operand = ch - '0';
                stack.push(operand);
            } else if (ch == '+' || ch == '-' || ch == '*' || ch == '/') {
                if (stack.size() < 2) {
                    return Stack.UNDERFLOW;
                }

                int operand2 = stack.pop();
                int operand1 = stack.pop();
                int result = applyOperator(ch, operand1, operand2);
                if (result == Stack.OVERFLOW) {
                    return Stack.OVERFLOW;
                }
                stack.push(result);
            }
        }

        if (stack.size() != 1) {
            return Stack.OVERFLOW;
        }

        return stack.pop();
    }

    public static int applyOperator(char operator, int operand1, int operand2) {
        switch (operator) {
            case '+':
                return operand1 + operand2;
            case '-':
                return operand1 - operand2;
            case '*':
                return operand1 * operand2;
            case '/':
                if (operand2 == 0) {
                    return Stack.OVERFLOW;
                }
                return operand1 / operand2;
            default:
                return Stack.OVERFLOW;
        }
    }
}

