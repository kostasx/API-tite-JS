# API-tite JS
Consuming APIs using JavaScript (originally written in CoffeeScript) 


## Table of Contents

* Music
    * [EchoNest](#echonest)

* Translation
    * [Glosbe](#glosbe-api)
    * [IATE](#iate)
    * [MyMemory](#mymemory-api)
    * [WordReference](#wordreference-api)

--------------------------------------------------

## MUSIC APIS

### EchoNest

**NOTE: See source code for provided methods.**

`$ coffee ./music/echonest.coffee`

`$ node ./music/echonest.js`

[Reference](http://developer.echonest.com/docs/v4)

--------------------------------------------------

## TRANSLATION APIS

### Glosbe API

`$ coffee ./translation/glosbe-webtranslate.coffee <WORD>`

`$ node ./translation/glosbe-webtranslate.js <WORD>`

[Reference](https://glosbe.com/a-api)

### IATE

IATE: InterActive Terminology for Europe

Experimental: This is not an actual API, but rather a scraping of the results page using `cheerio`. 
Still under development.

[Reference](http://iate.europa.eu/SearchByQueryLoad.do?method=load)

### MyMemory API

`$ coffee ./translation/mymemory.coffee <WORD>`

`$ node ./translation/mymemory.js <WORD>`

[Reference](http://mymemory.translated.net/doc/spec.php)


### WordReference API

`$ coffee ./translation/wordreference.coffee <WORD>`

`$ node ./translation/wordreference.js <WORD>`

[Reference](http://www.wordreference.com/docs/api.aspx)