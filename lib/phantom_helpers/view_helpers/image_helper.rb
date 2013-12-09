module PhantomHelpers
  module ViewHelpers
    module ImageHelper

      def boolean_image(field)
        if field
          image_tag('tick.png')
        else
          image_tag('cross.png')
        end
      end

      def resize_image(image_url, options = {})
        raise 'No size given use :size or :width & :height' unless options[:size] || (options[:height] && options[:width])
        height = options[:height] || options[:size]
        width  = options[:width]  || options[:size]
        image_tag(image_url, style: "height:#{height}px;width:#{width}px") unless image_url.blank?
      end

    end
  end
end
