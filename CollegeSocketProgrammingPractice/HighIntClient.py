import socket

HOST = '127.0.0.1'
PORT = 8888
kill_mess = "KILL"
send_keyword = "SEND"

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))
send_message = []

while True:
    message = input('Client: ')
    send_message.append(message)
    while message != send_keyword:
        if message == kill_mess:
            break
        message = input('Client: ')
        send_message.append(message)
    client_socket.sendall((str(send_message)).encode())
    send_message.clear()
    if kill_mess in message:
        print('Client initiated termination.')
        break
    
    data = client_socket.recv(1024)
    datalist = eval(data.decode())

    for i in datalist:
        if i == send_keyword:
            break
        print('Server:', i)  
    if kill_mess in datalist:
        print('Client disconnected with KILL message.')
        break
client_socket.close()
