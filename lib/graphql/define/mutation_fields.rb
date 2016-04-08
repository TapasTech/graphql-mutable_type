module GraphQL
  module Define
    # # Define MutableType by define block
    module MutationFields
      def self.call(mutable_type, &block)
        mutation_type = mutation_type(mutable_type, &block)

        mutable_type.fields['mutation'] = GraphQL::Field.define do
          name 'mutation'
          type mutation_type
          description mutation_type.description

          resolve -> (obj, _args, _cxt) { obj }
        end
      end

      private_class_method

      # define nested mutation type
      def self.mutation_type(mutable_type, &block)
        m_type = GraphQL::ObjectType.define(&block)
        m_type.name = "#{mutable_type.name}Mutation"
        m_type.description = "Mutations of #{mutable_type.description}"
        m_type
      end
    end
  end
end
