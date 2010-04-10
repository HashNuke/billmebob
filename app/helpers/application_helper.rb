module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association,new_object,:child_index=>"new_#{association}") do |builder|
      render(association.to_s.singularize+"_fields",:f=>builder)
    end
    link_to "New item", "javascript:add_item(\"#{association}\", \"#{escape_javascript(fields)}\")"
  end

  def error_messages_for(*params)
      options = params.extract_options!.symbolize_keys

      if object = options.delete(:object)
        objects = [object].flatten
      else
        objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact
      end

      count  = objects.inject(0) {|sum, object| sum + object.errors.count }
      unless count.zero?
        html = {}
        [:id, :class].each do |key|
          if options.include?(key)
            value = options[key]
            html[key] = value unless value.blank?
          else
            html[key] = 'errormessages'
          end
        end
        options[:object_name] ||= params.first

        I18n.with_options :locale => options[:locale], :scope => [:activerecord, :errors, :template] do |locale|
          header_message = if options.include?(:header_message)
            options[:header_message]
          else
            object_name = options[:object_name].to_s.gsub('_', ' ')
            object_name = I18n.t(object_name, :default => object_name, :scope => [:activerecord, :models], :count => 1)
            locale.t :header, :count => count, :model => object_name
          end
          message = options.include?(:message) ? options[:message] : locale.t(:body)
          #error_messages = objects.sum {|object| object.errors.full_messages.map {|msg| content_tag(:li, ERB::Util.html_escape(msg)) } }.join
          error_messages = objects.map {|object| object.errors.collect{ |column,error| content_tag( :li, error ) } } 

          contents = 'Just make sure you entered all the required fields and atleast one product :) '
          #contents << content_tag(:ul, error_messages)

          content_tag(:div, contents, html)
        end
      else
        ''
      end

  end  
  
end
