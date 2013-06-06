class ArticleDecorator < Draper::Decorator
  delegate_all
  decorates_finders

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  #

  alias :article :source
  
  def formatted_created_at
    article.created_at.strftime("%m/%d/%Y - %H:%M")
  end

  def comments_count
    h.pluralize(article.comments.count, "Comment")
  end

end
