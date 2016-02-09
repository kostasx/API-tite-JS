# API-tite JS
Consuming APIs using JavaScript (originally written in CoffeeScript) 


## Table of Contents

* Music
    * [EchoNest](#echonest)
    * [TuneFind](#tunefind)

* Portfolio
    * [Flickr](#flickr)

* Network & Telecommunications
    * [SMSAPI.com](#smsapi-com)
    * [OTE WhitePages](#ote-whitepages)

* Translation
    * [Glosbe](#glosbe-api)
    * [IATE](#iate)
    * [MyMemory](#mymemory-api)
    * [Wordnik](#wordnik-api)
    * [WordReference](#wordreference-api)

--------------------------------------------------

## PREREQUISITES

`npm install`

--------------------------------------------------

## MUSIC APIS

### EchoNest

**NOTE: See source code for provided methods.**

```bash
$ coffee ./music/echonest.coffee
```

```bash
$ node ./music/echonest.js
```

[Reference](http://developer.echonest.com/docs/v4)

### TuneFind

```bash
$ coffee ./music/tunefind.coffee "Modern Family"
```

```bash
$ node ./music/tunefind.js "Modern Family"
```

[Reference](http://www.tunefind.com/api)

--------------------------------------------------

## PORTFOLIO APIS

### FLICKR

`$ coffee ./portfolio/flickr.coffee keyword`

`$ node ./portfolio/flickr.js keyword`

[Reference](https://www.flickr.com/services/api/)

--------------------------------------------------

## NETWORK & TELECOMMUNICATIONS

### SMSAPI COM

Description: Send SMS

```bash
$ coffee ./network/smsapi.coffee
```

OR

```bash
$ node ./network/smsapi.js
```

### OTE WHITEPAGES

Description: Get contact information from greek whitepages service (OTE). 
Not an API consumer, but it uses `cheerio` to scrape the results [web page](http://www.11888.gr/search/goodys/).

```bash
$ coffee ./network/ote.coffee GOODYS
```

OR

```bash
$ node ./network/ote.js GOODYS
```

Outputs:
```
NAME: GOODYS
TELEPHONE: 2310912163
ADDRESS: ΛΑΜΠΡΑΚΗ ΓΡΗΓ. 144 Θεσσαλονίκη [Δήμος] Θεσσαλονίκη 54351
```

```bash
$ coffee ./network/ote.coffee 2310912163
```

OR

```bash
$ node ./network/ote.js 2310912163
```

Outputs:
```
NAME: GOODYS
TELEPHONE: 2310912163
ADDRESS: ΛΑΜΠΡΑΚΗ ΓΡΗΓ. 144 Θεσσαλονίκη [Δήμος] Θεσσαλονίκη 54351
```

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

### Wordnik API

```bash
$ coffee ./translation/wordnik.coffee <WORD>
```

```bash
$ node ./translation/wordnik.js <WORD>
```

[Reference](http://developer.wordnik.com/docs.html)

### WordReference API

```bash
$ coffee ./translation/wordreference.coffee <WORD>
```

```bash
$ node ./translation/wordreference.js <WORD>
```

[Reference](http://www.wordreference.com/docs/api.aspx)