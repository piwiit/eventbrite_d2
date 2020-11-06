require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.assets.initialize_on_precompile = false # the framework and any gems in your application.
  end
end
