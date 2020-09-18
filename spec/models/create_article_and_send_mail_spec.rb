require 'rails_helper'

RSpec.describe CreateArticleAndSendMail, type: :model do
  describe "#save" do
    # context "保存に成功した場合" do
    #   it "trueが返ること" do
    #     article = create(:article)
    #     expect(article.save).to eq true
    #     decorator = CreateArticleAndSendMail.new(article)
    #     instance_double(ActionMailer::MessageDelivery, deliver_now:true)
    #     instance_double(ArticleMailer)
    #     expect(ArticleMailer).to receive(:new_article).with(article).and_return(:deliver_now)
    #     # allow(ActionMailer::MessageDelivery).to receive(deliver_now).and_return(true)
    #     # expect(ArticleMailer).to be_truthy
    #     # expect(ArticleMailer).to receive(:new_article).with(article) { deliver_now }.once
    #   end
    # end
    context "保存に成功した場合" do
      let(:article) { create(:article) }
      let(:decorator) { CreateArticleAndSendmailDecorator.new(article) }
      let(:mock_article) { instance_double(Article) }
      before do
        allow(mock_article).to receive(:save).and_return(true)
        allow(ArticleMailer).to receive_message_chain(:new_article, :deliver_now).with(mock_articlearticle)
      end
      it do
        expect(ArticleMailer).to be_truthy
        expect(ArticleMailer).to have_received(:new_article).with(mock_article)
      end
    end
  end
end
