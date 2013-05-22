require 'spec_helper'

describe ArticleDecorator do
  it "formats the created_at" do
    article = stub(:created_at => 
                   Time.parse("2013-05-19T20:15:30Z"))
    decorator = ArticleDecorator.new(article)

    decorator.formatted_created_at.should == "05/19/2013 - 20:15"
  end


  context "#comments_count" do
    before do
      @article = Article.create!(title: "foo", body: "bar")
      @article.comments.create!(author_name: "bob")
    end

    it "pluralizes 'Comment' word based on their count" do
      @article.comments.create!(author_name: "alice")
      decorator = ArticleDecorator.new(@article)

      decorator.comments_count.should == "2 Comments"
    end

    it "does not pluralize 'Comment' when there is one comment" do
      decorator = ArticleDecorator.new(@article)

      decorator.comments_count.should == "1 Comment"
    end

    it "works also for each article in a collection" do
      decorator = ArticleDecorator.decorate_collection([@article])
      decorator[0].comments_count.should == "1 Comment"
    end
  end
end
