module PhantomHelpers
  module ViewHelpers
    module IconHelper

      def calendar_icon
        content_tag(:i, nil, class: ' icon-calendar')
      end

      def download_icon
        content_tag(:i, nil, class: 'icon-white icon-download')
      end

      def address_icon
        content_tag :span, nil, class: 'glyphicon glyphicon-globe'
      end

      def contact_icon
        content_tag :span, nil, class: 'glyphicon glyphicon-envelope'
      end

      def ok_icon
        content_tag :span, nil, class: 'glyphicon glyphicon-ok'
      end

    end
  end
end
