from http.server import HTTPServer, BaseHTTPRequestHandler

HTML_CONTENT = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Counter App GitOps</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: sans-serif;
            background-color: #f0f0f0;
        }
        #counter {
            font-size: 5rem;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
    <div id="counter">0</div>

    <script>
        let count = 0;
        const counterElement = document.getElementById('counter');
        
        setInterval(() => {
            count++;
            counterElement.textContent = count;
        }, 1000);
    </script>
</body>
</html>
"""

class configuration(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('content-type', 'text/html')
        self.end_headers()
        self.wfile.write(HTML_CONTENT.encode('utf-8'))

port = HTTPServer(('', 5555), configuration)
print("Server running on http://localhost:5555")
port.serve_forever()