$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require File.expand_path('../lib/maplibre-gl/rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'maplibre-gl-rails'
  gem.version       = MaplibreGl::Rails.gem_version

  gem.authors       = ['Rudo Kemper']
  gem.email         = ['rkemper@digital-democracy.org']
  gem.description   = 'maplibre-gl-rails provides MapLibre GL JS sources and stylesheets as a ' \
                      'Rails engine for use with the asset pipeline.'
  gem.summary       = 'an asset gemification of the MapLibre GL JS library'
  gem.homepage      = 'https://github.com/terrastories/maplibre-gl-rails'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split("\n").reject { |f| f =~ /^gemfiles|^\..+/ }
  gem.test_files    = `git ls-files -- test/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_dependency 'railties', '>= 3.2'

  gem.add_development_dependency 'activesupport'
  gem.add_development_dependency 'sass-rails', '>= 5.0', '< 6.0'
  gem.add_development_dependency 'thor'

  gem.required_ruby_version = '>= 1.9.3'
end
