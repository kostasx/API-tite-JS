# http://openweathermap.org/api

API_KEY        = '<YOUR_API_KEY>'
openWeatherUrl = 'http://api.openweathermap.org/data/2.5/forecast' # ?q={city name},{country code}
city           = 'Berlin'
country        = 'de'
units          = 'metric' # 'imperial'
API_QUERY      = "?q=#{city},#{country}&appid=#{API_KEY}&units=#{units}"

getData = (url,method,callback)->
  xhr = new XMLHttpRequest
  method = method or "GET"
  xhr.onreadystatechange = -> if xhr.readyState is 4 and xhr.status is 200 then callback xhr.responseText
  xhr.open method, url, true
  xhr.send()

fetchData = (forecast)->
  forecast = if typeof forecast is "string" then JSON.parse forecast else forecast
  console.log forecast.city.name, forecast.city.country
  forecast.list.forEach (forecastEntry, index, list)-> console.log( forecastEntry.dt_txt, forecastEntry.main.temp )

# AJAX (BROWSER)
getData( openWeatherUrl + API_QUERY, 'GET', fetchData )

# JSONP (BROWSER)
script = document.createElement('script');
script.src = openWeatherUrl + API_QUERY + "&callback=fetchData"
document.getElementsByTagName('head')[0].appendChild(script)





