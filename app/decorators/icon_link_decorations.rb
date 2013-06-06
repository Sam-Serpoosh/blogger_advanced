module IconLinkDecorations
  def edit_icon(link_text = nil)
    edit_icon_filename = 'page_edit.png'
    h.link_to(h.image_tag(edit_icon_filename) + " " + link_text,
            h.edit_polymorphic_path(model))
  end

  def delete_icon(link_text = nil) 
    delete_icon_filename = "cancel.png"
    h.link_to(h.image_tag(delete_icon_filename) + link_text, 
              h.polymorphic_path(article), 
              method: :delete,
              confirm: "Delete '#{article}'?")
  end
end
