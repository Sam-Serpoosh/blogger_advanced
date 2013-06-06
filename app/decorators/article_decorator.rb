class ArticleDecorator < Draper::Decorator
  delegate_all
  decorates_finders

  include IconLinkDecorations

  alias :article :source
  
  def formatted_created_at
    article.created_at.strftime("%m/%d/%Y - %H:%M")
  end

  def comments_count
    h.pluralize(article.comments.count, "Comment")
  end

  def to_json
    article.to_json
  end
end
