require 'phantom_helpers/view_helpers'
module PhantomHelpers
  class Railtie < Rails::Railtie

    config.assets.paths << File.expand_path("../../../vendor/assets/stylesheets", __FILE__)

    initializer "phantom_helpers" do
      I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../../locales'), '*.yml')]
      I18n.load_path.flatten!
    end

    initializer "phantom_helpers.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
