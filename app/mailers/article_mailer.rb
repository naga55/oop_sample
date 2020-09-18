class ArticleMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def new_article(article)
    @article = article
    mail(to: 'to@example.com', subject: "#{@article.title}を作成しました")
  end
end
