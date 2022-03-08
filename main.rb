require "discordrb"
require "dotenv"
Dotenv.load
$token=ENV['botordNewsToken']
$clientId=ENV['clientId']
bot = Discordrb::Commands::CommandBot.new token: $token, prefix: "/", client_id: $clientId


bot.command :ping do |event|
	event.respond "Pong!"
end
bot.run
# bot.command :ping do |msg|
# 	msg.respond "Pong!"
# end