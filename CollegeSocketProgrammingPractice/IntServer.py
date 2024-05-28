import socket

# Server setup
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('127.0.0.1', 5555))
server_socket.listen(1)
print("Server started and listening on port 5555")

client_socket, client_address = server_socket.accept()
print(f"New connection from {client_address}")

while True:
    # Receive message from client
    client_message = client_socket.recv(1024)
    if not client_message:
        break
    print(f"Client: {client_message.decode()}")

    # Send message to client
    server_message = input("Server: ")
    client_socket.send(server_message.encode())

client_socket.close()
server_socket.close()
