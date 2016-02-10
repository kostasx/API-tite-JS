got     = require 'got'
cheerio = require 'cheerio'
query   = process.argv.slice(2)[0] || "GOODYS"

# HELPERS

log = ()-> console.log.apply( console, arguments )
ok  = ()-> Object.keys.apply( Object, arguments )

# OPTIONS

api_url = 'http://11888.ote.gr/web/guest/list-names?_wpType='
# api_url = 'http://11888.ote.gr/web/guest/white-pages/search?who=NUMBER&where='

sendRequest = (query) ->
  theQueryString = undefined
  # DO WE HAVE A NUMBER AS INPUT?
  if query.match(/^\d*$/) == null
    theQueryString = 'name&_wpName=' + query + '&_wpWhere='
  else
    theQueryString = 'number&_wpPhone=' + query
  url = api_url + theQueryString
  log 'SENDING REQUEST: ' + url
  got(url)
  .then((response)->

    $ = cheerio.load(response.body)
    return $('ul.results-list-names li').each ->
      details = $(this).find('.details')
      title   = details.find('span.title').text()
      tel     = details.find('div.phone').text()
      address = details.find('div.address').text()
      return log 'NAME: ' + title + '\nTELEPHONE: ' + tel + '\nADDRESS: ' + address

  ).catch((error)->
    log "Error: #{error}"
  )
  return

sendRequest query