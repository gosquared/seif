# -*- encoding: utf-8 -*-
require File.expand_path('../lib/seif/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gerhard Lazu"]
  gem.email         = ["gerhard@lazu.co.uk"]
  gem.description   = %q{Exposes info about web services and the customers that they belong to.}
  gem.summary       = %q{
                        I wanted to keep track of all my clients and the
                        websites which I host for them, expose these details to Chef
                        and hook it all up to my billing system (FreeAgent).
                      }
  gem.homepage      = "https://github.com/gerhard/seif"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "seif"
  gem.require_paths = ["lib"]
  gem.version       = Seif::VERSION

  gem.add_development_dependency 'foreman', '~> 0.47.0'
  gem.add_development_dependency 'guard-minitest', '~> 0.5.0'
  gem.add_development_dependency 'minitest', '~> 3.2.0'
  gem.add_development_dependency 'pry', '~> 0.9.9.6'
  gem.add_development_dependency 'rack-test', '~> 0.6.1'
  gem.add_development_dependency 'rake', '~> 0.9.2.2'
  gem.add_development_dependency 'turn', '~> 0.9.5'

  gem.add_runtime_dependency 'grape', '~> 0.2.0'
  gem.add_runtime_dependency 'oj', '~> 1.2.11'
  gem.add_runtime_dependency 'unicorn', '~> 4.3.0'
end
