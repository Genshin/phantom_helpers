module PhantomHelpers
  module ViewHelpers
    module ExtrasHelper

      def drag_field
        content_tag :td, class: 'sort-handler' do
          content_tag :i, nil, class: 'icon-move'
        end
      end

      def required_field
        content_tag :span, t(:required), class: 'label label-important pull-right'
      end

      def color_code(color)
        content_tag :div, nil, style: "width:100px;height:20px;background-color:#{color}"
      end

      def datepicker_date_format(date)
        date ?  date.strftime('%Y-%m-%d') : Time.now.strftime('%Y-%m-%d')
      end

      def comma_separated_list(objects, &block)
        if objects.any?
          objects.map do |object|
            block_given? ? block.call(object) : object
          end.join(', ').html_safe
        else
          t(:empty)
        end
      end

    end
  end
end
