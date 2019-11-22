// load the http module
var http = require('http');

// configure our HTTP server
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
<<<<<<< HEAD
  response.end("Congratulation, Succesfully Deployed Nodejs Application \n");
=======
  response.end("Congratulation, Succesfully Deployed Nodejs App \n");
>>>>>>> 2255d24ce7168e12816dfb8abe0d0a3a5c8f2ac2
});

// listen on localhost:8000
server.listen(8000);
console.log("Server listening on port 8000 :  http://127.0.0.1:8000/");
