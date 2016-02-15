require File.join(File.dirname(__FILE__), 'francia_kings_data.rb')

RenameKingField = GraphQL::Field.define do
  type -> { KingType }

  argument :name, !types.String

  resolve ->(obj, args, _cxt) { (obj.name = args[:name]) && obj }
end

FetchKingField = GraphQL::Field.define do
  type -> { KingType }

  argument :id, !types.ID

  resolve ->(_obj, args, _cxt) { KINGS[args[:id]] }
end

KingType = GraphQL::MutableType.define do
  name 'King'
  description 'The title of the ruler of the kingdom'

  field :id,   !types.ID
  field :name, !types.String

  mutation do
    field :rename, field: RenameKingField
  end
end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'Query root'

  field :king, field: FetchKingField
end

FranciaSchema = GraphQL::Schema.new(query: QueryType)
