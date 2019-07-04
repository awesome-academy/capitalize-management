require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module CapitalizeManagement
  class Application < Rails::Application
    config.load_defaults 5.2
    Dotenv::Railtie.load
    config.i18n.load_path += Dir[Rails.root
    .join("config", "locales", "**", "*.{rb,yml}")]
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.assets.paths << Rails.root.join("vendor", "assets", "images")
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.active_storage.variant_processor = :vips
  end
end
