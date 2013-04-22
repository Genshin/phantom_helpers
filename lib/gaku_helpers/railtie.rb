require 'gaku_helpers/view_helpers'
module GakuHelpers
  class Railtie < Rails::Railtie
    initializer "gaku_helpers" do
      I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../../locales'), '*.yml')]
      I18n.load_path.flatten!
    end

    initializer "gaku_helpers.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
