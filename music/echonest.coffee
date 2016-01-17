colors  = require "colors"
got     = require "got"

# HELPERS

log = ()-> console.log.apply( console, arguments )
ok  = ()-> Object.keys.apply( Object, arguments )

# OPTIONS

API_KEY       = "<YOUR_API_KEY>" 

# IGNORE THESE COMMENTED LINES. THEY ARE INTENTED FOR LOCAL TESTING ONLY
# config = require("fs").readFileSync("../_RAW/API_KEYS.json", "utf8"); 
# API_KEY = JSON.parse(config).echonest.api_key

Echonest =

    # API DOC: http://developer.echonest.com/docs/v4
    apiVersion: 4

    api_url: ->
        "http://developer.echonest.com/api/v#{@apiVersion}/"

    getSimilarArtists: (options)->

        # options.format  = 'json'  # &format=json
        # options.results = 10      # &results=10
        # options.start   = 0       # &start=0
        # options.byid    = false   # &id=ARDW1CO1187B9AD318&id=ARN5NHX1187FB4F755&id=ARH6W4X1187B99274F

        if (typeof options.artists is 'object') and ( options.artists instanceof Array)
            artist = "" 
            options.artists.forEach (a)->
                artist += "&name=#{encodeURI(a)}"
        else
            artist   = "&name=" + encodeURI options.artists

        if options.results and typeof options.results is 'number' 
            apiEntry = "#{@api_url()}artist/similar?api_key=#{API_KEY}#{artist}&results=#{options.results}"  
        else
            apiEntry = "#{@api_url()}artist/similar?api_key=#{API_KEY}#{artist}"  

        log "Contacting: #{apiEntry} ..."
        return got apiEntry, { json: true }

# GET SIMILAR ARTISTS FROM ARTIST NAME
Echonest.getSimilarArtists({ artists: "Bob Dylan", results: 3 })
    .then (data)->
        data = data.body.response
        log data.status.message
        data.artists.forEach (o)->
            log o.id, o.name.cyan
    .catch (e)->
        log "e", e

# GET SIMILAR ARTISTS FROM SEED OF ARTIST NAMES
Echonest.getSimilarArtists({ artists: ["Mozart", "Vivaldi"]})
    .then (data)->
        data = data.body.response
        log data.status.message
        data.artists.forEach (o)->
            log o.id, o.name.cyan
    .catch (e)->
        log "e", e
