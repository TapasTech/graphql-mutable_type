require 'graphql/define/mutation_fields'

module GraphQL
  # Mutable Type is an extended Object Type that has mutations inside.
  class MutableType < ObjectType
    accepts_definitions(mutation: GraphQL::Define::MutationFields)

    attr_accessor :mutation
  end
end
# require 'graphql/mutable_type/version'
