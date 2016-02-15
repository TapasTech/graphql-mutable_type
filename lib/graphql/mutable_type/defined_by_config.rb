# Define MutableType by define block
class GraphQL::DefinitionHelpers::DefinedByConfig::DefinitionConfig
  attr_definable :mutation

  def mutation(&block)
    mutation_type = mutation_type(&block)

    field :mutation do
      name 'mutation'
      type mutation_type
      description mutation_type.description

      resolve -> (obj, _args, _cxt) { obj }
    end
  end

  protected

  # define nested mutation type
  def mutation_type(&block)
    @mutation_type ||= begin
      m_type = GraphQL::ObjectType.define(&block)
      m_type.name = "#{name} Mutation"
      m_type.description = "Mutations of #{description}"
      m_type
    end
  end
end
