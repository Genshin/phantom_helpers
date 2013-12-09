module PhantomHelpers
  module ViewHelpers
    module ControllerHelper

      def current_parent_controller
        controller.controller_path.split('/').second
      end

      def current_controller_action
        controller.action_name
      end

    end
  end
end
