RSpec.describe GraphQL::MutableType do
  let(:king_france) { KINGS['k_france'] }
  let(:king_germany) { KINGS['k_germany'] }
  let(:king_lotharingia) { KINGS['k_lotharingia'] }

  let(:type) { KingType }
  let(:schema) { FranciaSchema }
  describe 'define mutable type' do
    
    let(:mutation) { type.fields['mutation'] }
    let(:mutation_fields) { mutation.type.fields }

    it 'has mutation' do
      expect(mutation).to be_truthy
      expect(mutation_fields.keys).to eq(%w(rename))
    end

    let(:resolve) { ->(id) { mutation.resolve(id, nil, nil) } }

    it 'resolve mutation results the object it self' do
      expect(resolve[king_france]).to eq(king_france)
      expect(resolve[king_germany]).to eq(king_germany)
      expect(resolve[king_lotharingia]).to eq(king_lotharingia)
    end
  end

  describe 'execute query with mutation' do
    let(:query) do
%q{
  query {
    king(id: "k_germany") {
      id
      name
      mutation {
        rename(name: "Germany") {
          name
        }
      }
    }
  }
}
    end

    let(:result) do
      {
        "data" => {
          "king" => {
            "id" => "k_germany",
            "name" => "East Francia",
            "mutation" => {
              "rename" => {
                "name" => "Germany"
              }
            }
          }
        }
      } 
    end

    it 'renames East Francia to Germany' do      
      expect(schema.execute(query)).to eq(result)
    end
  end
end
