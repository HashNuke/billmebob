module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association,new_object,:child_index=>"new_#{association}") do |builder|
      render(association.to_s.singularize+"_fields",:f=>builder)
    end
    link_to "New item", "javascript:add_item(\"#{association}\", \"#{escape_javascript(fields)}\")"
  end

end
