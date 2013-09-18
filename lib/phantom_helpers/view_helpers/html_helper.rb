module PhantomHelpers
  module ViewHelpers
    module HtmlHelper

      def hr
        content_tag :div, class: "row" do
          content_tag :div, class: "col-md-12" do
            content_tag :hr
          end
        end
      end

      def well_div(&block)
        content_tag :div, class: "row" do
          content_tag :div, class: "col-md-12" do
            content_tag :div, class: "well" do
              block.call
            end
          end
        end
      end

      def panel_div(color = 'default', title = nil, footer = nil, &block)
        content_tag :div, class: "row" do
          content_tag :div, class: "col-md-12" do
            content_tag :div, class: "panel panel-#{color}" do
              [
                if title
                  content_tag :div, class: "panel-heading" do
                    content_tag :h3, class: "panel-title" do
                      title
                    end
                  end
                end,
                content_tag(:div, class: "panel-body") do
                  block.call
                end,
                if footer
                  content_tag :div, class: "panel-footer" do
                    footer
                  end
                end
              ].join.html_safe
            end
          end
        end
      end

      def index_body(&block)
        content_tag :div, class: "row" do
          content_tag :div, class: "col-md-12" do
            block.call
          end
        end
      end

      def index_header(&block)
        content_tag :div, class: "row" do
          block.call
        end
      end

    end
  end
end
