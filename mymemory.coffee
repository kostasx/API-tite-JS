# API: MyMemory.com Translated Method (JSON API)
# DESCRIPTION: Free Usage Limit: 2500 Requests/Day
# URL: http://mymemory.translated.net/api/get?q=translation&langpair=en|it&of=json

# USAGE: coffee mymemory.coffee <WORD>

colors    = require "colors"
got       = require "got"
Purdy     = require "purdy"

# HELPERS

log = ()-> console.log.apply( console, arguments )
ok  = ()-> Object.keys.apply( Object, arguments )

# OPTIONS

word      = process.argv.slice(2)[0];
lang_from = "en"       # LANGUAGE TO TRANSLATE FROM (= English)
lang_to   = "el"       # LANGUAGE TO TRANSLATE TO (= Greek)
api_url = "http://mymemory.translated.net/api/get?q=#{word}&langpair=#{lang_from}|#{lang_to}&of=json";

# MAIN APP

got(api_url,{
    json: true
})
.then((response)->

    response = response.body

    log "RESULTS STATUS: #{response.responseStatus}" 
    log "RESULTS COUNT: #{response.matches.length}"
    log Purdy.stringify(response)

).catch((error)->

    log "Error:", error

) 