require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Ensure that the Sass files in app/assets/stylesheets are precompiled.
    #config.assets.precompile << /\.(scss|sass)$/

    # Add the sass-rails gem to handle Sass files.
    config.generators do |g|
      g.assets false
      g.stylesheets true
    end
  end
end
