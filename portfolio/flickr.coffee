got    = require "got"
colors = require "colors"

# HELPERS

log = ()-> console.log.apply( console, arguments )
ok  = ()-> Object.keys.apply( Object, arguments )

# OPTIONS

API_KEY = "<YOUR_API_KEY>";

# IGNORE THESE COMMENTED LINES. THEY ARE INTENTED FOR LOCAL TESTING ONLY
# config = require("fs").readFileSync("../_RAW/API_KEYS.json", "utf8"); 
# API_KEY = JSON.parse(config).flickr.api_key

keyword = process.argv.slice(2)[0] || "miami"
base    =  "https://api.flickr.com/services/rest/?api_key=#{API_KEY}&format=rest&format=json&nojsoncallback=1";

getFlickrPhotoUrl = (image)-> "https://farm#{image.farm}.staticflickr.com/#{image.server}/#{image.id}_#{image.secret}.jpg" 

searchFlickr = ( keyword )->

    base = base + "&method=flickr.photos.search&text=#{keyword}&per_page=10&page=1"

    got(base).then((response)->

        data = JSON.parse response.body
        parsePhotos data.photos.photo        # data.photos.page, .pages, .total .photo[]

    ).catch((error)->

        log "Error: #{error}"

    )

parsePhotos = ( photoList )->
    photoList.forEach (photo)->
        log "#{photo.title.magenta} [ #{photo.owner} ]" # photo.id, , photo.server, photo.farm
        log "#{getFlickrPhotoUrl(photo)}".yellow
        # photo.secret, photo.isPublic, photo.isFriend

searchFlickr keyword