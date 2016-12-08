# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'fuzzy_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = "fuzzy_matcher"
  spec.version       = FuzzyMatcher::VERSION
  spec.authors       = ['Vemos']
  spec.email         = ["ajuda@vemos.com.br"]
  spec.homepage      = "https://github.com//fuzzy_matcher"
  spec.summary       = "Compare strings based on similarity"
  spec.description   = "Helper functions for comparing strings which may only be mostly inequal instead of exactly equal."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'fuzzy-string-match', '~> 0.9.7'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'minitest', '~> 5.9.0'
  spec.add_development_dependency 'faker', '~> 1.6.6'
  spec.add_development_dependency 'byebug', '~> 8.2.2'
  spec.add_development_dependency 'minitest-reporters', '~> 1.1.6'

  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'pry-byebug', '~> 3.3.0'
  spec.add_development_dependency 'guard', '~> 2.14.0'
  spec.add_development_dependency 'guard-minitest', '~> 2.4.4'
  spec.add_development_dependency 'guard-bundler', '~> 2.1.0'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2.0'
  spec.add_development_dependency 'terminal-notifier-guard', '~> 1.7.0'
end
