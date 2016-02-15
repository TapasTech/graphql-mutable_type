## GraphQL::MutableType

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
query Fish(id: "1") {
  id
  name
  price
  mutation {
    sell(weight: 100) {
      inStock
    }
  }
}
```

## Proposal

As working with Facebook's practice of GraphQL, we have found that the mutations are all top level children of "mutation". This keeps us using global mutation names look like "SellFish", "UpdateFish". While all the models and services are coded in the OO way, the organization of mutations reminds me of days with out OO: some structs and a large set of functions that operate on the structs.

So we tried to reorganize the mutations under the Object Type itself, whick looks more like the way models we define our models.

This gem provides some DSLs that helps define the types with mutations inside.