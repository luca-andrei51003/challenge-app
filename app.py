from http.server import HTTPServer, BaseHTTPRequestHandler

HTML_CONTENT = """
"""

class configuration(BaseHTTPRequestHandler):
    def do_GET(self):
        try:
            with open('main.html', 'rb') as f:
                html_content = f.read()
            self.send_response(200)
            self.send_header('content-type', 'text/html')
            self.end_headers()
            self.wfile.write(html_content)
        except FileNotFoundError:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b"<h1>404 Not Found</h1>")
        

port = HTTPServer(('', 5555), configuration)
print("Server running on http://localhost:5555")
port.serve_forever()