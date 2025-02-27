require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestCiRunnerApp
  class Application < Rails::Application
	  config.generators do |generate|
      generate.helper false

      generate.assets false
      generate.helper false
      generate.stylesheets false
      generate.test_framework :rspec,
                              request_specs: false,
                              view_specs: false,
                              controller_specs: false,
                              helper_specs: false,
                              routing_specs: false,
                              fixture: false,
                              fixture_replacement: "factory_bot"
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
