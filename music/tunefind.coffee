"""
As a reminder, among the other terms you have agreed to in our Terms of Service and API Terms of Service, you are required to:

Not cache or store API data in any form for longer than than 24 hours.
Not share your API Username and Password
Acknowledge in any Application created that the song data is used under license from TuneFind LLC and if your application is web based, link to TuneFind.com
Any links to purchase songs via iTunes or Amazon must utilize the song purchase links provided by the API. 
For information about the additional features of our Premium API subscription service, please see http://www.tunefind.com/api.
To retrieve your API Username and Password, please visit your settings page: http://www.tunefind.com/user/settings
"""

colors = require 'colors'
got    = require 'got'
Purdy  = require 'purdy'

keyword = process.argv.slice(2)[0] || 'alias'
keyword = keyword.toLowerCase()
keyword = keyword.replace(/ /g, "-")

# HELPERS

log = ()-> console.log.apply( console, arguments )
ok  = ()-> Object.keys.apply( Object, arguments )

# OPTIONS

api_url = "https://www.tunefind.com/api/v1/show/#{keyword}"
USERNAME = "<YOUR_API_USERNAME>" 
PASSWORD = "<YOUR__API_PASSWORD>"

# IGNORE THESE COMMENTED LINES. THEY ARE INTENTED FOR LOCAL TESTING ONLY
# config = require("fs").readFileSync("../_RAW/API_KEYS.json", "utf8"); 
# USERNAME = JSON.parse(config).tunefind.username
# PASSWORD = JSON.parse(config).tunefind.password

got( api_url, {

  json: true
  headers:
    Authorization: "Basic " + new Buffer(USERNAME + ":" + PASSWORD).toString("base64")

}).then((response)->

  log Purdy(response.body)

).catch((error)->

    log "Error: #{error}"

)