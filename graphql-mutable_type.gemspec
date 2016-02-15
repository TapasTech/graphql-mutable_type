$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'graphql/mutable_type/version'

Gem::Specification.new do |gem|
  gem.name        = 'graphql-mutable_type'
  gem.version     = GraphQL::MUTABLE_TYPE_VERSION
  gem.date        = Date.today.to_s
  gem.summary     = 'An Object Type that may have mutation queries.'
  gem.description = 'An Object Type that may have mutation queries.'
  gem.homepage    = 'https://github.com/TapasTech/graphql-mutable_type'
  gem.authors     = ['Karloku Sang']
  gem.email       = ['karloku@gmail.com']
  gem.license     = 'MIT'
  gem.required_ruby_version = '>= 2.1.0' # bc optional keyword args

  gem.require_paths = ['lib']
  gem.files         = Dir['{lib}/**/*', 'MIT-LICENSE', 'README.md']
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {spec}/*`.split("\n")

  gem.add_dependency 'graphql', '~> 0.10.0'

  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'codeclimate-test-reporter', '~>0.4'
  gem.add_development_dependency 'pry', '~> 0.10'
  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.add_development_dependency 'rake', '~> 10.4'
end
