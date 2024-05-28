import socket

# Client setup
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect(('127.0.0.1', 5555))

while True:
    # Send message to server
    client_message = input("You: ")
    client_socket.send(client_message.encode())

    # Receive message from server
    server_message = client_socket.recv(1024)
    if not server_message:
        break
    print(f"Server: {server_message.decode()}")

client_socket.close()
