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
