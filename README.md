# MapLibre for Rails

[![Gem Version](https://badge.fury.io/rb/maplibre-gl-rails.svg)](http://badge.fury.io/rb/maplibre-gl-rails) [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](#license)

`maplibre-gl-rails` provides the [Maplibre GL JS](https://github.com/maplibre/maplibre-gl-js) library as a Rails engine for
use with the asset pipeline. It uses the same versioning as the Maplibre GL JS.

Supports Rails >= 3.2 (see [Travis build matrix]((.travis.yml))).

## Installation

Add this to your Gemfile:

```ruby
gem 'maplibre-gl-rails'
```

and run `bundle install`.

## Usage

In your `application.js`, include the following:

```js
//
//*= require maplibre-gl
//= require_tree .
```

In your `application.css`, include the css file:

```css
/*
 *= require maplibre-gl
 */
```

Then restart your webserver if it was previously running.

Congrats! You now have Maplibre GL JS on board and check out the
[Maplibre Examples](https://maplibre.org/maplibre-gl-js-docs/example/).
### Sass Support

If you prefer [SCSS](http://sass-lang.com/documentation/file.SASS_REFERENCE.html), add this to your
`application.css.scss` file:

```scss
@import 'maplibre-gl';
```

If you use the [Sass indented syntax](http://sass-lang.com/docs/yardoc/file.INDENTED_SYNTAX.html),
add this to your `application.css.sass` file:

```sass
@import maplibre-gl
```

## Misc

### Rails engines

When building a Rails engine that includes maplibre-gl-rails as a dependency,
be sure to `require "maplibre-gl-rails"` somewhere during the intialization of
your engine. Otherwise, Rails will not automatically pick up the load path of
the maplibre-gl-rails assets and helpers.

### Deploying to sub-folders

It is sometimes the case that deploying a Rails application to a production
environment requires the application to be hosted at a sub-folder on the server.
This may be the case, for example, if Apache HTTPD or Nginx is being used as a
front-end proxy server, with Rails handling only requests that come in to a sub-folder
such as `http://example.com/myrailsapp`. In this case, the
MaplibreRails gem (and other asset-serving engines) needs to know the sub-folder,
otherwise you can experience a problem roughly described as ["my app works
fine in development, but fails when I deploy
it"](https://github.com/bokmann/font-awesome-rails/issues/74).

To fix this, set the *relative URL root* for the application. In the
environment file for the deployed version of the app, for example
`config/environments/production.rb`,
set the config option `action_controller.relative_url_root`:

    MyApp::Application.configure do
      ...

      # set the relative root, because we're deploying to /myrailsapp
      config.action_controller.relative_url_root  = "/myrailsapp"

      ...
    end

The default value of this variable is taken from `ENV['RAILS_RELATIVE_URL_ROOT']`,
so configuring the environment to define `RAILS_RELATIVE_URL_ROOT` is an alternative strategy.

In addition you need to indicate the subfolder when you *precompile* the assets:

    RAILS_ENV=production bundle exec rake assets:precompile RAILS_RELATIVE_URL_ROOT=/myrailsapp

### Rails 3.2

**Note:** In Rails 3.2, make sure maplibre-gl-rails is outside the bundler asset group
so that these helpers are automatically loaded in production environments.

## Versioning

Versioning follows the core releases of Maplibre GL JS which follows Semantic
Versioning 2.0 as defined at <http://semver.org>. We will do our best not to
make any breaking changes until Maplibre core makes a major version bump.

Additional build number can be added to fix internal gem errors (like 0.43.0.**0**).

## Releasing

1. Update gem version in `lib/maplibre-gl/rails/version.rb` to match latest Maplibre GL version.
2. Run `bundle exec rake update` (this will automatically load and convert assets).
3. Commit
4. Create gem and push it to Rubygems
5. Create a GitHub release.

## License

* The [Maplibre GL JS](https://github.com/maplibre/maplibre-gl-js) and it's components are
  licensed under [their own licenses](https://github.com/maplibre/maplibre-gl-js/blob/master/LICENSE.txt).
* This gem is a fork of the [mapbox-gl-rails](https://github.com/nbulaj/mapbox-gl-rails) project which is licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).

## Acknowledgment

This template is based on Nikita Bulai's [Mapbox GL Rails gem](https://github.com/nbulaj/mapbox-gl-rails/blob/master/mapbox-gl-rails.gemspec), which works great with maps designed in Mapbox's Studio tool but requires a Mapbox access token.