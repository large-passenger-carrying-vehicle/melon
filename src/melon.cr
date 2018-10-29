require "discordcr"
require "yaml"
require "./cmds/*"
require "./core/*"
require "./extension/*"
config = File.open("config.yaml") do |file|
  Config.from_yaml(file)
end

client = Discord::Client.new(token: "Bot #{config.token}", client_id: config.client_id)

handler = Handler.new("!")
handler.add_cmds([Ping])
handler.handle(client, config)
client.run
