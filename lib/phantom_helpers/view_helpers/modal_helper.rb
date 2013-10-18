module PhantomHelpers
  module ViewHelpers
    module ModalHelper

      def modal_for(id, &block)
        content_tag :div, class: "modal hide", id: id, wmode: "opaque" do
          block.call
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
