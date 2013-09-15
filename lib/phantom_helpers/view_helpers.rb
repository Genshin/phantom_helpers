require 'phantom_helpers/view_helpers/link_helper'
require 'phantom_helpers/view_helpers/modal_helper'
require 'phantom_helpers/view_helpers/table_helper'
require 'phantom_helpers/view_helpers/html_helper'

module PhantomHelpers
  module ViewHelpers
    ActionView::Base.send :include, LinkHelper
    ActionView::Base.send :include, ModalHelper
    ActionView::Base.send :include, TableHelper
    ActionView::Base.send :include, HtmlHelper
  end
end
