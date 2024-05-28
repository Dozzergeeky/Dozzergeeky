import socket
from _thread import *
import threading

# Initialize server
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = socket.gethostname()
port = 2345
ThreadCount = 0
clients = []
client_ids = {}  # Dictionary to map clients to their IDs
lock = threading.Lock()

try:
    s.bind((host, port))
except socket.error as e:
    print(str(e))

print('Waiting for clients...')
s.listen(5)

def broadcast_message(message):
    with lock:
        for client in clients:
            try:
                client.sendall(str.encode(message))
            except Exception as e:
                print(f"Error sending message to client: {e}")
                client.close()
                remove(client)

def remove(connection):
    with lock:
        if connection in clients:
            clients.remove(connection)
            del client_ids[connection]

def threaded_client(connection, client_id):
    connection.send(str.encode('Welcome to the Server'))
    while True:
        try:
            data = connection.recv(1024)
            if not data:
                break
            reply = f'Client {client_id} says: ' + data.decode('UTF-8')
            print(reply)
            connection.sendall(str.encode(reply))
        except Exception as e:
            print(f"Error in client thread: {e}")
            break
    remove(connection)
    connection.close()

def server_input():
    while True:
        message = input("Server: ")
        if message:
            broadcast_message(f"Server says: {message}")

# Start the server input thread
start_new_thread(server_input, ())

while True:
    c, addr = s.accept()
    with lock:
        clients.append(c)
        client_id = ThreadCount + 1  # Assign client ID based on ThreadCount
        client_ids[c] = client_id
    print(f'Connected to: {addr[0]}:{addr[1]} as Client {client_id}')
    start_new_thread(threaded_client, (c, client_id))
    ThreadCount += 1
    print(f'Client Number: {ThreadCount}')

s.close()
