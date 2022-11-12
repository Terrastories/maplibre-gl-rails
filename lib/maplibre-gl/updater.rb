# frozen_string_literal: true

require 'thor'
require 'yaml'

class Updater < Thor
  include Thor::Actions

  # Base assets storage URL
  # TODO: Change this to Maplibre API or source
  BASE_URL = 'https://api.tiles.mapbox.com/mapbox-gl-js'.freeze

  desc 'update assets', 'update assets from the MapBox S3 storage'
  def update
    self.destination_root = 'app/assets'

    get File.join(BASE_URL, "v#{MaplibreGl::Rails::VERSION::STRING}/maplibre-gl-dev.js"), 'javascripts/maplibre-gl.js'
    get File.join(BASE_URL, "v#{MaplibreGl::Rails::VERSION::STRING}/maplibre-gl.css"), 'stylesheets/maplibre-gl.css'

    inside destination_root do
      run('sass-convert -F css -T scss stylesheets/maplibre-gl.css stylesheets/maplibre-gl.scss')
    end

    remove_file 'stylesheets/maplibre-gl.css'

  end
end
