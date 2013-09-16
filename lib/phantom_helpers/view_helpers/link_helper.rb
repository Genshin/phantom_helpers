module PhantomHelpers
  module ViewHelpers
    module LinkHelper

      def link_to_add_fields(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render(association.to_s.singularize + "_fields", f: builder)
        end
        link_to(("<i class='glyphicon-plus glyphicon-white'></i> " + name).html_safe, '#', :class => "btn btn-primary add_fields", data: {id: id, fields: fields.gsub("\n", "")})
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
        name = ("<i class='glyphicon-file'></i> " + text).html_safe
        attributes = {:class => "btn btn-primary"}.merge(options)
        link_to name, resource, attributes
      end

      def link_to_upload_image(resource, options = {})
        name = ("<i class='glyphicon-camera'></i> " + t(:'phantom_helpers.picture.change')).html_safe
        attributes = {:class => "btn btn-default span12"}.merge(options)
        link_to name, resource, attributes
      end

      def link_to_upload(options = {})
        text = ("<i class='glyphicon-upload'></i> " + t(:'phantom_helpers.picture.upload')).html_safe
        attributes = {:class => "btn btn-default span12"}.merge(options)
        button_tag(content_tag('span', text), attributes)
      end

      def link_to_import(text, resource, options = {})
        name = ('<i class="glyphicon-upload"></i> '+ text).html_safe
        attributes = {:class => 'btn btn-default'}.merge(options)
        link_to name, resource, attributes
      end

      def link_to_export(text, resource, options = {})
        name = ('<i class="glyphicon-download"></i> '+ text).html_safe
        attributes = {:class => 'btn btn-default'}.merge(options)
        link_to name, resource, attributes
      end

      #needs id, because it is unique
      def ajax_link_to_new(text, resource, options = {})
        name = ("<i class='glyphicon-plus'></i> " + text).html_safe
        attributes = {
          :remote => true,
          :class => "btn btn-primary"
        }.merge(options)
        link_to name, resource, attributes
      end

      #needs id
      def link_to_new(text, resource, options = {})
        name = ("<i class='glyphicon-plus'></i> " + text).html_safe
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
          :class => "mr-xs btn btn-mini btn-warning recovery-link"
        }.merge(options)
        link_to name, resource, attributes
      end

      def link_to_delete(resource, options = {})
        name = ("<i class='glyphicon-remove'></i>").html_safe
        attributes = {
          :method => :delete,
          :class => 'btn btn-mini btn-danger delete-link'
        }.merge(options)
        link_to name, resource, attributes
      end

      def ajax_link_to_delete(resource, options = {})
        name = ("<i class='glyphicon-remove'></i>").html_safe
        attributes = {
          :remote => true,
          :method => :delete,
          :data => { :confirm => t(:'phantom_helpers.are_you_sure') },
          :class => 'btn btn-mini btn-danger delete-link'
        }.merge(options)
        link_to name, resource, attributes
      end

      def link_to_modal_delete(resource, options = {})
        name = ("<i class='glyphicon-trash'></i>").html_safe
        attributes = {
          :class => 'btn btn-danger modal-delete-link span12'
        }.merge(options)
        link_to name, resource, attributes
      end

      def ajax_soft_delete(resource, options = {})
        name = ("<i class='glyphicon-remove'></i>").html_safe
        attributes = {
          :remote => true,
          :data => { :confirm => t(:'phantom_helpers.are_you_sure') },
          :class => 'btn btn-mini btn-danger delete-link'
        }.merge(options)
        link_to name, resource, attributes
      end


      def primary_checkbox
        ("<i class='glyphicon-ok'></i>").html_safe
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
        name = ("<i class='glyphicon-pencil'></i>").html_safe
        attributes = {
          :remote => true,
          :class => "mr-xs btn btn-mini btn-warning edit-link"
        }.merge(options)
        link_to name, resource, attributes
      end


      # Edit button with only pencil image - without text
      def link_to_edit(resource, options = {})
        name = ("<i class='glyphicon-edit'></i>").html_safe
        attributes = {
          :class => "mr-xs btn btn-mini btn-inverse edit-link",
        }.merge(options)
        link_to name, resource, attributes
      end

      # Edit button with text "Edit" and pencil image
      def link_to_edit_with_text(resource, options = {})
        name = ('<i class="glyphicon-pencil"></i> '+t(:'phantom_helpers.edit')).html_safe
        attributes = {:class => "span12 btn edit-link"}.merge(options)
        link_to name, resource, attributes
      end

      def link_to_edit_with_custom_text(text, resource, options = {})
        name = ('<i class="glyphicon-pencil"></i> '+ text).html_safe
        attributes = {:class => "span12 btn edit-link"}.merge(options)
        link_to name, resource, attributes
      end

      def ajax_link_to_show(resource, options = {})
        name = ("<i class='glyphicon-eye-open'></i>").html_safe
        attributes = {
          :remote => true,
          :class => "mr-xs btn btn-mini btn-info show-link"
        }.merge(options)
        link_to name, resource, attributes
      end

      def link_to_show(resource, options = {})
        name = ("<i class='glyphicon-eye-open'></i>").html_safe
        attributes = {
          :class => "mr-xs btn btn-mini btn-info show-link"
        }.merge(options)
        link_to name, resource, attributes
      end

      def link_to_cancel(options = {})
        text = ('<i class="glyphicon-ban-circle"></i> '+ t(:'phantom_helpers.cancel')).html_safe
        attributes = {
          :class => "span6 btn btn-warning cancel-link",
          :'data-dismiss' => "modal"
        }.merge(options)
        link_to text, '#', attributes
      end

      def link_to_modal_cancel(options = {})
        name = t(:'phantom_helpers.cancel')
        attributes = {
          :class => "span6 btn btn-warning modal-cancel-link",
          :'data-dismiss' => "modal"
        }.merge(options)
        link_to name, '#', attributes
      end

      def ajax_link_to_back(resource, options = {})
        name = ('<i class="glyphicon-share-alt"></i> ' + t(:'phantom_helpers.back')).html_safe
        attributes = {
          :class => "span6 btn btn-warning back-link back-modal-link",
          :remote => true
        }.merge(options)

        link_to name, resource, attributes
      end

      def link_to_back(resource, options = {})
        name = ('<i class="glyphicon-share-alt"></i> '+ t(:'phantom_helpers.back')).html_safe
        attributes = {
          :class => 'col-md-6 btn back-link'
        }.merge(options)
        link_to name, resource, attributes
      end

      def submit_button(text, options={})
        text = ('<i class="glyphicon-ok-circle"></i> '+ text).html_safe
        attributes = {
          :type => 'submit',
          :class => 'col-md-6 btn btn-primary button'
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
