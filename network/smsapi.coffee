# SERVICE URL: https://smsapi.com
# API REFERENCE: https://www.smsapi.com/rest

got    = require 'got'
crypto = require "crypto"

# OPTIONS

API_URL  = "https://api.smsapi.com/sms.do"
username = "<USERNAME>"
password = "<PASSWORD>"
sender   = "<SENDER>"

# IGNORE THESE COMMENTED LINES. THEY ARE INTENTED FOR LOCAL TESTING ONLY
# config   = require("fs").readFileSync("../_RAW/API_KEYS.json", "utf8"); 
# username = JSON.parse(config).smsapi.username
# password = JSON.parse(config).smsapi.password
# sender   = JSON.parse(config).smsapi.sender

got.post( API_URL, {

  body:

    username : username                   
    password : crypto.createHash('md5').update(password).digest('hex')
    to       : '<RECIPIENT_MOBILE>'          
    from     : sender            
    message  : "What's up Doc?"

})
.then (response)->

  # response.body.match /OK:/
  console.log response.body

.catch (e)->

  console.log "Error: #{e}"

