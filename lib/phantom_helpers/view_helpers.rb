require 'phantom_helpers/view_helpers/controller_helper'
require 'phantom_helpers/view_helpers/count_helper'
require 'phantom_helpers/view_helpers/extras_helper'
require 'phantom_helpers/view_helpers/html_helper'
require 'phantom_helpers/view_helpers/icon_helper'
require 'phantom_helpers/view_helpers/image_helper'
require 'phantom_helpers/view_helpers/link_helper'
require 'phantom_helpers/view_helpers/modal_helper'
require 'phantom_helpers/view_helpers/sort_helper'
require 'phantom_helpers/view_helpers/table_helper'
require 'phantom_helpers/view_helpers/flash_helper'

module PhantomHelpers
  module ViewHelpers
    ActionView::Base.send :include, ControllerHelper
    ActionView::Base.send :include, CountHelper
    ActionView::Base.send :include, ExtrasHelper
    ActionView::Base.send :include, HtmlHelper
    ActionView::Base.send :include, IconHelper
    ActionView::Base.send :include, ImageHelper
    ActionView::Base.send :include, LinkHelper
    ActionView::Base.send :include, ModalHelper
    ActionView::Base.send :include, SortHelper
    ActionView::Base.send :include, TableHelper
    ActionView::Base.send :include, FlashHelper
  end
end
