'use strict'

http = require 'http'
util = require 'util'

server = http.createServer  (req, response) ->
	console.log util.inspect req ,
		depth : 1
	console.log req.connection.remoteAddress
	response.writeHead 200  , 
		"Content-Type": "text/html"
	response.end '<head></head><p>Hello World</p>'

server.listen 80
