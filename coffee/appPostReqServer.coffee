'use strict'

http = require 'http'
util = require 'util'

server = http.createServer  (req, response) ->
	if req.url == '/' 
		response.writeHead 200  , 
			"Content-Type": "text/html"
		response.end ['<form method="POST" action="/url">'
			'<h1>My form</h1>'
			'<fieldset>'
			'<label>Personal information</label>'
			'<p>What is your name?</p>'
			'<input type="text" name="name">'
			'<p><button>Submit</button></p>'
			'</form>'].join('')
	else if ('/url' == req.url && 'POST' == req.method) 
		body = ""
		type = req.headers['content-type']
		req.on 'data', (chunk) ->
			body += chunk
		req.on 'end' ,  () ->
			response.writeHead 200  , 
				"Content-Type": "text/html"
			response.end "<p>Content-Type: + #{ type } </p><p>Data:</p><pre> #{  body  } </pre>"

server.listen 80
