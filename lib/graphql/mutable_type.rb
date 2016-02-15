module GraphQL
  # Mutable Type is an extended Object Type that has mutations inside.
  class MutableType < ObjectType
    defined_by_config(*superclass.defined_by_config, :mutation)

    attr_accessor :mutation
  end
end

require 'graphql/mutable_type/defined_by_config'
# require 'graphql/mutable_type/version'
