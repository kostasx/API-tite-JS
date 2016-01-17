# API: WordReference.com 
# DESCRIPTION: 
# URL: 

# USAGE: coffee mymemory.coffee <WORD>

colors    = require "colors"
got       = require "got"
Purdy     = require "purdy"

# HELPERS

log = ()-> console.log.apply( console, arguments )
ok  = ()-> Object.keys.apply( Object, arguments )

# OPTIONS

API_KEY   = "<YOU_API_KEY>"
word      = process.argv.slice(2)[0];
lang_from = "en"       # LANGUAGE TO TRANSLATE FROM (= English)
lang_to   = "gr"       # LANGUAGE TO TRANSLATE TO (= Greek)
api_url   = "http://api.wordreference.com/0.8/#{API_KEY}/json/#{lang_from}#{lang_to}/#{word}"

# MAIN APP

got(api_url,{
    json: true
})
.then((response)->

    response = response.body
    log Purdy.stringify(response)

).catch((error)->

    log "Error:", error

) 