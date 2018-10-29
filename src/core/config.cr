require "yaml"

class Config 
    YAML.mapping(
        token: String,
        client_id: UInt64,
        prefix: String
    )
end
