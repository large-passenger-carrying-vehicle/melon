require "../extension/*"
require "discordcr"
require "./cmd"
alias Client = Discord::Client

class Handler
  property prefix : String

  def initialize(prefix : String)
    @cmds = Hash(String, Cmd).new
    @prefix = prefix
  end

  def cmds
    @cmds
  end

  def add_cmd(cmd)
    command = cmd.new
    @cmds[command.name] = command
  end

  def add_cmds(cmds)
    cmds.map { |x| self.add_cmd(x) }
  end

  def handle(client : Client, config)
    client.on_message_create do |message|
      reg = Regex.new("^(<@!?#{config.client_id}>|\\#{@prefix})\\s*")
      result = reg.match(message.content)
      if result
        begin
          matched = result[0]
          args = message.content[matched.size..-1].split(/ +/)
          self.cmds[args[0]].exec(message, args, client)
        rescue e
            client.create_message(message.channel_id, "Oops something happened!")
        end
      end
    end
  end
end
