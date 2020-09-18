class CreateArticleAndSendMail
  include ActiveModel::Model

  def initialize(article)
    @article = article
  end

  def save
    if @article.save
      ArticleMailer.new_article(@article).deliver_now
    end
  end
end
