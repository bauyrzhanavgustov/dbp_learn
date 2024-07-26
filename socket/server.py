# server.py
import socket
import threading

clients = []


def handle_client(client_socket, client_address):
    print(f"Client connected from {client_address}")
    while True:
        try:
            message = client_socket.recv(1024).decode('utf-8')
            if not message:
                break
            print(f"Received message from {client_address}: {message}")
            broadcast(message, client_socket)
        except ConnectionResetError:
            break

    print(f"Client disconnected from {client_address}")
    clients.remove(client_socket)
    client_socket.close()


def broadcast(message, sender_socket):
    for client_socket in clients:
        if client_socket != sender_socket:
            try:
                client_socket.send(message.encode('utf-8'))
            except BrokenPipeError:
                pass


def start_server(host='0.0.0.0', port=12345):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((host, port))
    server_socket.listen(5)
    print(f"Server listening on {host}:{port}")

    while True:
        client_socket, client_address = server_socket.accept()
        clients.append(client_socket)
        client_thread = threading.Thread(target=handle_client, args=(client_socket, client_address))
        client_thread.start()


if __name__ == "__main__":
    start_server()
