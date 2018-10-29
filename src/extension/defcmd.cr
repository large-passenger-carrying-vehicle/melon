require "../core/*"

macro defcmd(name, cmd, desc, usage = "", aliases = [] of String, prefix = nil, owner_only = false, guild_only = false, permission = 0)
    class {{name}} < Cmd
    def initialize
        super(cmd: {{cmd}}, desc: {{desc}}, usage: {{usage}}, aliases: {{aliases}}, prefix: {{prefix}}, owner_only: {{owner_only}}, guild_only: {{guild_only}}, permission: {{permission}})
    end
    def exec(message, args, client)
        {{yield}}
    end
end
end
# def send(text : String, channel=)
#     return client.create_message(channel, text)
# end
