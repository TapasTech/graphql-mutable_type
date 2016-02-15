## GraphQL::MutableType

[![Gem Version](https://badge.fury.io/rb/graphql-mutable_type.svg)](https://badge.fury.io/rb/graphql-mutable_type)
[![Build Status](https://travis-ci.org/TapasTech/graphql-mutable_type.svg?branch=master)](https://travis-ci.org/TapasTech/graphql-mutable_type)
[![Gem Version](https://badge.fury.io/rb/graphql-mutable_type.svg)](https://badge.fury.io/rb/graphql-mutable_type)

GraphQL::MutableType is an extension to GraphQL::ObjectType that adds the ability of having nested mutation queries.
It defines as following:

```
type Fish {
  id: String
  name: String
  Price: Float
  inStock: Int
  mutation: [FishMutation]
}
```

```
type FishMutation {
  update: [UpdateFishMutation]
  sell: [SellFishMutation]
}
```

And can be queried as following:

```
query {
  fish(id: "1") {
    id
    name
    price
    mutation {
      sell(weight: 100) {
        inStock
      }
    }
  }
}
```

## Proposal

As working with Facebook's practice of GraphQL, we have found that the mutations are all top level children of "mutation". This keeps us using global mutation names look like "SellFish", "UpdateFish". While all the models and services are coded in the OO way, the organization of mutations reminds me of days with out OO: some structs and a large set of functions that operate on the structs.

So we tried to reorganize the mutations under the Object Type itself, whick looks more like the way models we define our models.

This gem provides a DSL that helps define the types with mutations inside.

## Usage

Just warp your mutations in ```mutation do ... end```.

```ruby
KingType = GraphQL::MutableType.define do
  name 'King'
  description 'The title of the ruler of the kingdom'

  field :id,   !types.ID
  field :name, !types.String

  mutation do
    field :rename, field: RenameKingField
  end
end
```

See alse: [test schema](spec/support/francia_kings_app.rb)

## License

This gem is released under the [MIT License](MIT-LICENSE)