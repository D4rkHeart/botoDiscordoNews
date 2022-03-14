require "discordrb"
require "dotenv"
require 'net/http'
require "json"
Dotenv.load
$token=ENV['botordNewsToken']
$clientId=ENV['clientId']
bot = Discordrb::Commands::CommandBot.new token: $token, prefix: "/", client_id: $clientId

bot.command :ping do |event|
	event.respond "Pong!"
	sleep 5
	event.respond "Pong!"
end

bot.command :botonews do |event,srcName,number|
	if srcName.nil? and number.nil?
    botResponse = botoNewsDefault()
  elsif srcName == "random"
    botResponse = botoRandomNews(number)
  else
    botResponse = botoNewsXSources(srcName,number)
	end 
  p botResponse
  if botResponse.empty?
    event.respond "Error we cannot find your news"
  else
    event.respond botResponse
  end

end

def botoNewsDefault
  newsLink = botConnection(nil)
  newsLink = newsLink.map do |url|
    "<#{url}>"
  end 
  newsLink.first(3).join("\n")
end

def botoNewsXSources(srcName,number)
  newsLink = botConnection(srcName)
  number = number.nil? ? 3 : number.to_i
  srcName.split(",").map do |src|
    botoNewsSource(src,number)
  end.compact.join("\n")
end

def botoNewsSource(srcName,number)
  newsLink = botConnection(srcName)
  newsLink.first(number).join("\n")
end

def botoRandomNews(number=nil)
  number = number.nil? ? 1 : number.to_i
  botConnection(nil).shuffle.first(number).join("\n")
end

def botConnection(*srcName)
  uri = URI('http://localhost:8081/news')
  uri.query = URI.encode_www_form({src: srcName})
  json = Net::HTTP.get(uri) 
  rawResponse = JSON.parse(json)
  newsLink = rawResponse.map do |news|
    news["item_url"]
  end.compact
  return newsLink
end

bot.run

