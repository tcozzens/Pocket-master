var http = require("http");

function onRequest(request, response) {


	var imageStr = "";

  console.log(request);
  request.on('data', function(chunk){
  	 
  	 imageStr += chunk.toString();


  	 //imageStr.concat(chunk.toString());
	});

  //request is done
  request.on('end', function(){

  	console.log(imageStr);
  	require("fs").writeFile("test.png", new Buffer(imageStr, "base64"), function(err){});
	
  });

  response.writeHead(200, {"Content-Type": "text/plain"});
  response.write("Hello World");
  response.end();



}



http.createServer(onRequest).listen(8888);

