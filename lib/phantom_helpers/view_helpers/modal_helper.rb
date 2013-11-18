module PhantomHelpers
  module ViewHelpers
    module ModalHelper

      def panel_for(id, type='default', &block)
        content_tag :div, id: id, class: "panel panel-#{type}" do
          block.call
        end
      end

      def panel_header(text, object=nil)
        content_tag :div, class: 'panel-heading clearfix' do
          concat(content_tag(:h3, class: 'panel-title pull-left') { "#{text}"})
          concat(content_tag(:h3, class: 'panel-title pull-right') { updated_at_text(object) }) if object
        end
      end

      def updated_at_text(object)
        "#{t(:'phantom_helpers.updated')}: #{time_ago_in_words(object.updated_at)} #{t(:'phantom_helpers.ago')}"
      end

      def modal_for(id, &block)
        content_tag :div, class: "modal d-none", id: id, wmode: "opaque" do
          content_tag :div, class: "col-md-12 alert-dismissable" do
            block.call
          end
        end
      end

      def index_modal_for(id, &block)
        content_tag :div, class: "modal d-none", id: id, wmode: "opaque" do
          content_tag :div, class: "col-md-12 alert-dismissable" do
            content_tag :div, class: "panel panel-primary" do
              block.call
            end
          end
        end
      end

      def modal_body(&block)
        content_tag(:div, class: "panel-body") do
          block.call
        end
      end

      def modal_header(text)
        panel_title(text, modal_close_button)
      end

      private

      def panel_title(title, close_button)
        content_tag :div, class: "panel-heading" do
          content_tag :h3, class: "panel-title" do
            concat close_button
            concat(title ||= ' ')
          end
        end
      end

      def modal_close_button
        content_tag :button, :class => 'close', :'data-dismiss' => 'modal', :'aria-hidden' => true do
          "&times".html_safe
        end
      end

    end
  end
end
