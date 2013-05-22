class ArticleDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  #
  
  def formatted_created_at
    source.created_at.strftime("%m/%d/%Y - %H:%M")
  end

  def comments_count
    h.pluralize(source.comments.count, "Comment")
  end

end
