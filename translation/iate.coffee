# API: (NOT AVAILABLE) iateTranslate (Using web scraping via Cheerio)
# DESCRIPTION: Scraping IATE Translation Service
# URL: http://iate.europa.eu/SearchByQueryLoad.do?method=load

# USAGE: coffee iate.coffee <WORD>

colors    = require "colors"
got       = require "got"
Purdy     = require "purdy"
cheerio   = require "cheerio"

# HELPERS

log = -> console.log.apply( console, arguments )
ok  = -> Object.keys.apply( Object, arguments )

# OPTIONS

word      = process.argv.slice(2)[0];
lang_from = "en"       # LANGUAGE TO TRANSLATE FROM (= English)
lang_to   = "el"       # LANGUAGE TO TRANSLATE TO (= Greek)
api_url = "http://iate.europa.eu/SearchByQuery.do";

# MAIN APP

data = 
    "method"          : "search" 
    "saveStats"       : "true" 
    "screenSize"      : "1280x768"
    "query"           : word
    "valid"           : "Search+" 
    "sourceLanguage"  : lang_from
    "targetLanguages" : lang_to
    "domain"          : "0" 
    "typeOfSearch"    : "s" 

got.post(api_url,{ body: data })
.then((response)->

    # match('/No matching/i', response)
    $ = cheerio.load(response.body)
    $("#searchResultBody table").filter(->
        log $(@).find("tr").eq(1).find("td div.termRecord").text().trim()
        log $(@).find("tr").eq(2).find("td div.termRecord").text().trim()
    )

).catch((error)-> log "Error:", error )