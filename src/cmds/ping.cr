require "../extension/*"
defcmd name: Ping, cmd: "ping", desc: "pings the user" do
    client.create_message(message.channel_id, "pong")
end
