$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'graphql/mutable_type/version'

Gem::Specification.new do |gem|
  gem.name        = 'graphql-mutable_type'
  gem.version     = GraphQL::MutableType::VERSION
  gem.date        = Date.today.to_s
  gem.summary     = 'An Object Type that may have mutation queries.'
  gem.description = 'An Object Type that may have mutation queries.'
  gem.homepage    = 'http://github.com/TapasTech/graphql-mutable_type'
  gem.authors     = ['Karloku Sang']
  gem.email       = ['karloku@gmail.com']
  gem.license     = 'MIT'
  gem.required_ruby_version = '>= 2.1.0' # bc optional keyword args

  gem.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'README.md']
  gem.test_files = Dir['spec/**/*']

  gem.add_dependency 'graphql', '~> 0.10.0'

  gem.add_development_dependency 'codeclimate-test-reporter', '~>0.4'
  gem.add_development_dependency 'pry', '~> 0.10'
  gem.add_development_dependency 'guard', '~> 2.12'
  gem.add_development_dependency 'guard-bundler', '~> 2.1'
  gem.add_development_dependency 'guard-minitest', '~> 2.4'
  gem.add_development_dependency 'minitest', '~> 5'
  gem.add_development_dependency 'minitest-focus', '~> 1.1'
  gem.add_development_dependency 'minitest-reporters', '~>1.0'
  gem.add_development_dependency 'rake', '~> 10.4'
end
