require 'test_helper'

class MaplibreRailsTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test 'engine is loaded' do
    assert_equal ::Rails::Engine, MaplibreGl::Rails::Engine.superclass
  end

  test 'javascript are served' do
    get '/assets/maplibre-gl.js'
    assert_maplibre_gl_js(response)
  end

  test 'javascript of valid version' do
    get '/assets/maplibre-gl.js'
    assert_maplibre_gl_js(response, MaplibreGl::Rails::VERSION::STRING)
  end

  test 'stylesheets are served' do
    get '/assets/maplibre-gl.css'
    assert_maplibre_gl_css(response)
  end

  test 'stylesheet is available in a css sprockets require' do
    get '/assets/sprockets-require.css'
    assert_maplibre_gl_css(response)
  end

  test 'stylesheet is available in a sass import' do
    get '/assets/sass-import.css'
    assert_maplibre_gl_css(response)
  end

  test 'stylesheet is available in a scss import' do
    get '/assets/scss-import.css'
    assert_maplibre_gl_css(response)
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path('../dummy/tmp',  __FILE__)
  end

  def assert_maplibre_gl_css(response, pattern = /maplibregl-map/)
    assert_response :success
    assert_match(pattern, response.body)
  end

  def assert_maplibre_gl_js(response, pattern = /window\.maplibregl/)
    assert_response :success
    assert_match(pattern, response.body)
  end
end
