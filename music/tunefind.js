// Generated by CoffeeScript 1.10.0
"As a reminder, among the other terms you have agreed to in our Terms of Service and API Terms of Service, you are required to:\n\nNot cache or store API data in any form for longer than than 24 hours.\nNot share your API Username and Password\nAcknowledge in any Application created that the song data is used under license from TuneFind LLC and if your application is web based, link to TuneFind.com\nAny links to purchase songs via iTunes or Amazon must utilize the song purchase links provided by the API. \nFor information about the additional features of our Premium API subscription service, please see http://www.tunefind.com/api.\nTo retrieve your API Username and Password, please visit your settings page: http://www.tunefind.com/user/settings";
var PASSWORD, Purdy, USERNAME, api_url, colors, got, keyword, log, ok;

colors = require('colors');

got = require('got');

Purdy = require('purdy');

keyword = process.argv.slice(2)[0] || 'alias';

keyword = keyword.toLowerCase();

keyword = keyword.replace(/ /g, "-");

log = function() {
  return console.log.apply(console, arguments);
};

ok = function() {
  return Object.keys.apply(Object, arguments);
};

api_url = "https://www.tunefind.com/api/v1/show/" + keyword;

USERNAME = "<YOUR_API_USERNAME>";

PASSWORD = "<YOUR__API_PASSWORD>";

got(api_url, {
  json: true,
  headers: {
    Authorization: "Basic " + new Buffer(USERNAME + ":" + PASSWORD).toString("base64")
  }
}).then(function(response) {
  return log(Purdy(response.body));
})["catch"](function(error) {
  return log("Error: " + error);
});
