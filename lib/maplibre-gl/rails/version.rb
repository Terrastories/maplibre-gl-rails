# frozen_string_literal: true

module MaplibreGl
  module Rails
    ##
    # Maplibre GL JS & gem version.
    def self.gem_version
      Gem::Version.new VERSION::STRING
    end

    ##
    # Follows Maplibre GL JS versioning.
    module VERSION
      # Major version number
      MAJOR = 2
      # Minor version number
      MINOR = 4
      # Smallest version number
      TINY = 0

      # Full version number
      STRING = [MAJOR, MINOR, TINY].compact.join('.')
    end
  end
end
