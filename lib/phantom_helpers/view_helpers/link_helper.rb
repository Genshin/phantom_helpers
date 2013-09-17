module PhantomHelpers
  module ViewHelpers
    module LinkHelper

      def link_to_add_fields(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render(association.to_s.singularize + "_fields", f: builder)
        end
        link_to(("<span class='glyphicon glyphicon-plus glyphicon-white'></span> " + name).html_safe, '#', :class => "btn btn-primary add_fields", data: {id: id, fields: fields.gsub("\n", "")})
      end

      def button(text, resource, options = {})
        attributes = {:class => "btn btn-default"}.merge(options)
        link_to text, resource, attributes
      end

      def primary_button(text, resource, options = {})
        attributes = {:class => "btn btn-primary"}.merge(options)
        link_to text, resource, attributes
      end

      def link_to_file(text, resource, options = {})
        name = ("<span class='glyphicon glyphicon-file'></span> " + text).html_safe
        attributes = {:class => "btn btn-primary"}.merge(options)
        link_to name, resource, attributes
      end

      def link_to_upload_image(resource, options = {})
        name = ("<span class='glyphicon glyphicon-camera'></span> " + t(:'phantom_helpers.picture.change')).html_safe
        attributes = {:class => "btn btn-default span12"}.merge(options)
        link_to name, resource, attributes
      end

      def link_to_upload(options = {})
        text = ("<span class='glyphicon glyphicon-upload'></span> " + t(:'phantom_helpers.picture.upload')).html_safe
        attributes = {:class => "btn btn-default"}.merge(options)
        button_tag(content_tag('span', text), attributes)
      end

      def link_to_import(text, resource, options = {})
        name = ('<span class="glyphicon glyphicon-upload"></span> '+ text).html_safe
        attributes = {:class => 'btn btn-default'}.merge(options)
        link_to name, resource, attributes
      end

      def link_to_export(text, resource, options = {})
        name = ('<span class="glyphicon glyphicon-download"></span> '+ text).html_safe
        attributes = {:class => 'btn btn-default'}.merge(options)
        link_to name, resource, attributes
      end

      #needs id, because it is unique
      def ajax_link_to_new(text, resource, options = {})
        name = ("<span class='glyphicon glyphicon-plus'></span> " + text).html_safe
        attributes = {
          :remote => true,
          :class => "btn btn-primary"
        }.merge(options)
        link_to name, resource, attributes
      end

      #needs id
      def link_to_new(text, resource, options = {})
        name = ("<span class='glyphicon glyphicon-plus'></span> " + text).html_safe
        attributes = {:class => "btn btn-primary"}.merge(options)
        link_to name, resource, attributes
      end

      #needs id
      def submit_button(text, options={})
        attributes = {:type => 'submit'}.merge(options)
        button_tag(content_tag('span', text), attributes)
      end

      def ajax_link_to_recovery(resource, options = {})
        name = content_tag(:i, nil, :class => 'glyphicon-repeat')
        attributes = {
          :remote => true,
          :class => "btn btn-xs btn-warning recovery-link"
        }.merge(options)
        link_to name, resource, attributes
      end

      def link_to_delete(resource, options = {})
        name = ("<span class='glyphicon glyphicon-remove'></span>").html_safe
        attributes = {
          :method => :delete,
          :class => 'btn btn-xs btn-danger delete-link'
        }.merge(options)
        link_to name, resource, attributes
      end

      def ajax_link_to_delete(resource, options = {})
        name = ("<span class='glyphicon glyphicon-remove'></span>").html_safe
        attributes = {
          :remote => true,
          :method => :delete,
          :data => { :confirm => t(:'phantom_helpers.are_you_sure') },
          :class => 'btn btn-xs btn-danger delete-link'
        }.merge(options)
        link_to name, resource, attributes
      end

      def link_to_modal_delete(resource, options = {})
        name = ("<span class='glyphicon glyphicon-trash'></span>").html_safe
        attributes = {
          :class => 'btn btn-danger modal-delete-link span12'
        }.merge(options)
        link_to name, resource, attributes
      end

      def ajax_soft_delete(resource, options = {})
        name = ("<span class='glyphicon glyphicon-remove'></span>").html_safe
        attributes = {
          :remote => true,
          :data => { :confirm => t(:'phantom_helpers.are_you_sure') },
          :class => 'btn btn-xs btn-danger delete-link'
        }.merge(options)
        link_to name, resource, attributes
      end


      def primary_checkbox
        ("<span class='glyphicon glyphicon-ok'></span>").html_safe
      end

      def ajax_link_to_make_primary(resource, options = {})
        attributes = {
          :remote => true,
          :method => :post,
          :data => { :confirm => t(:'phantom_helpers.are_you_sure') },
        }.merge(options)
        link_to primary_checkbox, resource, attributes
      end

      def ajax_link_to_edit(resource, options = {})
        name = ("<span class='glyphicon glyphicon-pencil'></span>").html_safe
        attributes = {
          :remote => true,
          :class => "btn btn-xs btn-warning edit-link"
        }.merge(options)
        link_to name, resource, attributes
      end


      # Edit button with only pencil image - without text
      def link_to_edit(resource, options = {})
        name = ("<span class='glyphicon glyphicon-edit'></span>").html_safe
        attributes = {
          :class => "btn btn-xs btn-inverse edit-link",
        }.merge(options)
        link_to name, resource, attributes
      end

      # Edit button with text "Edit" and pencil image
      def link_to_edit_with_text(resource, options = {})
        name = ('<span class="glyphicon glyphicon-pencil"></span> '+t(:'phantom_helpers.edit')).html_safe
        attributes = {:class => "span12 btn edit-link"}.merge(options)
        link_to name, resource, attributes
      end

      def link_to_edit_with_custom_text(text, resource, options = {})
        name = ('<span class="glyphicon glyphicon-pencil"></span> '+ text).html_safe
        attributes = {:class => "span12 btn edit-link"}.merge(options)
        link_to name, resource, attributes
      end

      def ajax_link_to_show(resource, options = {})
        name = ("<span class='glyphicon glyphicon-eye-open'></span>").html_safe
        attributes = {
          :remote => true,
          :class => "btn btn-xs btn-info show-link"
        }.merge(options)
        link_to name, resource, attributes
      end

      def link_to_show(resource, options = {})
        name = ("<span class='glyphicon glyphicon-eye-open'></span>").html_safe
        attributes = {
          :class => "btn btn-xs btn-info show-link"
        }.merge(options)
        link_to name, resource, attributes
      end

      def link_to_cancel(options = {})
        text = ('<span class="glyphicon glyphicon-ban-circle"></span> '+ t(:'phantom_helpers.cancel')).html_safe
        attributes = {
          :class => "col-md-12 btn btn-warning cancel-link",
          :'data-dismiss' => "modal"
        }.merge(options)
        link_to text, '#', attributes
      end

      def link_to_modal_cancel(options = {})
        name = t(:'phantom_helpers.cancel')
        attributes = {
          :class => "col-md-12 btn btn-warning modal-cancel-link",
          :'data-dismiss' => "modal"
        }.merge(options)
        link_to name, '#', attributes
      end

      def ajax_link_to_back(resource, options = {})
        name = ('<span class="glyphicon glyphicon-share-alt"></span> ' + t(:'phantom_helpers.back')).html_safe
        attributes = {
          :class => "col-md-6 btn btn-warning back-link back-modal-link",
          :remote => true
        }.merge(options)

        link_to name, resource, attributes
      end

      def link_to_back(resource, options = {})
        name = ('<span class="glyphicon glyphicon-share-alt"></span> '+ t(:'phantom_helpers.back')).html_safe
        attributes = {
          :class => 'col-md-6 btn back-link'
        }.merge(options)
        link_to name, resource, attributes
      end

      def submit_button(text, options={})
        text = ('<span class="glyphicon glyphicon-ok-circle"></span> '+ text).html_safe
        attributes = {
          :type => 'submit',
          :class => 'col-md-12 btn btn-primary button'
        }.merge(options)
        button_tag(content_tag('span', text), attributes)
      end

      def manage_buttons_for(resource, options = {})
        id = extract_id(resource)
        concat link_to_show(resource, :id => "show-#{id}-link") unless except?(:show, options)
        concat link_to_edit [:edit] + [resource].flatten, :id => "edit-#{id}-link", :remote => true unless except?(:edit, options)
        ajax_link_to_delete resource, :id => "delete-#{id}-link" unless except?(:delete, options)
      end

      private

      def except?(button_symbol, options)
        [options[:except]].flatten.include?(button_symbol)
      end

      def extract_id(resource)
        if resource.kind_of?(Array)
          resource_id = String.new
          resource.each_with_index do |r, index|
            resource_id << '-' unless index == 0
            resource_id << proper_id(r)
          end
          resource_id
        else
          proper_id(resource)
        end
      end

      def proper_id(resource)
        resource.class.to_s.underscore.split('/')[1].dasherize
      end

    end
  end
end
