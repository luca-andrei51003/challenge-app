from http.server import *

class configuration(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)

        self.send_header('content-type', 'text/html')
        self.end_headers()

        self.wfile.write('<h1>I love gubu. Gubu loves guba</h1>'.encode())

port = HTTPServer(('', 5555), configuration)
port.serve_forever()