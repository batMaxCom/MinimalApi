from http.server import BaseHTTPRequestHandler, HTTPServer
import json

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            # Ответ с заголовками
            self.send_response(200)
            self.send_header("Content-type", "application/json")
            self.end_headers()

            # Тело ответа
            response = {"message": "Hello, world!"}
            self.wfile.write(json.dumps(response).encode())
        else:
            self.send_error(404, "Not Found")

# Запуск сервера
if __name__ == "__main__":
    server_address = ("", 8000)  # слушать на всех интерфейсах
    httpd = HTTPServer(server_address, SimpleHandler)
    print("🚀 Server running at http://localhost:8000")
    httpd.serve_forever()