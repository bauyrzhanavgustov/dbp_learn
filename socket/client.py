# client.py
import socket
import threading
import sys


def receive_messages(client_socket):
    while True:
        try:
            message = client_socket.recv(1024).decode('utf-8')
            if not message:
                break
            print(f"\n{message}")
        except ConnectionResetError:
            break


def send_messages(client_socket, username):
    while True:
        message = input()
        if message.lower() == '/exit':
            print("Exiting chat...")
            client_socket.close()
            sys.exit()
        client_socket.send(f"{username}: {message}".encode('utf-8'))


def start_client(host='127.0.0.1', port=12345):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((host, port))

    username = input("Enter your username: ")

    receive_thread = threading.Thread(target=receive_messages, args=(client_socket,))
    receive_thread.start()

    send_thread = threading.Thread(target=send_messages, args=(client_socket, username))
    send_thread.start()


if __name__ == "__main__":
    start_client()
