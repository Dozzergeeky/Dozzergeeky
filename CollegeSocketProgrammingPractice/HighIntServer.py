import socket

HOST = '127.0.0.1'
PORT = 8888
kill_mess = "KILL"
send_keyword = "SEND"

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((HOST, PORT))
server_socket.listen(1)

print('Server is listening for connections...')

client_socket, addr = server_socket.accept()
print('Connected by', addr)

while True:
    data = client_socket.recv(1024)
    if not data:
        break
    datalist = eval(data.decode())
     
    for i in datalist:
        if (i == send_keyword) or (kill_mess == i):
            break
        # if kill_mess==i:
        #     #print('Client disconnected with KILL message.')
        #     break
        print('Client:', i)

    if kill_mess in datalist:
        print('Client disconnected with KILL message.')
        break
    
    send_message = []
    while True:
        message = input('Server: ')
        send_message.append(message)
        if message == send_keyword or message == kill_mess:
            break
    
    client_socket.sendall((str(send_message)).encode())
    
    if kill_mess in send_message:
        print('Server initiated termination.')
        break

client_socket.close()
server_socket.close()