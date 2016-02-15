King = Struct.new(:id, :name, :king)

KINGS = {
  'k_france' => King.new('k_france', 'West Francia'),
  'k_lotharingia' => King.new('k_lotharingia', 'Middle Francia'),
  'k_germany' => King.new('k_germany', 'East Francia')
}.freeze
