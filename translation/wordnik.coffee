colors = require "colors"
got    = require "got"

# HELPERS

log = ()-> console.log.apply( console, arguments )
ok  = ()-> Object.keys.apply( Object, arguments )

# OPTIONS

API_KEY = "<YOUR_API_KEY>"

# IGNORE THESE COMMENTED LINES. THEY ARE INTENTED FOR LOCAL TESTING ONLY
# config = require("fs").readFileSync("../_RAW/API_KEYS.json", "utf8"); 
# API_KEY = JSON.parse(config).wordnik.api_key

word               = process.argv.slice(2)[0] || "resilience"
limit              = 10
sourceDictionaries = 'all'          # ahd, century, wiktionary, webster, wordnet
op                 = 'definitions'  # 'examples', 'topExample', 'relatedWords', 'pronunciations', 'phrases', 'etymologies', 'audio', more on: http://developer.wordnik.com/docs.html#!/word
entry              = 'word'         # 'words', 'wordList', 'wordLists'
qs                 = "?api_key=#{API_KEY}&limit=#{limit}&sourceDictionaries=#{sourceDictionaries}"
api_url            = "https://api.wordnik.com/v4/#{entry}.json/#{word}/#{op}/" + qs

got( api_url, {
    json : true
})
.then((response)->

    output = response.body
    output.forEach (word)->
        log "SOURCE: #{word.sourceDictionary}".yellow
        log "PART OF SPEECH: #{word.partOfSpeech}".magenta
        log "DEFINITION: #{word.text}".red 
        log "\n"

)
.catch((error)->

    log "Error: #{error}"

)

