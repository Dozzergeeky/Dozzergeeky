import socket
from _thread import start_new_thread


# Initialize client
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = socket.gethostname()
port = 2345

print('Waiting for connection')
try:
    s.connect((host, port))
except socket.error as e:
    print(str(e))

# Receive the welcome message from the server
response = s.recv(1024)
print(response.decode('UTF-8'))

def receive_messages():
    while True:
        try:
            response = s.recv(1024)
            if response:
                print(response.decode('UTF-8'))
            else:
                break
        except:
            break

# Start a new thread to handle incoming messages from the server
start_new_thread(receive_messages, ())

while True:
    message = input('Enter a message: ')
    if message.lower() == 'exit':
        break
    s.send(str.encode(message))

s.close()
