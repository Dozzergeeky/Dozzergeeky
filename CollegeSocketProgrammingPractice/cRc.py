def crc_remainder(message, polynomial):
    message = list(message)
    polynomial = list(polynomial)
    n = len(polynomial)
    # Append zeros to the end of the message to match the length of polynomial
    message.extend('0' * (n - 1))
    
    # Perform the CRC division
    while '1' in message[:-(n - 1)]:
        # Find the next '1' in the message
        i = message.index('1')
        # XOR the polynomial with the corresponding part of the message
        for j in range(n):
            message[i + j] = str(int(message[i + j]) ^ int(polynomial[j]))
    
    # Return the CRC remainder
    return ''.join(message[-(n - 1):])

def crc_encode(message, polynomial):
    crc = crc_remainder(message, polynomial)
    return message + crc

def crc_check(encoded_message, polynomial):
    remainder = crc_remainder(encoded_message, polynomial)
    # If the remainder is all zeros, there is no error
    return all(bit == '0' for bit in remainder)

# Take input from the user
message = input("Enter the message: ")
polynomial = input("Enter the polynomial: ")

# Encode the message
encoded_message = crc_encode(message, polynomial)
print("Encoded Message:", encoded_message)

# Prompt the user to input the encoded message
received_message = input("Enter the received encoded message: ")

# Check if there's an error
error_detected = not crc_check(received_message, polynomial)
if error_detected:
    print("Error detected!")
else:
    print("No error detected.")
