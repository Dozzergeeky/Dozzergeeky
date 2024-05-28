import socket

def send_message():
    # Create a TCP/IP socket
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Connect to the server
    server_address = ('localhost', 65432)
    client_socket.connect(server_address)

    try:
        # Send message
        message = 'server is connected'
        client_socket.sendall(message.encode('utf-8'))
        print('Message sent to server')

    finally:
        # Clean up the connection
        client_socket.close()
send_message()
