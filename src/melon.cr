require "discordcr"
require "yaml"
require "./cmds/*"
require "./core/*"
config = File.open("config.yaml") do |file|
    Config.from_yaml(file) 
end

client = Discord::Client.new(token: "Bot #{config.token}", client_id: config.client_id)

client.run
