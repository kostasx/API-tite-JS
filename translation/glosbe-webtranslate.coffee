# API:  https://glosbe.com/a-api
# URL:  https://glosbe.com/gapi/translate?from=pol&dest=eng&format=json&phrase=witaj&pretty=true
# MEMORY API:
#       https://glosbe.com/gapi/tm?from=eng&dest=ell&format=json&phrase=book&page=1&pretty=true
#       tm -> Gives access to translation memory

# USAGE: coffee glosbe-webtranslate.coffee <WORD>

colors    = require "colors"
got       = require "got"
Purdy     = require "purdy"

# HELPERS

log = -> console.log.apply( console, arguments )
ok  = -> Object.keys.apply( Object, arguments )

# OPTIONS

word      = process.argv.slice(2)[0];
tm        = "tm=true&"  # INCLUDE EXAMPLES
lang_from = "de"        # LANGUAGE TO TRANSLATE FROM (= German)
lang_to   = "en"        # LANGUAGE TO TRANSLATE TO (= English)
api_url   = "https://glosbe.com/gapi/translate?#{tm}from=#{lang_from}&dest=#{lang_to}&format=json&phrase=#{word}&pretty=true&tm=false"

# MAIN APP

got(api_url,{ json: true })
.then((response)->

    response = response.body
    log "RESULTS STATUS: #{response.result}" 
    log "RESULTS COUNT: #{response.tuc.length}"
    response.tuc.map((result,index)-> 
        log "RESULT ##{index+1}".red
        log Purdy.stringify(result)
    )

).catch((error)-> log "Error:", error ) 