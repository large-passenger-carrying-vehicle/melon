require "./cmd"
require "discordcr"
class Handler
    property prefix : String
    property cmds : Hash(String, Cmd)
    def initialize(prefix : String)
        @cmds = Hash(String, Cmd).new
        @prefix =  prefix
    end
    def cmds
        @cmds 
    end
    def add_cmd(cmd)
        command = cmd.new
        @cmds[command.name] = command
    end
    def add_cmds(cmds)
        cmds.map {|x| self.add_cmd(x)}
    end
    def handle(client : Discord::Client)
        # yet to implment
    end
end
