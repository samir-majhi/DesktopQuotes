#Plan
#1 get quotes from site - done
#2 show on desktop - 1st release
#3 get wallpaper
#4 combine wallpaper and quote
#5 display combo or set as wallpaper - 2nd release

#get quotes from site
require 'net/http'
require 'json'
uri = URI.parse("https://favqs.com/api/qotd")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
http.use_ssl = true
begin
    response = http.request(request)
    json = response.body
    tokens = JSON.parse(json)
    quote = "\""+tokens["quote"]["body"]+"\""
    puts quote
    author = "-"+tokens["quote"]["author"]
    puts author
    puts
    source = "powered by FavQs"
    puts source
    #show messagebox
    #require 'messagebox'
    #MessageBox.new("Motivational Quote",quote+"\n"+author+"\n\n"+source).show
rescue
    puts "No Internet connection"
end
