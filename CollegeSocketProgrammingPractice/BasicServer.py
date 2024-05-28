import socket

def start_server():
    # Create a TCP/IP socket
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Bind the socket to the address and port
    server_address = ('localhost', 65432)
    server_socket.bind(server_address)

    # Listen for incoming connections
    server_socket.listen(1)
    print('Server is listening on {}:{}'.format(*server_address))

    while True:
        # Wait for a connection
        connection, client_address = server_socket.accept()
        try:
            print('Connection from', client_address)

            # Receive the data in small chunks
            data = connection.recv(1024)
            if data:
                print('Received: {}'.format(data.decode('utf-8')))
            else:
                print('No data received from', client_address)

        finally:
            # Clean up the connection
            connection.close()

start_server()
