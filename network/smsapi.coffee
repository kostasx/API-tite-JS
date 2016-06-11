# SERVICE URL: https://smsapi.com
# API REFERENCE: https://www.smsapi.com/rest

got    = require 'got'
crypto = require "crypto"

# OPTIONS

API_URL  = "https://api.smsapi.com/"
username = "<USERNAME>"
password = "<PASSWORD>"
sender   = "<SENDER>"

# IGNORE THESE COMMENTED LINES. THEY ARE INTENTED FOR LOCAL TESTING ONLY
# config   = require("fs").readFileSync("../_RAW/API_KEYS.json", "utf8"); 
# username = JSON.parse(config).smsapi.username
# password = JSON.parse(config).smsapi.password
# sender   = JSON.parse(config).smsapi.sender

# HASH PASSWORD
password = crypto.createHash('md5').update(password).digest('hex')

# API ENDPOINTS METHODS

getBalance = (options)->

  return got.get( API_URL + "user.do?username=#{username}&password=#{password}&credits=1" )

sendSMS = (options)->

  return got.post( API_URL + "sms.do", {

    body:

      username : username                   
      password : password
      to       : options.to          
      from     : sender            
      message  : options.msg

  })

getBalance().then (response)->

  console.log response.body

sendSMS({ to: "<RECIPIENT>", msg: "<YOUR MESSAGE>" }).then (response)->

  # response.body.match /OK:/
  console.log response.body

.catch (e)-> console.log "Error: #{e}"

### REFERENCE

Response: ERROR:13 (then NOT catch)
Type: String
Reference: 
  RESPONSE ERROR:13
  ERROR No correct phone numbers

Response: ERROR:103
Type: String
Reference:
  ERROR Cannot send sms, account balance is low
  RESPONSE ERROR:103

###