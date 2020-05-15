
var http = require("http");
http.createServer(function (request, response) {
      response.writeHead(200, {"Content-Type": "text/html"});
      response.write("<!DOCTYPE 'html'>");
      response.write("<html>");
      response.write("<head>");
      response.write("<title>Lab-In-A-Box - NodeJS</title>");
      response.write("</head>");
      response.write("<body>");
      response.write("Welcome to lab-in-a-box NodeJS!");
      response.write("</body>");
      response.write("</html>");
      response.end();
}).listen(8080);
