abstract class Cmd
    property name : String
    property desc : String
    property usage : String
    def initialize(name : String, desc : String, usage : String)
    @name = name
    @desc = desc
    @usage = usage
    end
    abstract def exec(m)
end
