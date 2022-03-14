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
  else
    # botResponse = botoNewsSource(srcName)
    botResponse = botoNewsSourceNumber(srcName,number)
	end 

  if botResponse.empty?
    event.respond "Error we cannot found your news"
  else
    event.respond botResponse
  end

end

def botoNewsDefault
  uri = URI('http://localhost:8081/news')
  json = Net::HTTP.get(uri)
  rawResponse = JSON.parse(json)	
  newsLink = rawResponse.map do |news|
    news["item_url"]
  end.compact
  newsLink = newsLink.map do |url|
    "<#{url}>"
  end 
  newsLink.first(3).join("\n")
end

def botoNewsSource(srcName)
  uri = URI('http://localhost:8081/news')
  uri.query = URI.encode_www_form({src: srcName})
  json = Net::HTTP.get(uri) 
  rawResponse = JSON.parse(json)
  newsLink = rawResponse.map do |news|
    news["item_url"]
  end.compact
  newsLink.first(4).join("\n")
end

def botoNewsSource(srcName)
  uri = URI('http://localhost:8081/news')
  uri.query = URI.encode_www_form({src: srcName})
  json = Net::HTTP.get(uri) 
  rawResponse = JSON.parse(json)
  newsLink = rawResponse.map do |news|
    news["item_url"]
  end.compact
  newsLink.first(4).join("\n")
end

def botoNewsSourceNumber(srcName,number)
  uri = URI('http://localhost:8081/news')
  uri.query = URI.encode_www_form({src: srcName})
  json = Net::HTTP.get(uri) 
  rawResponse = JSON.parse(json)
  newsLink = rawResponse.map do |news|
    news["item_url"]
  end.compact
  newsLink.first(number.to_i).join("\n")
end

def botoNewsSourceNumber(srcName,number)
  apiConnection(srcName)
  newsLink = rawResponse.map do |news|
    news["item_url"]
  end.compact
  newsLink.first(number.to_i).join("\n")

bot.run

