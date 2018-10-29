abstract class Cmd
  property name : String
  property desc : String
  property usage : String
  property aliases : Array(String)
  property prefix : String | Nil
  property owner_only : Bool
  property guild_only : Bool
  property permission : Int32

  def initialize(cmd : String, desc : String, usage : String, aliases : Array(String), prefix : String | Nil, owner_only : Bool, guild_only : Bool, permission : Int32)
    @name = cmd
    @desc = desc
    @usage = usage
    @aliases = aliases
    @prefix = prefix
    @owner_only = owner_only
    @guild_only = guild_only
    @permission = permission
  end

  abstract def exec(message, args, client)

  def set_prefix(prefix : String)
    @prefix = prefix
  end
end
