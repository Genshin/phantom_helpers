module PhantomHelpers
  module ViewHelpers
    module TableHelper

      def table_for(id, &block)
        content_tag :div, class: "row" do
          content_tag :div, class: "col-md-12" do
            content_tag :table, class: "table table-striped table-bordered table-condensed mb-0", id: id do
              block.call
            end
          end
        end
      end

      def table(&block)
        content_tag :table, class: "table table-striped table-bordered table-condensed" do
          block.call
        end
      end

      def show_table_for(id, &block)
        content_tag :div, class: "row" do
          content_tag :div, class: "col-md-12" do
            content_tag :table, class: "table", id: id do
              block.call
            end
          end
        end
      end

      def show_table(&block)
        content_tag :table, class: "table table-hover table-condensed"  do
          block.call
        end
      end

      def sortable_table_for(id, &block)
        content_tag :table, class: "table table-striped table-bordered table-condensed", id: id do
          block.call
        end
      end

      def th(text)
        content_tag(:th, class: "btn-inverse") { text }
      end

      def th_icon(icon)
        content_tag :th, class: "btn-inverse", style: "width:24px;" do
          content_tag :span, nil,  class: "glyphicon glyphicon-#{icon}"
        end
      end

      def th_actions(num)
        size = case num
        when 1 then 35
        when 2 then 64
        when 3 then 93
        else num
        end
        content_tag :th, class: "btn-inverse", style:"width:#{size}px" do
          content_tag :span, nil,  class: "glyphicon glyphicon-edit"
        end
      end

    end
  end
end
